# DESIGN.md — The Iceland 2035 Sentinel

## Tilgangur

Þetta skjal er **visual source of truth** fyrir framenda Sentinel.
Markmiðið er ekki "fallegt dashboard", heldur **trúverðugt stefnumótunarviðmót** þar sem gögn, aðferð og óvissa eru sýnileg.

Forgangsröð:

1. Credibility
2. Traceability
3. Legibility
4. Composability
5. Aesthetics

---

## Hönnunarsjónarmið

### Atmosphere

- Alvarlegt, rólegt, ritstjórnarlegt.
- "Sovereign-risk intelligence", ekki startup marketing.
- Fáar sjónrænar truflanir; þéttleiki má vera hár ef hann eykur skýrleika.

### Core Principles

- **Evidence-first**: fullyrðing fær ekki premium framsetningu án heimilda.
- **State-first**: gögn eru alltaf merkt með stöðu (verified/provisional/stale/missing/contested).
- **Method-visible**: notandi á að sjá "hvernig vitum við þetta?" án þess að yfirgefa samhengi.
- **No fabricated confidence**: óvissa skal sýnileg, ekki falin.

---

## Design Tokens

Nota alltaf tokens, ekki hardcoded lit/gap/font values.

### Color Tokens

#### Neutrals

- `--bg-canvas`: #0B0E13
- `--bg-surface-1`: #121722
- `--bg-surface-2`: #171E2B
- `--bg-surface-3`: #1D2636
- `--border-subtle`: #2A3447
- `--border-strong`: #3A4861
- `--text-primary`: #E8EDF7
- `--text-secondary`: #B4C0D3
- `--text-muted`: #8593AA

#### Semantic States

- `--state-verified`: #2F9E6F
- `--state-provisional`: #D6A649
- `--state-stale`: #B67E2E
- `--state-missing`: #7A869A
- `--state-contested`: #C35D5D
- `--state-info`: #4F86D9

#### Data Viz

- `--series-primary`: #8FB3FF
- `--series-secondary`: #6ED3C1
- `--series-tertiary`: #D2A8FF
- `--series-quaternary`: #F2C879
- `--series-negative`: #E07A7A
- `--series-neutral`: #9AA8BD

### Typography Tokens

- `--font-ui`: Inter, system-ui, -apple-system, sans-serif
- `--font-data`: Inter, system-ui, -apple-system, sans-serif
- `--font-mono`: ui-monospace, SFMono-Regular, Menlo, monospace

- `--text-display`: 30/36, 600
- `--text-h1`: 24/30, 600
- `--text-h2`: 20/26, 600
- `--text-h3`: 16/22, 600
- `--text-body`: 14/20, 400
- `--text-small`: 12/16, 400
- `--text-micro`: 11/14, 500

### Spacing Tokens

8pt grunnkerfi:

- `--space-1`: 4px
- `--space-2`: 8px
- `--space-3`: 12px
- `--space-4`: 16px
- `--space-5`: 20px
- `--space-6`: 24px
- `--space-8`: 32px
- `--space-10`: 40px
- `--space-12`: 48px

### Radius / Shadow

- `--radius-sm`: 6px
- `--radius-md`: 10px
- `--radius-lg`: 14px
- `--shadow-surface`: 0 8px 24px rgba(0, 0, 0, 0.32)
- `--shadow-focus`: 0 0 0 2px rgba(143, 179, 255, 0.45)

---

## Surface Hierarchy

- **Canvas**: grunnbakgrunnur.
- **Section surface**: heldursvæði fyrir síðuþemu.
- **Panel**: aðaleining fyrir insight.
- **Inset**: secondary info (method notes, caveats, metadata).

Regla: Ekki nota meira en 3 sýnileg dýptarlög á sama skjá.

---

## Component Primitives

Skyldueiningar í kerfi:

- `AppShell`
- `TopNav` og `SectionNav`
- `PageHeader`
- `InsightPanel`
- `MetricCard`
- `ChartFrame`
- `EvidenceDrawer`
- `MethodNote`
- `StateBadge`
- `FreshnessBadge`
- `ConfidenceBadge`
- `MissingDataBlock`
- `ContestedInterpretationCallout`

Allar síður eiga að vera samsettar úr þessum primitives áður en sértækar útgáfur eru smíðaðar.

---

## Chart Style Language

- Axar og labels: muted en skýrar.
- Gridlines: fínar, lág andstæða, aldrei dominant.
- Annotation texti: stuttur, staðreyndamiðaður, með evidence link ef fullyrt er.
- Legends: einfaldar, stöðugar yfir allar chart gerðir.
- Tooltip: sýnir gildi, tíma, stöðu gagna, confidence og heimild.

Forðast:

- neon litablikk
- trading/fintech sjónmál
- ofþungar animationar
- óskýrar 3D framsetningar

---

## Data State Visual Grammar

Öll gagnatengd UI þarf sýnilegt state.

- **Verified**: grænn accent + "Verified" badge + source tiltæk.
- **Provisional**: amber accent + "Provisional" + caveat.
- **Stale**: burnt amber + "Stale" + síðasta uppfærsludagsetning.
- **Missing**: neutral gray + "Missing" + hvað vantar og hver á að mæla.
- **Contested**: red accent + "Contested" + competing interpretation.

Það er bannað að sýna chart án state-merkingar.

---

## Evidence Interaction Model

### Evidence Drawer

Evidence drawer opnast úr panel/chart og sýnir:

1. Claim
2. Evidence list (heimildir)
3. Method note
4. Limitations
5. Last verified date

### Method Notes

- Stuttar, í plain language.
- Mega ekki fela orsakatúlkun sem gögn styðja ekki.

---

## Missing / Warning / Risk States

### Missing Data Block

Skal alltaf innihalda:

- hvað vantar
- af hverju það skiptir máli
- hvaða stofnun ber ábyrgð
- hvaða nálgun var notuð á meðan gögn vantar

### Warning Severity

- `info`: context only
- `watch`: likely issue
- `critical`: decision-risk now

Litir skulu fylgja state tokens, ekki custom litum í einstökum componentum.

---

## Do / Don't

### Do

- Hanna fyrir þinglega kynningu og stefnumótun.
- Nota skýra hierarchy milli fullyrðingar, sönnunargagna og caveat.
- Halda texta stuttum en nákvæmum.
- Sýna uncertainty sem fyrsta flokks feature.

### Don't

- Ekki "startup-ify" viðmótið.
- Ekki nota decorative gradients sem bera enga merkingu.
- Ekki fela source/method fyrir notanda.
- Ekki gera dramatíska litaval sem skekkir merkingu gagna.

---

## Accessibility Baseline

- WCAG AA minimum fyrir texta og controls.
- Full keyboard navigation.
- Visible focus states á öllum interactive elementum.
- Charts þurfa textaútskýringar sem virka fyrir screen readers.

---

## Delivery Rule

Allar nýjar frontend breytingar skulu:

1. vísa í viðeigandi section í þessu skjali,
2. nota design tokens,
3. innihalda skýra data-state meðhöndlun.
