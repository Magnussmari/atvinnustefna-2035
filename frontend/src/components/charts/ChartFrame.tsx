import type { ChartKind, ChartPayload, DataState } from '../../types'
import { StateBadge } from '../ui/Badges'
import { AnnotationBlock, CaveatBlock, MethodNoteBlock } from '../ui/Blocks'
import { ChartCanvas } from './ChartCanvas'

interface ChartFrameProps {
  title: string
  subtitle: string
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
  title,
  subtitle,
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
      <header className="chart-frame__header">
        <div>
          <h4>{title}</h4>
          <p>{subtitle}</p>
        </div>
        <StateBadge state={state} />
      </header>

      <div className="chart-frame__legend">
        <span className="legend-chip legend-chip--primary">Series A</span>
        <span className="legend-chip legend-chip--secondary">Series B</span>
        <span className="legend-chip legend-chip--neutral">Reference</span>
      </div>

      <ChartCanvas
        chartKind={chartKind}
        state={state}
        fallbackNote={fallbackNote}
        payload={payload}
      />

      {includesComparisonToggle ? (
        <div className="chart-frame__compare">
          <button type="button">Baseline: 2019</button>
          <button type="button">Baseline: 2022</button>
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
