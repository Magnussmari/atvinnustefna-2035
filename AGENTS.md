# AGENTS.md — Operating Protocol for Sentinel

## Scope

Þessi skrá skilgreinir hvernig agentar eiga að vinna í þessu repo, sérstaklega við framenda Sentinel.

Hún gildir fyrir:

- Cursor agents
- subagents
- öll sjálfvirk code breytingaflæði

---

## Prime Directive

Byggja **evidence-first policy interface**, ekki generic dashboard.

Allar breytingar skulu hámarka:

1. credibility
2. traceability
3. composability
4. accessibility

---

## Mandatory Read Order (Before Any Frontend Change)

Áður en frontend skrár eru breyttar skal lesa:

1. `DESIGN.md`
2. `dashboard-spec.md`
3. viðeigandi `.cursor/rules/*.mdc`

Ef þessar skrár stangast á:

- `DESIGN.md` ræður visual language
- `dashboard-spec.md` ræður upplýsingaskipan og narrative
- `.cursor/rules/*.mdc` ráða implementation guardrails

---

## Non-Negotiable Rules

- Ekki búa til mæligildi eða "synthetic evidence" sem líta út fyrir að vera raunheimildir.
- Ekki fela óvissu eða gagnaskort.
- Ekki kynna orsakatúlkun sem staðreynd ef gögn sýna aðeins mynstur.
- Ekki hardcode-a visual values sem eiga heima í token kerfi.
- Ekki breyta upplýsingaskipan síðu án skýrrar ástæðu í commit lýsingu.

---

## Evidence Integrity Protocol

Fyrir hverja claim-tengda UI breytingu:

1. tengja claim við source eða merkja sem placeholder,
2. sýna evidence level,
3. sýna caveat ef orsakasamband er ósannað,
4. tryggja að Evidence Drawer sé aðgengilegur.

---

## Frontend Engineering Protocol

- Nota reusable components fremur en page-level copy/paste.
- Halda component API litlu og skýru.
- Nota semantic HTML þar sem hægt er.
- Nota accessibility labels fyrir interactive controls.
- Gera state meðhöndlun explicit: verified/provisional/stale/missing/contested.

---

## Visual Integrity Protocol

- Forðast startup aesthetics (óþarfa gradients, flashy glows, decorative noise).
- Viðhalda premium dark-mode restraint.
- Halda hierarchy milli headline, evidence og method.
- Chart aesthetics skulu þjóna túlkun, ekki skreytingu.

---

## Planning and Execution Flow

Þegar beðið er um nýja frontend vinnu:

1. draga stuttlega saman design constraints úr `DESIGN.md`,
2. leggja fram component architecture,
3. lista skrár sem verður breytt,
4. framkvæma í litlum, sannreynanlegum skrefum.

Við visual refinement í Browser Design Mode:

- laga spacing, hierarchy og state skýrleika
- ekki brjóta IA sem skilgreind er í `dashboard-spec.md`

---

## Done Criteria (Frontend PR Ready)

Verk telst tilbúið þegar:

- design tokens eru notuð kerfisbundið,
- evidence states eru sýnileg í öllum chart/panel einingum,
- keyboard og focus hegðun virkar,
- engin fabricated metrics eða fabricated evidence texti er sýndur,
- component uppsetning er samræmd milli síðna.

---

## Preferred Communication Style in Code

- Nöfn á componentum: skýr og verkefnamiðuð.
- Athugasemdir: stuttar, aðeins þar sem business logic er óaugljós.
- Placeholder efni: merkt sem placeholder, ekki framsett sem niðurstaða.

---

## Escalation Rule

Ef user request kallar á:

- að brjóta evidence integrity,
- að sýna ósannaðar fullyrðingar sem staðreynd,
- eða að fela gagnaskort,

skal agent stoppa og óska skýrrar staðfestingar áður en haldið er áfram.
