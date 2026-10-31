# Playwright on Node in the official image

The runner is a Compose service on `mcr.microsoft.com/playwright`, version pinned equal to `@playwright/test`, running Node. Dependencies: `@playwright/test`, Biome, TypeScript. Why: Playwright on Bun is not the supported path, and the image already carries the browsers.
