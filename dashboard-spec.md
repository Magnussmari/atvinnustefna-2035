# dashboard-spec.md — The Iceland 2035 Sentinel

## Tilgangur

Þetta skjal skilgreinir **product architecture** og **narrative order** fyrir Sentinel.
Hver síða á að geta staðið ein og sér sem briefing view, en saman mynda síðurnar samfellda sönnunarkeðju.

---

## Product North Star

Sentinel er evidence-first stefnumótunarviðmót fyrir:

- vinnumarkaðsröskun,
- AI-áhættu,
- stofnanaþögn,
- og mælingareyður á Íslandi.

Vara við:

- flashy BI tropes
- pseudo-precision
- claims án rekjanlegra heimilda

---

## Primary Users

- embættismenn í ráðuneytum og stofnunum
- þingnefndir og stefnumótendur
- hagfræðingar, greiningarteymi og rannsóknarstofnanir
- fulltrúar launafólks og atvinnurekenda

---

## Global UX Requirements

Allar síður skulu innihalda:

1. `PageHeader` með context og síðutengdri áhættuorðræðu
2. `InsightPanel` fyrir aðalniðurstöðu
3. minnst einn `ChartFrame` eða tafla með state-merkingu
4. `EvidenceDrawer` tengdan fullyrðingum
5. `MethodNote` þar sem túlkun er viðkvæm
6. `FreshnessBadge` og `ConfidenceBadge`
7. `MissingDataBlock` ef viðeigandi gögn vantar

---

## Information Architecture

### Síður í fastri röð

1. Executive Overview
2. ICT Trifecta
3. Knowledge Occupation Collapse
4. Iceland Flying Blind
5. Institutional Silence
6. Adversarial Review

### Navigation Rules

- Top navigation sýnir allar 6 síður.
- Hver síða hefur local anchor nav fyrir "Findings / Evidence / Methods / Gaps".
- User skal geta farið beint í Evidence Drawer án taps á samhengi.

---

## Page Specifications

## 1) Executive Overview

### Narrative Role

Setur sviðið: hvað er staðfest, hvað er sterk ályktun og hvað er ósannað.

### Must Prove

- að textaeyðan sé staðreyndalega staðfest
- að vinnumarkaðsmynstur séu marktæk en orsakasamband ósannað
- að mælingagrunnur sé ófullnægjandi

### Required Modules

- Executive status ribbon (5 findings + evidence levels)
- Claims matrix (Confirmed / Strong inference / Unproven)
- Key risk panel ("policy without measurement")
- Immediate action panel (3 brýn gögn)

### Key Interaction

- Smellur á hverja niðurstöðu opnar Evidence Drawer með tilheyrandi heimildum.

---

## 2) ICT Trifecta

### Narrative Role

Sýnir samtímaþróun í NACE J: tekjur, ráðningar, lausar stöður, framleiðni.

### Must Prove

- að þrjú merki hreyfast í sömu átt á tímabilum
- að mismatch milli vöxts og ráðninga sé sýnilegt
- að túlkun sé merkt sem mynstur, ekki orsök

### Required Modules

- Multi-series timeline (revenue, employment, vacancy rate)
- Baseline switch (2019 vs 2022)
- Trifecta interpretation panel með caveats
- Data freshness metadata

### Key Interaction

- Baseline toggle uppfærir sjónrænt allar viðeigandi series og footnotes.

---

## 3) Knowledge Occupation Collapse

### Narrative Role

Sýnir samsetningarbreytingu vinnumarkaðar 2024 -> 2025.

### Must Prove

- nettóhreyfingu milli ISCO 1-4 og 5-9
- hvaða flokkar lækka mest hlutfallslega
- að þetta sé skráð mynstur, ekki endanleg orsakasönnun

### Required Modules

- Ranked change table (ISCO groups)
- Split bar eða slope chart fyrir 2024 vs 2025
- Occupation impact summary cards
- Method caveat panel

### Key Interaction

- Smellur á starfaflokk sýnir nánari upptalningu og source rows.

---

## 4) Iceland Flying Blind

### Narrative Role

Sýnir að Ísland skortir lykilmælingar sem önnur Norðurlönd hafa.

### Must Prove

- fjarvist í isoc_eb_ai og EWCS
- skort á linked admin gögnum
- að eyðan er governance risk, ekki hlutlaus tækniatriði

### Required Modules

- Nordic comparison matrix
- Measurement coverage heatmap
- Agency responsibility map excerpt
- Gap impact explainer

### Key Interaction

- Smellur á "missing metric" sýnir: ábyrg stofnun, áhrif og gagnaósk.

---

## 5) Institutional Silence

### Narrative Role

Sýnir þátttökuleysi lykilstofnana/samtaka í samráði um AI.

### Must Prove

- að stór stéttarfélög hafi ekki sent umsagnir í viðkomandi ferli
- að samræmd viðbragðsinnviði vanti
- að claims með fyrirvara séu rétt merkt

### Required Modules

- Consultation participation table
- Timeline of policy events vs stakeholder responses
- Confidence-tagged claims list
- "What remains unverified" panel

### Key Interaction

- Hover/smellur á claim sýnir confidence level og hvað myndi hrekja fullyrðingu.

---

## 6) Adversarial Review

### Narrative Role

Sýnir mótrök, styrk þeirra og hvort þau hafi verið tekin gild.

### Must Prove

- að sterk mótrök séu birt af heiðarleika
- að rannsóknin geri skýr mörk milli gagna og túlkunar
- að notandi sjái hvað þarf að gerast til að hrekja niðurstöður

### Required Modules

- Counterargument register
- Claim-vs-falsifier matrix
- "What would change the conclusion?" panel
- Evidence confidence legend

### Key Interaction

- Toggle milli "Current conclusion" og "If falsifier appears".

---

## Evidence Model

Hver lykilfullyrðing skal mappast á:

- `claim_id`
- claim text
- evidence level
- sources[]
- method note
- falsifier condition
- freshness

Engin UI-eining má sýna fullyrðingu án `claim_id` og aðgengilegrar source-listu.

---

## Interaction Priorities

1. Trace claim -> evidence -> method innan 2 smella
2. Sýna uncertainty áður en notandi túlkar trend
3. Keep orientation: user má ekki "týnast" milli síðna/panela

---

## Phase Scope

### Phase 1 (núna)

- app shell
- navigation
- token integration
- panel/card primitives
- chart wrappers
- evidence drawer
- badges (warning/confidence/freshness)
- structural page skeletons fyrir 6 síður

### Phase 2 (seinna)

- raunveruleg data wiring
- state-aware data adapters
- method note automation
- advanced comparison interactions

---

## Non-Negotiable Constraints

- Ekki búa til metrics sem ekki eiga sér heimild.
- Placeholder texti skal vera skýrt merktur sem placeholder.
- Aðgengi og semantík ganga fyrir visual bravado.
- Viðmótið má ekki líta út sem generic SaaS dashboard.
