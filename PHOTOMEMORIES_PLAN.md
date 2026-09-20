# Been Here — implementační plán

Pracuje se po fázích, v pořadí. Po každé fázi: testy zelené, `flutter analyze`
čistý, commit. Další fáze nezačíná, dokud nejsou splněná akceptační kritéria
té předchozí.

## 0. Rozhodnutí (sekce 9 zodpovězena 2026-09-20)

| Otázka | Rozhodnutí |
|---|---|
| Název / bundle id | **Been Here** / `com.lioilsources.beenhere`, Dart package `been_here` |
| Monetizace | Vše zdarma v první verzi. Žádné IAP, žádné feature flagy. |
| Mapa | V MVP žádná. Místa jsou seznam. `flutter_map` + OSM zůstává volbou, až bude potřeba. |
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

### Fáze 1: Indexace — hotovo (kromě běhu na reálném telefonu)

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
- [ ] **Zbývá tobě:** běh na reálném telefonu s velkou knihovnou — progress,
      resume po backgroundu, iCloud offload. Viz `docs/QA.md`.

### Fáze 2: Obrazovka Tady — hotovo (kromě běhu na reálném telefonu)

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
- [ ] **Zbývá tobě:** ověřit na telefonu, že se reálné fotky z okolí seskupí
      správně a slider je plynulý. Simulátor to neumí — PhotoKit na iOS 26
      neuznává `simctl privacy grant photos` a systémový dialog nejde
      odklepnout skriptem. Viz `docs/QA.md`.

Nejbližší *místo* nahradí nejbližší fotku ve fázi 3.

### Fáze 3: Místa a mute

- Clustering + auto-mute, přepočet po indexaci
- Obrazovka Místa: seznam (řazení: nejdéle nenavštívené / nejvíc fotek /
  nejblíž)
- Ruční mute/unmute, zobrazení ztlumených zvlášť
- Reverse geocoding popisků líně a s cache, vypínatelné, zmíněné v onboardingu
- **Hotovo když:** fixtures test ověří, že domov/práce jsou auto-mute a
  výletová místa ne; na reálných datech dávají místa smysl

### Fáze 4: Geofence notifikace

- Eskalace oprávnění: when-in-use → always, až po prvním úspěšném zobrazení
  vzpomínek, s vlastní vysvětlující obrazovkou
- `GeofenceService`: registrace nejbližších míst, přeregistrace, handler na
  enter → pravidla → lokální notifikace → deep link
- Bez always oprávnění appka funguje dál, jen bez notifikací
- Info.plist / manifest texty oprávnění srozumitelně, kvůli App Review
- **Hotovo když:** simulace polohy (GPX v Xcode) vyvolá notifikaci u
  neztlumeného místa, u ztlumeného ne; cooldowny drží; tap otevře správné místo

### Fáze 5: Rephoto

- Kamera s overlayem původní fotky: slider průhlednosti, přepínač
  overlay/obrys hran, zamknutý poměr stran podle originálu
- Po vyfocení: uložit novou fotku do systémové knihovny, záznam do `rephotos`
- Výstup then & now: side-by-side obrázek a interaktivní slider v appce;
  export přes share sheet
- **Hotovo když:** jde udělat rephoto z detailu fotky, výsledek se uloží a jde
  sdílet

### Fáze 6: Onboarding a polish

- Onboarding: 3 obrazovky (co to dělá, soukromí, oprávnění k fotkám). Poloha
  až na obrazovce Tady.
- Settings: prahy (mute dny, stáří vzpomínky, cooldown), geocoding on/off,
  reindex, debug poloha
- Dark mode, prázdné/chybové stavy, přístupnost základně
- Ikona, splash, TestFlight build

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
