# Frontend tooling: Bun native, no Vite

Bun builds (`index.html` entry, `bun-plugin-tailwind` for Tailwind v4) and serves in dev; React, shadcn, Biome and TypeScript on top. Tests are `bun test` with happy-dom and Testing Library. Why: same runtime and runner as the backend, no second toolchain. Risk: Testing Library under `bun test` is less trodden than under Vitest; if it blocks, revisit Vitest.
