# Playwright on Node in the official image

The runner is a Compose service on `mcr.microsoft.com/playwright`, version pinned equal to `@playwright/test`, running Node. Dependencies: `@playwright/test`, Biome, TypeScript and `@types/node`, with `types: ["node"]` in `tsconfig.json`.

Why: Playwright on Bun is not the supported path, and the image already carries the browsers. `@types/node` is there because `playwright.config.ts` reads `process.env.BASE_URL` and `tsc` cannot type `process` without it.
