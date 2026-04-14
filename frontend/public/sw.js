const CACHE_NAME = 'sentinel-v1'
const WIRING_PREFIX = '/data/wiring/'

self.addEventListener('install', (event) => {
  event.waitUntil(self.skipWaiting())
})

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(
        keys
          .filter((key) => key !== CACHE_NAME)
          .map((key) => caches.delete(key)),
      ),
    ),
  )
  self.clients.claim()
})

self.addEventListener('fetch', (event) => {
  const request = event.request
  if (request.method !== 'GET') {
    return
  }

  const url = new URL(request.url)
  if (!url.pathname.startsWith(WIRING_PREFIX)) {
    return
  }

  event.respondWith(
    caches.open(CACHE_NAME).then(async (cache) => {
      try {
        const networkResponse = await fetch(request)
        if (networkResponse.ok) {
          cache.put(request, networkResponse.clone())
        }
        return networkResponse
      } catch {
        const cached = await cache.match(request)
        if (cached) {
          return cached
        }
        return new Response('Offline and no cached wiring payload available.', {
          status: 503,
          statusText: 'Service Unavailable',
        })
      }
    }),
  )
})
