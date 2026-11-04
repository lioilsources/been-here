# Plán: filtr stáří fotek na mapě

Zadání od uživatele: na mapě nechci vidět tečky všech fotek z celé historie.
Chci slider se dvěma úchyty, který říká „od kdy do kdy": třeba *posledních
14 dní*, nebo *14 dní zpátky, ale ne starší než 2 roky*.

> **Stav: implementováno.** Odchylky od plánu níže:
> - Sémantika `RangeSlider` **není** v `MergeSemantics`. Sloučení ponechá
>   jen hodnotu prvního úchytu. Jméno je na kontejneru a každý úchyt se čte
>   zvlášť. Ovládání čtečkou (`increase`/`decrease`) volá jen `onChanged`,
>   takže se ukládá hned, ne až v `onChangeEnd`.
> - České popisky: „Mladší než {x}", „Starší než {x}", „Staré {x} až {y}",
>   „Všechny fotky". Anglicky „Up to {x} old", „Older than {x}",
>   „{x} to {y} old", „All photos". Zarážky jsou v 1. pádě, takže stačí jeden
>   klíč na zarážku.
> - Tlačítko návratu k výchozímu je textové („Výchozí" / „Reset").
> - `AgeWindow.clamp` je `factory` konstruktor (vyžaduje lint).

Tento dokument je plán pro implementaci. Předpokládá čtenáře (model nebo
člověka), který repozitář ještě neviděl. Před začátkem si přečti
`docs/ARCHITECTURE.md` (vrstvy, pravidla importů, `test/architecture_test.dart`)
a `README.md` (build: `make gen`, `make check`).

---

## 1. Co se má stát (produktově)

- Na **celoobrazovkové mapě** (`HereMapScreen`) přibude pod radius sliderem
  druhý slider: **dvouúchytový `RangeSlider` na ose „jak staré"**.
- Levý úchyt = *nejnovější* hranice („ne novější než…"), pravý = *nejstarší*
  hranice („ne starší než…"). Mezi nimi je okno, které se kreslí.
  Příklad: levý na „teď", pravý na „2 roky" = posledních 2 roky.
  Příklad: levý na „14 dní", pravý na „2 roky" = 14 dní zpátky až 2 roky.
- Osa je **diskrétní** (pevné zarážky), ne spojitá. Zarážky:

  | index | zarážka | dní |
  |---|---|---|
  | 0 | teď | 0 |
  | 1 | 1 den | 1 |
  | 2 | 3 dny | 3 |
  | 3 | týden | 7 |
  | 4 | 2 týdny | 14 |
  | 5 | měsíc | 30 |
  | 6 | 3 měsíce | 90 |
  | 7 | půl roku | 180 |
  | 8 | rok | 365 |
  | 9 | 2 roky | 730 |
  | 10 | 5 let | 1826 |
  | 11 | 10 let | 3652 |
  | 12 | vše | ∞ (bez spodní hranice) |

  Proč diskrétní: label se čte jako věta („2 týdny – 2 roky"), dotaz do DB
  se nespouští na každý pixel, a dvouúchytový slider se spojitou
  logaritmickou osou se blbě ovládá palcem.
- **Výchozí okno: `teď – 2 roky`** (indexy 0–9). Uživatel výslovně nechce
  „celou historii" jako výchozí stav.
- Úchyty se nesmí sejít: okno musí mít aspoň jeden krok (`end > start`).
- **Filtr ovlivňuje jen tečky na mapě** (`memoryPointsProvider`).
  Timeline návštěv, počet u radius slideru, „nejbližší vzpomínka" a
  notifikace zůstávají beze změny: aplikace stojí na tom, že u místa
  ukáže „loni, před pěti lety", a to se nemá filtrovat. Viz otevřené
  otázky níže.
- Stejná data používá i **karta mapy** na Here obrazovce (`HereMapCard`,
  170 px, neinteraktivní). Karta nemá ovládání, ale **kreslí stejné
  filtrované tečky** a když okno není výchozí, ukáže malý štítek s jeho
  popisem (např. „2 týdny – 2 roky"), aby bylo jasné, proč na kartě tečky
  chybí.
- Okno se **ukládá** do `preferences` (tabulka klíč/hodnota, viz
  `PreferencesDao`), aby přežilo restart. Rádius se neukládá, protože patří
  k místu, kde člověk stojí; okno stáří je vkus a nastavovat ho po každém
  spuštění znovu by otravovalo.

## 2. Jak to dnes funguje (co je potřeba znát)

- `lib/app/providers.dart`
  - `SearchRadius` (`Notifier<double>`) + `searchRadiusProvider` – vzor pro
    nový notifier.
  - `memoryPointsProvider` (`FutureProvider<List<MapPhoto>>`) – jediný
    zdroj teček. Volá `MemoriesService.pointsNear(center, radiusMeters,
    limit: 800)`. **Sem přijde filtr.**
  - `hasSeenMemoriesProvider` / `markMemoriesSeen` – vzor přímého čtení a
    zápisu do `preferencesDao` mimo `AppSettings`.
- `lib/domain/memories/memories_service.dart` → `pointsNear`.
- `lib/data/db/daos/memories_dao.dart` → `pointsWithin` (ručně psané SQL,
  `ORDER BY taken_at DESC LIMIT ?`). `photosWithin` už umí `fromTakenAt` /
  `toTakenAt` – stejnou sémantiku (unix sekundy UTC, včetně obou krajů)
  převezmi.
- `lib/data/db/tables.dart` – `photos.taken_at` je integer (unix s),
  existují indexy `photos_lat_lng` a `photos_taken_at`. **Žádná migrace
  není potřeba.**
- `lib/features/here/widgets/here_map.dart`
  - `HereMapCard` (karta), `HereMap` (vlastní mapa), `HereMapScreen`
    (celá obrazovka), `_MapControls` (overlay dole s `RadiusSlider`).
- `lib/features/here/widgets/radius_slider.dart` – jak vypadá slider,
  label, počet, přístupnost (`MergeSemantics`, `semanticFormatterCallback`),
  throttling. Nový slider má vypadat jako sourozenec tohohle.
- `lib/features/common/format.dart` – formátovací helpery, sem přijde
  formátování okna.
- Lokalizace: `lib/l10n/app_en.arb` + `app_cs.arb`, generované soubory
  jsou commitnuté → po změně `.arb` spustit `make l10n` (nebo `make gen`)
  a commitnout `lib/l10n/generated/`.
- Testy: `test/features/here/here_map_test.dart` (widget testy mapy s
  `FakePhotoLibrary`, `FakeLocationService`, in-memory drift),
  `test/domain/memories/memories_service_test.dart` (service nad in-memory
  DB), `test/architecture_test.dart` (hlídá importy – domain nesmí
  importovat Flutter).

## 3. Návrh po vrstvách

### 3.1 `core/` nebo `domain/` – model okna (čistý Dart, bez Flutteru)

Nový soubor `lib/domain/memories/age_window.dart`:

```dart
/// Jak staré fotky se kreslí na mapě: od [newest] zpátky po [oldest],
/// obojí jako index do [stops].
@immutable
class AgeWindow {
  const AgeWindow({required this.newest, required this.oldest})
      : assert(newest < oldest);

  /// Zarážky slideru ve dnech. Poslední je „bez hranice".
  static const List<int?> stops = [0, 1, 3, 7, 14, 30, 90, 180, 365, 730, 1826, 3652, null];

  static const AgeWindow defaults = AgeWindow(newest: 0, oldest: 9); // teď – 2 roky
  static const AgeWindow all = AgeWindow(newest: 0, oldest: 12);

  final int newest; // index zarážky, 0 = teď
  final int oldest; // index zarážky, stops.length-1 = vše

  bool get isDefault => this == defaults;

  /// Hranice `taken_at` v unix sekundách UTC pro dotaz.
  /// `to` je null když newest == 0 (žádná horní hranice),
  /// `from` je null když oldest je poslední zarážka.
  ({int? from, int? to}) bounds(DateTime now) { ... }

  /// Sevře libovolný pár indexů do platného okna (pořadí, min. krok 1,
  /// rozsah). Používá slider při tažení.
  static AgeWindow clamp(int a, int b) { ... }

  String encode();                 // "0:9" pro preferences
  static AgeWindow? decode(String?); // null při nesmyslu → použij defaults
}
```

Poznámky:
- `now` se předává zvenku (vzor: `relativeAge(now: …)`, `clock` v
  `ArrivalService`). Žádné `DateTime.now()` uvnitř domain.
- „Teď – N dní" počítej jako `now.subtract(Duration(days: n))`, bez
  zarovnávání na kalendářní den. Zdokumentuj to v komentáři jako záměr:
  pro filtr teček je to jedno a `LocalDay` by sem tahal časové zóny.
- Unit test `test/domain/memories/age_window_test.dart`: bounds pro
  default, pro „vše", pro okno uprostřed; clamp (prohozené, stejné, mimo
  rozsah); encode/decode round-trip a decode nesmyslu.

### 3.2 `data/` – DAO

`MemoriesDao.pointsWithin` dostane volitelné `int? fromTakenAt`,
`int? toTakenAt` a přidá do `WHERE` `taken_at >= ?` / `taken_at <= ?`
(stejná sémantika jako `photosWithin`). Proměnné drž ve správném pořadí:
nejdřív `circle.variables`, pak hranice, pak `limit`.

Test v `test/data/db/database_test.dart` nebo
`memories_service_test.dart`: tři fotky na stejném místě s různým
`takenAt`, ověř, že hranice vrací jen prostřední.

### 3.3 `domain/` – service

`MemoriesService.pointsNear(center, radiusMeters, {limit, AgeWindow? window, DateTime? now})`
– když je `window` zadané, spočítá `bounds(now)` a předá je DAO. Bez
`window` se chová jako dnes (ostatní volající se nemění).

### 3.4 `app/providers.dart` – stav a propojení

```dart
/// Okno stáří teček na mapě. Uložené, protože je to vkus, ne poloha.
class MapAgeWindow extends AsyncNotifier<AgeWindow> {
  static const _key = 'map_age_window';

  @override
  Future<AgeWindow> build() async {
    final values = await ref.watch(databaseProvider).preferencesDao.readAll();
    return AgeWindow.decode(values[_key]) ?? AgeWindow.defaults;
  }

  Future<void> set(AgeWindow window) async {
    state = AsyncData(window);           // okamžitě, aby slider neskákal
    await ref.read(databaseProvider).preferencesDao.write(_key, window.encode());
  }
}
final mapAgeWindowProvider = AsyncNotifierProvider<MapAgeWindow, AgeWindow>(MapAgeWindow.new);
```

`memoryPointsProvider`:

```dart
final window = ref.watch(mapAgeWindowProvider).value ?? AgeWindow.defaults;
return service.pointsNear(center, radiusMeters: radius, limit: 800,
    window: window, now: DateTime.now());
```

`DateTime.now()` je v `app/`, kde už dnes je (řádek ~632), ne v domain.

Pozor: `memoryPointsProvider` se přepočítá i při každém posunu radius
slideru; filtr přidá jen dvě podmínky na indexovaný sloupec, takže cena
je zanedbatelná. Není třeba nic měnit na throttlingu.

### 3.5 `features/` – UI

Nový widget `lib/features/here/widgets/age_slider.dart` (`AgeSlider`),
sourozenec `RadiusSlider`:

- `ConsumerStatefulWidget`, lokální `_dragging` (`RangeValues`) během
  tahu, zápis do provideru v `onChangeEnd` (zarážky jsou diskrétní, takže
  stačí zapsat na konci; při tahu stačí `setState` pro label).
- `RangeSlider(min: 0, max: stops.length - 1, divisions: stops.length - 1,
  values: …, labels: RangeLabels(…))`.
- V `onChanged` převeď na int a protáhni přes `AgeWindow.clamp`, aby se
  úchyty nesešly.
- Řádek nad sliderem: vlevo label okna (viz formát níže), vpravo počet
  teček: `points.length`, a když `== 800` (limit), zobraz `800+`. Počet
  čti z `memoryPointsProvider` (už ho mapa sleduje), ne novým dotazem.
- Přístupnost stejně jako `RadiusSlider`: `MergeSemantics`, `Semantics(label:
  l10n.ageSemanticLabel)`, `semanticFormatterCallback` vracející název
  zarážky (ne surový index).
- Když okno není výchozí, malé tlačítko „Reset" (ikona `Icons.restart_alt`
  nebo `TextButton`) vrátí `AgeWindow.defaults`.

Formátování (`features/common/format.dart`):

- `formatAgeStop(l10n, int? days)` → „teď", „1 den", „3 dny", „týden",
  „2 týdny", „měsíc", „3 měsíce", „půl roku", „rok", „2 roky", „5 let",
  „10 let", „vše". Doporučuji jeden l10n klíč na zarážku (`ageStopNow`,
  `ageStopDay`, …) místo plurálů – jsou to pevné texty, ne počty.
- `formatAgeWindow(l10n, AgeWindow w)`:
  - `newest == 0 && oldest == vše` → „Všechny fotky"
  - `newest == 0` → „Posledních {oldest}" (cs) / „Last {oldest}" (en),
    např. „Poslední 2 roky", „Poslední týden". Pozor na český tvar:
    „Poslední týden", „Poslední 2 roky", „Posledních 5 let" – tvar
    závisí na zarážce, takže dej do `.arb` samostatný klíč na kombinaci
    „posledních + zarážka", nebo zvol neutrální tvar „Do 2 let zpátky".
    Rozhodni se pro jednu z variant a drž ji v obou jazycích.
  - jinak → „{newest} – {oldest} zpátky", např. „2 týdny – 2 roky zpátky".

Umístění:

- `_MapControls` v `here_map.dart`: pod `RadiusSlider` přidej
  `AgeSlider`. Overlay má poloprůhledné pozadí, oba slidery se tam vejdou;
  zkontroluj na malém displeji (iPhone SE) a při dvojnásobné velikosti
  textu (viz `test/features/here/accessibility_test.dart`), že overlay
  nepřekryje víc než ~40 % mapy. Když ano, zmenši vertikální padding
  sliderů místo přidávání scrollu.
- `HereMapCard`: do `Stack` přidej vpravo nahoře malý `Chip`/štítek s
  `formatAgeWindow` **jen když `!window.isDefault`**. Žádné ovládání na
  kartě; tap na kartu dál otvírá celou mapu.
- `HereScreen` se nemění (timeline nefiltrujeme).

### 3.6 Lokalizace

Přidej do `app_en.arb` a `app_cs.arb` (včetně `@` popisků v en):
`ageSemanticLabel` („Stáří fotek" / „Photo age"), `ageStop*` pro každou
zarážku, `ageWindowAll`, `ageWindowLast` (nebo varianty), `ageWindowRange`,
`ageWindowReset`, `herePhotoCountCapped` („{count}+"). Pak `make l10n` a
commitni `lib/l10n/generated/`.

### 3.7 Dokumentace

- `docs/ARCHITECTURE.md`: krátký odstavec do „Decisions" – proč filtr
  platí jen pro mapu a proč je okno v `preferences` a rádius ne.
- `docs/QA.md`: nová sekce s ruční kontrolou (viz §5).

## 4. Testy (co musí projít v `make check`)

1. `test/domain/memories/age_window_test.dart` – viz §3.1.
2. `memories_service_test.dart`: `pointsNear` s oknem vrací jen fotky v
   okně; bez okna vrací všechny; okno „vše" vrací všechny; `newest > 0`
   vynechá nejnovější.
3. `here_map_test.dart` (widget):
   - fixtures `_photos()` mají `takenAt` v roce 2019 → s výchozím oknem
     (2 roky) by **zmizely z mapy**. Buď přidej do fixtures i čerstvé
     fotky, nebo v `setUp` nastav okno na `AgeWindow.all` přes
     `db.preferencesDao.write('map_age_window', …)`. Rozhodni se podle
     toho, který test co ověřuje; stávající testy tapu na tečku
     (`PhotoDetailScreen`) musí dál projít.
   - nový test: dvě fotky, jedna 3 dny stará, jedna 3 roky; výchozí okno
     kreslí jednu tečku (`CircleLayer` má 1 + 1 kruh: rádius + tečka);
     po nastavení okna na „vše" dvě.
   - nový test: na `HereMapScreen` je `RangeSlider`; posun pravého úchytu
     změní `mapAgeWindowProvider` a hodnota se po rebuildu aplikace
     načte z DB (persistence).
   - nový test: karta ukazuje štítek jen při nevýchozím okně.
4. `accessibility_test.dart`: `RangeSlider` má sémantický label a čtené
   hodnoty jsou slova, ne čísla 0–12.
5. `architecture_test.dart` musí projít beze změn (žádný Flutter import v
   `domain/memories/age_window.dart`).

Spouštění: `make analyze && make test`. Benchmarky (`make bench`) se
netýkají, ale `make check` je pouští, tak je nerozbij.

## 5. Ruční QA (do `docs/QA.md`)

- [ ] Na celé mapě je pod rádiusem slider stáří, výchozí „teď – 2 roky".
- [ ] Posun pravého úchytu na „vše" rozsvítí staré tečky; zpět na „2 roky"
      je schová. Počet vpravo odpovídá.
- [ ] Úchyty nelze přetáhnout přes sebe.
- [ ] Levý úchyt na „2 týdny" schová fotky z posledních dvou týdnů.
- [ ] Po zabití a spuštění aplikace zůstane nastavené okno.
- [ ] Karta na Here ukazuje štítek s oknem, když není výchozí; tap na
      kartu otevře mapu se stejným oknem.
- [ ] Timeline pod kartou se filtrem nemění (záměr).
- [ ] Česky i anglicky, dark mode, 200 % text: overlay nezakryje mapu.
- [ ] VoiceOver/TalkBack přečte „Stáří fotek" a názvy zarážek.

## 6. Pořadí práce (doporučené commity)

1. `AgeWindow` + test (domain, čistý Dart).
2. DAO `fromTakenAt/toTakenAt` v `pointsWithin` + test.
3. `pointsNear(window:, now:)` + test.
4. `mapAgeWindowProvider` + napojení do `memoryPointsProvider`; oprav
   fixtures v `here_map_test.dart`, aby stávající testy prošly.
5. `.arb` + `make l10n` + `format.dart`.
6. `AgeSlider` + zapojení do `_MapControls`; widget testy.
7. Štítek na `HereMapCard` + test.
8. Docs (`ARCHITECTURE.md`, `QA.md`).

Každý krok má po sobě zelené `make analyze && make test`.

## 7. Otevřené otázky (rozhodnuto takto, dá se změnit)

| Otázka | Rozhodnutí v tomto plánu | Alternativa |
|---|---|---|
| Filtrovat i timeline a počet u rádiusu? | Ne, jen tečky. Zadání říká „na mapě". | Jeden přepínač „filtr platí i na seznam" – až když o něj někdo požádá. |
| Výchozí okno | teď – 2 roky | teď – rok; nebo „vše" s tím, že si uživatel nastaví sám (zadání to nechce). |
| Persistovat? | Ano, `preferences['map_age_window']` | In-memory `Notifier` jako `SearchRadius` (jednodušší, ale po restartu se vrátí default). |
| Diskrétní vs. spojitá osa | Diskrétní zarážky | Logaritmická spojitá jako rádius; hůř se ovládá dvěma palci a label není věta. |
| Kalendářní vs. přesné dny | Přesné (`now − n dní`) | `LocalDay` zarovnání na půlnoc; pro tečky zbytečné. |
| Ovládání i na kartě? | Ne, jen štítek | Mini-slider na kartě; karta je 170 px a neinteraktivní záměrně. |
