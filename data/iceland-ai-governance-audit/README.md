# PANOPTICON REVERSE

Rannsókn á því hvernig Ísland stjórnar gervigreind á grundvelli lántra töluleg, án mælibúnaðar til að greina raunveruleg áhrif á vinnumarkað, velferðarkerfi eða vinnuafl.

**Aðalniðurstaða: „Ísland er að fljúga blinnt í gervigreind"**

Rannsóknin hófst sem tilraun til að loka orsakakeðjunni: *gervigreind → atvinnumissir → velferðarkerfi*. Keðjan lokaðist ekki — en það er rannsóknarniðurstaðan. Stofnanalegar blindurnar eru fundnar, skráðar og sönnuðar með gögnum.

**Tengsl við meistaraverkefni:** Meistaraverkefni höfundar (*Beyond Fragmentation: A Life-Value Alternative for AI Governance*, UNAK 2026, einkunn 9,5/10) er aðgengilegt á [Skemman](https://skemman.is/handle/1946/52173).

---

## Helstu niðurstöður — Sex sönnunarstoðir

| Stoð | Niðurstaða | Lykiltölur |
|------|-----------|------------|
| **1. Mælivakuum** | Ísland undanskilið bæði Eurostat AI-könnun og EWCS 2024. 17% mismunur milli Hagstofu og VMST. Aðgerðaráætlun byggð á lánteknum alþjóðlegum tölum. | 0 innlend mæling |
| **2. UT-trifecta** | Ráðning -11,4% + VSK-velta +72% + Lausstörf -94% í upplýsingatæknigeiranum. Tilfærslusmynsturinn er sjáanlegt — en enginn var að fylgjast með. | -1.300 störf, +34% velta |
| **3. Stofnanalegt þögn** | Engjar stéttarfélög sendu inn umsögn um gervigreind til samráðsgáttar. Engar gervigreindarályktanir á þingi ASÍ. Engin kjarasamningsákvæði. Norræn nágrannaþjóðir hafa öll slík ramma. | 0 umsagnir |
| **4. Umræðu-realítigap** | ~35 manns smíða gervigreind á Íslandi, ~15+ gefa sig út fyrir það. Engir verkfræðingar taka þátt í stefnumótunarumræðu. | 35 vs. 15+ |
| **5. Háskólaeyðimörk** | RU + HI eiga ~95% af gervigreindarfærni. Öll 8 Rannís-styrki fóru til RU/HI. Enginn hagfræðingur rannsakar gervigreind og ráðningar. | 8/8 styrki |
| **6. Velferðarsvarthol** | Geðfatlanir +179%, geðlyf #1 í heiminum. Fyrri starfsgrein umsækjenda um örorkubætur er ekki opinber. Kerfið getur ekki rakið hvort tilfærðir starfsmenn fari inn í það. | 9,4% af vinnumarkaði |

---

## Skjalakort

### Verkefnið í einu augnaráði

```
panopticon/
├── README.md ................................ Þetta skjal — aðalkort verkefnisins
│
├── UNAK_report/ ............................. Skýrsla fyrir Háskólann á Akureyri (9. mars 2026)
│   ├── UNAK_AI_LANDSCAPE_Q1_2026.md ........ ~6.700 orð, 8 kaflar, 40+ heimildir, 10 tillögur
│   └── PROJECT_MANAGEMENT_LOG.md ........... Mannlegt eftirlit — 8 fasar, 44 staðreyndir prófaðar
│
├── reports/ ................................. Rannsóknarskýrslur (14 skjöl)
│   ├── FLYING_BLIND_ARCHITECTURE.md ........ Uppbygging 6 sönnunarstoða — aðallegar rammar
│   ├── FLYING_BLIND_SYNTHESIS.md ........... Heildarsamantekt gagna þvert á allar stoðir
│   ├── PANOPTICON_BRIEF.md ................. Framkvæmdaryfirlit — 2 blaðsíður
│   ├── WORKSTREAM_A_MACRO_REPORT.md ........ Þjóðhagfræðileg greining vinnumarkaðar
│   ├── WORKSTREAM_B_WELFARE_AUDIT.md ....... Endurskoðun örorku- og endurhæfingarkerfis
│   ├── WORKSTREAM_C_CORPORATE*.md .......... Fyrirtækjagreining — gervigreindarinnleiðing
│   ├── WORKSTREAM_D_EPISTEMIC*.md .......... Þekkingarskerðing og umræðutómarúm
│   ├── PANOPTICON_SYNTHESIS.md ............. Krossgreining allra verkstrauma (upprunalegt)
│   ├── INTELLIGENCE_SWEEP_REPORT.md ........ Njósnasveit — nýjar gagnaheimildir og fræðigreinar
│   ├── AI_ECOSYSTEM_MAP.md ................. Smíðamaður vs. umsagnarmenn — flokkun
│   ├── DISCOURSE_REALITY_GAP_REPORT.md ..... Umræðu-realítigap greining
│   ├── UNIVERSITY_AI_LANDSCAPE.md .......... Gervigreindarfærni háskóla — endurskoðun
│   ├── SAMRADSGATT_ANALYSIS.md ............. Greining 12 umsagna úr samráðsgátt S-223/2024
│   └── PANOPTICON_SAMANTEKT.md ............. Heildarsamantekt allra niðurstaðna (íslenska)
│
├── docs/ .................................... Skipulags- og stjórnunarskjöl + samráðsgögn
│   ├── PANOPTICON_MISSION_PLAN.md .......... Áætlun 1. fasa — gagnamat og hrakningarskilyrði
│   ├── PANOPTICON_POST_LAUNCH_REPORT.md .... Staðfestingarlisti og stöðuskýrsla
│   ├── DATA_DICTIONARY.md .................. Gagnaorðabók — skemu, API-lýsing, takmarkanir
│   └── samrad/ ............................. 12 umsagnir úr samráðsgátt (PDF/MD)
│
├── graph/ ................................... Neo4j þekkingargraf
│   └── PANOPTICON_GRAPH.cypher ............. 955 línur — ~112 hnútar, ~65 tengsl
│       Upprunalegt (2026-03-06): Workstreams A–D — Ísland innlæg gögn
│       Viðauki (2026-03-09): UNAK-rannsókn — Evrópsk samhengi, benchmarks, stofnanir
│
├── scripts/ ................................. Gagnaútdráttarforrit (6 skjöl, ~1.100 línur)
│   ├── hagstofa_pxweb.py ................... Hagstofa PxWeb API — 10 töflur (150K+ raðir)
│   ├── run_pipeline.sh ..................... Aðalkeðja — útdráttur + staðfesting í einu skrefi
│   ├── validate_data.py .................... Gagnagæðaeftirlit
│   ├── ted_procurement.py .................. TED innkaupagagnagrunnur — íslensk UT-samningar
│   ├── sedlabanki_financial_stress.py ...... Seðlabanki — fjárhagsleg streituævisaga
│   └── graph_import.sh ..................... Neo4j innflutningshjálp
│
├── data/ .................................... Gagnamöppur (gitignored)
│   ├── raw/ ................................. Hráar API-niðurstöður + fræðigreinar
│   │   └── s41586-025-09962-4.pdf .......... HLE — Nature Vol 649, Phan et al. 2026
│   └── processed/ .......................... Hreinsuð gagnasöfn
│
├── data-requests/ ........................... Formleg bréf samkvæmt upplýsingalögum (3 skjöl)
│   ├── 01_TR_OCCUPATION_DIAGNOSIS.md ....... TR: starfsgrein × sjúkdómsgreining krosstafla
│   ├── 02_VMST_SECTOR_UNEMPLOYMENT.md ...... VMST: mánaðarlegt atvinnuleysi eftir atvinnugreinum
│   └── 03_HAGSTOFA_VACANCIES.md ............ Hagstofa: lausstörf eftir atvinnugreinum
│
└── .gitignore ............................... Python, gögn, trúnaðargögn
```

**Samtals: 30+ skrár, ~15.000+ línur kóða og texta.**

---

## Ítarleg skjalaskrá

### UNAK-skýrsla (`UNAK_report/`)

| Skjal | Línur | Efni | Athugasemdir |
|-------|-------|------|--------------|
| `UNAK_AI_LANDSCAPE_Q1_2026.md` | ~6.700 orð | Q1 2026 gervigreindarlandslag — alþjóðlegt, evrópsk, norrænt, íslenskt. 8 kaflar + framkvæmdaryfirlit. 10 tillögur. 40+ heimildir. | Stuðst við 6 samhliða rannsóknaragentar, 200+ heimildir, 4 sjálfstæðar staðreyndaprófunaragentar. Staðreyndavillur leiðréttar: 4. |
| `PROJECT_MANAGEMENT_LOG.md` | 195 línur | Mannlegt eftirlit yfir framleiðslu AI-studdrar skýrslu. 8 fasar: skilgreining, rannsókn, samantekt, gagnrýni, falskheitagreining, heimildaprófun, staðreyndaeftirlit, lokaástand. | Undirritað: Magnús Smári Smárason, MA. 9. mars 2026. |

### Skýrslur (`reports/`)

| Skjal | Efni | Helstu niðurstöður |
|-------|------|-------------------|
| `FLYING_BLIND_ARCHITECTURE.md` | Uppbygging 6 sönnunarstoða | Endurskipuleggur rannsóknina frá „QUALIFIED" í „Flying Blind" — stofnanalegar blindurnar ER niðurstaðan |
| `FLYING_BLIND_SYNTHESIS.md` | Heildarsamantekt þvert á allar stoðir | Gagnleg yfirlit yfir öll sex blinda svæði með beinum gagnatenglum |
| `PANOPTICON_BRIEF.md` | Framkvæmdaryfirlit | 2 blaðsíður. Hæfur til kynningar fyrir stjórnendur og stefnumótendur. |
| `WORKSTREAM_A_MACRO_REPORT.md` | Þjóðhagfræðileg greining | Þekkingarstörf -9.300 (2024→2025). UT -11,4%. 25–54 ára atvinnuleysi 4,9% F4 2025. 17% mismunur Hagstofu/VMST. |
| `WORKSTREAM_B_WELFARE_AUDIT.md` | Örorku- og endurhæfingarkerfi | 6,3%→9,4% af vinnumarkaði (2000–2024). Geðraskanir +179%. Konur 18–49: +79%. Útgjöld +40% á ári. |
| `WORKSTREAM_C_CORPORATE*.md` | Fyrirtækjagreining | Landsbankinn: -38 FTE + tækniorðalag. Íslandsbanki: -20. Arion: +36 (mótdæmi). |
| `WORKSTREAM_D_EPISTEMIC*.md` | Þekkingarskerðing | Ísland ekki í EWCS 2024. 0 verkalýðsfélagar birtu neitt um gervigreind. |
| `AI_ECOSYSTEM_MAP.md` | Smíðamaður vs. umsagnarmenn | ~35 smíða gervigreind á Íslandi. ~15+ gefa sig út fyrir það. Enginn verkfræðingur í stefnumótunarumræðu. |
| `DISCOURSE_REALITY_GAP_REPORT.md` | Umræðu-realítigap | Ríkið notaði gervigreind til að skipta um stjórnsýslustörf á meðan aðgerðaráætlun segir „aukningarstuðningur". |
| `UNIVERSITY_AI_LANDSCAPE.md` | Háskólaendurskoðun | RU + HI: ~95% gervigreindarfærni. Öll 8 Rannís-styrki. UNAK: AUTO-MARE einn, 1. íslenska háskólinn með gervigreindarstjórnunarstefnu (30. okt. 2025). |
| `SAMRADSGATT_ANALYSIS.md` | 12 umsagnir S-223/2024 | BHM: 2 blaðsíður, engin gögn. ASÍ, VR, Efling, SFR, BSRB: Ekkert. Verkalýðshreyfingin er fjarverandi. |
| `INTELLIGENCE_SWEEP_REPORT.md` | Njósnasveit (6 agentar) | UT lausstörf -94% (JVS00001). J62 velta +72% (FYR04101). 14 nýjar fræðigreinar. |
| `PANOPTICON_SYNTHESIS.md` | Krossgreining (upprunalegt) | Úrskurður: QUALIFIED. 400× bil milli þjóðhagsmerkis (-9.300) og fyrirtækjasönnunar (22). |
| `PANOPTICON_SAMANTEKT.md` | Heildarsamantekt | Íslenska. Allir verkstraumar. Hæfir til dreifingar. |

### Þekkingargraf (`graph/`)

| Skjal | Línur | Hnútar | Tengsl | Hnútatýpur |
|-------|-------|--------|--------|-----------|
| `PANOPTICON_GRAPH.cypher` | 955 | ~112 | ~65 | MacroMetric, WelfareStatistic, CorporateAction, PolicyChange, UnionGrievance, AcademicEvidence, FalsificationTest, DemographicCohort, DataSource, **GovernanceFramework**, **InstitutionalCapacity**, **BenchmarkEvidence**, **ResearchProject**, **EvidenceGap**, **InternationalComparison** |

**Nýjar hnútatýpur (UNAK-viðauki 2026-03-09):** GovernanceFramework (EU AI Act þrep 1–3, norrænar stefnur), InstitutionalCapacity (UNAK, AIFA-ICE, Nordic AIR, RU, HI), BenchmarkEvidence (ARC-AGI, SWE-bench, GPQA, HLE), ResearchProject (AUTO-MARE, NordForsk), EvidenceGap (öll 6 blinda svæði), InternationalComparison (5-landa norræn samanburður).

---

## Hrakningarrammi

13 forskráð próf yfir 5 verkstrauma. Rannsóknin var hönnuð til að drepa tilgátuna ef gögnin kröfðust þess.

| Próf | Niðurstaða | Áhrif | Verkstraumur |
|------|-----------|-------|--------------|
| FA-1: Líkamlegir vs. þekkingargeirar | BLANDAÐ | Styður að hluta (þekkingarstörf -9.300) | A |
| FA-2: Árstíðaútskýring | AÐ HLUTA | F4 2025 frávik er ekki árstíðabundið | A |
| FA-3: Aldursdreifing | BLANDAÐ | Ungt fólk ráðandi en 25–54 hækkar | A |
| FB-1: Geðgreiningar hraðar | STAÐFEST | Styður (179% vs. 26%) | B |
| FB-2: Öldrunarskýring | AÐ HLUTA HRAKIÐ | Yngri hópur vex hraðar | B |
| FB-3: Kerfisbreyting sept. 2025 | STAÐFEST BROT | Mælibrestur viðurkenndur | B |
| FC-1: Tímaröð fyrirtækja | AÐ HLUTA STAÐFEST | Landsbankinn tímaröð til staðar | C |
| FC-2: Opinber innkaup | ÓMÆLANLEG | TED-gögn ekki útvíkkuð | C |
| FC-3: AI-notkunarstig | ÓÞEKKT | Ísland ekki í Eurostat könnun | C |
| FD-1: Reikniritsþjórnun | ÓPRÓFANLEG | Ísland ekki í EWCS 2024 | D |
| FD-2: Kulnun og tól | MERKI | Kulnun há en ekki tæknidrifin | D |
| **FE-1: Ísland jafngildir Norðurlöndum í stjórnun** | **HRAKIÐ** | Öll 4 norræn nágrannalönd með verkalýðssamninga um gervigreind. Ísland: engin. | E |
| **FE-2: Gæðaaukning benchmarks er hæg/fyrirsjáanleg** | **HRAKIÐ** | ARC-AGI +82,5pp, SWE-bench +60pp í <24 mánuðum. Stökkbreytt, ekki línulegt. | E |
| **FE-3: UNAK á enga sérstæða hlutverk í gervigreindarstjórnun** | **AÐ HLUTA HRAKIÐ** | UNAK: 1. háskólinn með stjórnunarstefnu (30. okt.). AUTO-MARE. EU AI Act samsvararlegt sérfræðiþekking er raunveruleg. | E |

**Niðurstaða: 3 styðja, 3 blandaðar, 3 ómælanlegar, 2 veikja, 2 hraka, 1 að hluta hrakið.**

---

## Fræðilegt samhengi — Helstu heimildir

| Höfundar | Ár | Niðurstaða | Áhrif á tilgátu |
|----------|-----|-----------|----------------|
| Humlum og Vestergaard (NBER w33777) | 2025 | Núll-áhrif á danskar tekjur/vinnutíma frá LLM | Sterkustu mótröksemdir |
| Acemoglu (Economic Policy) | 2024–25 | Hófleg TFP-aukning (0,53–0,66% á 10 árum) | Takmarkar umfang tilfærslu |
| Frank, Ahn og Moro (PNAS Nexus) | 2025 | AI-útsetning spáir atvinnuleysi (r=0,57) | Styður tilgátu |
| Aldasoro et al. (BIS WP 1325) | 2026 | +4% framleiðni í 12.000 ESB-fyrirtækjum. Hæfnimiðuð tilfærsla, ekki massamissir. | Hlutgar tilfærslutilgátu |
| IMF WP 067/2025 | 2025 | Hæfð störf 3–5× meir útsett. 40% heimsvinnuafls í hættu. | Staðfestir UT-mynstur |
| Anthropic Economic Index | 2025 | 94% starfa með fræðilega AI-þekt. Aðeins 33% raunvera nota eru sjálfvirkni (vs. aukningarstuðningur). | Bil milli fræðilegrar útsetningar og raunnotkunar |
| Phan et al. — Nature Vol 649 | 2026 | HLE: GPT-4o 2,7%. Allar gervigreindarlíkön >70% mælikvarðavilla. | Stjórnunarásökunarmál: AI veit ekki hvað það veit ekki |

---

## Gagnaheimildir

| Heimild | Tegund | Aðgengi | Forrit | Notað í |
|---------|--------|---------|--------|---------|
| Hagstofa PxWeb (10 töflur) | Vinnumarkaður, laun, framleiðni | Opið API | `hagstofa_pxweb.py` | WS-A, Njósnasveit |
| Vinnumálastofnun | Skráð atvinnuleysi | Opinbert mælaborð | Handvirkt / beiðni | WS-A |
| Ríkisendurskoðun 2025 | Atvinnuleysi og þjóðhagur | Opinber PDF | Handvirkt | WS-A |
| Tryggingastofnun PowerBI | Örorku-/endurhæfingarfjöldi | Opinbert mælaborð | Handvirkt | WS-B |
| Læknablaðið (2021, 2026) | Sjúkdómsgreiningarþróun | Opinber tímarit | Handvirkt | WS-B |
| Landsbankinn, Íslandsbanki, Arion (ársskýrslur) | FTE, AI-tæki, tæknivísanir | Opinberar | Handvirkt | WS-C |
| TED (EU innkaupagagnagrunnur) | Opinber samningar | Opið API | `ted_procurement.py` | WS-C |
| Eurostat isoc_eb_ai | AI-notkun fyrirtækja | Opið | — | WS-C **(Ísland undanskilið)** |
| Eurofound EWCS 2024 | Vinnuaðstæður | Opið | — | WS-D **(Ísland undanskilið)** |
| Samráðsgátt S-223/2024 | 12 umsagnir um aðgerðaráætlun | Opinbert | Handvirkt | WS-D |
| EU AI Act (OJ L 2024/1689) | Stjórnunarlöggjöf | Opinbert | Handvirkt | UNAK |
| BIS WP 1325 (Aldasoro et al.) | Framleiðni 12.000 ESB-fyrirtækja | Opinber PDF | Handvirkt | UNAK |
| Anthropic Economic Index | Starfsgreining í Claude API | Opinber skýrsla | Handvirkt | UNAK |
| Nature Vol 649 — HLE (Phan et al.) | Benchmark — 2.500 sérfræðingaspurningar | Opinn aðgangur | `data/raw/s41586-025-09962-4.pdf` | UNAK |
| Nordregio 2025:10 | Norrænt háskólalandslag | Opinber PDF | Handvirkt | UNAK |
| UNAK gervigreindarstefna (30. okt. 2025) | Innleiðing gervigreindar UNAK | Opinber vefur | Handvirkt | UNAK |
| NordForsk Nordic-Baltic AI | Norrænt rannsóknarsamstarf | Opinbar | Handvirkt | UNAK |
| Nordic AIR MoU (26. feb. 2025) | Norræn rannsóknarsamhæfing | Opinber | Handvirkt | UNAK |

---

## Hrakningarrammi — tengsl milli skjala

```
MISSION_PLAN ──────────────────────────────────────────────────────────┐
  │ Skilgreinir hrakningarskilyrði, gagnaheimildir, grafskema          │
  │                                                                     │
  ├──► WORKSTREAM_A ──► FA-1, FA-2, FA-3 prófuð                       │
  ├──► WORKSTREAM_B ──► FB-1, FB-2, FB-3 prófuð                       │
  ├──► WORKSTREAM_C ──► FC-1, FC-2, FC-3 prófuð                       │
  ├──► WORKSTREAM_D ──► FD-1, FD-2 prófuð                             │
  │                                                                     │
  │   SYNTHESIS ◄────── Allir 4 verkstraumar                           │
  │       │  Upprunalegt úrskurður: QUALIFIED                          │
  │                                                                     │
  │   INTELLIGENCE_SWEEP ◄── Njósnasveit (6 agentar)                  │
  │       │  UT-trifecta staðfest: -94% lausstörf, +72% velta         │
  │                                                                     │
  │   FLYING_BLIND_ARCHITECTURE ──► Nýr rammi — 6 sönnunarstoðir      │
  │       │  Snýst um: stofnanalegar blindurnar ER niðurstaðan         │
  │                                                                     │
  │   UNAK_report/ ◄── 6 samhliða rannsóknaragentar, 200+ heimildir   │
  │       │  UNAK_AI_LANDSCAPE_Q1_2026.md ─ FE-1, FE-2, FE-3 prófuð  │
  │       │  PROJECT_MANAGEMENT_LOG.md ─ Mannlegt eftirlit skjalfest   │
  │                                                                     │
  │   PANOPTICON_GRAPH.cypher ◄── Öll gögn sem hnútar og tengsl       │
  │       │  955 línur — ~112 hnútar, ~65 tengsl                      │
  │       │  15 hnútatýpur — Íslenski + evrópskur samhengi            │
  │                                                                     │
  └── POST_LAUNCH_REPORT + DATA-REQUESTS ──► Opnar rannsóknarsprungur
          Mikilvægast: TR starfsgrein × greining (lokar orsakakeðjunni)
```

---

## Keyrsla

### Forsendur
- Python 3.8+ (engin ytri tengsl — eingöngu stdlib)
- Neo4j 5.x (valfrjálst, fyrir grafinnflutning)
- cypher-shell (valfrjálst, eða nota Neo4j Browser)

### Keyra alla gagnaútdráttarkeðjuna
```bash
bash scripts/run_pipeline.sh              # Útdráttur + staðfesting
bash scripts/run_pipeline.sh --extract    # Útdráttur eingöngu
bash scripts/run_pipeline.sh --validate   # Staðfesting eingöngu
bash scripts/run_pipeline.sh --strict     # Bregst við viðvörunum
```

### Draga út gögn frá Hagstofunni (stakt)
```bash
python scripts/hagstofa_pxweb.py --all           # Allar 10 töflur
python scripts/hagstofa_pxweb.py --unemployment  # Ein tafla
python scripts/validate_data.py                  # Gæðaeftirlit
```

### Leita í TED innkaupagagnagrunni
```bash
python scripts/ted_procurement.py --cpv 72000000 --since 2023-01-01
```

### Flytja inn þekkingargraf
```bash
./graph_import.sh bolt://localhost:7687 neo4j password
```

### Senda gagnabeiðnir
Fylla inn `[SETJA INN]` eyður í `data-requests/` og senda:
- **TR:** tr@tr.is — starfsgrein × sjúkdómsgreining **(mikilvægast — lokar orsakakeðjunni)**
- **VMST:** vmst@vmst.is — mánaðarlegt atvinnuleysi eftir geirum
- **Hagstofa:** upplysingar@hagstofa.is — lausstörf

---

## Næstu skref

| # | Aðgerð | Forgangur | Skjal |
|---|--------|-----------|-------|
| 1 | Senda TR-beiðni (starfsgrein × greining) | **HÆSTUR** | `01_TR_OCCUPATION_DIAGNOSIS.md` |
| 2 | Senda VMST-beiðni (mánaðarlegt atvinnuleysi) | Hár | `02_VMST_SECTOR_UNEMPLOYMENT.md` |
| 3 | Senda Hagstofu-beiðni (lausstörf) | Miðlungs | `03_HAGSTOFA_VACANCIES.md` |
| 4 | ~~Keyra `hagstofa_pxweb.py` til að fylla `data/raw/`~~ | ~~Miðlungs~~ | **LOKIÐ** — 10 töflur, 150K+ raðir |
| 5 | ~~UNAK Q1 2026 skýrsla~~ | ~~Hár~~ | **LOKIÐ** — 9. mars 2026 |
| 6 | ~~Uppfæra PANOPTICON_GRAPH.cypher~~ | ~~Hár~~ | **LOKIÐ** — 955 línur, ~112 hnútar |
| 7 | Keyra `ted_procurement.py` fyrir innkaupagögn | Miðlungs | — |
| 8 | Flytja graf inn í Neo4j og keyra lokayrirspurn | Lágur | `graph_import.sh` |
| 9 | Beita sér fyrir Íslands þátttöku í EWCS 2026 | Framtíð | — |

---

## Höfundur

**Magnus Smari Smarason, MA**
Háskólinn á Akureyri
Meistarapróf: *Beyond Fragmentation: A Life-Value Alternative for AI Governance* (einkunn 9,5/10)
[skemman.is/handle/1946/52173](https://skemman.is/handle/1946/52173)

## Leyfi

Rannsókn unnin í fræðilegum tilgangi. Gögn sótt úr opinberum íslenskum gagnagrunnum. Fyrirtækjagögn úr birtum ársskýrslum. Allar heimildir tilgreindar í verkstraumaskýrslum.
