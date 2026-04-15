import type { ChartKind, ChartPayload, DataState, SeriesPoint } from '../../types'

interface ChartCanvasProps {
  chartKind: ChartKind
  state: DataState
  fallbackNote: string
  payload?: ChartPayload
}

function buildPath(points: SeriesPoint[], width: number, height: number) {
  if (points.length < 2) {
    return ''
  }

  const values = points.map((point) => point.value)
  const min = Math.min(...values)
  const max = Math.max(...values)
  const range = max - min || 1

  return points
    .map((point, index) => {
      const x = (index / (points.length - 1)) * width
      const y = height - ((point.value - min) / range) * height
      return `${index === 0 ? 'M' : 'L'}${x},${y}`
    })
    .join(' ')
}

export function ChartCanvas({
  chartKind,
  state,
  fallbackNote,
  payload,
}: ChartCanvasProps) {
  const primarySeries = payload?.series?.[0]?.points ?? []
  const polylinePath = buildPath(primarySeries, 320, 120)
  const rows = payload?.rows ?? []

  return (
    <div
      className={`chart-canvas chart-canvas--${chartKind} chart-canvas--state-${state}`}
      role="img"
      aria-label={`${chartKind} chart placeholder in ${state} state`}
    >
      <div className="chart-canvas__grid" />
      {polylinePath ? (
        <svg className="chart-canvas__svg" viewBox="0 0 320 120" aria-hidden="true">
          <path d={polylinePath} />
        </svg>
      ) : null}
      <p className="chart-canvas__label">
        <strong>{chartKind}</strong> chart preview
      </p>
      <p className="chart-canvas__note">{payload?.summary ?? fallbackNote}</p>
      {rows.length ? (
        <div className="chart-canvas__rows">
          {rows.slice(0, 5).map((row) => (
            <div key={row.label} className="chart-canvas__row">
              <span>{row.label}</span>
              <strong>{row.valueA.toLocaleString('en-US')}</strong>
            </div>
          ))}
        </div>
      ) : null}
    </div>
  )
}
