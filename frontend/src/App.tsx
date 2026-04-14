import { useEffect, useMemo, useState } from 'react'
import { dashboardPages } from './content/pages'
import {
  loadModuleChart,
  loadWiringIndex,
  preloadPageBundle,
} from './data/sentinelWiring'
import { EvidenceDrawer } from './components/evidence/EvidenceDrawer'
import { AppShell } from './components/layout/AppShell'
import { PageView } from './components/pages/PageView'
import type { ClaimReference, PageId, WiringIndex } from './types'

function App() {
  const [activePageId, setActivePageId] = useState<PageId>('executive-overview')
  const [activeClaim, setActiveClaim] = useState<ClaimReference | null>(null)
  const [drawerOpen, setDrawerOpen] = useState(false)
  const [wiringIndex, setWiringIndex] = useState<WiringIndex | null>(null)
  const [wiringError, setWiringError] = useState<string | null>(null)

  const activePage = useMemo(
    () => dashboardPages.find((page) => page.id === activePageId) ?? dashboardPages[0],
    [activePageId],
  )
  useEffect(() => {
    let isMounted = true

    void loadWiringIndex()
      .then((payload) => {
        if (!isMounted) {
          return
        }
        setWiringIndex(payload)
        setWiringError(null)
      })
      .catch((error: unknown) => {
        if (!isMounted) {
          return
        }
        setWiringError(error instanceof Error ? error.message : 'Unknown wiring load error')
      })

    return () => {
      isMounted = false
    }
  }, [])

  useEffect(() => {
    if (!wiringIndex) {
      return
    }
    const activeIndex = dashboardPages.findIndex((page) => page.id === activePageId)
    const nextPage = dashboardPages[activeIndex + 1]
    if (nextPage) {
      preloadPageBundle(nextPage.id)
    }
  }, [activePageId, wiringIndex])

  return (
    <AppShell
      pages={dashboardPages}
      activePage={activePage.id}
      pipelineMeta={
        wiringIndex
          ? {
              generatedAt: wiringIndex.generatedAt,
              fingerprint: wiringIndex.fingerprint,
              sourceCount: wiringIndex.sourceFiles.length,
            }
          : undefined
      }
      onSelectPage={(pageId) => {
        setActivePageId(pageId)
        setDrawerOpen(false)
      }}
    >
      {wiringError ? (
        <section className="panel">
          <header className="panel__header">
            <h3>Data wiring error</h3>
            <p>Failed to load processed dashboard dataset.</p>
          </header>
          <div className="panel__body">
            <p>{wiringError}</p>
          </div>
        </section>
      ) : wiringIndex ? (
        <PageView
          page={activePage}
          loadModuleChart={loadModuleChart}
          onOpenEvidence={(claim) => {
            setActiveClaim(claim)
            setDrawerOpen(true)
          }}
        />
      ) : (
        <section className="panel">
          <header className="panel__header">
            <h3>Preparing briefing data</h3>
            <p>Loading page-scoped preprocessed data bundle.</p>
          </header>
          <div className="panel__body">
            <p>Data pipeline is warming up...</p>
          </div>
        </section>
      )}
      <EvidenceDrawer
        claim={activeClaim}
        open={drawerOpen}
        onClose={() => setDrawerOpen(false)}
      />
    </AppShell>
  )
}

export default App
