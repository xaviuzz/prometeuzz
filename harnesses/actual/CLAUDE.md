# actual

Xavier's fork of Actual Budget (`https://github.com/xaviuzz/actual`), a TypeScript monorepo (Yarn 4, lage, vitest, oxlint/oxfmt).

Read `AGENTS.md` before any change: it holds commands, package layout and code-style rules. Run `yarn` commands from the repo root only.

## Current target

Upstream issue #9230: desktop "Export data" writes the whole pooled 64 KiB buffer around the ZIP. Chosen because it has no PR, a verified diagnosis and a small fix.

- `packages/desktop-electron/index.ts`, `save-file-dialog` handler: `new Uint8Array(fileContents.buffer)` drops `byteOffset` and `byteLength`; `resolve()` runs before the write completes.
- `packages/desktop-electron/preload.ts`: renderer-side caller of that handler.

`desktop-electron` has no unit-test setup, only Playwright `e2e/`. Finding a test seam is the first task.

- Decisions: fix inline in the `save-file-dialog` handler with `await fs.promises.writeFile(filePath, fileContents)`. A throwaway vitest harness (extraction to `saveFile.ts`, real temp dir) proved it test-first, then left the PR: the package has no unit-test setup and adding one is out of scope. The copy goes to `.claude/reference/`. The cancelled dialog (`filePath` undefined) stays out to keep the PR on the issue; the PR mentions it as a follow-up. Plan: `.claude/specs/9230-pr-ready.md`.

## Contributing

Upstream: `https://github.com/actualbudget/actual`. Project rules in `AGENTS.md`, the lint config and `CODE_REVIEW_GUIDELINES.md` win over PrometeuZZ's code-style conventions.
