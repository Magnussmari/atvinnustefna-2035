import type { PropsWithChildren } from 'react'
import type { DataState } from '../../types'
import { StateBadge } from './Badges'

export function SectionHeader({
  title,
  subtitle,
}: {
  title: string
  subtitle: string
}) {
  return (
    <header className="section-header">
      <h2>{title}</h2>
      <p>{subtitle}</p>
    </header>
  )
}

export function Panel({
  title,
  subtitle,
  children,
}: PropsWithChildren<{ title: string; subtitle: string }>) {
  return (
    <section className="panel">
      <header className="panel__header">
        <h3>{title}</h3>
        <p>{subtitle}</p>
      </header>
      <div className="panel__body">{children}</div>
    </section>
  )
}

export function MetricCard({
  label,
  value,
  note,
}: {
  label: string
  value: string
  note: string
}) {
  return (
    <article className="metric-card">
      <p className="metric-card__label">{label}</p>
      <p className="metric-card__value">{value}</p>
      <p className="metric-card__note">{note}</p>
    </article>
  )
}

export function MethodNoteBlock({ text }: { text: string }) {
  return (
    <aside className="callout callout--method">
      <h4>Method note</h4>
      <p>{text}</p>
    </aside>
  )
}

export function CaveatBlock({ text }: { text: string }) {
  return (
    <aside className="callout callout--caveat">
      <h4>Caveat</h4>
      <p>{text}</p>
    </aside>
  )
}

export function AnnotationBlock({ text }: { text: string }) {
  return (
    <aside className="callout callout--annotation">
      <h4>Annotation</h4>
      <p>{text}</p>
    </aside>
  )
}

export function StateBlock({
  state,
  title,
  description,
}: {
  state: DataState
  title: string
  description: string
}) {
  return (
    <aside className={`state-block state-block--${state}`}>
      <div className="state-block__head">
        <h4>{title}</h4>
        <StateBadge state={state} />
      </div>
      <p>{description}</p>
    </aside>
  )
}
