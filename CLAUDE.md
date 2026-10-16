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
- Tests assert on public behavior. Never widen visibility (`pub`, `export`, a public accessor) only so a test can reach something; test the rule through the behavior that uses it, or delete a test that only reads internals.
- Separate structural changes (refactor) from behavioral changes. Never mix them in one step.
- Do the simplest thing that passes, then refactor. Rule of three before abstracting.
- Record each project decision and its why in that project's `CLAUDE.md` when it is made. The repo cannot tell it later.
- In a TDD run, agree the seam once, then run every planned cycle in one go. Report at the end of the run, or earlier when a cycle contradicts the plan.
- Mark each step of a spec as done (`- [x]`) when its tests, lint and build pass. "Next step" is the first unmarked one. The code cannot tell which step a file belongs to.
- Do not invent facts, APIs or requirements. If something is unknown, say so and ask.
- Do not modify files outside the task without asking. Propose first when scope is unclear.
- Do not add dependencies, frameworks or tooling without asking.
- Keep `CLAUDE.md` to rules needed every turn. Material needed only on one branch (git details, project list) goes in a `.claude/*.md` file behind a pointer that names its trigger.
- When moving, renaming or deleting a documented section, search `.claude/` (skills, specs, hooks, templates) for references to it by name and fix them in the same change.
- Never use the auto-memory directory. Durable lessons go in `CLAUDE.md`, skills or agents.

## Git

Claude uses git **read-only, always, with two exceptions** (`git clone` into `Sandbox/`, and approved `add`/`commit` through the `commit-message` skill), even if asked, in every repo on this machine. Other writes are done by Xavier (`! git ...`).

Allowed command shapes, blocked shapes and the why: `.claude/git-policy.md`. Read it before any git or `gh` command beyond plain `status`, `log` or `diff`, and before editing the hook. `.claude/hooks/git-read-only.sh` enforces it, in sessions started in PrometeuZZ only.

The hook blocks any Bash command that mentions `git` or `gh`, even as a search pattern. Search with Grep or Read instead.

## Learning projects

A project whose `CLAUDE.md` has a `## Learning` section teaches Xavier a technology; its deliverable is his understanding. Read `.claude/learning-projects.md` before working in one or creating one. It overrides the TDD pacing in "How to work".

## Contributing projects

A project whose `CLAUDE.md` has a `## Contributing` section is an upstream contribution. Read `.claude/contributing-projects.md` before choosing an issue or working in one. Its rules override the style conventions in "Conventions".

## Harnesses

A project whose upstream has no Claude setup keeps its `CLAUDE.md` and `.claude/` in `harnesses/<name>/`, linked into `Sandbox/<name>`. Read `.claude/harnesses.md` before cloning, working in or creating such a project, and whenever a project's `CLAUDE.md` is missing.

## Preferred skills

Reach for these first, before improvising a process:

- `mattpocock-skills:tdd`: building features or fixing bugs test-first.
- `mattpocock-skills:codebase-design`: designing modules, interfaces and seams.
- `mattpocock-skills:domain-modeling`: shared terminology, CONTEXT.md, ADRs.
- `mattpocock-skills:grilling`: **always** when Xavier asks to plan ("planeemos", "let's plan"), when his instruction is extensive or complex (even without saying "grill me"), and to stress-test a decision before building. Open with it; a ready-made plan comes after the grilling, never before.
- `mattpocock-skills:writing-for-agents`: **always**, before creating or editing any `CLAUDE.md`, `AGENTS.md`, skill or `.md` under a `.claude/` directory, in any project. Load it first, then write. Enforced by `.claude/hooks/agent-docs-need-skill.sh`, in sessions started in PrometeuZZ only.
- `commit-message`: one-line gitmoji commits for the whole uncommitted delta, one approval at a time. Project-local, so it loads only in sessions started in PrometeuZZ. No trailer.

## Conventions

- Language: Xavier is Spanish-first. Conversation may be in Spanish or English; reply in the language used. Code, identifiers and commits in English unless told otherwise.
- Name every intermediate result in an explaining variable (Fowler's *Introduce Explaining Variable*), in any project. A chained expression becomes one named step per line. Each operand of a predicate gets its own name too (`hasVowel`, `hasDigit`, then `isCountable`).
- Names must read one way when split into words. Say the candidate aloud as separate words (`FeelsLikeDifference` reads as "feels like difference"); if a second grouping makes sense, pick another name.
- Write iteration as an explicit loop block over a collecting variable. Reach for functional idioms (`map`, `filter`, `reduce`, chains) only where they add specific value that the loop lacks; the visual structure of the block is the default.
- One return per function, ending on a named result. Where a conditional varies behavior by state or type, replace it with polymorphism (State, Strategy) before reaching for guard clauses or early returns.
- No ternary operators, in any project. Set a default value and overwrite it in an `if`; where the branch varies by state or type, use polymorphism.
- Code carries no comments, in any project. Intent lives in names, small units and tests; the why of a decision goes in that project's `CLAUDE.md`.

## Layout

- **Project**: a directory directly inside `Sandbox/` that is its own git repository and has its own `CLAUDE.md`. The folder name is the project name. Anything smaller is not a project.
- `Sandbox/`: the single home for every project PrometeuZZ creates or works on. It is the `Sandbox/` directory at the root of this repo (`~/sandbox/PrometeuZZ/Sandbox/`), so resolve every `Sandbox/...` path from the repo root, never from `~/sandbox/`. The rule applies to new projects; existing ones in `~/sandbox` are left alone.
- `Sandbox/TMP/`: read-only references and scratch material (e.g. clones of reference repos). We read from it, never build in it. It can be deleted at any time without losing work.
- Each project keeps `reference/` (research material) and `specs/` (step-by-step plans) inside its own `.claude/`, never at the project root. Put new ones there without asking.

## Current project

None. Xavier names one, or asks for a known project; this section is then updated.

When the user says "let's work" (or similar) without naming a project, work in the current project: read its `CLAUDE.md` and do all changes there, not in PrometeuZZ. With none, ask which project.

Known projects, with repos and references: `.claude/projects.md`. Read it when Xavier names a project, asks which exist, or a project is created.
