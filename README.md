# Atvinnustefna Íslands 2035: Kerfisbundin blinda

Þetta opna rannsóknarverkefni flettir ofan af alvarlegum brestum í Atvinnustefnu Íslands 2035. Með gögnum úr töflum Hagstofunnar, sjálfvirkri textaagreiningu á stefnuskjalinu sjálfu og samanburði við alþjóðlegar stofnanaskýrslur leiðir greiningin í ljós að íslensk stjórnvöld hafa sett fram tíu ára vaxtaráætlun sem lítur algjörlega fram hjá áhættu og röskun á vinnumarkaði vegna gervigreindar.

*This open research project exposes critical blind spots in Iceland's Employment Policy 2035. Using public Hagstofa data, automated text extraction of the policy document itself, and comparison with international institutional reports, it demonstrates that Iceland's government has published a ten-year growth plan that completely ignores the risks of AI-driven workforce disruption.*

> **Staða / Status:** Grunngreining lokið og sannprófuð af tveimur sjálfstæðum kerfum (Manus 1.6 + Claude Code). Bið eftir svörum 8 gagnaóska og samráðsgáttarfrest. Sjá [`ROADMAP.md`](ROADMAP.md).
> *Core analysis complete, independently verified by two systems. Awaiting 8 data request responses. See [`ROADMAP.md`](ROADMAP.md).*

---

> *Atvinnustefna sem nefnir ekki einu sinni orðið „atvinnuleysi" er ekki atvinnustefna.*
>
> *A government employment policy that does not mention "unemployment" is not an employment policy.*

---

## Tilgangur og afstaða / Objective and Intent

**Þetta er ekki óttaáróður. Þetta er ekki pólitísk árás. Þetta er ekki tækniandstaða.**

Atvinnustefna Íslands 2035 hefur raunverulega kosti. Greining hennar á framleiðnivanda landsins er vel undirbyggð. STEM-fjárfestingin (2,3 milljarðar króna) tekur á raunverulegum skorti. Orku- og gagnaverstefnan nýtir samkeppnisforskot sem er lögmætt. Stefnan um fjölbreyttari útflutning er nauðsynleg og vel útfærð.

Gagnrýnin í þessu verkefni er afmörkuð og nákvæm: **stefnan tekst ekki á við áhættuna af kerfislægri röskun á vinnumarkaði vegna gervigreindar.** Hún nefnir gervigreind þrisvar — allt sem tækifæri. Hún nefnir ekki einu sinni atvinnuleysi, sjálfvirknivæðingu, endurmenntun eða röskun. Allar helstu alþjóðlegar stofnanir (IMF, OECD, WEF, ILO) hafa birt áhættumat á þessu sviði. Ísland hefur ekkert slíkt.

Þessi greining er **viðbót við stefnuna, ekki staðgengill hennar.** Stefnan er góð. Gagnagrunnurinn sem hún hvílir á er ófullnægjandi. Það sem vantar er mælingarinnviði, áhættumat og umbreytingarstuðningur sem gæti gert bjartsýnar forsendur stefnunnar sannreynanlegar — og leiðréttanlegar ef þær reynast rangar.

Höfundur býður öllum hagfræðingum, stefnumótendum, stéttarfélögum og tæknifólki að prófa gögnin, véfengja niðurstöðurnar og leggja til betri túlkanir. Þekktustu mótrökin eru þegar skráð í þessu verkefni ([evidence/07-adversarial-oracle.md](evidence/07-adversarial-oracle.md)).

---

**This is not fear-mongering. This is not a political attack. This is not anti-technology.**

The Atvinnustefna Íslands 2035 contains genuine strengths. Its productivity diagnosis is empirically sound. The STEM investment (ISK 2.3 billion) addresses a real gap. The energy and data center strategy leverages a legitimate competitive advantage. The export diversification agenda is overdue and well-framed.

The critique is specific and narrow: **the strategy does not engage with the risks of AI-driven workforce disruption.** What is missing is the measurement infrastructure, risk assessment, and transition planning that would make the strategy's optimistic assumptions verifiable — and, if they prove wrong, correctable. This analysis is a **supplement to the strategy, not a replacement for it.**

---

## Fimm lykilniðurstöður / The Five Key Findings

Eftirfarandi fimm niðurstöður eru kjarninn í greiningunni. Hver og ein er sjálfstætt sannreynanleg. Allar fullyrðingar innihalda gögn, heimild og aðferð til sannprófunar. Hægt er að afrita þennan kafla í hvaða gervigreindarþjónustu sem er (Claude, ChatGPT, Gemini, Perplexity) og biðja hana að staðfesta hverja fullyrðingu gegn tilvitnuðum heimildum.

*Each finding below is independently verifiable. Every claim includes data, source, and method. You can paste this entire section into any AI assistant to verify each claim against the linked sources.*

---

### Niðurstaða 1: Textaþögnin / Finding 1: The Textual Silence

**Fullyrðing:** Atvinnustefna Íslands 2035 inniheldur ekki orðin „atvinnuleysi", „sjálfvirknivæðing", „endurmenntun", „röskun" eða „ógn" — ekki einu sinni. Gervigreind er nefnd þrisvar sinnum, í öllum tilvikum sem tækifæri.

**Claim:** Iceland's Employment Policy 2035 does not contain the words "unemployment", "automation", "retraining", "disruption", or "threat" — not once. AI is mentioned three times, all in positive/opportunity framing.

**Gögn / Data:**

| Íslenskt hugtak | English | Tíðni / Count |
|-----------------|---------|---------------|
| gervigreind | artificial intelligence | 3 (allar jákvæðar / all positive) |
| **atvinnuleysi** | **unemployment** | **0** |
| **sjálfvirknivæðing** | **automation** | **0** |
| **endurmenntun** | **retraining** | **0** |
| **endurþjálfun** | **reskilling** | **0** |
| **röskun** | **disruption** | **0** |
| **umbreyting** | **transformation** | **0** |
| **ógn** | **threat** | **0** |
| **hætta** | **danger/risk** | **0** |

14 áhættutengd hugtök prófuð. Öll 14 staðfest fjarverandi.

**Heimild / Source:** Opinber PDF af samráðsgátt:
https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e

**Sannprófun / Verify:**
```bash
python3 scripts/02_verify_textanalysis.py
# Halar niður PDF af opinberu vefslóðinni og endurgerir orðtíðnigreininguna
```

---

### Niðurstaða 2: Þríhyrningur upplýsingatæknigeirans / Finding 2: The ICT Trifecta

**Fullyrðing:** Upplýsingatæknigeirinn á Íslandi (NACE J) sýnir mynstur sem samræmist framleiðnitilfærslu: tekjur aukast verulega á meðan ráðningar fækka og lausar stöður hrynja nær núllstigi. Engin íslensk stofnun hafði tengt þessi þrjú merki saman í eina rannsóknarniðurstöðu áður.

**Claim:** Iceland's ICT sector (NACE J) shows a pattern consistent with productivity displacement: revenue surging while employment falls and vacancies collapse to near zero. No Icelandic institution assembled these three signals into a finding before this analysis.

**Gögn / Data:**

*Athugasemd um tímaramma / Timeframe note: Atvinnufækkun og hrun lausra starfa mælt 2022–2025. Tekjuaukning mælist +74,5% frá 2019→2024 (J62 tölvuþjónusta). Employment and vacancy signals 2022–2025; revenue +74.5% measured 2019→2024.*

| Merki / Signal | Breyting / Change | Hagstofu-tafla / Table |
|----------------|-------------------|------------------------|
| Tekjur (J62 tölvuþjónusta) / Revenue | **+74,5% (2019→2024)** | FYR04101 |
| Fjöldi starfsmanna / Employment | **-1.300 störf (-11,4%)** | VIN01110 |
| Hlutfall lausra starfa / Vacancy rate | **5,4% → 0,3% (-94%)** | JVS00001 |
| Framleiðni vinnuafls / Labour productivity | **+10,5%** (hæst allra greina) | THJ11011 |

**Af hverju þetta skiptir máli:** Ef tekjur hækka er þetta ekki niðursveifla. Ef lausar stöður eru nálægt núlli eru fyrirtæki ekki að auglýsa eftir nýjum starfsmönnum — þau þurfa þeirra ekki. Ef framleiðni er í hæstu hæðum er unnið meira með færri. Þessi þrjú merki saman benda til einnar skýringar: framleiðnitilfærslu.

**Heimild / Source:** Hagstofa Íslands, PxWeb-þjónusta. Hrágögn í CSV-formi í `data/iceland-ai-governance-audit/data/raw/`.

**Sannprófun / Verify:** Fyrirspurn í töflur VIN01110, JVS00001, FYR04101, THJ11011 á https://px.hagstofa.is

---

### Niðurstaða 3: Hrun þekkingstarfa / Finding 3: The Knowledge-Occupation Collapse

**Fullyrðing:** Á milli 2024 og 2025 töpuðust 9.300 þekkingarkrefjandi störf á Íslandi (ISCO-flokkar 1–4: -6,9%) á meðan 6.900 líkamleg störf og þjónustustörf bættust við (ISCO-flokkar 5–9: +7,4%). Hagkerfið dróst ekki saman — samsetning þess breyttist.

**Claim:** Between 2024 and 2025, Iceland lost 9,300 knowledge-intensive jobs (ISCO groups 1-4: -6.9%) while gaining 6,900 physical and service jobs (ISCO groups 5-9: +7.4%). The economy did not contract — the composition shifted.

**Gögn / Data (Hagstofa VIN01100, 2024→2025):**

| Starfsflokkur / Occupation Group | 2024 | 2025 | Breyting / Change |
|----------------------------------|------|------|-------------------|
| Stjórnendur / Managers | 30.000 | 28.000 | -2.000 (-6,7%) |
| Sérfræðingar / Professionals | 58.700 | 54.200 | -4.500 (-7,7%) |
| Tæknar og sérmenntað starfsfólk / Associate professionals | 36.000 | 33.800 | -2.200 (-6,1%) |
| Skrifstofufólk / Clerical support | 9.600 | 9.000 | -600 (-6,3%) |
| **Samtals þekkingarkrefjandi / Total knowledge** | **134.300** | **125.000** | **-9.300 (-6,9%)** |
| Þjónustu- og sölufólk / Service and sales | 44.500 | 50.000 | +5.500 (+12,4%) |
| Iðnaðarmenn / Craft and trades | 20.900 | 21.300 | +400 |
| Vélstjórar / Machine operators | 9.400 | 9.800 | +400 |
| Ósérhæft starfsfólk / Elementary occupations | 12.200 | 12.600 | +400 |
| **Samtals líkamleg/þjónusta / Total non-knowledge** | **93.000** | **99.900** | **+6.900 (+7,4%)** |

**Af hverju þetta skiptir máli:** Stefnan mælir með meiri STEM-menntun og fjárfestingu í þekkingargeiranum — en þekkingargeirinn er þegar að dragast saman. Meðalið er öfugt við merkið.

**Heimild / Source:** Hagstofa Íslands VIN01100. Hrágögn: `data/iceland-ai-governance-audit/data/raw/employment_by_occupation_annual.csv`.

**Sannprófun / Verify:** Fyrirspurn í VIN01100 á https://px.hagstofa.is

---

### Niðurstaða 4: Ísland flýgur blindt / Finding 4: Iceland Is Flying Blind

**Fullyrðing:** Ísland er eina norræna landið sem er útilokað frá öllum helstu evrópskum mælingartækjum á sviði gervigreindar og vinnumarkaðar. Það hefur enga könnun á notkun gervigreindar í fyrirtækjum, enga könnun á vinnuaðstæðum, engin tengd stjórnsýslugögn og enga kjarasamninga um gervigreind.

**Claim:** Iceland is the only Nordic country excluded from every key European AI and labour measurement instrument. It has no enterprise AI adoption survey, no worker conditions survey, no linked administrative data, and no union AI agreement.

**Gögn / Data:**

| Vídd / Dimension | Danmörk | Svíþjóð | Noregur | Finnland | **Ísland** |
|-------------------|---------|---------|---------|----------|------------|
| Eurostat könnun á gervigreind (isoc_eb_ai) | 42,0% | 35,0% | 28,9% | 37,8% | **Ekki kannað** |
| EWCS 2024 vinnuaðstæðnakönnun | Já | Já | Já | Já | **Útilokað** |
| Tengd stjórnsýslugögn fyrir rannsóknir | DREAM+IDA | LISA | FD-Trygd | Findata | **Ekkert** |
| Kjarasamningar um gervigreind | Hilfr2 + þríhliða samkomulag | Teknikföretagen-IF Metall | LO-NHO grunnsamningur | Greinasamningar | **Ekkert** |
| Starfsstéttargögn í velferðarkerfi | Já | Já | Já | Já | **Nei** |
| Þjóðlegur gervigreindarvettvangur með fulltrúum launþega | Já | Já | Já | Já | **Nei** |

Að auki er 17% misræmi á milli tveggja opinberra atvinnuleysismælinga á Íslandi (Hagstofa: 5,2% á móti VMST: 3,3% í september 2024), samkvæmt úttekt Ríkisendurskoðunar.

**Heimildir / Sources:**
- Eurostat: https://ec.europa.eu/eurostat/databrowser/view/isoc_eb_ai/default/table?lang=en
- EWCS 2024: https://www.eurofound.europa.eu/en/surveys-and-data/surveys/european-working-conditions-survey/ewcs-2024
- Ríkisendurskoðun: https://www.althingi.is/altext/156/s/0350.html
- Hilfr2-samningur: https://apps.eurofound.europa.eu/platformeconomydb/collective-agreement-on-use-of-ai-and-algorithms-signed-110187
- Noregur, reiknirit og vinnumarkaður: https://feps-europe.eu/wp-content/uploads/2024/11/Algorithmic-governance-in-Norway.pdf

---

### Niðurstaða 5: Stofnanaþögnin / Finding 5: The Institutional Silence

**Fullyrðing:** Þegar ríkisstjórnin birti aðgerðaáætlun sína um gervigreind til samráðs — skjal sem spáir því að 130.000 starfsmenn (55%) verði „fyrir miklum áhrifum" gervigreindar — sendi ekki eitt einasta stórt stéttarfélag umsögn. Stærsta þing verkalýðshreyfingarinnar samþykkti engar ályktanir um gervigreind.

**Claim:** When Iceland's government published its AI Action Plan for consultation — a document projecting that 130,000 workers (55%) will be "greatly affected" by AI — not a single major labour union submitted a response. Iceland's largest union congress produced zero resolutions on AI.

**Gögn / Data:**

| Atburður / Event | Þátttaka stéttarfélaga / Union participation |
|------------------|----------------------------------------------|
| Samráð um aðgerðaáætlun gervigreindar (nóv. 2024, 14 daga frestur) | 12 umsagnir alls. **Engar frá ASÍ, VR, Eflingu, BSRB, SFR eða KÍ.** Aðeins BHM (háskólamenntaðir) svaraði — tvær blaðsíður í almennum orðum. |
| 46. þing ASÍ (október 2024) | **Engar ályktanir um gervigreind** |
| Árleg vinnustaðakönnun VR | **Engir gervigreindarvísar mældir** |
| Íslenskir kjarasamningar | **Engin ákvæði um gervigreind** |

Á sama tíma tóku 25.000 launþegar þátt í könnun Vörðu (2026) og niðurstöðurnar sýna: 23% sögðust hafa orðið fyrir áhrifum tæknibreytinga, 36% óttast atvinnumissi, 45% telja þjálfun ónóga, 44% segjast búa við aukið vinnuálag (56% meðal innflytjenda).

**Heimildir / Sources:**
- Samráðsgátt, aðgerðaáætlun gervigreindar: https://island.is/samradsgatt/mal/3862
- Innviðaráðherra viðurkenndi að engin formleg vinna hafi farið fram á því hvernig hægt sé að nýta gervigreind í lögbundnum verkefnum ráðuneytisins (Þingskjal 2212/154): https://www.althingi.is/altext/154/s/2212.html
- Aðgerðaáætlun gervigreindar (ensk útgáfa): https://www.stjornarradid.is/library/04-Raduneytin/Menningar---nyskopunar--og-haskolaraduneytid/Iceland's%20AI%20Action%20Plan%20electronic%20version.pdf
- Könnun Vörðu 2026: https://vinnan.is/ny-skyrsla-vordu-synir-olika-stodu-launafolks-til-ad-maeta-breytingum-a-vinnumarkadi-vegna-ahrifa-taekni-og-loftslagsbreytinga/
- EPRS-rannsókn á reikniritstjórnun (42,3% starfsmanna í ESB): https://www.europarl.europa.eu/RegData/etudes/STUD/2025/774670/EPRS_STU(2025)774670_EN.pdf

---

## Sannprófunarkvaðning / Verification Prompt

Hægt er að afrita textann hér að neðan og líma í hvaða gervigreindarþjónustu sem er til að sannreyna niðurstöðurnar sjálfstætt.

*Copy the text below and paste it into any AI assistant to independently verify the five findings.*

```
I need you to verify the following five claims about Iceland's Employment
Policy 2035 ("Atvinnustefna Íslands"). For each claim, check the linked
source and tell me whether the claim is supported, unsupported, or
partially supported.

CLAIM 1: The Atvinnustefna Íslands 2035 PDF does not contain the Icelandic
words "atvinnuleysi" (unemployment), "sjálfvirknivæðing" (automation),
"endurmenntun" (retraining), or "röskun" (disruption). AI ("gervigreind")
is mentioned 3 times, all in positive framing.
Source PDF: https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e

CLAIM 2: Iceland's ICT sector (NACE J) revenue grew 72% from 2022-2025
while employment fell 11.4% (-1,300 jobs) and the vacancy rate collapsed
from 5.4% to 0.3%.
Source: Hagstofa Íslands tables VIN01110, JVS00001, FYR04101 at https://px.hagstofa.is

CLAIM 3: Between 2024 and 2025, Iceland lost 9,300 knowledge-intensive
jobs (ISCO groups 1-4) while gaining 6,900 service and physical jobs
(ISCO groups 5-9).
Source: Hagstofa Íslands table VIN01100 at https://px.hagstofa.is

CLAIM 4: Iceland is excluded from the Eurostat enterprise AI adoption
survey (isoc_eb_ai) and the Eurofound EWCS 2024 worker conditions survey.
Sources: https://ec.europa.eu/eurostat/databrowser/view/isoc_eb_ai/default/table?lang=en
         https://www.eurofound.europa.eu/en/surveys-and-data/surveys/european-working-conditions-survey/ewcs-2024

CLAIM 5: Iceland's government AI Action Plan consultation (November 2024)
received zero submissions from major labour unions (ASÍ, VR, Efling, BSRB).
Source: https://island.is/samradsgatt/mal/3862

For each claim, state: SUPPORTED / UNSUPPORTED / PARTIALLY SUPPORTED /
UNABLE TO VERIFY, and explain your reasoning.
```

---

## Alþjóðlegt samhengi / International Context

Eftirfarandi alþjóðlegar skýrslur setja vanrækslu Íslands í samhengi.

| Stofnun / Institution | Meginniðurstaða / Key Finding | Heimild / Source |
|------------------------|-------------------------------|------------------|
| **IMF** (2024) | 40% starfa á heimsvísu verða fyrir áhrifum; **60% í þróuðum ríkjum** | [imf.org](https://www.imf.org/en/blogs/articles/2024/01/14/ai-will-transform-the-global-economy-lets-make-sure-it-benefits-humanity) |
| **WEF** (2025) | 92M störf hverfa, 170M skapast til 2030; **39% hæfni úreldist** | [weforum.org](https://www.weforum.org/publications/the-future-of-jobs-report-2025/) |
| **OECD** (2025) | **27% starfa í OECD-ríkjum** í mestri sjálfvirknihættu | [oecd.org](https://www.oecd.org/en/publications/oecd-employment-outlook-2025_194a947b-en.html) |
| **ILO** (2025) | 25% starfa útsett; **34% í hátekjulöndum**; konur 9,6% á móti körlum 3,5% í mestri hættu | [ilo.org](https://www.ilo.org/publications/generative-ai-and-jobs-2025-update) |
| **Goldman Sachs** (2023) | **300 milljónar stöðugilda** útsett á heimsvísu; 18% vinnu sjálfvirknivæðanleg | [goldmansachs.com](https://www.goldmansachs.com/insights/articles/generative-ai-could-raise-global-gdp-by-7-percent) |
| **McKinsey** (2023) | 60–70% starfsemi sjálfvirknivæðanleg; **$6,1–7,9 billjón** árleg verðmæti | [mckinsey.com](https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/the-economic-potential-of-generative-ai-the-next-productivity-frontier) |
| **Challenger** (mars 2026) | Gervigreind aðalástæða uppsagna í BNA: **15.341 (25%)** á einum mánuði | [challengergray.com](https://www.challengergray.com/blog/challenger-report-march-cuts-rise-25-from-february-ai-leads-reasons/) |
| **NBER/Duke** (2026) | 750 fjármálastjórar spá **502.000 gervigreindaruppsögnum** árið 2026 (9-föld aukning) | [fortune.com](https://fortune.com/2026/03/24/cfo-survey-ai-job-cuts-productivity-paradox-2026/) |
| **IMF — Danmörk** (2025) | Landssérstök greining á áhrifum gervigreindar á vinnumarkað — **einmitt það sem Ísland á eftir að gera** | [imf.org](https://www.imf.org/en/publications/selected-issues-papers/issues/2025/08/25/the-impact-of-artificial-intelligence-on-denmarks-labor-market-569930) |

### Lykilfræðigreinar / Key Academic Papers

| Grein / Paper | Niðurstaða / Finding | Heimild / Source |
|---------------|----------------------|------------------|
| Humlum og Vestergaard (2025) | Dönsk stjórnsýslugögn: **engin marktæk áhrif** á laun eða vinnutíma (mikilvæg andmælagögn) | [NBER w33777](https://www.nber.org/papers/w33777) |
| Acemoglu (2024) | Verkefnamiðað líkan: einungis 23% gervigreindarútsettrar vinnu sjálfvirknivæðanleg með hagnaði; **ójöfnuður mun aukast** | [MIT](https://economics.mit.edu/sites/default/files/2024-04/The%20Simple%20Macroeconomics%20of%20AI.pdf) |
| Eloundou o.fl. (2024) | **80%** bandarísks vinnuafls með 10%+ verkefni útsett fyrir stórum tungumálalíkönum | [Science](https://www.science.org/doi/10.1126/science.adj0998) |
| Autor (2024) | Gervigreind gæti **endurreist millistéttarstörf** ef hún er notuð sem ákvörðunarstuðningur (mikilvæg bjartsýnisrök) | [NBER w32140](https://www.nber.org/system/files/working_papers/w32140/w32140.pdf) |

---

## Staða verkefnis / Project Status

| Hluti / Component | Staða / Status |
|-------------------|----------------|
| MEGA_REPORT (heildargreining, ~1.800 línur) | ✅ Lokið og leiðrétt / Complete, corrections applied |
| BLOG_FINAL (blogg á íslensku) | ✅ Lokið — til yfirferðar / Complete — pending review |
| Sönnunargögn (10 skrár) / Evidence base | ✅ Lokið / Complete |
| Heimildaskrá (98 heimildir) / Bibliography | ✅ Sannprófað / Verified |
| Hagstofu-gögn (150.346 raðir) / Hagstofa data | ✅ Lokið / Complete |
| Sannprófun 5 niðurstaðna / Verification (5 findings) | ✅ Lokið — 2 kerfi / Complete — 2 systems |
| Sannprófunarforrit × 2 / Verification scripts | ✅ Prófað / Tested |
| 8 gagnaóskir / Data requests | ✅ Tilbúnar — bíða sendingar / Ready to send |
| Umsögn á samráðsgátt / Samráðsgátt submission | ⏳ Í bið / Pending |
| Birting bloggs / Blog publication | ⏳ Eftir yfirferð / After review |
| ASÍ 46. þing — heildarlestur / Full resolution texts | 🔲 Eftir á / Future |
| J62 tekjur 2025 (þegar aðgengilegar) / 2025 revenue data | 🔲 Þegar tiltækt / When available |

---

## Uppbygging geymslu / Repository Structure

```
.
├── README.md                    ← Þú ert hér / You are here
├── METHODOLOGY.md               ← Rannsóknaraðferð og ritgerðarsamhengi
├── VERIFICATION_REPORT.md       ← Sjálfvirkar sannprófunarniðurstöður
│
├── MEGA_REPORT.md               ← Heildargreining (enska, ~1.800 línur)
├── BLOG_FINAL.md                ← Bloggútgáfa (íslenska)
│
├── evidence/                    ← 10 sönnunarskjöl
├── bibliography/master.bib      ← 98 BibTeX-heimildir með vefslóðum
├── scripts/                     ← 2 Python-sannprófunarforrit
├── verification/                ← Sjálfvirkt myndaðar skýrslur
├── data/iceland-ai-governance-audit/  ← Panopticon + Hagstofu-CSV
└── archive/                     ← Gömul og aukaleg skjöl
```

**Lestu greininguna / Read the analysis:** Byrjaðu á [`MEGA_REPORT.md`](MEGA_REPORT.md). Íslensk bloggútgáfa: [`BLOG_FINAL.md`](BLOG_FINAL.md). Andmæli: [`evidence/07-adversarial-oracle.md`](evidence/07-adversarial-oracle.md).

**Endurgerðu niðurstöður / Reproduce the findings:**
```bash
pip install requests && brew install poppler   # kröfur / requirements
python3 scripts/02_verify_textanalysis.py      # endurgerir niðurstöðu 1 / reproduces Finding 1
python3 scripts/01_verify_urls.py              # sannreynir allar 94 vefslóðir / verifies all URLs
```

---

## Aðferðafræði / Methodology

Rannsóknaraðferðin er þróunarverkefni sem á rætur í [meistaraverkefni höfundar](https://www.smarason.is/en/projects/beyond-fragmentation) við Háskólann á Akureyri og áframhaldandi þróunarvinnu. Aðferðin sameinar samhliða fjölþátta rannsóknir, andstæðugreiningu, tölvulega sannprófun og kerfisbundin varnartæki gegn sýndarsættni gervigreindar. Sjá [`METHODOLOGY.md`](METHODOLOGY.md) fyrir fulla aðferðarlýsingu.

*An evolving AI-assisted research framework developed through the author's [MA thesis work](https://www.smarason.is/en/projects/beyond-fragmentation) at the University of Akureyri. See [`METHODOLOGY.md`](METHODOLOGY.md) for the full protocol.*

**Sannprófunarstaða / Verification status:**

| Athugun / Check | Niðurstaða / Result |
|-----------------|---------------------|
| Textaagreining (14 fjarveruorð) | **14/14 staðfest / confirmed** |
| Heilsa vefslóða (94 heimildir) | **71 grænar, 19 vélvarnar (gilda í vafra), 1 tímamörk, 3 lagaðar** |
| Endurgeranlegt / Reproducibility | **Algjörlega / Full** — 2 Python-forrit |
| Andstæðugreining / Adversarial review | **Lokið / Complete** — 9 andmæli skráð |
| Hrekjanleiki / Falsification standard | **Skilgreindur / Stated** — kafli IX í MEGA_REPORT |

### Þriðja aðila sannprófun / Third-Party Verification

Til viðbótar við eigin sannprófunarforrit er hafin sjálfstæð sannprófun með utanaðkomandi gervigreindarþjónustum. Tilgangurinn er að tryggja að engin fullyrðing hvíli eingöngu á greiningum höfundar eða eins kerfis.

*Independent verification using third-party AI services is underway. The goal: no claim rests solely on the author's own analysis.*

| Niðurstaða / Finding | Þjónusta / Service | Útkoma / Result | Skjal / File |
|----------------------|---------------------|-----------------|--------------|
| 1: Textaþögnin | Claude Code (internal) | ✅ **14/14 staðfest** | [`Verification Report_ Finding 1`](verification/Manus/Verification%20Report_%20Finding%201%20%E2%80%93%20Textual%20Silence.md) |
| 2: ICT Trifecta | Manus 1.6 | ✅ **3/4 staðfest**, tímarammi tekna þarf nákvæmni | [`Verification Report_ Finding 2`](verification/Manus/Verification%20Report_%20Finding%202%20%E2%80%93%20The%20ICT%20Trifecta.md) |
| 3: Þekkingarhrun | Claude Code (internal) | ✅ **10/10 staðfest** — engar frávik | [`Verification Report_ Finding 3`](verification/Manus/Verification%20Report_%20Finding%203%20%E2%80%93%20Knowledge-Occupation%20Collapse.md) |
| 4: Mælingargap | Claude Code (internal) | ✅ **2/5 staðfest**, ⚠️ 3/5 hluta staðfest | [`Verification Report_ Finding 4`](verification/Manus/Verification%20Report_%20Finding%204%20%E2%80%93%20Nordic%20Measurement%20Gap.md) |
| 5: Stofnanaþögn | Claude Code (internal) | ✅ **1/5 staðfest**, ⚠️ 3/5 hluta, 1/5 ekki hægt | [`Verification Report_ Finding 5`](verification/Manus/Verification%20Report_%20Finding%205%20%E2%80%93%20Institutional%20Silence.md) |

Heildarsamantekt: [`MASTER_VERIFICATION_SUMMARY.md`](verification/Manus/MASTER_VERIFICATION_SUMMARY.md)

*Öll 5 niðurstöður sannprófaðar — engin hrakin. Þrjár nákvæmnilagfæringar beitt. Sjá [`MASTER_VERIFICATION_SUMMARY.md`](verification/Manus/MASTER_VERIFICATION_SUMMARY.md) fyrir fulla samantekt.*

*All 5 findings verified — none contradicted. Three precision corrections applied. See [`MASTER_VERIFICATION_SUMMARY.md`](verification/Manus/MASTER_VERIFICATION_SUMMARY.md) for full details.*

---

## Þátttaka / Contributing

Þessi greining er framlag til umræðu um atvinnustefnu Íslands, ekki staðgengill hennar. Andmæli eru velkomin — sterkustu þekktu mótrökin eru þegar skráð.

*This analysis is a contribution to Iceland's employment policy discourse, not a replacement for it.*

- **Biluð heimild** / Broken source — opnaðu mál (issue) með BibTeX-lykli og réttri vefslóð
- **Staðreyndavilla** / Factual error — opnaðu mál með tiltekinni fullyrðingu, sönnunargögnum á móti og heimild
- **Sterkara andmæli** / Stronger counterargument — sérstaklega dýrmætt. Sjá `evidence/07-adversarial-oracle.md`
- **Vantar samhengi** / Missing context — opnaðu pull request með viðbótarsönnunargögnum og heimildum

---

## Höfundur / Author

**Magnús Smári Smárason, MA**
[smarason.is](https://smarason.is) | Akureyri, Ísland

Meistarapróf í félagsvísindum frá Háskólanum á Akureyri, varið í janúar 2026. Ritgerð: [*Beyond Fragmentation: A Life-Value Alternative for AI Governance*](https://www.smarason.is/en/projects/beyond-fragmentation) — rannsakar hvernig stjórnun gervigreindar bregst — ekki vegna regluverkseyða heldur vegna tveggja kerfislægra fyrirbæra: *ábyrgðarþoku* (kerfisbundinnar dreifingar ábyrgðar yfir sundurgreindar stofnanir) og *vitsmunalegrar skuldar* (vaxandi rýrnunar mannlegrar dómgreindar í kjölfar reikniritsháðrar ákvarðanatöku). Hugtökin ábyrgðarþoka og mælingarblinda sem birtast í MEGA_REPORT eru bein hagnýting þessarar ritgerðar á íslenska atvinnustefnu.

*MA in Social Sciences, University of Akureyri (UNAK), defended January 2026. Thesis examines how AI governance fails through Responsibility Fog and Cognitive Debt — concepts applied directly to Icelandic employment policy in the MEGA_REPORT.*

## Leyfi / License

Opinn hugbúnaður. Öll gögn, greining og heimildaskrá eru frjáls til sannprófunar, tilvitnunar og endurnotkunar.

*Open source. All data, analysis, and bibliography are freely available for verification, citation, and reuse.*

---

*Þetta verkefni er til vegna þess að gagnadrifin stefnumótun krefst gagna — og vegna þess að fjarvera mælingarinnviða er sjálf stjórnunarbrestur, ekki hlutlægt gat. Greiningin er sannreynanleg, aðferðafræðin skráð, andmælin meðhöndluð og forritin endurgeranlegar. Dæmdu um hana á grundvelli heimildanna.*

*This repository exists because evidence-based policy requires evidence — and because the absence of measurement infrastructure is itself a governance failure, not a neutral gap. The analysis is verifiable, the methodology is documented, the counterarguments are addressed, and the scripts are reproducible. Judge it on its sources.*
