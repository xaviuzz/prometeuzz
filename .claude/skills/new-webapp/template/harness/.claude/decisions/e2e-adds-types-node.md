# E2E adds @types/node

`@types/node` is a fourth devDependency of `e2e/`, with `types: ["node"]` in `tsconfig.json`. Why: `playwright.config.ts` reads `process.env.BASE_URL`, and `tsc` cannot type `process` without it. Approved by Xavier on top of the spec's three.
