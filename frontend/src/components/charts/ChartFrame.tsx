import type { ChartKind, ChartPayload, DataState } from '../../types'
import { AnnotationBlock, CaveatBlock, MethodNoteBlock } from '../ui/Blocks'
import { ChartCanvas } from './ChartCanvas'

interface ChartFrameProps {
  sourceLabel: string
  methodNote: string
  caveat: string
  state: DataState
  chartKind: ChartKind
  usageIntent: string
  fallbackNote: string
  payload?: ChartPayload
  includesComparisonToggle?: boolean
  annotation?: string
}

export function ChartFrame({
  sourceLabel,
  methodNote,
  caveat,
  state,
  chartKind,
  usageIntent,
  fallbackNote,
  payload,
  includesComparisonToggle,
  annotation,
}: ChartFrameProps) {
  return (
    <section className="chart-frame chart-frame--export-safe">
      <div className="chart-frame__legend" aria-label="Chart legend">
        <span className="legend-chip legend-chip--primary">Primary</span>
        <span className="legend-chip legend-chip--secondary">Secondary</span>
        <span className="legend-chip legend-chip--neutral">Context</span>
      </div>

      <ChartCanvas
        chartKind={chartKind}
        state={state}
        fallbackNote={fallbackNote}
        payload={payload}
      />

      {includesComparisonToggle ? (
        <div className="chart-frame__compare">
          <button type="button" aria-label="Use 2019 baseline">
            2019 baseline
          </button>
          <button type="button" aria-label="Use 2022 baseline">
            2022 baseline
          </button>
        </div>
      ) : null}

      <div className="chart-frame__meta">
        <p>
          <strong>Type:</strong> {chartKind}
        </p>
        <p>
          <strong>Usage:</strong> {usageIntent}
        </p>
        {payload?.summary ? (
          <p>
            <strong>Data summary:</strong> {payload.summary}
          </p>
        ) : null}
        {payload?.unit ? (
          <p>
            <strong>Unit:</strong> {payload.unit}
          </p>
        ) : null}
        <p>
          <strong>Source:</strong> {sourceLabel}
        </p>
      </div>

      <MethodNoteBlock text={methodNote} />
      <CaveatBlock text={caveat} />
      {annotation ? <AnnotationBlock text={annotation} /> : null}
    </section>
  )
}
