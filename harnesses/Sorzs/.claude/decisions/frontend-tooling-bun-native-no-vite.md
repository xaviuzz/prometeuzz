# Frontend tooling: Bun native, no Vite

Bun builds and serves; React, shadcn, Biome and TypeScript on top. The build is a script: `build.ts` calls `Bun.build` with `bun-plugin-tailwind` (Tailwind v4) and `index.html` as entry, and `dev.ts` serves `index.html` with Bun's HTML routes and the same plugin from `bunfig.toml`. Tests are `bun test` with happy-dom and Testing Library. Biome has `css.parser.tailwindDirectives` on and skips what is not our code (shadcn components, installed skills, the generated schema); the list is in `biome.json`.

Why: same runtime and runner as the backend, no second toolchain. `bun build index.html` ignores plugins, so the CLI left Tailwind directives unprocessed in `dist/`. `@theme` and `@apply` in `index.css` fail to parse in Biome otherwise. Lint must judge only what we write. Testing Library under `bun test` was the risk of leaving Vitest; it has held.
