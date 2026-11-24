# The benchmark has its own start entry with a fake web

The backend benchmark starts the server through `backend/benchmark/main.ts`, which builds it with a fake `WebFetch` and a fake `PageReader`, both answering canned data after a fixed latency (`BENCHMARK_LATENCY_MS`, default 100). Production code has no switch for it: `Server.start` receives the `PageReader` and `SearchSettings` an optional `WebFetch`, and `src/main.ts` passes the real ones.

Why: the real providers and the page reader call other sites. Under load that measures their latency, risks a block, and a synthetic address would wait for the 3 second timeout on every `sorzs.add`. A switch inside `src/` could stay on by mistake in production; a separate entry cannot.
