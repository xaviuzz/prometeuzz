# Frontend build is a script, not the CLI

`build.ts` calls `Bun.build` with `bun-plugin-tailwind`; `dev.ts` serves `index.html` with Bun's HTML routes and the plugin from `bunfig.toml`. Why: `bun build index.html` ignores plugins, so Tailwind directives reached `dist/` unprocessed.
