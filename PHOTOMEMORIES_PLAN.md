# Been Here — implementační plán

Pracuje se po fázích, v pořadí. Po každé fázi: testy zelené, `flutter analyze`
čistý, commit. Další fáze nezačíná, dokud nejsou splněná akceptační kritéria
té předchozí.

## 0. Rozhodnutí (sekce 9 zodpovězena 2026-09-20)

| Otázka | Rozhodnutí |
|---|---|
| Název / bundle id | **Been Here** / `com.lioilsources.beenhere`, Dart package `been_here` |
| Monetizace | Vše zdarma v první verzi. Žádné IAP, žádné feature flagy. |
| Mapa | **Změněno 2026-09-20:** `flutter_map` + OSM je uvnitř, ale vypnutá ve výchozím stavu a zapínatelná v Nastavení. Dlaždice jsou síťový provoz, který průběžně prozradí, kam se díváš — viz `docs/ARCHITECTURE.md`. |
| Videa | Neindexovat vůbec. Sloupec `is_video` v schématu zůstává pro budoucnost. |
| Min OS | iOS 15, Android 8 (API 26) |

Odchylky od plánu, které z toho a z implementace vyplynuly, jsou vypsané
v `docs/ARCHITECTURE.md`.

## 1. Produkt

Přijedeš na místo, kde jsi už někdy byl. Appka ti ukáže tvoje fotky z tohoto
místa, seřazené podle návštěv (před rokem, před pěti lety…). Poloměr hledání
jde rozšířit a zobrazit i okolí.

Klíčový moment je **příjezd**, ne galerie. Appka se proto musí umět ozvat sama
(geofence notifikace).

Principy:

- **Vše on-device.** Fotky ani jejich GPS neopouští telefon. MVP nemá žádný
  backend, žádný účet, žádnou analytiku třetích stran.
- Appka fotky nekopíruje, drží jen index (asset id + metadata). Zdroj pravdy
  je systémová knihovna.
- Doma a v práci jsou tisíce fotek. Tato místa se musí automaticky ztlumit,
  jinak je appka k ničemu.

### Rozsah MVP

1. Index knihovny podle GPS
2. Obrazovka „Tady" (fotky v okolí aktuální polohy, radius slider, časová osa
   návštěv)
3. Místa (clustery), automatické ztlumení domova/práce
4. Geofence notifikace při příjezdu
5. Rephoto (stará fotka jako overlay v kameře, výstup then & now)

### Mimo MVP (nedělat, jen nerozbít architekturou)

Sdílení s přáteli, rodinná mapa, AR/kompas režim, automatický sestřih videa,
ruční umístění fotek bez GPS, poznámky k místu, plánování cesty.

**Změna oproti původnímu rozsahu (2026-09-20):** ruční *pojmenování* místa
je dovnitř. Seznam míst bez názvů byl zeď stejných řádků a vlastní název
(„U babičky") je lepší než geocodovaný („Nádražní 12") — a na rozdíl od něj
neopouští telefon. Tagování a hvězdičkování zůstávají nápady na později;
sloupec `places.user_label` jim nestojí v cestě.

## 2. Stack

- Flutter (stable), Dart 3, **iOS first** (TestFlight), Android hned po něm
  ze stejného kódu
- State: Riverpod
- DB: drift (SQLite)
- Knihovna fotek: `photo_manager` (PhotoKit / MediaStore)
- Poloha: `geolocator`
- Geofencing: `native_geofence` (nebo ekvivalent), notifikace
  `flutter_local_notifications`
- Kamera: `camera`
- Mapa: v MVP není

## 3. Architektura

Viz `docs/ARCHITECTURE.md`.

Pravidlo: `domain/` nezná Flutter ani pluginy, jen rozhraní z `data/`.
Vynucuje to `test/architecture_test.dart`.

## 4. Datový model

Viz `lib/data/db/tables.dart` a `docs/ARCHITECTURE.md`.

Fotky bez GPS se indexují taky (lat/lng NULL), kvůli pozdějšímu ručnímu
umístění. V dotazech MVP se ignorují.

## 5. Klíčové algoritmy

**Dotaz „tady"** (`MemoriesQuery.near(lat, lng, radiusM)`): bounding box přes
indexy lat/lng, pak přesný filtr haversine v Dartu. Cíl: < 50 ms na 100k fotek.

**Návštěvy:** fotky z výsledku seskup podle místního kalendářního dne; dny
jdoucí po sobě (mezera ≤ 1 den) jsou jedna návštěva. Výstup: seznam návštěv od
nejnovější, každá s popiskem „před X lety / měsíci" a datem.

**Clustering míst:** buňky geohash-7, sousední obsazené buňky slouč
(connected components přes 8-okolí). Střed = těžiště, radius = max vzdálenost
od středu, clamp 100–500 m. Přepočet inkrementálně jen pro dotčené buňky.
DBSCAN až když tohle nebude stačit.

**Auto-mute:** místo s `distinct_days >= 30` dostane `mute='auto'`. Práh
v nastavení. Rozhodnutí uživatele má vždy přednost a auto pravidlo ho
nepřepisuje ani jedním směrem.

**Pravidla notifikace** (čistá funkce, plně pokrytá testy):

- místo není ztlumené
- poslední fotka z místa je starší než N měsíců (default 6)
- max 1 notifikace denně celkem, cooldown 30 dní na místo
- minimálně 3 fotky na místě
- text: „Před 6 lety jsi tu byl. 14 fotek." Tap otevře obrazovku Tady pro dané
  místo.

**Správa geofence:** iOS povoluje jen 20 monitorovaných regionů na appku
(Android 100). Registruj vždy N nejbližších neztlumených míst splňujících
pravidla; přeregistruj při significant location change a po doběhnutí
indexace. Logika výběru = čistá funkce v `domain/`, testovaná.

## 6. Fáze

### Fáze 0: Scaffold — hotovo

- [x] Flutter projekt, struktura, Riverpod, drift se schématem, přísný lint,
      `make test` / `make analyze`
- [x] `FakePhotoLibrary` + generátor fixtures (50k fotek: 2 husté clustery
      „domov/práce", 40 výletových míst, náhodný šum, část bez GPS, videa
      navíc)
- [x] Appka naběhne na iOS simulátoru s prázdnou Here obrazovkou, testy běží

### Fáze 1: Indexace — hotovo

- [x] `PhotoLibrary` nad `photo_manager`: stránkovaný průchod, čtení lat/lng
- [x] `IndexerService`: full scan v dávkách (neblokuje UI, průběžný progress
      stream), idempotentní, přerušitelný a navazující
- [x] Inkrementální sync: change notifikace knihovny + pass při startu
- [x] iOS limited access: detekováno a vysvětleno, appka funguje dál
- [x] Android: `ACCESS_MEDIA_LOCATION` v manifestu a v žádosti o oprávnění
- [x] Full scan 50k fixtures projde testem; opakované spuštění nic
      neduplikuje; smazaná fotka zmizí z indexu
- [x] Na simulátoru se zaindexuje reálná knihovna přes PhotoKit
      (`integration_test/`, 12 fotek, 83 % s polohou)
- [x] Ověřeno na iPhonu 12 mini (2026-09-20): indexace velké knihovny běží
      s viditelným progressem a neblokuje UI. Zbývají dílčí body (resume po
      backgroundu, mazání fotky, limited access, Android) — viz `docs/QA.md`.

### Fáze 2: Obrazovka Tady — hotovo

- [x] Aktuální poloha (when-in-use), dotaz near, radius slider (100 m → 50 km,
      logaritmicky), živý počet fotek
- [x] Časová osa návštěv, v každé návštěvě lazy grid náhledů s cache
- [x] Detail fotky: fullscreen, swipe v rámci návštěvy, tlačítko Rephoto
      (disabled, patří do fáze 5)
- [x] Prázdný stav: „Tady jsi ještě nefotil" + vzdálenost k nejbližší
      vzpomínce + tlačítko, které na ni rozšíří radius
- [x] Debug poloha: dlouhý stisk na nadpisu „Tady"
- [x] Benchmark na 100k fotkách: časová osa < 50 ms, počet pod sliderem
      < 25 ms
- [x] Ověřeno na iPhonu 12 mini (2026-09-20): reálné fotky z okolí se
      seskupí správně, slider je plynulý. Zbytek viz `docs/QA.md`.

Nejbližší *místo* nahradí nejbližší fotku ve fázi 3.

### Fáze 3: Místa a mute — hotovo

- [x] Clustering (geohash-7, connected components) + auto-mute, přepočet
      navázaný na doběhnutí indexace
- [x] Obrazovka Místa: seznam se třemi řazeními, ztlumená zvlášť
- [x] Ruční mute/unmute + „rozhodnout automaticky"; rozhodnutí uživatele
      přežije přepočet v obou směrech
- [x] Reverse geocoding líně a s cache, **vypnutý default**, vypnutí zapomene
      i uložené názvy — ale ne ty, které jsi zadal ty
- [x] Řádek místa vede časem a vzdáleností, ne názvem; název ho nahradí,
      když nějaký je
- [x] Ruční pojmenování místa (mimo původní rozsah, viz sekce 1)
- [x] Nastavení: práh auto-mute, pojmenovávání míst, reindex, statistika
      indexu (fáze 6 ho rozšíří)
- [x] Fixtures test: domov i práce auto-mute, 40 výletových míst ne, ztlumená
      jsou přesně dvě
- [x] Ověřeno na iPhonu 12 mini (2026-09-20): místa na reálných datech
      dávají smysl, domov i práce vyšly auto-mute.

### Fáze 4: Geofence notifikace — kód hotový, chybí ověření na trase

- [x] Eskalace oprávnění: až po prvním zobrazení vzpomínek, s vlastní
      vysvětlující obrazovkou před systémovým dialogem
- [x] `RegionSyncService`: výběr nejbližších míst (čistá funkce, iOS limit
      20 regionů), přeregistrace jen když se výběr změní
- [x] `ArrivalService`: enter → pravidla → lokální notifikace → deep link,
      běží v isolate na pozadí
- [x] Bez always oprávnění appka funguje dál a přestane se ptát
- [x] Info.plist / manifest texty oprávnění napsané pro App Review
- [ ] **Zbývá tobě:** simulace polohy (GPX v Xcode) — notifikace u
      neztlumeného místa ano, u ztlumeného ne, cooldowny drží, tap otevře
      správné místo. Viz `docs/QA.md`.

Znění notifikace je zatím „{stáří} · {počet fotek}" místo věty z plánu —
skládat větu kolem lokalizovaného údaje o stáří naráží na velká písmena
a skloňování ve dvou jazycích. Patří to do polishe ve fázi 6.

### Fáze 5: Rephoto — kód hotový, chybí ověření s kamerou

- [x] Kamera s overlayem původní fotky: slider průhlednosti, přepínač
      overlay/obrys hran, zamknutý poměr stran podle originálu
- [x] Sobel detekce hran v čistém Dartu, běží v isolate přes `compute()`
- [x] Po vyfocení: uložit novou fotku do systémové knihovny (se souřadnicemi
      té staré, ne novým fixem), záznam do `rephotos`
- [x] Výstup then & now: interaktivní slider v appce, složený side-by-side
      obrázek do share sheetu
- [x] Tlačítko v detailu fotky funguje; „Tehdy a teď" se objeví, až když
      odpověď existuje
- [x] Info.plist / manifest texty pro kameru a zápis do knihovny
- [ ] **Zbývá tobě:** vyfotit něco znovu na telefonu — sedí overlay, uloží se
      to do Fotek, sdílení dá rozumný obrázek. Viz `docs/QA.md`.

### Fáze 6: Onboarding a polish — kód hotový, TestFlight zbývá

- [x] Onboarding: 3 obrazovky (co to dělá, soukromí, oprávnění k fotkám).
      Poloha až na obrazovce Tady, jak plán chtěl. Jde přeskočit.
- [x] Settings: prahy, geocoding on/off, mapa, reindex, statistika indexu,
      verze, odkaz na zdrojový kód, „zobrazit úvod znovu". Debug poloha
      zůstala na dlouhém stisku nadpisu — je to vývojářská berlička, ne
      nastavení.
- [x] Dark mode (celá appka jede z jednoho seedu), prázdné a chybové stavy
- [x] Přístupnost: fotky v mřížce jsou pojmenovaná tlačítka, slider okruhu
      hlásí metry místo logaritmu, úvod přežije dvojnásobné písmo
- [x] Znění notifikace přepsané bez rodu (viz docs/ARCHITECTURE.md)
- [x] Ikona a splash, kreslené `tool/make_icon.py`
- [ ] **Zbývá:** TestFlight build — potřebuje záznam v App Store Connect
      a distribuční profil

## 7. Testování

- Unit: haversine, bbox, geohash, seskupení návštěv (časové zóny a přelom
  dne), clustering, auto-mute, pravidla notifikací, výběr geofence regionů
- Integrační: indexer proti `FakePhotoLibrary` (full scan, resume, inkrement,
  mazání)
- Widget testy: Here obrazovka se stavy loading / prázdno / data
- Výkon: benchmark dotazu near na 100k řádcích jako test s limitem
- Ruční checklist pro zařízení: `docs/QA.md`

## 8. Rizika

- **App Review a always location:** potřebuje jasné zdůvodnění a viditelný
  přínos. Appka musí být plně použitelná i bez něj.
- **Limit 20 regionů na iOS:** řeší dynamická přeregistrace; ověřit na reálném
  zařízení brzy.
- **Fotky bez GPS:** u části uživatelů většina knihovny. V MVP aspoň ukaž
  v settings statistiku „X % fotek má polohu".
- **iCloud optimalizované úložiště:** originály nemusí být lokálně. Pro index
  stačí metadata, pro grid thumbnaily; plné rozlišení až v detailu a rephotu.
- **Baterie:** žádné vlastní průběžné sledování polohy, jen systémový region
  monitoring a significant changes.
- **Apple to může přidat do Memories.** Odlišení: rephoto a později sdílené
  vzpomínky napříč platformami.
