import fs from 'node:fs/promises'
import path from 'node:path'
import crypto from 'node:crypto'

const ROOT = process.cwd()
const RAW_DIR = path.resolve(
  ROOT,
  '../data/iceland-ai-governance-audit/data/raw',
)
const INDEX_PATH = path.resolve(ROOT, 'public/data/wiring/index.json')
const MODULES_DIR = path.resolve(ROOT, 'public/data/wiring/modules')
const BUNDLES_DIR = path.resolve(ROOT, 'public/data/wiring/bundles')

function sha256(input) {
  return crypto.createHash('sha256').update(input).digest('hex')
}

async function readRaw(file) {
  return fs.readFile(path.join(RAW_DIR, file), 'utf8')
}

async function main() {
  const indexRaw = await fs.readFile(INDEX_PATH, 'utf8')
  const index = JSON.parse(indexRaw)

  const sourceFiles = index.sourceFiles ?? []
  const sourceHashes = index.sourceHashes ?? {}

  for (const file of sourceFiles) {
    const content = await readRaw(file)
    const currentHash = sha256(content).slice(0, 16)
    const expectedHash = sourceHashes[file]
    if (currentHash !== expectedHash) {
      throw new Error(
        `Wiring stale for ${file}: expected ${expectedHash}, got ${currentHash}. Run npm run build:data.`,
      )
    }
  }

  const pages = index.pages ?? {}
  for (const [pageId, pageMeta] of Object.entries(pages)) {
    const modules = pageMeta.modules ?? []
    const bundlePath = path.join(BUNDLES_DIR, `${pageId}.json`)
    let bundle
    try {
      bundle = JSON.parse(await fs.readFile(bundlePath, 'utf8'))
    } catch {
      throw new Error(`Missing page bundle: ${bundlePath}. Run npm run build:data.`)
    }

    if (!bundle || typeof bundle !== 'object' || !bundle.moduleCharts) {
      throw new Error(`Invalid page bundle format: ${bundlePath}`)
    }

    for (const moduleId of modules) {
      const modulePath = path.join(MODULES_DIR, pageId, `${moduleId}.json`)
      try {
        await fs.access(modulePath)
      } catch {
        throw new Error(
          `Missing module payload: ${modulePath}. Run npm run build:data.`,
        )
      }

      if (!(moduleId in bundle.moduleCharts)) {
        throw new Error(
          `Module ${moduleId} missing from bundle ${bundlePath}. Run npm run build:data.`,
        )
      }
    }
  }

  console.log('Sentinel wiring freshness check passed.')
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : error)
  process.exitCode = 1
})
