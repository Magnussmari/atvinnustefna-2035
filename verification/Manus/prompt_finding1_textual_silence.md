# Sannprófun — Niðurstaða 1: Textaþögnin

## Verkefni

Halaðu niður opinberu PDF-skjali Atvinnustefnu Íslands 2035 af samráðsgáttinni og framkvæmdu sjálfstæða orðtíðnigreiningu til að staðfesta eða hrekja eftirfarandi fullyrðingu.

## Fullyrðing sem á að sannprófa

Atvinnustefna Íslands 2035 inniheldur ekki eftirfarandi 14 íslensk orð — ekki einu sinni:

| Orð | Merking |
|-----|---------|
| atvinnuleysi | unemployment |
| atvinnumissi | job loss |
| sjálfvirknivæðing | automation (full) |
| sjálfvirkni | automation (short) |
| endurmenntun | retraining |
| endurþjálfun | reskilling |
| röskun | disruption |
| umbreyting | transformation |
| neikvæð | negative |
| ógn | threat |
| hætta | danger/risk |
| starfamissi | job loss (alt) |
| umskipti | transition |
| vinnuleysi | unemployment (alt) |

Jafnframt er fullyrt að orðið „gervigreind" (artificial intelligence) komi einungis 3 sinnum fyrir, allt í jákvæðu/tækifærissamhengi.

## Heimild

PDF-skjalið (6 MB):
https://samradapi.island.is/api/Documents/74e3082d-e8c6-f011-9bd1-005056bcce7e

Samráðsgáttarsíða:
https://island.is/samradsgatt/mal/4111

## Aðferð

1. Halaðu niður PDF-skjalinu af vefslóðinni hér að ofan
2. Dragðu allan texta út úr skjalinu (pdftotext eða sambærilegt)
3. Leitaðu að hverju af 14 orðunum (case-insensitive)
4. Teldu fjölda „gervigreind" og skráðu samhengið í kring (3-4 línur fyrir og eftir)
5. Skráðu allar niðurstöður í töfluformi

## Væntanlegt svarformat

Fyrir hvert orð:

| Orð | Merking | Fjöldi | Staða |
|-----|---------|--------|-------|
| atvinnuleysi | unemployment | [tala] | STAÐFEST FJARVERANDI / FANNST |

Ef eitthvert orð finnst, skráðu nákvæmlega hvar og í hvaða samhengi.

Fyrir „gervigreind": skráðu öll tilvik og 3-4 línur af samhengi í kring. Er samhengið jákvætt/tækifæri, neikvætt/áhætta, eða hlutlaust?

## Varúð

- Notaðu case-insensitive leit (bæði „Atvinnuleysi" og „atvinnuleysi")
- Athugaðu líka afleidd form (t.d. „atvinnuleysis-" sem hluti af samsettum orðum)
- Ef PDF-textaútdráttur gefur óreiðulegan texta (t.d. vegna dálka eða mynda), skráðu það
- Tilgreindu nákvæmlega hvaða tól/aðferð þú notaðir til útdráttar
