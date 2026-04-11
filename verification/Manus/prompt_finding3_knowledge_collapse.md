# Sannprófun — Niðurstaða 3: Hrun þekkingstarfa

## Verkefni

Sæktu gögn úr Hagstofu Íslands (PxWeb) og staðfestu eða hrektu eftirfarandi fullyrðingu um breytingar á starfasamsetningunni á Íslandi.

## Fullyrðing sem á að sannprófa

Á milli 2024 og 2025 töpuðust 9.300 þekkingarkrefjandi störf á Íslandi (ISCO-flokkar 1–4: -6,9%) á meðan 6.900 líkamleg störf og þjónustustörf bættust við (ISCO-flokkar 5–9: +7,4%).

Sérstök gögn til staðfestingar:

| Starfsflokkur (ISCO) | 2024 | 2025 | Fullyrðing um breytingu |
|----------------------|------|------|------------------------|
| 1: Stjórnendur | 30.000 | 28.000 | -2.000 (-6,7%) |
| 2: Sérfræðingar | 58.700 | 54.200 | -4.500 (-7,7%) |
| 3: Tæknar | 36.000 | 33.800 | -2.200 (-6,1%) |
| 4: Skrifstofufólk | 9.600 | 9.000 | -600 (-6,3%) |
| Samtals ISCO 1-4 | 134.300 | 125.000 | -9.300 (-6,9%) |
| 5: Þjónustu-/sölufólk | 44.500 | 50.000 | +5.500 (+12,4%) |
| 7: Iðnaðarmenn | 20.900 | 21.300 | +400 |
| 8: Vélstjórar | 9.400 | 9.800 | +400 |
| 9: Ósérhæft starfsfólk | 12.200 | 12.600 | +400 |
| Samtals ISCO 5-9 | 93.000 | 99.900 | +6.900 (+7,4%) |

## Heimild

Hagstofa Íslands, tafla VIN01100:
https://px.hagstofa.is

Leiðbeiningar: Farðu í Samfélag → Vinnumarkaður → Vinnumarkaðsrannsókn → Árstölur → VIN01100. Veldu „Starfsstéttarflokkur" (ISCO 1-stafur), ár 2024 og 2025, bæði kyn.

CSV-hrágögn eru einnig í GitHub repo:
https://github.com/Magnussmari/atvinnustefna-2035/blob/main/data/iceland-ai-governance-audit/data/raw/employment_by_occupation_annual.csv

## Aðferð

1. Sæktu gögn úr VIN01100 af PxWeb (eða notaðu CSV-skjalið í repo)
2. Dregðu út tölur fyrir ISCO-flokka 1-9 fyrir árin 2024 og 2025
3. Reiknaðu breytingar í fjölda og prósentum
4. Berðu saman við fullyrðinguna hér að ofan
5. Reiknaðu samtölu ISCO 1-4 (þekkingarkrefjandi) og ISCO 5-9 (líkamleg/þjónusta)

## Væntanlegt svarformat

| ISCO-flokkur | 2024 (sannreynt) | 2025 (sannreynt) | Breyting (sannreynt) | Fullyrðing | Staða |
|-------------|-----------------|-----------------|---------------------|-----------|-------|
| 1 Stjórnendur | [tala] | [tala] | [tala] | -2.000 | STAÐFEST / FRÁBRUGÐIÐ |

Ef tölur eru annað en fullyrt, skráðu raunverulegar tölur og útskýrðu muninn.

## Varúð

- Hagstofa PxWeb getur sýnt tölur í þúsundum eða heiltölum — athugaðu einingar
- Gögn geta verið ávöluð (t.d. 30,0 þúsund = 30.000)
- Athugaðu hvort ISCO-flokkur 6 (bændur/sjómenn) er innifalinn — hann getur verið undanskilinn eða sameinaður
- Ef 2025 gögn eru ekki enn aðgengileg í PxWeb, notaðu CSV-skjalið úr repo og skráðu það
