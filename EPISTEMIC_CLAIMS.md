# Sönnunarstig fullyrðinga / Evidence Register

Þetta skjal flokkar allar meginniðurstöður rannsóknarinnar eftir sönnunarstigi. Tilgangurinn er að gera aðskilnað á milli þess sem er **staðfest**, þess sem er **sterk ályktun** og þess sem er **túlkun eða viðvörun** — þannig að gagnrýni beinist á réttan hluta. Rannsóknin hvílir á tveimur aðskildum málaflokkunum sem þarf að meta hvert fyrir sig.

---

## Tvö mál, ekki eitt / The Two Cases

**Mál A: Textamál (óhrekjanlegt)**
Atvinnustefna Íslands 2035 nefnir ekki lykilhugtök tengd áhættu, röskun eða umbreytingu vinnumarkaðar. Þetta er staðreyndarleg niðurstaða, ekki túlkun. Hún stendur hvort sem eð er hvort AI er að valda röskun á íslenskum vinnumarkaði eða ekki.

**Mál B: Vinnumarkaðsmál (mynstur, ekki sönnun)**
Gögn um íslenskan vinnumarkað sýna röskunarmynstur sem er samhljóða þróun sem alþjóðlegar stofnanir tengja við gervigreind — en orsakasamband er **ekki hægt að sanna með fyrirliggjandi íslenskum gögnum**. Skortir á þann mælingargrundvöll sem þyrfti til þess. Mál B styður Mál A en þarf ekki að vera satt til þess að Mál A standi.

> **Mál A stendur þótt Mál B sé rangt.**
> *Case A holds even if Case B is wrong.*

---

## Flokkur 1: STAÐFEST — Tölvupróf endurgerlanlegt
*Computationally verified — reproducible by any system*

### F1 · Textaeyða Atvinnustefnunnar

**Fullyrðing:** 14 áhættutengd lykilhugtök eru ekki til staðar í opinbera PDF-skjali Atvinnustefnu Íslands 2035.

**Sönnunargrundvöllur:** Sjálfvirk textagreining á opinberri PDF-skrá; endurgert af tveimur sjálfstæðum kerfum (Manus 1.6 + Claude Code). Python-skrifta í `scripts/02_verify_textanalysis.py` endurgerir greininguna.

**Niðurstaða:** 14/14 hugtök staðfest fjarverandi. Engin fyrirvari.

**Heimild:** Samráðsgátt S-226/2025, PDF-skrá; `evidence/02-document-textanalysis.md`

**Hvað myndi hrekja þetta:** Ef offical PDF er uppfærð eða skipt út og nýtt skjal inniheldur hugtökin. Núverandi skrá mun áfram vera mælanleg.

---

### F3 · Hrun þekkingstarfa 2024→2025

**Fullyrðing:** 9.300 þekkingarkrefjandi störf (ISCO 1–4) töpuðust á Íslandi milli 2024 og 2025 (-6,9%) á sama tíma og 6.900 líkamleg störf og þjónustustörf bættust við (ISCO 5–9: +7,4%).

**Sönnunargrundvöllur:** Allar 10 tölur staðfestar af Manus 1.6 úr Hagstofa VIN01100 tafla. Nákvæm töluleg samsvörun.

**Niðurstaða:** Staðfest. Engin fyrirvari.

**Heimild:** Hagstofa Íslands, PxWeb tafla VIN01100; `data/iceland-ai-governance-audit/data/raw/`

**Mikilvægt fyrirvari:** Þetta lýsir **mynstri**, ekki orsök. Gögnin sýna hvað gerðist — ekki af hverju.

**Hvað myndi hrekja þetta:** Rangar tölur í PxWeb (villur í upprunagögnum Hagstofunnar). Ekkert bendir til þess.

---

### F4 · Útilokun Íslands úr Eurostat AI-mælingum

**Fullyrðing:** Ísland er ekki þátttakandi í Eurostat isoc_eb_ai könnuninni (notkun gervigreindar í fyrirtækjum). Öll önnur Norðurlönd (DK, SE, NO, FI) eru þátttakendur.

**Sönnunargrundvöllur:** Bein athugun á Eurostat gagnagrunni. Ísland kemur ekki fyrir í gögnum.

**Niðurstaða:** Staðfest. Athugið að rannsóknin skráir **fjarvist** — ástæðan (af hverju Ísland er ekki þátttakandi) er óþekkt og er meðal þess sem gagnaóskir þeirra 04_HAGSTOFA og 08_HVIN eru sendar til að kanna.

**Heimild:** Eurostat isoc_eb_ai; `evidence/03-institutional-reports.md`

**Hvað myndi hrekja þetta:** Ef Ísland er í gagnagrunni undir öðru kóðanafni eða ef gögn eru birt með seinkun sem hefur ekki verið uppfærð.

---

## Flokkur 2: STERK ÁLYKTUN — Mynstur skýrt, orsakasamband líklegt en ósannað
*Pattern clear, causality plausible but not provable with current data*

### F2 · ICT-þríhyrningurinn / The ICT Trifecta

**Fullyrðing:** Upplýsingatæknigeirinn (NACE J) á Íslandi sýnir samtíða: (a) tekjuvöxt, (b) ráðningarsamdrátt og (c) hrun lausra starfa — þrjár vísbendingar sem saman eru samhljóða framleiðnitilfærslu.

**Sönnunargrundvöllur:** Mynsturinn staðfestur í báðum tímarömmum (2022-baseline og 2019-baseline). Tafla VIN01110 (ráðningar), JVS00001 (laus störf), FYR04101 (tekjur), THJ11011 (framleiðni).

**Nákvæmnisfyrirvari:** Tekjutala er 2019→2024 (ekki 2022→2025). J62-tekjugögn fyrir 2025 eru ekki enn til staðar í PxWeb — gagnaósk 03_HAGSTOFA sækist eftir þeim.

**Hvernig á að lýsa þessu:** *Mynsturið er samhljóða framleiðnitilfærslu* — ekki *AI gerði þetta*. AI er trúverðug og vaxandi skýring, sérstaklega í ljósi alþjóðlegra gagna, en íslenskar gagnaheimildir duga ekki til orsakasönnunar.

**Heimild:** Hagstofa PxWeb; `data/iceland-ai-governance-audit/data/raw/`

**Hvað myndi hrekja þetta:**
- J62-tekjugögn fyrir 2025 sýna tekjusamdrátt (myndi benda til COVID-leiðréttingar, ekki tilfærslu)
- Skýring með sönnun á að ráðningarsamdrátturinn í J sé vegna annars en tæknitilfærslu (t.d. stór fyrirtæki flykkja sig til útlanda)

---

### F4b · Norðurlöndin og linked admin-gögn

**Fullyrðing:** Öll önnur Norðurlönd (DK, SE, NO, FI) hafa tengd stjórnsýsluleg gagnasöfn (linked administrative data) sem gera kleift að rekja starfsmenn frá störfum yfir í velferðarkerfi. Ísland hefur ekkert slíkt.

**Sönnunargrundvöllur:** DREAM+IDA (DK), FD-Trygd (NO), LISA (SE), Findata (FI) — öll staðfest í opinberri skjölun. Íslenskt kerfi staðfest ótilvísað.

**Fyrirvari:** Hvort þetta er *meðvituð stefnuval* eða *einfaldlega ekki farið í það* er opið. Gagnaóskir eru sendar til að kanna ástæðu.

---

### F5 · Þögn stéttarfélaga

**Fullyrðing:** Við samráð um Aðgerðaáætlun um gervigreind (14 dagar, nóvember 2024) skilaði ekkert stórt stéttarfélag (ASÍ, VR, Efling, BSRB, SFR, KÍ) athugasemd. Á 46. þingi ASÍ (október 2024) voru engar ályktanir um gervigreind samþykktar.

**Sönnunargrundvöllur:**
- ✅ Núll stéttarfélag-umsóknir: staðfest með beinni yfirferð samráðsskjala (94 PDF greind)
- ✅ BHM (Academic Association) skilaði 2 blaðsíðna athugasemd
- ❓ ASÍ 46. þing: titlar þingskjala yfirfarnir, en full PDF-les hefur ekki farið fram

**Af hverju þetta skiptir máli þótt einhver fyrirvari sé:** Jafnvel að teknu tilliti til óstaðfests atriðis er þögn 6 stærstu stéttarfélaga við samráð um gervigreindarstefnu grundvallaratriði.

**Hvað myndi hrekja þetta:** Ef ASÍ 46. þingskjöl innihalda ályktanir um gervigreind við nánari skoðun.

---

## Flokkur 3: LÝSANDI — Skipulægar staðreyndir, ekki orsakasönnun
*Structural facts — descriptive, not causal*

### Mælingareyða Íslands

**Fullyrðing:** Íslenskar stofnanir mæla ekki AI-innleiðingu í fyrirtækjum, tengja ekki starfsgrein við velferðarinngang, og taka ekki þátt í EWCS eða isoc_eb_ai. Þetta er skipulagsleg staðreynd.

**Mikilvægt:** Þetta er **lýsing á fjarvist**, ekki ásakning um vanrækslu. Eyðan getur verið afleiðing takmarkaðra fjármuna, forgangsröðunar eða einföldlega þess að málið er nýtt. Gagnaóskir eru sendar til að skilja ástæðurnar.

---

### 17% misræmi í atvinnuleysismælingum

**Fullyrðing:** Hagstofa Íslands og Vinnumálastofnun gáfu 17% mismunandi atvinnuleysistölur í september 2024 (5,2% vs. 3,3%), samkvæmt skýrslu Ríkisendurskoðunar.

**Sönnunargrundvöllur:** ✅ Ríkisendurskoðun Þingskjal 350/156, staðfest.

**Merkjamál:** Þetta er gagnlegt dæmi um mælingarúrræðnisleika — ekki sönnun á AI-tengslum.

---

## Flokkur 4: VIÐVÖRUN / TÚLKUN — Ályktað, ekki sannað
*Inferred, not evidenced*

### Orsakasamband AI → ISCO-tap

**Fullyrðing (sem BÁ á að gera):** Gervigreind er orsök þess að þekkingastörfum fækkaði um 9.300 á milli 2024 og 2025.

**Staðan:** Þetta er **ekki hægt að sanna með fyrirliggjandi gögnum**. Mynsturið er samhljóða AI-tilfærslu, AI er trúverðug skýring, en tvo þættirnir sem krafist er til orsakasönnunar vantar: (a) bein mæling á AI-innleiðingu á vinnustöðum og (b) samanburðarhæf gögn sem loka á aðrar skýringar.

**Rétt framing:** *„Stjórnvöld hafa ekki sýnt fram á að þau mæli eða aðgreini orsakir nægilega vel til að útiloka þessa skýringu"* — ekki *„AI olli þessu"*.

---

## Hvað myndi hrekja þessar niðurstöður? / What would falsify these findings?

*Þetta er í samræmi við opnar vísindastaðlaðar kröfur. Allir eru hvattir til að leita að þessum gögnum.*

| Niðurstaða | Gögn sem myndu veikja hana |
|-----------|---------------------------|
| **F1 Textaeyða** | Uppfærð útgáfa stefnunnar sem inniheldur áhættutengd hugtök |
| **F2 ICT-þríhyrningur** | J62-tekjutölur 2025 sem sýna tekjusamdrátt; sönnun á útflutningi starfa til útlanda |
| **F3 ISCO-tap** | Gögn sem sýna að 9.300 störfin hafi flust til annarra geira (ekki tapist); sönnun á öðrum skýringum (t.d. lýðfræðibreytingar) |
| **F4 Mælaeyða** | Innlend AI-mæling í Hagstofu; sönnun á að Ísland taki þátt í EWCS |
| **F5 Þögn** | ASÍ 46. þingskjöl með gervigreindartengdum ályktunum (í skoðun) |
| **Orsakasamband** | Bein mæling á AI-innleiðingu á vinnustöðum sem sýnir engan samsvörun við ráðningarbreytingar |

---

## Sterkustu mótrök / Strongest Counterarguments

Sjá fulla greiningu í [`evidence/07-adversarial-oracle.md`](evidence/07-adversarial-oracle.md). Sterkustu rökin sem hafa **ekki verið fullnægjandi hrekkt**:

1. **Luddite Fallacy (STERK):** Söguleg tæknipanikar voru rangar. Svar: Rannsóknin fjallar um umbreytingarkostnað og mælingarhæfni, ekki um langtímanettó.

2. **Small Economy Advantage (STERK):** Ísland er betur í stakk búið en flestar þjóðir. Svar: Forskot jafngildir ekki þörfinni á áhættumetingu.

3. **WEF Net Positive (MIÐLUNGS-STERK):** +78M nettóstörf. Svar: Nettóniðurstaða leysir ekki umbreytingarábyrgð stjórnvalda á meðan á ferðinni stendur.

4. **Humlum & Vestergaard (2025, MIÐLUNGS):** Engin marktæk launa- eða vinnustundaáhrif í dönskum stjórnsýslugögnum. Þetta er **sterkasta gagngögn** rannsóknarinnar. Svar: Rannsóknin mælir ekki launaáhrif — hún mælir fjarveru mælingarinnviða og textaeyðu.

---

## Samantekt sönnunarstigs / Summary Table

| Niðurstaða | Stuðningur | Fyrirvari | Orsakasamband |
|-----------|-----------|-----------|--------------|
| F1 Textaeyða | ✅ Staðfest | Engin | Á ekki við |
| F2 ICT-þríhyrningur | ⚠️ Mynstur staðfest | Tekjuár þarf nákvæmni; J62 2025 vantar | Nei — mynstur, ekki orsök |
| F3 ISCO-tap | ✅ Staðfest | Skráning á mynstri — ekki orsök | Nei |
| F4 Mælaeyða | ✅ Staðfest (fjarvist) | Ástæða fjarveru er óþekkt | Á ekki við |
| F5 Stéttarþögn | ⚠️ Mestmegnis | ASÍ-þingskjöl ólesin að fullu | Á ekki við |
| Orsakasamband AI→ISCO | ❌ Ósannað | Vantar innlendar mælingar | Þetta er það sem vantar |

---

*Skjal uppfært: apríl 2026. Tengt við: `MEGA_REPORT.md`, `evidence/07-adversarial-oracle.md`, `evidence/07-gap-analysis.md`*
