# New Obsidian plugin skill

Skill `new-obsidian-plugin` in `.claude/skills/new-obsidian-plugin/`. Manual invocation only (`disable-model-invocation: true`), like `learn`: it writes files and edits the root `CLAUDE.md`. `/new-obsidian-plugin` creates a project; `/new-obsidian-plugin update` refreshes the template.

## Template

`template/` next to `SKILL.md`, extracted from `Sandbox/pintafrase`, with placeholders `{{name}}`, `{{displayName}}`, `{{className}}`, `{{description}}`, `{{intro}}`; `scripts/render.mjs` fills them and derives the display name and class name from the name.

- Config: `esbuild.config.mjs`, `eslint.config.mjs`, `tsconfig.json`, `vitest.config.ts`, `version-bump.mjs`, `.editorconfig`, `.npmrc`, `.gitignore`, `LICENSE`, `package.json` (scripts and devDependencies), `manifest.json`, `versions.json` (`{}`), `styles.css` (empty), `README.md`.
- `AGENTS.md`: Obsidian plugin rules, verbatim from pintafrase.
- `CLAUDE.md`: Stack, Commands, Code rules and Testing conventions verbatim; Layout with `src/main.ts` and `src/test-utils/` only; a pointer to `.claude/decisions.md`; pointers to `../../CLAUDE.md` and `AGENTS.md`.
- `.claude/decisions.md`: the project's decisions, seeded with the template's general ones (`moduleResolution: "bundler"`, the `obsidian`, `eslint` and `typescript` pins).
- `src/main.ts` minimal plugin; `src/test-utils/obsidian-mock.ts` and a smoke test that loads `main.ts` through the `obsidian` alias (red without the alias).
- `.claude/specs/` and `.claude/reference/` with `.gitkeep`, and `.claude/decisions.md`; `test-vault/.obsidian/plugins/{{name}}/.placeholder`.
- `manifest.json`: author `XaV1Uzz`, `authorUrl` `https://github.com/xaviuzz`, license `0BSD`, `minAppVersion` `0.15.0`, `isDesktopOnly` `false`, version `0.1.0`.
- No domain code from pintafrase.

## Create mode

1. Ask for name (also folder and plugin `id`), description and the opening line of `CLAUDE.md`.
2. Stop with a message when `Sandbox/<name>/` exists.
3. Run `scripts/render.mjs`: it fills the placeholders in contents and paths.
4. Run `npm i`, `npm run build`, `npm test`, `npm run lint`; all green.
5. After Xavier confirms, add the project to `.claude/projects.md` and optionally to "Current project" in the root `CLAUDE.md`.
6. Print the `! git init` and first-commit lines for Xavier (git writes are his).

## Update mode

- Job A: read upstream `AGENTS.md` (obsidian-sample-plugin) and the template's, suggest changes one by one; apply each approved one with `mattpocock-skills:writing-for-agents`.
- Job B: run `npm outdated` in a scratch copy in `Sandbox/TMP/`; apply minor and patch upgrades, ask per package for majors; write to the template only when install, build, test and lint pass.
- `decisions.md` next to `SKILL.md` logs each verdict (key, upstream rule or version, accepted/rejected/deferred, why). A rejected suggestion is re-asked only when the upstream text for that rule changes, quoting the old why; a skipped major is re-asked only when a newer major appears.
- Pintafrase is not an update source.

## Design

Template design decisions (why the template is stored, why pintafrase is not a source, why majors are the user's call) live in `SKILL.md`; `decisions.md` holds only verdicts on upstream and version suggestions.

## Steps

- [x] 1. Check upstream `AGENTS.md` is reachable; read pintafrase's `obsidian-mock.ts` and `.gitignore` to confirm what is generic.
- [x] 2. Extract the template from pintafrase with placeholders and the smoke test.
- [x] 3. Prove the template: generate a throwaway plugin in `Sandbox/TMP/` by hand; `npm i`, build, test and lint green.
- [x] 4. Write `SKILL.md` create mode.
- [x] 5. Run create mode end to end into `Sandbox/TMP/`; green.
- [x] 6. Write `SKILL.md` update mode and an empty `decisions.md`.
- [x] 7. Run update mode once; record its verdicts in `decisions.md`.
