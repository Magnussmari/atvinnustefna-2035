import { useEffect, useRef, useState } from 'react'
import type { ChartPayload, ClaimReference, DashboardModule, DashboardPage } from '../../types'
import {
  ConfidenceBadge,
  EvidenceLevelBadge,
  FreshnessBadge,
  StateBadge,
} from '../ui/Badges'
import {
  AnnotationBlock,
  CaveatBlock,
  MetricCard,
  Panel,
  SectionHeader,
  StateBlock,
} from '../ui/Blocks'
import { ChartFrame } from '../charts/ChartFrame'

interface PageViewProps {
  page: DashboardPage
  loadModuleChart: (pageId: DashboardPage['id'], moduleId: string) => Promise<ChartPayload>
  onOpenEvidence: (claim: ClaimReference) => void
}

interface ModulePanelProps {
  pageId: DashboardPage['id']
  module: DashboardModule
  loadModuleChart: (pageId: DashboardPage['id'], moduleId: string) => Promise<ChartPayload>
}

function ModulePanel({ pageId, module, loadModuleChart }: ModulePanelProps) {
  const panelRef = useRef<HTMLElement | null>(null)
  const [isVisible, setIsVisible] = useState(false)
  const [payload, setPayload] = useState<ChartPayload | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    const current = panelRef.current
    if (!current) {
      return
    }

    const observer = new IntersectionObserver(
      (entries) => {
        if (entries.some((entry) => entry.isIntersecting)) {
          setIsVisible(true)
        }
      },
      { threshold: 0.2, rootMargin: '140px 0px' },
    )
    observer.observe(current)
    return () => observer.disconnect()
  }, [])

  useEffect(() => {
    if (!module.includesChart || !isVisible || payload || error) {
      return
    }

    let isMounted = true
    void loadModuleChart(pageId, module.id)
      .then((result) => {
        if (!isMounted) {
          return
        }
        setPayload(result)
      })
      .catch((err: unknown) => {
        if (!isMounted) {
          return
        }
        setError(err instanceof Error ? err.message : 'Unknown module load error')
      })

    return () => {
      isMounted = false
    }
  }, [module.includesChart, isVisible, payload, error, loadModuleChart, pageId, module.id])

  return (
    <Panel title={module.title} subtitle={module.subtitle}>
      <section ref={panelRef}>
        <div className="panel__badges">
          <StateBadge state={module.state} />
        </div>
        {module.includesChart ? (
          <>
            <ChartFrame
              title={module.title}
              subtitle={module.subtitle}
              sourceLabel={module.sourceLabel}
              methodNote={module.methodNote}
              caveat={module.caveat}
              state={module.state}
              chartKind={module.chartKind ?? 'line'}
              usageIntent={
                module.chartUsageIntent ??
                'Narrative comparison view with explicit policy caveats.'
              }
              fallbackNote={
                module.chartFallbackNote ??
                'Data wiring pending. Structure reflects final chart metadata zones.'
              }
              payload={payload ?? undefined}
              annotation={module.annotation}
              includesComparisonToggle={module.includesComparisonToggle}
            />
            {!isVisible ? (
              <p className="panel__status">Waiting for panel visibility before loading data module.</p>
            ) : null}
            {isVisible && !payload && !error ? (
              <p className="panel__status">Loading module dataset...</p>
            ) : null}
            {error ? <p className="panel__status panel__status--error">{error}</p> : null}
          </>
        ) : (
          <>
            <p className="panel__source">
              <strong>Source:</strong> {module.sourceLabel}
            </p>
            <AnnotationBlock text={module.methodNote} />
            <CaveatBlock text={module.caveat} />
          </>
        )}
      </section>
    </Panel>
  )
}

export function PageView({ page, loadModuleChart, onOpenEvidence }: PageViewProps) {
  return (
    <article className="page-view">
      <header className="page-header">
        <p className="page-header__eyebrow">{page.label}</p>
        <h2>{page.heading}</h2>
        <p className="page-header__subheading">{page.subheading}</p>
        <p className="page-header__summary">{page.briefingSummary}</p>
        <p className="page-header__risk">{page.riskSignal}</p>
        <div className="page-header__badges">
          <EvidenceLevelBadge level={page.evidenceLevel} />
          <ConfidenceBadge confidence={page.confidence} />
          <FreshnessBadge freshness={page.freshness} />
        </div>
      </header>

      <section className="metrics-row">
        <MetricCard
          label="Briefing mode"
          value="Standalone page"
          note="Each page is structured to stand as an independent policy briefing."
        />
        <MetricCard
          label="Evidence navigation"
          value="Direct"
          note="Claims open evidence drawer without losing page context."
        />
        <MetricCard
          label="Data state model"
          value="State-first"
          note="Verified, provisional, stale, missing and contested are explicit."
        />
      </section>

      <SectionHeader
        title="Findings and Modules"
        subtitle="Core regions required by dashboard-spec.md"
      />

      <section className="module-grid">
        {page.modules.map((module) => (
          <ModulePanel
            key={module.id}
            pageId={page.id}
            module={module}
            loadModuleChart={loadModuleChart}
          />
        ))}
      </section>

      <SectionHeader
        title="Evidence-linked claims"
        subtitle="Click any claim to open source, method and caveat context."
      />

      <section className="claims-list">
        {page.claims.map((claim) => (
          <article key={claim.id} className="claim-item">
            <div className="claim-item__head">
              <p>{claim.claim}</p>
              <div className="claim-item__badges">
                <EvidenceLevelBadge level={claim.level} />
                <StateBadge state={claim.state} />
              </div>
            </div>
            <button type="button" onClick={() => onOpenEvidence(claim)}>
              Open evidence
            </button>
          </article>
        ))}
      </section>

      <StateBlock
        state="missing"
        title="Missing data treatment"
        description={page.missingDataNote}
      />
    </article>
  )
}
