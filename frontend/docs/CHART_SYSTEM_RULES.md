# Sentinel Chart System Rules

## Design Rules

- Charts are editorial policy instruments, not decorative widgets.
- Every chart frame must expose: type, source, usage intent, method note, caveat, state.
- State grammar is mandatory: `verified`, `provisional`, `stale`, `missing`, `contested`.
- Legends, annotation slots, and comparison areas stay in fixed positions.
- Charts must remain export-safe and printable without losing interpretive context.

## Supported Chart Types

- `line`: trend comparison over time
- `area`: magnitude context and accumulation windows
- `radar`: multi-dimension profile comparison
- `heatmap`: coverage/intensity matrix
- `waterfall`: additive/subtractive decomposition
- `ranked-table`: rank and evidence severity views
- `timeline`: event and response sequencing

## Annotation Pattern

Each chart can carry:

1. direct annotation for interpretation cue,
2. method note for construction logic,
3. caveat for epistemic boundary.

## Data-State Behavior

- `verified`: stable border accent and normal chart narrative
- `provisional`: amber accent and explicit caveat emphasis
- `stale`: warning-toned accent and freshness reminder
- `missing`: fallback content prioritizes what is absent and who measures it
- `contested`: red-toned accent and competing interpretation framing

## Data-Wiring Readiness Checklist

- [ ] chart has stable `chartKind`
- [ ] source label points to a real data table or document
- [ ] method note is specific and non-generic
- [ ] caveat is present where interpretation risk exists
- [ ] state is set intentionally (not defaulted implicitly)
- [ ] comparison toggle behavior is defined where needed
- [ ] fallback view is meaningful under missing/stale data
