# Stofnanakort: AI og vinnumarkaður á Íslandi
*Agency Map: AI and Labour Market Measurement in Iceland*

Þetta skjal sýnir hvaða stofnun ber formlega ábyrgð á mælingu ákveðinna þátta, hvað er mælt, hvað er ekki mælt, og hvaða gagnaósk þessarar rannsóknar er beint til hverrar stofnunar.

Tilgangurinn er tvíþættur: (1) Sýna hvar mælingareyðurnar eru og hverjum tilheyra þær; (2) Forðast þá hring-vísunarvandann þar sem stofnanir vísa á hinar og engar svara.

---

## Mælingarkort / Measurement Map

| Stofnun | Ætti að mæla | Mælir nú þegar | Eyða | Tegund eyðu | FOI-beiðni |
|---------|-------------|----------------|------|------------|------------|
| **Hagstofa Íslands** | AI-innleiðing í fyrirtækjum (Eurostat isoc_eb_ai) | Tekur **ekki** þátt í þessari könnun | Hvernig útbreitt er AI í íslenskum fyrirtækjum | ALGJÖR | `04_HAGSTOFA_EUROSTAT` |
| **Hagstofa Íslands** | Laus störf eftir atvinnugreinum (ársfjórðungslega) | Birta heildarstöðu en ekki alltaf sundurliðað eftir geirum í opinberri aðgengi | ICT-geiri: laus störf 2022–2025 | HLUTLÆG | `03_HAGSTOFA_VACANCIES` |
| **VMST — Vinnumálastofnun** | Atvinnuleysi eftir atvinnugreinum (mánaðarlega, niðurhal) | Mælaborð á island.is en **engin CSV-niðurhal** til almennings | Gagna-aðgengi á geiragreindu stigi | HLUTLÆG | `02_VMST_SECTOR_UNEMPLOYMENT` |
| **TR — Tryggingastofnun** | Velferðarinngang tengdur fyrri starfsgrein og sjúkdómsgreiningu | Heildarfjöldi viðtakenda; sjúkdómsgreiningartíðni sérstaklega | **Engin krosstafla**: starfsgrein × sjúkdómsgreining × inngang | ALGJÖR | `01_TR_OCCUPATION_DIAGNOSIS` |
| **Sjúkratryggingar Íslands** | Veikindafjarvistir eftir sjúkdómsgreiningu og atvinnugrein | Greiðslur í heild; sumar brotnar niður | Sundurliðun á geira × greiningu × ári | HLUTLÆG | `05_SJUKRATRYGGINGAR_SICK_LEAVE` |
| **Ríkisendurskoðun** | Eftirlit með samræmi atvinnuleysismælinga | Greindi 17% misræmi (2024 skýrsla) | **Stofnanasvar**: hvort tilmæli hafa verið framkvæmd | EFTIRFYLGNI | `06_RIKISENDURSKODUN_FOLLOWUP` |
| **Forsætisráðuneytið** | Aðferðafræðigrundvöllur AI-stefnu (55%/130.000) | Hefur birt töluna; **engin aðferðafræðiskjöl** opinber | Uppruni og óvissa-bil tölunnar | AÐFERÐAFRÆÐIEYÐA | `07_FORSAETISRADUNEYTI_METHODOLOGY` |
| **HVIN — Háskóla-, iðnaðar- og nýsköpunarráðuneytið** | Þátttaka í EWCS (evrópsk vinnuaðstæðnakönnun) | Ísland tók **ekki þátt** í EWCS 2024 | Vinnuaðstæður, reikniritstjórnun, þjálfunarnægjusemi | ALGJÖR | `08_HVIN_EWCS_PARTICIPATION` |

---

## Norðurlandasamanburður / Nordic Comparison

| Mæling | Ísland | Danmörk | Noregur | Svíþjóð | Finnland |
|--------|--------|---------|---------|---------|---------|
| Eurostat AI-könnun (isoc_eb_ai) | ❌ | ✅ 42% | ✅ 29% | ✅ 35% | ✅ 38% |
| EWCS vinnuaðstæðnakönnun | ❌ (2024) | ✅ | ✅ | ✅ | ✅ |
| Tengd stjórnsýsluleg gögn (linked admin data) | ❌ | ✅ DREAM+IDA | ✅ FD-Trygd | ✅ LISA | ✅ Findata |
| Fagfélaga-AI-samningar | ❌ | ✅ | ✅ | ✅ | ✅ |
| Þjóðlegt AI-ráð með fulltrúum launafólks | ❌ | ✅ | ✅ | ✅ | ✅ |

Ísland er eina Norðurlandið sem er **ekki** í neinum þessara mælingakerfa.

---

## Hring-vísunarvandinn / The Accountability Gap

Þegar stofnanir eru spurðar um þessa mælingareyðu er algeng svar: *„Þetta er á verksviði X"* eða *„Við segjum frá X sem tekur þessa tölu"*. Þetta er dæmi um **ábyrgðarþoku** (Responsibility Fog) — kerfislæga dreifingu ábyrgðar þannig að enginn ber hana í raun.

Þetta skjal setur fram hvar ábyrgðin *ætti* að liggja — með það að markmiði að stofnanir geti ekki vísað á hvora aðra án þess að vísunin sé skjalfest.

**Keðjan sem vantar:**

```
AI-innleiðing → Vinnumarkaðsáhrif → Veikindi → Endurmenntun → Velferðarinngang
     ↑                  ↑                ↑              ↑                ↑
  Hagstofa/          Hagstofa/         Sjúkra-        VMST/            TR
  Eurostat            VMST             tryggingar     HVIN
  (vantar)           (hlutlægt)       (hlutlægt)   (hlutlægt)       (vantar)
```

Til þess að greina hvort AI-röskun sé að „renna í gegnum" þessa keðju þarf **tengd gögn** á öllum þrepum. Öll Norðurlöndin hafa það. Ísland hefur það ekki.

---

## Hvað þarf til að loka eyðunum? / What Would Close the Gaps?

| Eyða | Kostnaður/erfiðleiki | Tímarammi | Líklegasti framkvæmandi |
|------|---------------------|-----------|------------------------|
| Þátttaka í isoc_eb_ai | Lágur — viðbót við núverandi Eurostat-samstarf | 1–2 ár til næstu könnunar | Hagstofa + HVIN |
| Þátttaka í EWCS | Lágur (380.000 þjóð, lítið úrtak) | 3–5 ár til næstu umferðar | HVIN + Eurofound |
| TR-krosstafla | Lágur — gögn eru til; þarf flokkun | 3–6 mánuðir | TR + Hagstofa |
| Linked admin data | HÁR — krefst löggjafar, persónuverndarmats | 3–5 ár | Hagstofan + löggjafi |
| Samræming VMST/Hagstofa | MIÐLUNGS — krefst pólitískrar vilja | 1–3 ár | Ríkisendurskoðun |

---

*Skjal uppfært: apríl 2026. Tengist gagnaóskum í `data/iceland-ai-governance-audit/data-requests/`*
