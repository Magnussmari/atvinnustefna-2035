export type PageId =
  | 'executive-overview'
  | 'ict-trifecta'
  | 'knowledge-occupation-collapse'
  | 'iceland-flying-blind'
  | 'institutional-silence'
  | 'adversarial-review'

export type DataState =
  | 'verified'
  | 'provisional'
  | 'stale'
  | 'missing'
  | 'contested'

export type EvidenceLevel = 'confirmed' | 'strong-inference' | 'unproven'
export type ChartKind =
  | 'line'
  | 'area'
  | 'radar'
  | 'heatmap'
  | 'waterfall'
  | 'ranked-table'
  | 'timeline'

export interface ClaimReference {
  id: string
  claim: string
  level: EvidenceLevel
  state: DataState
  sourceLabel: string
  methodNote: string
  caveat: string
  lastVerified: string
}

export interface DashboardModule {
  id: string
  title: string
  subtitle: string
  sourceLabel: string
  methodNote: string
  caveat: string
  state: DataState
  includesComparisonToggle?: boolean
  includesChart?: boolean
  chartKind?: ChartKind
  chartUsageIntent?: string
  chartFallbackNote?: string
  annotation?: string
}

export interface SeriesPoint {
  label: string
  value: number
}

export interface ChartSeries {
  name: string
  points: SeriesPoint[]
}

export interface ChartRow {
  label: string
  valueA: number
  valueB?: number
  note?: string
}

export interface ChartPayload {
  kind: ChartKind
  unit: string
  summary: string
  series?: ChartSeries[]
  rows?: ChartRow[]
}

export interface PageWiring {
  moduleCharts: Record<string, ChartPayload>
}

export interface WiringPageIndexEntry {
  modules: string[]
}

export interface WiringIndex {
  generatedAt: string
  sourceFiles: string[]
  sourceHashes: Record<string, string>
  fingerprint: string
  pages: Record<PageId, WiringPageIndexEntry>
}

export interface WiringPageBundle {
  generatedAt: string
  fingerprint: string
  moduleCharts: Record<string, ChartPayload>
}

export interface DashboardPage {
  id: PageId
  label: string
  heading: string
  subheading: string
  briefingSummary: string
  riskSignal: string
  confidence: 'high' | 'medium' | 'low'
  freshness: string
  evidenceLevel: EvidenceLevel
  claims: ClaimReference[]
  modules: DashboardModule[]
  missingDataNote: string
}
