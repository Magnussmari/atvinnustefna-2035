import type { ClaimReference } from '../../types'
import { EvidenceLevelBadge, FreshnessBadge, StateBadge } from '../ui/Badges'
import { CaveatBlock, MethodNoteBlock } from '../ui/Blocks'

interface EvidenceDrawerProps {
  claim: ClaimReference | null
  open: boolean
  onClose: () => void
}

export function EvidenceDrawer({ claim, open, onClose }: EvidenceDrawerProps) {
  if (!open || !claim) {
    return null
  }

  return (
    <aside className="evidence-drawer" aria-label="Evidence drawer">
      <header className="evidence-drawer__header">
        <h2>Evidence Drawer</h2>
        <button type="button" onClick={onClose}>
          Close
        </button>
      </header>

      <p className="evidence-drawer__claim">{claim.claim}</p>

      <div className="evidence-drawer__badges">
        <EvidenceLevelBadge level={claim.level} />
        <StateBadge state={claim.state} />
        <FreshnessBadge freshness={claim.lastVerified} />
      </div>

      <div className="evidence-drawer__meta">
        <p>
          <strong>Source:</strong> {claim.sourceLabel}
        </p>
      </div>

      <MethodNoteBlock text={claim.methodNote} />
      <CaveatBlock text={claim.caveat} />
    </aside>
  )
}
