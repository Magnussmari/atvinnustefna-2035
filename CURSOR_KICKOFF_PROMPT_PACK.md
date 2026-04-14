# Cursor Kickoff Prompt Pack - Iceland 2035 Sentinel

Use these prompts in order. They are designed for:

1. system build,
2. visual refinement,
3. chart system hardening.

---

## Prompt 1 - Phase 1 Build: App Shell + System Foundations

Read and follow these files first, in this order:

1. AGENTS.md
2. DESIGN.md
3. dashboard-spec.md
4. all files in .cursor/rules/

Task:
Build the frontend foundation for "The Iceland 2035 Sentinel" exactly from the repo design operating system.

This is an evidence-first, policy-grade dashboard about labour-market disruption, AI risk, institutional silence, and measurement failure in Iceland.

Primary objective:
Create the app shell, design-token implementation, reusable UI primitives, and the six dashboard page skeletons so the product already feels coherent, premium, and serious before data wiring is complete.

Non-negotiables:

- Do not invent data, metrics, evidence text, citations, or institutional claims
- Do not introduce generic startup/SaaS styling
- Do not bypass the state grammar in DESIGN.md
- Do not hardcode ad hoc colors, spacing, shadows, or typography outside the token system
- Do not create disconnected one-off page layouts; all pages must derive from the same system
- Missing, stale, provisional, and contested states must be visibly supported from the start

Build in this order:

1. Design token layer

   - color tokens
   - typography scale
   - spacing scale
   - radius, border, depth, and state tokens

2. Shared app structure

   - global layout shell
   - top bar / page header pattern
   - left navigation or equivalent durable page navigation
   - evidence rail / status rail placeholder
   - page-level briefing header pattern

3. Reusable primitives

   - panel
   - metric card
   - section header
   - badge system
   - status indicator
   - confidence indicator
   - freshness indicator
   - method note block
   - caveat block
   - annotation block
   - evidence drawer shell
   - empty / missing / stale / contested state components

4. Chart wrappers

   - standard chart frame
   - title / subtitle / source / method / caveat zones
   - state-aware wrapper supporting verified/provisional/stale/missing/contested
   - annotation hooks
   - comparison toggle area
   - export-safe layout

5. Six page skeletons

   - Executive Overview
   - ICT Trifecta
   - Knowledge Occupation Collapse
   - Iceland Flying Blind
   - Institutional Silence
   - Adversarial Review

For each page:

- implement final layout hierarchy
- use realistic placeholder labels only where real data is not yet wired
- include all major regions and interactions defined in dashboard-spec.md
- ensure each page can stand alone as a briefing view

Before writing code:

- summarize the design system you infer from DESIGN.md
- summarize the page architecture from dashboard-spec.md
- propose the component/file architecture
- then implement

After implementation:

- list created/modified files
- explain how the design tokens flow through the system
- explain where visual refinement should happen next

---

## Prompt 2 - Visual Refinement in Cursor Browser (No IA Changes)

Read and follow these files first:

1. AGENTS.md
2. DESIGN.md
3. dashboard-spec.md
4. .cursor/rules/dashboard-ui.mdc
5. .cursor/rules/interaction-patterns.mdc
6. .cursor/rules/accessibility.mdc

Task:
Open the running frontend in Cursor Browser and run design-focused refinement without changing core information architecture.

Target feel:

- sovereign-risk intelligence software
- parliamentary briefing credibility
- forensic clarity
- premium dark-mode restraint
- high information density with legibility

Focus areas:

- spacing rhythm and vertical cadence
- panel proportions and alignment precision
- hierarchy of headline, metrics, chart, and evidence cues
- warning-state salience and missing-data treatment
- consistency of typography, radii, and border semantics
- removal of any generic SaaS visual signatures

Constraints:

- do not change page-level IA, only refine visual execution
- do not remove evidence, method, caveat, or state affordances
- do not introduce decorative effects that reduce seriousness
- preserve keyboard/focus accessibility

Workflow:

1. Inspect each of the six pages in browser
2. Propose a short refinement plan per page
3. Apply changes in underlying code
4. Re-check all pages for consistency regressions

Output:

- files changed
- before/after rationale by pattern (not by pixel)
- residual visual debt to address in a future pass

---

## Prompt 3 - Unified Chart System Hardening

Read and follow these files first:

1. AGENTS.md
2. DESIGN.md
3. dashboard-spec.md
4. .cursor/rules/chart-system.mdc
5. .cursor/rules/evidence-integrity.mdc
6. .cursor/rules/accessibility.mdc

Task:
Implement a unified chart system for Sentinel that is editorial, policy-grade, and evidence-aware.

Requirements:

- consistent chart frame, typography, legend, annotation, and metadata zones
- first-class visual states for verified/provisional/stale/missing/contested
- source/method/caveat always accessible
- support comparison narratives and divergence emphasis
- avoid fintech/trading visual language

Must support examples/patterns for:

- line
- area
- radar
- heatmap
- waterfall
- ranked table
- timeline

For each chart type:

- define usage intent
- define required metadata
- define state behavior
- define empty/missing fallback behavior

Output:

- chart design rules summary
- reusable chart wrapper components
- annotation and method-note patterns
- file map of where chart system lives
- checklist for data-wiring readiness
