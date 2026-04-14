import type { PropsWithChildren } from 'react'
import type { DashboardPage, PageId } from '../../types'

interface AppShellProps extends PropsWithChildren {
  pages: DashboardPage[]
  activePage: PageId
  onSelectPage: (pageId: PageId) => void
  pipelineMeta?: {
    generatedAt: string
    fingerprint: string
    sourceCount: number
  }
}

export function AppShell({
  pages,
  activePage,
  onSelectPage,
  pipelineMeta,
  children,
}: AppShellProps) {
  return (
    <div className="app-shell">
      <header className="top-bar">
        <div>
          <p className="top-bar__eyebrow">The Iceland 2035 Sentinel</p>
          <h1>Policy Intelligence Dashboard</h1>
        </div>
        <p className="top-bar__meta">
          Evidence-first interface | dark mode baseline
          {pipelineMeta ? ` | data: ${pipelineMeta.generatedAt.slice(0, 10)}` : ''}
        </p>
      </header>

      <div className="shell-grid">
        <nav className="left-nav" aria-label="Dashboard pages">
          <h2>Pages</h2>
          <ul>
            {pages.map((page) => (
              <li key={page.id}>
                <button
                  type="button"
                  className={page.id === activePage ? 'is-active' : undefined}
                  onClick={() => onSelectPage(page.id)}
                >
                  {page.label}
                </button>
              </li>
            ))}
          </ul>
        </nav>

        <main className="main-content">{children}</main>

        <aside className="right-rail" aria-label="Status rail">
          <h2>Status Rail</h2>
          <p>Missing-data and uncertainty states are first-class surfaces.</p>
          {pipelineMeta ? (
            <div className="pipeline-meta">
              <p>
                <strong>Fingerprint:</strong> {pipelineMeta.fingerprint}
              </p>
              <p>
                <strong>Sources:</strong> {pipelineMeta.sourceCount}
              </p>
            </div>
          ) : null}
          <ul>
            <li>Evidence links stay visible.</li>
            <li>Method notes stay near claims.</li>
            <li>No fabricated confidence.</li>
          </ul>
        </aside>
      </div>
    </div>
  )
}
