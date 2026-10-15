---
name: new-obsidian-plugin
description: Create an Obsidian plugin project in Sandbox/ from the stored template, or refresh the template with `update`.
disable-model-invocation: true
argument-hint: "[update]"
---

Without an argument, run **Create**. With `update`, run **Update**.

The template in `template/` was extracted from `Sandbox/pintafrase` (domain code left out). Pintafrase is the origin, not an update source: an improvement made there reaches the template by hand.

Placeholders in `template/`, in file contents and in paths: `{{name}}`, `{{displayName}}`, `{{className}}`, `{{description}}`, `{{intro}}`. `scripts/render.mjs` fills them and derives `displayName` and `className` from `name`.

Run each npm command as its own Bash call and read its exit status. A piped command reports the pipe's status, not the command's.

## Create

1. Ask for the **name** (kebab-case: it is the folder and the frozen plugin `id`), a one-line **description** (no double quote or backslash: it goes into JSON) and the **intro**, the opening line of the project's `CLAUDE.md`.
2. `node .claude/skills/new-obsidian-plugin/scripts/render.mjs Sandbox/<name> "<name>" "<description>" "<intro>"`. The script stops when `Sandbox/<name>` exists: report that and end.
3. In `Sandbox/<name>`, run `npm i`, `npm run build`, `npm test`, `npm run lint`. Done when all four exit 0.
4. Ask before touching the root `CLAUDE.md` or `.claude/projects.md`. On approval, add the project to `.claude/projects.md` and, when Xavier says so, to "Current project" in the root `CLAUDE.md`.
5. Print for Xavier, who runs git writes: `! git -C Sandbox/<name> init`, then the first commit through the `commit-message` skill.

## Update

Two jobs, A then B. Pintafrase is out of scope.

### Verdict log

`decisions.md` holds one entry per verdict on an upstream suggestion or a version: key, what was proposed, accepted / rejected / deferred, the why in one line. Read it first and append every verdict as it is made.

- A rejected rule returns only when its upstream text changed; quote the old why when asking again.
- A skipped major returns only when a newer major exists.

### A. AGENTS.md

Fetch `https://raw.githubusercontent.com/obsidianmd/obsidian-sample-plugin/master/AGENTS.md`. Our `template/AGENTS.md` is a condensed rewrite, so compare meaning, not text. For each upstream rule that ours lacks, contradicts or states differently, and that `decisions.md` does not already settle, ask one question: the upstream rule, ours, and a proposal. Done when every such rule has a verdict. Apply accepted proposals to `template/AGENTS.md` through `mattpocock-skills:writing-for-agents`.

### B. Versions

1. Render the template into a fresh `Sandbox/TMP/update-scratch`.
2. In it, run `npm outdated`. List the majors and ask per package, skipping those `decisions.md` settles.
3. Edit `template/package.json` to the approved versions: all minor and patch upgrades, plus the approved majors.
4. Render again into a fresh scratch, then run `npm i`, `npm run build`, `npm test`, `npm run lint`. Done when all four exit 0.
5. A red run restores the previous `template/package.json` versions; log the package and the failure as deferred.

## Design

- The template is stored, not derived from pintafrase on each run: creation is deterministic and works without pintafrase present.
- Majors are Xavier's call: a major can change the config files, and the template carries no tests that would catch it.
- `template/CLAUDE.md` keeps the generic parts of pintafrase's verbatim (Stack, Commands, Code rules, Testing conventions) and two general decisions. A new project starts with an empty `.claude/` apart from `specs/` and `reference/`; skills and hooks stay in PrometeuZZ.
- `template/src/test-utils/obsidian-mock.test.ts` loads `main.ts` through the `obsidian` alias. It goes red when the alias is missing, which is the one wiring a skeleton can break. A bare `new Plugin()` fails to type-check against the real `obsidian` types.
- `decisions.md` holds only verdicts on upstream and version suggestions; design decisions live here.
