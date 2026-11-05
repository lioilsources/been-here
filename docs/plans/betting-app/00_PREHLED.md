# Emocionální sázecí appka — přehled balíčku

Stav: koncept, 2026-11-04. Není to součást Been Here; je to samostatný produkt,
který je tu zaparkovaný, protože autor má jedno repo a jeden Flutter stack.
Kdyby se do toho šlo, dostane vlastní repo (viz plán, fáze 0).

## Co je uvnitř

| Soubor | K čemu | Pro koho |
|---|---|---|
| `01_PLAN_PRO_OPUS.md` | Implementační plán po fázích s akceptačními kritérii a go/no-go bránou. Napsaný tak, aby ho mohl vzít Opus a začít. | Opus / vývojář |
| `02_PROVIDERI_A_FIT.md` | Co nabízejí Tipsport, Fortuna, Betano, Sazkabet, globální sázkovky, e‑sports, krypto sázkovky, predikční trhy a „A/B rulety“ — a jak k nim appka sedí. | Zakladatel |
| `03_OPONENTURA.md` | Proč to nemůže fungovat. Dvanáct námitek, ke každé „co by muselo platit, aby padla“. | Zakladatel, před investicí času |
| `04_SWOT_KONKURENCE.md` | SWOT jednotlivých konkurenčních platforem a kde v tom je mezera. | Zakladatel |
| `06_DETAIL_TYMU.md` | Specifikace obrazovky oblíbeného týmu: kádr, lavička, pětky a dvojice, trenéři, historie, stadiony, doma/venku; co z toho smí do modelu. | Opus |
| `07_SROVNANI_TYMU.md` | Specifikace side‑by‑side srovnání dvou týmů v den zápasu: bloky metrik, pravidla pro zvýraznění výhody, karty „Co rozhoduje“ z dekompozice modelu. | Opus |
| `05_APIFY_SCRAPERY.md` | Co nabízí Apify Store a MCP: scrapery sázkovek, agregátorů kurzů a sestav, ceny, právní rámec a co to mění v plánu. | Opus / zakladatel |

## Myšlenka v jednom odstavci

Každý tým jede na „vlně“: posledních N zápasů (vážených podle stáří a podle
toho, *jak* se hrálo, ne jen jak to dopadlo), kdo chybí a jak moc ten hráč
nese tým, kdo za něj nastoupí a jak hluboká je lavička, kolik se střídá a jak
unavení přijdou. Dvě vlny proti sobě dají pravděpodobnostní model výsledku —
ne jen „kdo vyhraje“, ale rozložení skóre, ze kterého plynou hendikepy,
poločasy, třetiny, přesné výsledky, over/under. Appka porovná naši
pravděpodobnost s kurzem u každé sázkovky, kterou uživatel používá, a řekne,
kde (a jestli vůbec) je hodnota. Emoce je v tom dvakrát: jako vstup (vlna týmu)
a jako výstup (sázkař, který chce sázet 0:1, dostane číslo, ne kázání).

## Pořadí čtení

Nejdřív `03_OPONENTURA.md`. Jestli po ní zůstane chuť, teprve pak plán. Plán
je postavený tak, že se **žádná appka nestaví, dokud model na backtestu
neporazí trh** (fáze 1–3, brána G1). To je nejlevnější způsob, jak zjistit,
že oponentura měla pravdu.

## Hlavní zdroje (ověřeno 2026-11-04)

Tržní data: [e15: Tipsport 2025](https://www.e15.cz/domaci/tipsport-loni-zvysil-zisk-temer-o-tretinu-prehoupl-se-pres-miliardu-korun-1344322),
[e15: Fortuna](https://www.e15.cz/domaci/fortuna-loni-vydelala-pres-400-milionu-firmu-tahly-internetove-sazky-1067069),
[Forbes.cz: Betano](https://forbes.cz/rostou-nejrychleji-na-svete-po-plzni-a-komete-chteji-fotbalovou-ligu-sef-betana-o-vysokych-ambicich/),
[Lupa: srovnání sázkovek](https://www.lupa.cz/native/bonusy-live-sazky-a-aplikace-co-nabizi-nejvetsi-sazkove-kancelare-na-ceskem-trhu/).
Kurzová API: [Odds-API.io changelog (Tipsport přidán 12/2025)](https://feedback.odds-api.io/changelog),
[OddsPapi](https://oddspapi.io), [The Odds API bookmakers](https://the-odds-api.com/sports-odds-data/bookmaker-apis.html),
[Pinnacle API uzavřeno 23. 7. 2025](https://github.com/pinnacleapi/pinnacleapi-documentation).
Sportovní data: [Sportmonks Premium Expected Lineups](https://docs.sportmonks.com/v3/endpoints-and-entities/endpoints/premium-expected-lineups),
[Sportmonks ceny](https://www.sportmonks.com/football-api/plans-pricing),
[Sportradar hokej](https://developer.sportradar.com/ice-hockey/reference/overview),
[Enetpulse hokej](https://enetpulse.com/wp-content/uploads/Ice-Hockey-Packages.pdf),
[Goalserve hokej](https://goalserve.com/sport-data-feeds/ice-hockey-api/coverage).
Regulace: [Celní správa MI‑2025‑023 (affiliate)](https://celnisprava.gov.cz/cz/Metodika/MI-2025-023.pdf),
[MF varuje influencery 2026](https://mf.gov.cz/cs/kontrola-a-regulace/hazardni-hry/workshopy-a-aktuality/aktuality/2026/ministerstvo-financi-varuje-influencery-pred-propa-65266),
[MediaGuru: návrh omezení reklamy 2025](https://www.mediaguru.cz/clanky/2025/06/reklamni-byznys-loterii-a-sazkovek-je-v-ohrozeni/),
[Lupa: zákaz reklamy a financování sportu](https://www.lupa.cz/aktuality/obchodnici-s-vysilacimi-pravy-zakaz-reklamy-na-hazard-ohrozi-financovani-sportu/),
[The Block: ESMA k Polymarket/Kalshi](https://theblock.co/news/regulation/2026-09-11-esma-says-major-prediction-platforms-lack-eu-authorization-questions-polymarket-and-kalshis-partial-geo-blocks-414239),
[Fintelegram: Francie blokuje Polymarket](https://fintelegram.com/?p=81773),
[Google Play gambling policy](https://support.google.com/googleplay/android-developer/answer/13381106),
[Apple 5.3 (Conduct Atlas)](https://conductatlas.com/platform/apple/apple-app-store-review-guidelines/gambling-and-real-money-game-requirements/).
Predikční trhy a krypto: [The Block: $45 mld. v červnu 2026](https://www.theblock.co/post/406983/kalshi-polymarket-volume-45-billion),
[Front Office Sports](https://frontofficesports.com/prediction-markets-exploded-in-2025-what-comes-next/),
[Azuro docs](https://onchainbets.gitbook.io/onchainbets-docs/faq/azuro-protocol),
[CasinoBeats: Fliff → predikční trhy](https://casinobeats.com/2026/08/13/fliff-applies-for-prediction-market-license-as-sweepstakes-operators-pivot-models/),
[Manifold review 2026](https://cryptonews.com/cryptocurrency/manifold-markets-review/).
E‑sports: [Track360 statistiky 2026](https://track360.io/blog/esports-betting-statistics-2026),
[Oddin.gg trendy](https://oddin.gg/knowledge-hub/esports-betting-trends-2026),
[CDC: Pinnacle investuje do Rivalry](https://cdcgaming.com/rivalry-announces-strategic-investment-by-pinnacle/).
Akademika: [Moskowitz, Asset Pricing and Sports Betting (JF 2021)](https://academicnewsletter.sufe.edu.cn/info/359180),
[Byrnes & Farinella: momentum v NBA](https://thesportjournal.org/article/the-effect-of-momentum-on-the-nba-point-spread-market/),
[Sinkey & Logan: efektivita trhu](https://aeaweb.org/conference/2010/retrieve.php?pdfid=406),
[Offerman & Sonnemans: overreaction a hot hand](https://se.vlex.com/vid/whats-causing-overreaction-an-855676387).
Omezování výherců: [UKGC / Gambling Insider](https://www.gamblinginsider.com/magazine/1144/account-limits-legality-and-fairness-in-the-uk),
[Racing Post survey](https://www.racingpost.com/news/the-big-punting-survey/betting-account-restrictions-on-the-rise-as-two-in-five-report-being-limited-asfxC5q9xYDr).
Nástroje: [Trefík](https://trefik.cz/jak_tipuje_eng.aspx), [Forebet](https://apps.apple.com/pt/app/id6443482854).
