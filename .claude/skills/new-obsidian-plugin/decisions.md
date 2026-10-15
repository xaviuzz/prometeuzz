# Verdicts

Entries: key, what was proposed, accepted / rejected / deferred, why.

## Versions (2026-10-15)

- `@types/node` 22 → 26: accepted. Green.
- `builtin-modules` 3.3.0 → 5.4.0: replaced. `eslint-plugin-obsidianmd` bans the package; `esbuild.config.mjs` uses `builtinModules` from `node:module`.
- `tslib` 2.4.0 → 2.8.1: accepted.
- `typescript` 5.9 → 7.0: deferred to 6.0. `typescript-eslint` 8 peers `typescript <6.1`; 6.0 is the newest it accepts. Ask again when typescript-eslint supports 7. `baseUrl` removed from `tsconfig.json` (deprecated in 6).
- `eslint` 10 → 9 and `@eslint/js` 10 → 9: accepted as a downgrade, because `eslint-plugin-obsidianmd` peers `@eslint/js ^9`. Revisit when the plugin supports 10.
- `obsidian` `latest` → `1.8.7`: accepted as a pin, because `eslint-plugin-obsidianmd` peers `obsidian 1.8.7` exactly. Revisit when the plugin moves; the pin also caps the API types available.
- `eslint-plugin-obsidianmd` ^0.4.2, `@eslint/json` 0.14.0, `typescript-eslint` ^8.35.1: accepted (upstream rule: lint with the plugin). Replace `@typescript-eslint/eslint-plugin` and `@typescript-eslint/parser`, which `typescript-eslint` bundles. The flat config enables the recommended set plus globals for tests and `.mjs` files.

## Upstream AGENTS.md rules (obsidian-sample-plugin, 2026-10-15)

- `strict: true` in `tsconfig.json`: accepted.
- Lint with `eslint-plugin-obsidianmd`: accepted.
- Current Node LTS: accepted (Node 18+ is stale).
- Bundle all dependencies; keep the plugin small; split files over about 300 lines; `async`/`await`: accepted.
- Settings tab with defaults and validation: accepted.
- No remote code, `eval` or outside updates; opt-in documented telemetry: accepted.
- Keep `onload` light; batch disk access: accepted.
- Test on mobile; avoid large in-memory structures: accepted.
- `versions.json` maps versions to `minAppVersion`: accepted. Wiring `version-bump.mjs` into an npm `version` script stays open; the sample's script runs a git write.
- "Handle errors gracefully": rejected. It contradicts the code rule "let errors propagate".
- A GitHub Action that lints every commit: deferred. The template has no CI.
- Commands to install, build and lint; the layout example; "common tasks"; troubleshooting; the reference links: rejected. The model knows them by default, or `CLAUDE.md` and the config already say them.
- "Never commit `node_modules/` or `main.js`": rejected. `.gitignore` already says it.
