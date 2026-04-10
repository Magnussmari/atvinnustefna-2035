# Text Analysis Reproduction Report

**Generated:** 2026-04-10 22:14:39
**Script:** `scripts/02_verify_textanalysis.py`
**Source PDF:** [https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e](https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e)
**PDF size:** 6.0 MB
**Extracted text:** 1050 lines, 3108 words
**Tool:** pdftotext (poppler-utils)

## Method

1. Download Atvinnustefna Íslands 2035 PDF from samráðsgátt API
2. Extract full text using `pdftotext`
3. Case-insensitive search for each Icelandic term
4. Record line numbers and surrounding context

**This analysis is fully reproducible.** Run `python3 scripts/02_verify_textanalysis.py` to regenerate.

## Results: Terms PRESENT in the document

| Icelandic | English | Count | Context |
|-----------|---------|-------|---------|
| gervigreind | artificial intelligence | 3 | atvinnulífi kleift að nýta gervigreind til aukinnar verðmætasköpunar . |
| gagnavera | data centers | 1 | framleiðni . Alþjóðleg eftirspurn eftir þjónustu gagnavera eykst hratt, einkum v |
| áhættu | risk | 1 | til að greina áhættu |
| tækni | technology | 20 | -, iðn - og tæknigreinum |
| framleiðni | productivity | 35 | þekkingargreina og fjölbreyttra útflutningsgreina með mikla framleiðni. |
| nýsköpun | innovation | 23 | Verðmætasköpun er knúin af fjölbreyttum útflutningi sem byggir á nýsköpun |
| menntun | education | 2 | auka færni og menntun, einfalda |
| færni | skills | 9 | auka færni og menntun, einfalda |

## Results: Terms ABSENT from the document

| Icelandic | English | Count | Status |
|-----------|---------|-------|--------|
| atvinnuleysi | unemployment | 0 | CONFIRMED ABSENT |
| atvinnumissi | job loss | 0 | CONFIRMED ABSENT |
| sjálfvirknivæðing | automation (full word) | 0 | CONFIRMED ABSENT |
| sjálfvirkni | automation (short) | 0 | CONFIRMED ABSENT |
| röskun | disruption | 0 | CONFIRMED ABSENT |
| umbreyting | transformation | 0 | CONFIRMED ABSENT |
| neikvæð | negative | 0 | CONFIRMED ABSENT |
| ógn | threat | 0 | CONFIRMED ABSENT |
| hætta | danger/risk | 0 | CONFIRMED ABSENT |
| starfamissi | job loss (alt) | 0 | CONFIRMED ABSENT |
| endurmennt | retraining | 0 | CONFIRMED ABSENT |
| endurþjálf | reskilling | 0 | CONFIRMED ABSENT |
| umskipti | transition | 0 | CONFIRMED ABSENT |
| vinnuleysi | unemployment (alt) | 0 | CONFIRMED ABSENT |

## Full Context for AI Mentions

### Mention 1 (line 512)

```
innviði, til að stuðla að nýsköpun og gera

atvinnulífi kleift að nýta gervigreind til aukinnar verðmætasköpunar .
Spurning til hagaðila
• Til hvaða aðgerða geta stjórnvöld gripið
```

### Mention 2 (line 602)

```
landsins og móta skilvirka ferla um hæfni - og færnimat fyrir íslenskan vinnumarkað .
Tryggja þarf færni til að nýta gervigreind á íslenskum vinnumarkaði á ábyrgan hátt til að auka

framleiðni vinnuafls .
```

### Mention 3 (line 871)

```
framleiðni . Alþjóðleg eftirspurn eftir þjónustu gagnavera eykst hratt, einkum vegna aukinnar
notkunar gervigreindar . Ísland er í sterkri stöðu til að raungera tækifæri í gagnaversiðnaði í ljósi
m.a. samkeppnishæfni íslenskrar raforku og hagfelldra veðuraðstæðna fyrir kælingu .
```


---

*This report was auto-generated. Source: `https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e`*
