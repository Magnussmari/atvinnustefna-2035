import type { DataState, EvidenceLevel } from '../../types'

interface BadgeProps {
  label: string
  tone: DataState | 'neutral'
}

function PillBadge({ label, tone }: BadgeProps) {
  return (
    <span className={`pill-badge pill-badge--${tone}`} role="status">
      {label}
    </span>
  )
}

export function StateBadge({ state }: { state: DataState }) {
  return <PillBadge label={state} tone={state} />
}

export function ConfidenceBadge({
  confidence,
}: {
  confidence: 'high' | 'medium' | 'low'
}) {
  const tone: DataState | 'neutral' =
    confidence === 'high'
      ? 'verified'
      : confidence === 'medium'
        ? 'provisional'
        : 'contested'

  return <PillBadge label={`confidence: ${confidence}`} tone={tone} />
}

export function FreshnessBadge({ freshness }: { freshness: string }) {
  return <PillBadge label={`freshness: ${freshness}`} tone="neutral" />
}

export function EvidenceLevelBadge({ level }: { level: EvidenceLevel }) {
  const tone: DataState | 'neutral' =
    level === 'confirmed'
      ? 'verified'
      : level === 'strong-inference'
        ? 'provisional'
        : 'contested'

  return <PillBadge label={`evidence: ${level}`} tone={tone} />
}
