Sent 14. apríl
**Staða: SVAR MÓTTEKIÐ — sjálfsafgreiðsla (self-service)** ⚡

---

## Svar nr. 1 — 20. apríl 2026

**Frá:** Vinnumálastofnun (Ásta Ásgeirsdóttir, deildarstjóri Greiningardeildar, Þróunar- og tæknisvið)
**Dags:** 20. apríl 2026
**Efni svars:** Vísað á opinbera mælaborðið „Helstu talnagögn um atvinnuleysi" á vmst.is → síðu G5 (atvinnugreinaskipting).

**Orðrétt:**
> „Á heimasíðu VMST undir Mælaborð og tölulegar upplýsingar er að finna ýtarlegri talnagögn um atvinnuleysi undir 'Helstu talnagögn um atvinnuleysi'. Þar er meðal annars að finna atvinnuleysi skipt niður á atvinngreinar (sjá síðu G5) og þar ættirðu að geta fundið þau gögn sem þú leitar eftir."

**Túlkun:** Engin sérvinnsla — vísað í fyrirframútgefna XLSM-skrá á CDN Hagstofu. Skráin var sótt 20. apríl 2026 og gögnin umbreytt í langsniða CSV.

### Heimildir

| Þáttur | Slóð |
|--------|------|
| Mælaborð | https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar |
| XLSM upprunaskrá | https://assets.ctfassets.net/8k0h54kbe6bj/688FRtXuoA4qkPXerKcuMT/e6b9794d1bdfcf5cb5747a46b9b3d836/Talnagogn_atvinnuleysi.xlsm |
| Vistuð upprunaskrá | `data/iceland-ai-governance-audit/data/raw/vmst_Talnagogn_atvinnuleysi_2026-03.xlsm` |
| Unnin CSV-skrá | `data/iceland-ai-governance-audit/data/raw/vmst_unemployment_by_sector_monthly.csv` |

### Hvað er í G5

| Þáttur | Innihald |
|--------|----------|
| Tímabil | febrúar 2000 – mars 2026 (314 mánuðir) |
| Mæling | Fjöldi á atvinnuleysisskrá í lok mánaðar |
| Atvinnugreinaflokkun | **Sérflokkur VMST** (18 flokkar), **EKKI formlegt ÍSAT** |
| Skipting | Allir / Íslenskt ríkisfang / Erlent ríkisfang |
| CSV raðir | 16.596 (langt snið) |

### Takmörkun — VMST-flokkun er ekki ÍSAT

VMST notar **18 sérflokka** (t.d. „Gistiþjónusta" + „Veitingaþjónusta" + „Ferðaþjónusta ýmis" = ÍSAT-I). Mismunur:

| FOIA-beiðni (ÍSAT) | VMST-flokkur |
|-------------------|--------------|
| J — Upplýsingar og fjarskipti | Upplýsingar og fjarskipti ✅ 1:1 |
| K — Fjármál og vátryggingar | Fjármála- og vátryggingastarfsemi ✅ 1:1 |
| M — Sérfræði-/vísindi-/tækni | Sérfræðileg, vísindaleg og tæknileg starfsemi ✅ 1:1 |
| F — Byggingarstarfsemi | Byggingastarfsemi og mannvirkjagerð ✅ 1:1 |
| I — Hótel og veitingastaðir | Gistiþjónusta + Veitingaþjónusta + Ferðaþjónusta ýmis ⚠️ 3:1 |
| N — Stjórnsýslu- og stoðþjónusta | *Ekki sérflokkur* — fellur í „Ýmis þjónustustarfsemi" ❌ |
| O–Q — Opinber stjórnsýsla/fræðsla/heilbrigði | Opinber þjónusta, fræðsla, heilbrigðis- og félagsþjónusta ✅ samanlagt |

**N (stjórnsýslu- og stoðþjónusta)** er ekki aðgengilegur sem sérflokkur í G5 — merkileg takmörkun sem eftirfylgni getur fjallað um.

### Lykilniðurstaða — atvinnuleysi priority-geira, jan 2023 → mars 2026

| Geiri | Jan 2023 | Mars 2026 | Δ | % | Hámark |
|-------|---------:|----------:|---:|---:|-------|
| **Heild (Allir)** | 7.189 | 10.051 | +2.862 | **+39,8%** | 10.185 (jan-26) |
| **J** Upplýsingar og fjarskipti | 163 | **322** | +159 | **+97,5%** ⚡ | 322 (mars-26) |
| **K** Fjármála- og vátryggingastarfsemi | 104 | **198** | +94 | **+90,4%** ⚡ | 198 (mars-26) |
| **F** Byggingastarfsemi og mannvirkjagerð | 675 | 1.251 | +576 | +85,3% | 1.251 (mars-26) |
| I (hluti) Gistiþjónusta | 453 | 682 | +229 | +50,6% | 742 (jan-26) |
| I (hluti) Veitingaþjónusta | 630 | 906 | +276 | +43,8% | 933 (jan-26) |
| **M** Sérfræðileg, vísindaleg og tæknileg | 233 | 277 | +44 | +18,9% | 277 (mars-26) |
| O–Q Opinber þjónusta, fræðsla, heilbrigði | 1.040 | 1.169 | +129 | +12,4% | 1.191 (feb-26) |

### Túlkun — styrkir ICT Trifecta-niðurstöðuna

**J-geirinn (upplýsingatækni) tvöfaldast næstum í atvinnuleysi (+97,5%) á meðan heildaratvinnuleysi vex um +39,8%** — J vex **2,45× hraðar** en aggregat. K-geirinn (fjármál) vex **2,27× hraðar**. M-geirinn (sérfræði) er frávik — vex aðeins +18,9% (undir aggregati).

Þetta er samhljóma við þær niðurstöður sem þegar eru skráðar í MEGA_REPORT:
- **R.2 ICT Trifecta:** Ráðningar -11,4%, tekjur +72%, laus störf 5,4→0,3% **+ atvinnuleysi +97,5%** — fjórða ás sem styrkir grundvallartilgátu.
- **M.4 Mælingarmisræmi:** VMST skráir hærri atvinnuleysistölur en Hagstofa í LFS — sundurliðunin eftir geirum sýnir að misræmið er ekki einsleitt; J og K eru *ofmælanlegar* hjá VMST.

### Takmarkanir sem beiðni um eftirfylgni ætti að fjalla um

1. **Engin ÍSAT-tilvísun.** VMST-flokkar samrýmast ekki ÍSAT 2008; ómögulegt að tengja beint við PxWeb-töflur án brúartöflu.
2. **N-geirinn horfinn.** Stjórnsýslu- og stoðþjónusta — geiri sem inniheldur ráðningaskrifstofur og temping — er ekki aðgengilegur.
3. **Engin hlutföll** — aðeins fjöldi. Ekki er hægt að reikna atvinnuleysi í prósentum án vinnuaflsstærðar í hverjum geira.
4. **„Ferðaþjónusta ýmis"** — óskilgreindur flokkur sem gerir það erfitt að smíða samanburðarhæfan I-geira samtaka.

### Staða verkefnis

✅ **Gögn móttekin og unnin.** Grunnniðurstaða: J-geira-atvinnuleysi +97,5% frá jan-23 til mars-26 er sterkasta staka staðfestingin á rannsóknartilgátu til þessa.

⏳ **Eftirfylgni** með beiðni um ÍSAT-brúartöflu og N-geira-sundurliðun gæti verið ástæða til að skrifa.

---

**Efni: Upplýsingabeiðni á grundvelli upplýsingalaga – Tölfræði um skráð atvinnuleysi eftir atvinnugreinum**

Sæl/l,

Mælaborð Vinnumálastofnunar á island.is veitir sjónræna mynd af atvinnuleysi eftir atvinnugreinum, en býður ekki upp á niðurhal á tímaröðum á mánaðar- og atvinnugreinastigi. Í endurskoðunarskýrslu Ríkisendurskoðunar („Atvinnuleysi og vinnumarkaðsúrræði,“ desember 2024) var bent á vaxandi misræmi milli talna Hagstofunnar og Vinnumálastofnunar um atvinnuleysi (allt að 17%), sem gerir aðgang að undirliggjandi stjórnsýslugögnum Vinnumálastofnunar mikilvægan í rannsóknarskyni.

Beiðnin styður við rannsóknarverkefni í framhaldi af meistaragráðu við Háskólann á Akureyri sem kannar mælingarhæfni íslenskra stofnana gagnvart áhrifum tæknibreytinga á vinnumarkaðinn. Rannsóknin hefur leitt í ljós að ársfjórðungsleg sundurliðun atvinnuleysis eftir atvinnugreinum er ekki opinberlega aðgengileg — einn af mörgum mælingargöllum sem koma í veg fyrir eftirlit með skipulagsbreytingum á vinnumarkaði.

**Umbeðin gögn**
Óskað er eftir mánaðarlegri tímaröð sem inniheldur eftirfarandi breytur:

* **Tímabil:** Mánaðarlega, frá janúar 2023 til febrúar 2026 (38 mánuðir).
* **Atvinnugrein:** ÍSAT 2008 (NACE Rev.2) á deildarstig (2 stafir), eða að lágmarki á bókstafsstigi (A til U).
* **Fjöldi:** Fjöldi skráðra atvinnulausra.
* **Hlutfall:** Atvinnuleysi í prósentum ef reiknanlegt (skráðir atvinnulausir / skráður vinnuafli í greininni).

**Forgangsgeirar (ef full sundurliðun er ekki möguleg)**
Ef ekki er unnt að afhenda fulla ÍSAT-sundurliðun er að lágmarki óskað eftir sérstökum tölum fyrir eftirfarandi flokka:
* **J:** Upplýsingar og fjarskipti
* **K:** Fjármála- og vátryggingastarfsemi
* **M:** Sérfræðileg, vísindaleg og tæknileg starfsemi
* **N:** Stjórnsýslu- og stoðþjónustustarfsemi
* **F:** Byggingarstarfsemi og mannvirkjagerð
* **I:** Rekstur hótela og veitingastaða
* **O–Q:** Opinber stjórnsýsla, fræðsla, heilbrigðisþjónusta (samanlögð tala nægir)

**Snið**
CSV eða Excel er æskilegt. Dæmi um uppbyggingu:

| Mánuður | ÍSAT-flokkur | Skráðir atvinnulausir | Vinnuafl (ef tiltækt) |
| :--- | :--- | :--- | :--- |
| 2023-01 | J | [n] | [n] |

**Lagalegur grundvöllur og beiðni um gagnakeyrslu**
Beiðni þessi er sett fram á grundvelli 5. gr. upplýsingalaga nr. 140/2012, sem veitir rétt til aðgangs að fyrirliggjandi gögnum í vörslu stjórnvalda. 

Ég geri mér grein fyrir því að samkvæmt ákvæðum 5. gr. nær rétturinn til þegar tilbúinna skjala. Þar sem Vinnumálastofnun varðveitir þessi gögn þegar í sínum skráningarkerfum — eins og atvinnugreinasían á Power BI mælaborði stofnunarinnar ber vitni um — er þess virðingarfyllst óskað, af greiðvikni, að gögnin verði tekin saman á töflusniði teljist það framkvæmanlegt án of mikillar fyrirhafnar. Jafnframt vil ég benda á að beiðnin er lögð fram í þágu rannsókna og vísa í því samhengi til heimilda stjórnvalda til að veita aðgang að gögnum vegna rannsókna, sbr. sjónarmið að baki 33. gr. laganna.

Verði beiðninni hafnað að hluta eða öllu leyti óska ég eftir skriflegum rökstuðningi þar sem tilgreindur er lagagrundvöllur synjunar í samræmi við 19. gr. laganna.

**Um rannsakandann**
Magnús Smári Smárason, MA í félagsvísindum, Háskólinn á Akureyri.
* **Meistararitgerð:** „Beyond Fragmentation: A Life-Value Alternative for AI Governance" (2026, 90 ECTS einingar).
* **Verkefnasíða:** [https://www.smarason.is/is/verkefni/beyond-fragmentation](https://www.smarason.is/is/verkefni/beyond-fragmentation)
* **Netfang:** magnus@smarason.is

**Rannsóknarverkefnið**
Þessi beiðni er hluti af opnu rannsóknarverkefni sem greinir mælingarhæfni íslenskra stofnana gagnvart áhrifum gervigreindar á vinnumarkað. Allar niðurstöður, heimildir og gögn eru birt opinberlega á GitHub: [https://github.com/Magnussmari/atvinnustefna-2035](https://github.com/Magnussmari/atvinnustefna-2035)

**Gagnsæisyfirlýsing**
Þessi beiðni var samin með aðstoð gervigreindarkerfis sem höfundur hefur þróað sem hluta af rannsóknarverkefni sínu. Höfundur hefur farið yfir og staðfest efni beiðninnar í heild sinni áður en hún var send. Gervigreindin aðstoðaði við uppbyggingu texta og heimildavinnu; allar fullyrðingar, röksemdir og ákvarðanir eru á ábyrgð höfundar.

**Svartími**
Samkvæmt 17. gr. upplýsingalaga nr. 140/2012 er almennur afgreiðslufrestur 7 dagar en getur verið allt að 20 dagar þegar óskað er gagna í rannsóknarskyni skv. 33. gr. Ég óska eftir svari við því hvort orðið verði við beiðninni svo fljótt sem verða má, en krefjist hún lengri afgreiðslutíma en 7 daga óska ég eftir tilkynningu um áætlaðan svartíma í samræmi við lögin.

Virðingarfyllst,

Magnús Smári Smárason
14. apríl 2026