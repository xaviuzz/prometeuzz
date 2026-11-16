# PrometeuZZ

Personal harness for all of Xavier Gost's (XaV1Uzz) activities as a technologist.
Language, stack and commands depend on each project and live in that project's own `CLAUDE.md`. Do not assume any; read it, or ask or propose.

## Principles

1. **Simplicity**, per John Maeda's *Laws of Simplicity*: reduce, organize, save time, learn, differences, context, emotion, trust, failure, the one. When in doubt, remove.
2. **Best practices in programming**: clear names, small units, no duplication, tests as a safety net, no speculative generality.
3. **Hard object orientation**: behavior lives with the data it belongs to. Tell, don't ask. Avoid anemic models, primitive obsession and procedural code dressed up as classes. Prefer composition over inheritance.
4. **Patterns**: use them when they name a real force in the code, and name them in the code (e.g. `*Strategy`, `*Factory`). Never add a pattern ahead of need.

## Influences

Use their vocabulary as the reference in design decisions: Martin Fowler (refactoring catalog), Kent Beck (TDD, Tidy First), Ron Jeffries (XP, the three Cs), GeePaw Hill (MMMSS).

## How to work

- Work test-first, in the smallest steps that keep the build green.
- Separate structural changes (refactor) from behavioral changes. Never mix them in one step.
- Number a proposed list of changes in the order they will run. If impact and dependency order differ, number by dependency and show impact beside each item.
- Do not invent facts, APIs or requirements. If something is unknown, say so and ask.
- Do not modify files outside the task without asking. Propose first when scope is unclear.
- A question ("why...?", "could we...?", "do you think...?") asks for analysis, not action. Answer with viability, trade-offs and a recommendation, and change nothing until Xavier says to go ahead. Writing a decision record counts as a change.
- A short design remark ("tell, don't ask", a goal sentence) refers first to the file open in the IDE, and may only confirm what was just done. Read that file, apply it there, and propose any other file instead of editing it. A remark that a file is too long or too tangled to follow ("más componentizado", "difícil de entender") asks for a split first: list the parts, their props and any behavior change, and edit after Xavier approves.
- Xavier's button bar answers any question with "ok, adelante, todo ok". Close every question with one recommended default; that message approves it. Never leave an open either/or.
- Do not add dependencies, frameworks or tooling without asking.
- Keep `CLAUDE.md` to rules needed every turn. Material needed only on one branch goes in a `.claude/*.md` file behind a pointer that names its trigger.
- Never use the auto-memory directory. Durable lessons go in `CLAUDE.md`, skills or agents.

## Pointers

Read the file before the work it names:

- `.claude/code-style.md`: before writing, reviewing or renaming code. Style rules for every project.
- `.claude/workflow.md`: before writing tests, a refactor, a TDD run, a spec, a concept doc or a decision record, or before moving or renaming a documented section.
- `.claude/layout.md`: before creating a file, folder or project, or placing a file Xavier asks for.
- `.claude/projects.md`: when Xavier names a project, asks which exist, or a project is created.
- `.claude/git-policy.md`: before any git or `gh` command beyond plain `status`, `log` or `diff`, and before editing the hook.
- `.claude/experiments.md`: when Xavier announces an experiment, or asks to revert everything.
- `.claude/penpot.md`: before using the `penpot` MCP or registering it in a project. Touch a Penpot file only when Xavier asks.

## Git

Claude uses git **read-only, always, with two exceptions** (`git clone` into `Sandbox/`, and approved `add`/`commit` through the `commit-message` skill), even if asked, in every repo on this machine. Other writes are done by Xavier (`! git ...`).

`.claude/hooks/git-read-only.sh` blocks any Bash command that mentions `git` or `gh`, in sessions started in PrometeuZZ only. Search with Grep or Read; write a file's text with Write, never a heredoc.

## Project kinds

A project's `CLAUDE.md` section selects extra rules. Each file overrides the rules above where they differ.

- `## Learning`: the project teaches Xavier a technology. Read `.claude/learning-projects.md` before working in or creating one; it overrides the TDD pacing.
- `## Contributing`: an upstream contribution. Read `.claude/contributing-projects.md` before choosing an issue or working in one; it overrides `.claude/code-style.md`.
- `## Legacy`: works in deltas, not specs. Read `.claude/legacy-projects.md` before cataloging challenges, writing a delta or working in one; its `CLAUDE.md` stays in the project, not in a harness.
- No Claude setup upstream, or several repos (an umbrella): its `CLAUDE.md` and `.claude/` live in `harnesses/<name>/`, linked into `Sandbox/<name>`. Read `.claude/harnesses.md` before cloning, working in or creating one, and whenever a project's `CLAUDE.md` is missing.

## Preferred skills

Reach for these first, before improvising a process:

- `mattpocock-skills:grilling`: **always** when Xavier asks to plan ("planeemos", "let's plan"), when his instruction is extensive or complex (even without saying "grill me"), and to stress-test a decision before building. Open with it; a ready-made plan comes after the grilling, never before.
- `mattpocock-skills:writing-for-agents`: **always**, before creating or editing any `CLAUDE.md`, `AGENTS.md`, skill or `.md` under a `.claude/` directory, in any project. Load it first, then write. Enforced by `.claude/hooks/agent-docs-need-skill.sh`, in sessions started in PrometeuZZ only.
- `next-step`: **always**, first, when Xavier says "next step", "siguiente step" or asks what is next in a project with specs. It finds the step by script; never infer it from commits or memory.
- `commit-message`: no trailer.

## Conventions

- Language: Xavier is Spanish-first. Conversation may be in Spanish or English; reply in the language used. Code, identifiers and commits in English unless told otherwise.
- In the VSCode extension, name every file in a reply as a markdown link relative to the workspace root (`[SourceEntry.ts](Sandbox/Sorzs/backend/src/domain/source-list/SourceEntry.ts)`), never as plain text or in backticks. Xavier opens them from the reply.

## Current project

Sorzs, at `Sandbox/Sorzs/` (umbrella, harness `harnesses/Sorzs/`). Xavier names another, or asks for a known project; this section is then updated.

When the user says "let's work" (or similar) without naming a project, work in the current project: read its `CLAUDE.md` and do all changes there, not in PrometeuZZ. With none, ask which project.
