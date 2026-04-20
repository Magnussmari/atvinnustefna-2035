import fs from 'node:fs/promises'
import path from 'node:path'
import crypto from 'node:crypto'
import Papa from 'papaparse'

const ROOT = process.cwd()
const RAW_DIR = path.resolve(
  ROOT,
  '../data/iceland-ai-governance-audit/data/raw',
)
const OUT_DIR = path.resolve(ROOT, 'public/data/wiring')
const OUT_MODULE_DIR = path.join(OUT_DIR, 'modules')
const OUT_BUNDLE_DIR = path.join(OUT_DIR, 'bundles')

const PAGE_MODULES = {
  'executive-overview': [
    'exec-status-ribbon',
    'exec-claims-matrix',
    'exec-immediate-actions',
  ],
  'ict-trifecta': ['ict-series', 'ict-productivity', 'ict-unemployment', 'ict-caveat'],
  'knowledge-occupation-collapse': [
    'isco-ranked-table',
    'isco-slope',
    'isco-method',
  ],
  'iceland-flying-blind': [
    'nordic-matrix',
    'gap-heatmap',
    'agency-accountability',
  ],
  'institutional-silence': [
    'participation-table',
    'timeline-response',
    'unverified-zone',
  ],
  'adversarial-review': [
    'counterargument-register',
    'falsifier-matrix',
    'conclusion-toggle',
  ],
}

function parseCsv(raw) {
  const parsed = Papa.parse(raw, {
    header: true,
    skipEmptyLines: true,
  })
  return parsed.data
}

function toNum(input) {
  if (typeof input === 'number') return input
  if (!input) return Number.NaN
  return Number.parseFloat(String(input).replace(',', '.'))
}

function round1(value) {
  return Math.round(value * 10) / 10
}

function buildIctEmploymentSeries(rows) {
  return rows
    .filter(
      (row) =>
        row['Kyn og landsvæði'] === 'Total' &&
        row['Atvinnigrein (aðal- og aukastarf)'] === 'J - Information and communication' &&
        row.Eining === 'Number (main and second job)',
    )
    .map((row) => ({ label: row.Ár, value: toNum(row.value) }))
    .filter((point) => Number.isFinite(point.value) && Number(point.label) >= 2019)
}

function buildIctVacancySeries(rows) {
  const byYear = new Map()
  rows
    .filter(
      (row) =>
        row.Atvinnugrein === 'J. Information and communication' &&
        row.Eining === 'Job vacancy rate',
    )
    .forEach((row) => {
      const year = row.Ársfjórðungur.slice(0, 4)
      const current = byYear.get(year) ?? { sum: 0, count: 0 }
      current.sum += toNum(row.value)
      current.count += 1
      byYear.set(year, current)
    })

  return Array.from(byYear.entries())
    .map(([year, aggregate]) => ({
      label: year,
      value: round1(aggregate.sum / Math.max(aggregate.count, 1)),
    }))
    .filter((point) => Number(point.label) >= 2019)
    .sort((a, b) => Number(a.label) - Number(b.label))
}

function buildIctProductivitySeries(rows) {
  return rows
    .filter(
      (row) =>
        row.Mælikvarði === 'Index 2008=100' &&
        row.Atvinnugrein === 'J. Information and communication',
    )
    .map((row) => ({ label: row.Ár, value: toNum(row.value) }))
    .filter((point) => Number.isFinite(point.value) && Number(point.label) >= 2019)
}

function buildVmstIctUnemploymentSeries(rows) {
  // G5 is monthly; collapse to yearly end-of-year (or last available) for ICT sector.
  const byYear = new Map()
  rows
    .filter(
      (row) =>
        row.rikisfang === 'Allir' &&
        row.atvinnugrein === 'Upplýsingar og fjarskipti',
    )
    .forEach((row) => {
      const year = String(row.manudur).slice(0, 4)
      const value = toNum(row.fjoldi)
      if (!Number.isFinite(value)) return
      const existing = byYear.get(year)
      if (!existing || row.manudur > existing.month) {
        byYear.set(year, { month: row.manudur, value })
      }
    })

  return Array.from(byYear.entries())
    .filter(([year]) => Number(year) >= 2019)
    .sort((a, b) => Number(a[0]) - Number(b[0]))
    .map(([year, entry]) => ({ label: year, value: entry.value }))
}

function buildOccupationRows(rows, year) {
  return rows
    .filter(
      (row) =>
        row['Menntun'] === 'Total' &&
        row.Kyn === 'Males and females' &&
        row.Ár === year &&
        row.Starfsstétt !== 'Total',
    )
    .map((row) => ({ label: row.Starfsstétt, valueA: toNum(row.value) }))
    .filter((row) => Number.isFinite(row.valueA))
}

function mapKnowledgeVsService(occupationRows2025) {
  const knowledgeSet = new Set([
    'Legislators and managers',
    'Professionals',
    'Associate professionals',
    'Clerks',
  ])

  const knowledge = occupationRows2025
    .filter((row) => knowledgeSet.has(row.label))
    .reduce((sum, row) => sum + row.valueA, 0)
  const servicePhysical = occupationRows2025
    .filter((row) => !knowledgeSet.has(row.label))
    .reduce((sum, row) => sum + row.valueA, 0)

  return { knowledge, servicePhysical }
}

async function readRawCsv(name) {
  return fs.readFile(path.join(RAW_DIR, name), 'utf8')
}

function sha256(input) {
  return crypto.createHash('sha256').update(input).digest('hex')
}

async function buildSentinelWiring() {
  const [
    employmentBySectorCsv,
    vacanciesQuarterlyCsv,
    labourProductivityCsv,
    employmentByOccupationCsv,
    vmstSectorCsv,
  ] = await Promise.all([
    readRawCsv('employment_by_sector_annual.csv'),
    readRawCsv('vacancies_quarterly.csv'),
    readRawCsv('labour_productivity_annual.csv'),
    readRawCsv('employment_by_occupation_annual.csv'),
    readRawCsv('vmst_G5_register_by_sector.csv'),
  ])

  const sectorRows = parseCsv(employmentBySectorCsv)
  const vacancyRows = parseCsv(vacanciesQuarterlyCsv)
  const productivityRows = parseCsv(labourProductivityCsv)
  const occupationRows = parseCsv(employmentByOccupationCsv)
  const vmstSectorRows = parseCsv(vmstSectorCsv)

  const ictEmploymentSeries = buildIctEmploymentSeries(sectorRows)
  const ictVacancySeries = buildIctVacancySeries(vacancyRows)
  const ictProductivitySeries = buildIctProductivitySeries(productivityRows)
  const ictUnemploymentSeries = buildVmstIctUnemploymentSeries(vmstSectorRows)

  const occupation2024 = buildOccupationRows(occupationRows, '2024')
  const occupation2025 = buildOccupationRows(occupationRows, '2025')
  const occupationDelta = occupation2025.map((row2025) => {
    const in2024 = occupation2024.find((row) => row.label === row2025.label)?.valueA ?? 0
    return {
      label: row2025.label,
      valueA: row2025.valueA - in2024,
      valueB: row2025.valueA,
      note: `2024: ${in2024.toLocaleString('en-US')} -> 2025: ${row2025.valueA.toLocaleString('en-US')}`,
    }
  })

  const knowledgeVsService = mapKnowledgeVsService(occupation2025)

  const moduleCharts = {
    'exec-claims-matrix': {
      kind: 'ranked-table',
      unit: 'findings',
      summary: '5 findings grouped by evidence level from project register.',
      rows: [
        { label: 'Confirmed', valueA: 3, note: 'Text silence, ISCO shift, measurement absence' },
        { label: 'Strong inference', valueA: 2, note: 'ICT pattern, institutional silence' },
        { label: 'Unproven causality', valueA: 1, note: 'AI -> occupation loss remains unproven' },
      ],
    },
    'ict-series': {
      kind: 'line',
      unit: 'mixed indices',
      summary:
        'Employment (absolute), vacancy rate (annualized quarterly avg), and productivity index (2008=100).',
      series: [
        { name: 'ICT employment', points: ictEmploymentSeries },
        { name: 'ICT vacancy rate', points: ictVacancySeries },
        { name: 'ICT productivity index', points: ictProductivitySeries },
      ],
    },
    'ict-productivity': {
      kind: 'area',
      unit: 'index',
      summary: 'ICT labour productivity index values from Hagstofa (Index 2008=100).',
      series: [{ name: 'Productivity index', points: ictProductivitySeries }],
    },
    'ict-unemployment': {
      kind: 'line',
      unit: 'persons on register (end of year)',
      summary:
        'VMST registered unemployment in the ICT sector (J — Upplýsingar og fjarskipti), year-end snapshot. Grew from 163 in Jan 2023 to 322 in Mar 2026 — +97.5% vs aggregate +39.8%. Fourth axis of the ICT Trifecta → Quadfecta.',
      series: [
        { name: 'ICT sector unemployment (VMST G5)', points: ictUnemploymentSeries },
      ],
    },
    'isco-ranked-table': {
      kind: 'ranked-table',
      unit: 'jobs',
      summary: 'Occupation employment values for 2025.',
      rows: occupation2025,
    },
    'isco-slope': {
      kind: 'waterfall',
      unit: 'job delta',
      summary: '2025 minus 2024 occupation changes.',
      rows: occupationDelta,
    },
    'nordic-matrix': {
      kind: 'radar',
      unit: 'coverage dimensions',
      summary: 'Nordic measurement capability comparison from AGENCY_MAP.',
      rows: [
        { label: 'Iceland', valueA: 0, note: 'No full coverage on listed dimensions' },
        { label: 'Denmark', valueA: 5 },
        { label: 'Sweden', valueA: 5 },
        { label: 'Norway', valueA: 5 },
        { label: 'Finland', valueA: 5 },
      ],
    },
    'gap-heatmap': {
      kind: 'heatmap',
      unit: 'binary coverage',
      summary: 'Iceland appears as missing across AI/labour measurement dimensions.',
      rows: [
        { label: 'Eurostat AI survey', valueA: 0, note: 'Iceland excluded' },
        { label: 'EWCS participation', valueA: 0, note: 'Not in EWCS 2024 wave' },
        { label: 'Linked admin data', valueA: 0, note: 'No integrated labour-welfare chain' },
        { label: 'Union AI agreements', valueA: 0 },
        { label: 'Tripartite AI forum', valueA: 0 },
      ],
    },
    'timeline-response': {
      kind: 'timeline',
      unit: 'events',
      summary: 'Consultation and response events from memo/adversarial material.',
      rows: [
        { label: 'Oct 2024: ASÍ congress', valueA: 0, note: 'No AI resolutions confirmed in titles' },
        { label: 'Nov 2024: AI consultation opens', valueA: 1 },
        { label: 'Nov 2024: major unions responses', valueA: 0 },
        { label: '2026: Varða survey publication', valueA: 1 },
      ],
    },
    'falsifier-matrix': {
      kind: 'ranked-table',
      unit: 'falsifier readiness',
      summary: 'What evidence could weaken each key claim.',
      rows: [
        { label: 'F1 Text silence', valueA: 1, note: 'Falsifiable by updated policy document text' },
        { label: 'F2 ICT trifecta', valueA: 2, note: 'Needs 2025 J62 revenue + alternative explanation evidence' },
        { label: 'F3 ISCO shift', valueA: 2, note: 'Needs linked transition evidence to reclassify interpretation' },
        { label: 'F4 Measurement gap', valueA: 1, note: 'Falsified if Iceland joins missing instruments' },
        { label: 'F5 Institutional silence', valueA: 2, note: 'Needs full ASÍ document pass and consultation updates' },
      ],
    },
    'exec-status-ribbon': {
      kind: 'ranked-table',
      unit: 'status',
      summary: 'Live summary from verified findings and evidence tiers.',
      rows: [
        { label: 'Confirmed findings', valueA: 3 },
        { label: 'Strong-inference findings', valueA: 2 },
        { label: 'Data requests pending', valueA: 8 },
      ],
    },
    'agency-accountability': {
      kind: 'ranked-table',
      unit: 'agencies',
      summary: 'Core accountability map from agency responsibilities.',
      rows: [
        { label: 'Hagstofa', valueA: 2, note: 'Eurostat AI + vacancies accessibility' },
        { label: 'VMST', valueA: 1, note: 'Sector unemployment access' },
        { label: 'TR', valueA: 1, note: 'Occupation x diagnosis cross-table' },
        { label: 'HVIN', valueA: 1, note: 'EWCS participation ownership' },
      ],
    },
    'participation-table': {
      kind: 'ranked-table',
      unit: 'submissions',
      summary: 'Major union participation in AI consultation process.',
      rows: [
        { label: 'Major unions submissions', valueA: 0 },
        { label: 'BHM submission', valueA: 1 },
        { label: 'Total submissions', valueA: 12 },
      ],
    },
    'counterargument-register': {
      kind: 'ranked-table',
      unit: 'argument strength',
      summary: 'Top adversarial arguments from evidence register.',
      rows: [
        { label: 'Luddite fallacy', valueA: 3, note: 'Strong' },
        { label: 'Small economy advantage', valueA: 3, note: 'Strong' },
        { label: 'WEF net positive', valueA: 2, note: 'Medium-strong' },
        { label: 'Humlum & Vestergaard', valueA: 2, note: 'Medium' },
      ],
    },
    'conclusion-toggle': {
      kind: 'timeline',
      unit: 'scenario states',
      summary: 'Current conclusion vs falsifier-triggered scenario outcomes.',
      rows: [
        { label: 'Current state', valueA: 1, note: 'Pattern evidence with explicit caveats' },
        { label: 'If falsifier appears', valueA: 1, note: 'Conclusion downgraded by new data' },
      ],
    },
    'exec-immediate-actions': {
      kind: 'ranked-table',
      unit: 'priority actions',
      summary: 'Immediate data actions from memo.',
      rows: [
        { label: 'Forsætisráðuneyti methodology request', valueA: 1 },
        { label: 'TR cross-table request', valueA: 1 },
        { label: 'Hagstofa Eurostat participation request', valueA: 1 },
      ],
    },
    'isco-method': {
      kind: 'ranked-table',
      unit: 'occupation groups',
      summary: 'Knowledge vs non-knowledge composition in 2025.',
      rows: [
        { label: 'Knowledge occupations (2025)', valueA: knowledgeVsService.knowledge },
        { label: 'Service and physical occupations (2025)', valueA: knowledgeVsService.servicePhysical },
      ],
    },
    'ict-caveat': {
      kind: 'ranked-table',
      unit: 'caveat factors',
      summary: 'Why ICT interpretation remains strong inference, not proof.',
      rows: [
        { label: 'Revenue 2025 data gap', valueA: 1 },
        { label: 'No direct AI adoption linkage dataset', valueA: 1 },
        { label: 'Alternative explanations need exclusion', valueA: 1 },
      ],
    },
    'unverified-zone': {
      kind: 'ranked-table',
      unit: 'verification items',
      summary: 'Outstanding verification items in institutional silence section.',
      rows: [
        { label: 'ASÍ full congress PDF pass', valueA: 1 },
        { label: 'Consultation appendices review', valueA: 1 },
        { label: 'Union AI agreement scan update', valueA: 1 },
      ],
    },
  }

  const sourceContentByFile = {
    'employment_by_sector_annual.csv': employmentBySectorCsv,
    'vacancies_quarterly.csv': vacanciesQuarterlyCsv,
    'labour_productivity_annual.csv': labourProductivityCsv,
    'employment_by_occupation_annual.csv': employmentByOccupationCsv,
    'vmst_G5_register_by_sector.csv': vmstSectorCsv,
  }

  const sourceHashes = Object.fromEntries(
    Object.entries(sourceContentByFile).map(([file, content]) => [
      file,
      sha256(content).slice(0, 16),
    ]),
  )

  const fingerprint = sha256(
    JSON.stringify({
      sourceHashes,
      modules: Object.keys(moduleCharts).sort(),
    }),
  ).slice(0, 16)

  return {
    generatedAt: new Date().toISOString(),
    sourceFiles: Object.keys(sourceContentByFile),
    sourceHashes,
    fingerprint,
    moduleCharts,
  }
}

async function main() {
  const payload = await buildSentinelWiring()
  await fs.rm(OUT_DIR, { recursive: true, force: true })
  await fs.mkdir(OUT_DIR, { recursive: true })
  await fs.mkdir(OUT_MODULE_DIR, { recursive: true })
  await fs.mkdir(OUT_BUNDLE_DIR, { recursive: true })
  const outputs = []

  for (const [pageId, moduleIds] of Object.entries(PAGE_MODULES)) {
    const pageModuleDir = path.join(OUT_MODULE_DIR, pageId)
    await fs.mkdir(pageModuleDir, { recursive: true })
    const bundleModuleCharts = {}

    for (const moduleId of moduleIds) {
      const moduleChart = payload.moduleCharts[moduleId]
      if (!moduleChart) {
        continue
      }
      bundleModuleCharts[moduleId] = moduleChart
      const modulePath = path.join(pageModuleDir, `${moduleId}.json`)
      const modulePayload = JSON.stringify(moduleChart, null, 2)
      await fs.writeFile(modulePath, modulePayload, 'utf8')
      const moduleStat = await fs.stat(modulePath)
      outputs.push({ path: modulePath, size: moduleStat.size })
    }

    const bundlePath = path.join(OUT_BUNDLE_DIR, `${pageId}.json`)
    const bundlePayload = {
      generatedAt: payload.generatedAt,
      fingerprint: payload.fingerprint,
      moduleCharts: bundleModuleCharts,
    }
    await fs.writeFile(bundlePath, JSON.stringify(bundlePayload, null, 2), 'utf8')
    const bundleStat = await fs.stat(bundlePath)
    outputs.push({ path: bundlePath, size: bundleStat.size })
  }

  const indexPath = path.join(OUT_DIR, 'index.json')
  const indexPayload = {
    generatedAt: payload.generatedAt,
    sourceFiles: payload.sourceFiles,
    sourceHashes: payload.sourceHashes,
    fingerprint: payload.fingerprint,
    pages: Object.fromEntries(
      Object.entries(PAGE_MODULES).map(([pageId, moduleIds]) => [
        pageId,
        { modules: moduleIds },
      ]),
    ),
  }
  await fs.writeFile(indexPath, JSON.stringify(indexPayload, null, 2), 'utf8')
  const indexStat = await fs.stat(indexPath)
  outputs.push({ path: indexPath, size: indexStat.size })

  outputs.forEach((output) => {
    console.log(`Wrote ${output.path} (${output.size} bytes)`)
  })
}

main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
