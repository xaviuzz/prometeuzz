# {{name}}

{{intro}}

Reference project for structure and conventions: `../TMP/obsidian-paste-image-as-note`.

Follow the principles and way of working in `../../CLAUDE.md`.

Git is read-only for Claude; see "Git" in `../../CLAUDE.md`.

Obsidian plugin rules (manifest, cleanup, privacy, release) are in `AGENTS.md`. Read it before touching `manifest.json`, commands, settings or listeners.

Reference material (docs, notes, API excerpts) lives in `.claude/reference/`. List it before designing or implementing anything that depends on external behavior.

Specs live in `.claude/specs/`. A spec is done when all its steps are `[x]`; the first unmarked step is the next one.

## Stack

- TypeScript, bundled with esbuild into `main.js`.
- Tests with vitest. `obsidian` is aliased to `src/test-utils/obsidian-mock.ts`; grow the mock only as tests need it.

## Decisions

- `tsconfig.json` sets `moduleResolution: "bundler"`. With `"node"`, a bare `tsc --noEmit` cannot resolve the `exports` types of `vite` and `vitest`; `npm run build` hid it behind `-skipLibCheck`.
- `obsidian` is pinned to `1.8.7` and `eslint` to 9, `typescript` to 6: `eslint-plugin-obsidianmd` peers those versions (`typescript-eslint` caps `typescript` at 6.0). Lift them when the plugin does.

## Code rules

Adopted from the reference project, on top of `../../CLAUDE.md`.

- One public class per production file, and an interface gets its own file. The file name then finds the type. Test files keep `SUT`, fakes and helpers at the end (see Testing conventions).
- Let errors propagate. A failure throws; it is never a `null` or `undefined` return, and no `try/catch` guesses the cause. The caller decides how to tell the user.
- Name predicates in the positive (`hasImage`, never `hasNoImage`), so no caller reads a double negative.
- Give a string literal a module constant when it is built into another string or used twice. A literal alone under a descriptive key stays inline.
- A class with three or more constructor dependencies takes one typed parameter object instead.

## Commands

- `npm i`: install dependencies.
- `npm run dev`: build in watch mode.
- `npm run build`: type-check and bundle.
- `npm test`: run tests once.
- `npm run lint`: lint (flat config in `eslint.config.mjs`).
- `npm run deploy`: build and copy the plugin into `test-vault/` to try it by hand in Obsidian (open `test-vault/` as a vault).
- `npm test` does not type-check: vitest strips types, so a broken type-only import still passes. After moving or renaming files, run `npm run build` too.

## Testing conventions

Adapted from the reference project. Goal: tests that survive refactoring.

- **Behavior, not implementation.** Assert observable outcomes, never which collaborator method was called with which arguments. Name tests by behavior and condition: `returns X when Y`.
- **Fakes over mocks.** Write a minimal in-memory fake that implements the same interface as the real collaborator. No mocking framework.
- **The test talks only about behavior.** The Subject Under Test (SUT) is built, driven and observed through a `SUT` class at the end of the file, created in `beforeEach`; dependencies, wiring and fake setup stay out of the test bodies. The `extract-sut` skill refactors existing tests to this shape.
- **Infrastructure on demand.** Create fakes, factories and helpers when a test needs them.
- **Fixtures.** A fixture class lives in `src/test-utils/` and is named for its general concept, not for the unit that first used it.
- **Structure.** Nested `describe`: unit, then behavior, then scenario. Tests come first in the file; `SUT`, fakes and helpers go at the end, so the file reads "what" before "how".
- **Red first.** Run each new test and see it fail for the reason you expect before writing the code. A test that passes on arrival proves nothing: change its input until it fails.
- **What to unit test.** Logic: algorithms, rules, state, orchestration. Thin adapters over the Obsidian API and pure delegation get no unit test; the Obsidian mock covers their edge.

## Layout

- `src/main.ts`: plugin entry point (`{{className}}`).
- `src/test-utils/`: Obsidian API test doubles and shared fixtures.
- `test-vault/`: Obsidian vault for manual testing; `npm run deploy` fills `.obsidian/plugins/{{name}}/`.
