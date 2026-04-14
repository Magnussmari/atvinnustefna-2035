import type {
  ChartPayload,
  ChartKind,
  PageId,
  WiringIndex,
  WiringPageBundle,
} from '../types'

const moduleCache = new Map<string, ChartPayload>()
let indexPromise: Promise<WiringIndex> | null = null
const bundlePromiseByPage = new Map<PageId, Promise<WiringPageBundle>>()

const CHART_KINDS: ChartKind[] = [
  'line',
  'area',
  'radar',
  'heatmap',
  'waterfall',
  'ranked-table',
  'timeline',
]

function moduleKey(pageId: PageId, moduleId: string) {
  return `${pageId}:${moduleId}`
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null
}

function assertChartPayload(modulePath: string, value: unknown): asserts value is ChartPayload {
  if (!isRecord(value)) {
    throw new Error(`Invalid chart payload for ${modulePath}: not an object`)
  }
  if (typeof value.unit !== 'string' || typeof value.summary !== 'string') {
    throw new Error(`Invalid chart payload for ${modulePath}: missing unit/summary`)
  }
  if (typeof value.kind !== 'string' || !CHART_KINDS.includes(value.kind as ChartKind)) {
    throw new Error(`Invalid chart payload for ${modulePath}: invalid kind`)
  }
  if ('series' in value && !Array.isArray(value.series)) {
    throw new Error(`Invalid chart payload for ${modulePath}: series must be an array`)
  }
  if ('rows' in value && !Array.isArray(value.rows)) {
    throw new Error(`Invalid chart payload for ${modulePath}: rows must be an array`)
  }
}

function assertWiringIndex(value: unknown): asserts value is WiringIndex {
  if (!isRecord(value)) {
    throw new Error('Invalid wiring index: not an object')
  }
  if (
    typeof value.generatedAt !== 'string' ||
    typeof value.fingerprint !== 'string' ||
    !Array.isArray(value.sourceFiles) ||
    !isRecord(value.sourceHashes) ||
    !isRecord(value.pages)
  ) {
    throw new Error('Invalid wiring index shape')
  }
}

function assertPageBundle(
  pageId: PageId,
  value: unknown,
): asserts value is WiringPageBundle {
  if (!isRecord(value)) {
    throw new Error(`Invalid page bundle for ${pageId}: not an object`)
  }
  if (
    typeof value.generatedAt !== 'string' ||
    typeof value.fingerprint !== 'string' ||
    !isRecord(value.moduleCharts)
  ) {
    throw new Error(`Invalid page bundle for ${pageId}: invalid metadata`)
  }
  for (const [moduleId, payload] of Object.entries(value.moduleCharts)) {
    assertChartPayload(`${pageId}/${moduleId}`, payload)
  }
}

export async function loadWiringIndex(): Promise<WiringIndex> {
  if (!indexPromise) {
    indexPromise = fetch('/data/wiring/index.json').then((response) => {
      if (!response.ok) {
        throw new Error(`Failed to load wiring index (${response.status})`)
      }
      return response.json().then((payload) => {
        assertWiringIndex(payload)
        return payload
      })
    })
  }

  return indexPromise
}

export async function loadModuleChart(
  pageId: PageId,
  moduleId: string,
): Promise<ChartPayload> {
  const key = moduleKey(pageId, moduleId)
  const cached = moduleCache.get(key)
  if (cached) {
    return cached
  }

  const index = await loadWiringIndex()
  const pageEntry = index.pages[pageId]
  if (!pageEntry || !pageEntry.modules.includes(moduleId)) {
    throw new Error(`No module wiring found for ${pageId}/${moduleId}`)
  }

  let bundlePromise = bundlePromiseByPage.get(pageId)
  if (!bundlePromise) {
    bundlePromise = fetch(`/data/wiring/bundles/${pageId}.json`)
      .then((response) => {
        if (!response.ok) {
          throw new Error(`Failed to load page bundle (${pageId}, ${response.status})`)
        }
        return response.json()
      })
      .then((payload) => {
        assertPageBundle(pageId, payload)
        return payload
      })
    bundlePromiseByPage.set(pageId, bundlePromise)
  }

  const bundle = await bundlePromise
  for (const [bundleModuleId, payload] of Object.entries(bundle.moduleCharts)) {
    moduleCache.set(moduleKey(pageId, bundleModuleId), payload)
  }

  const payload = moduleCache.get(key)
  if (!payload) {
    throw new Error(`Module not found in page bundle (${pageId}/${moduleId})`)
  }
  return payload
}

export function preloadPageBundle(pageId: PageId): void {
  if (bundlePromiseByPage.has(pageId)) {
    return
  }
  void loadWiringIndex()
    .then((index) => {
      const firstModule = index.pages[pageId]?.modules?.[0]
      if (firstModule) {
        return loadModuleChart(pageId, firstModule)
      }
      return undefined
    })
    .catch(() => {
      // Preload should be non-fatal.
    })
}
