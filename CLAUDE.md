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
- Close every test you finish with the `extract-sut` skill: a test is done once its body reads as behavior only. Value-object tests are exempt.
- Separate structural changes (refactor) from behavioral changes. Never mix them in one step.
- Run the project's tests after every refactor step, including a move or rename, before the next step or the report.
- After moving or renaming a folder, list the old location (source and tests) and remove what it left empty. Passing tests do not show a stray file or an empty folder.
- Do the simplest thing that passes, then refactor. Rule of three before abstracting.
- The rule of three gates abstractions shared between types, not wrapping a primitive. A primitive that carries a rule or an identity becomes a value object at first use (`Binding`, `UserAlbumId`); do not propose waiting.
- Define each functional concept of a project in `.claude/docs/<concept>.md` before building it: what it is, what defines it, its rules, what can be done with it, what is out of scope, open questions. Write it in English, in business language, without programming terms (no class or field names), after grilling Xavier on the concept. Choose and scope every slice or spec from the docs it touches: read them first, name them in the spec, and update the doc in the same change when a rule is added or changed.
- Record each project decision and its why in that project's `.claude/decisions.md` when it is made; create the file if the project has none, and point to it from the project's `CLAUDE.md`. The repo cannot tell it later. Past about 15 decisions, make `decisions.md` an index by area with one file per decision in `.claude/decisions/` (title as heading, a line in the index for each file), so a session reads only the area it works in.
- In a TDD run, agree the seam once, then run every planned cycle in one go. Report at the end of the run, or earlier when a cycle contradicts the plan.
- End every spec you write or document with a `## Diagram` section: a Mermaid diagram of the feature's flow (sequence for interactions, flowchart or state for rules).
- Mark each step of a spec as done (`- [x]`) when its tests, lint and build pass. "Next step" is the first unmarked one. The code cannot tell which step a file belongs to. A step the spec says is tried by hand is marked only after Xavier confirms it.
- When Xavier asks that something be kept up to date whenever an event happens, write the rule in the project's `CLAUDE.md` and add a PostToolUse hook with its test in `.claude/hooks/` in the same change. A rule in prose is not enforced.
- Number a proposed list of changes in the order they will run. If impact and dependency order differ, number by dependency and show impact beside each item.
- Do not invent facts, APIs or requirements. If something is unknown, say so and ask.
- Do not modify files outside the task without asking. Propose first when scope is unclear.
- A question ("why...?", "could we...?", "do you think...?") asks for analysis, not action. Answer with viability, trade-offs and a recommendation, and change nothing until Xavier says to go ahead. Writing a decision record counts as a change.
- A short design remark ("tell, don't ask", a goal sentence) refers first to the file open in the IDE, and may only confirm what was just done. Read that file, apply it there, and propose any other file instead of editing it.
- Do not add dependencies, frameworks or tooling without asking.
- Keep `CLAUDE.md` to rules needed every turn. Material needed only on one branch (git details, project list) goes in a `.claude/*.md` file behind a pointer that names its trigger.
- When moving, renaming or deleting a documented section, search `.claude/` (skills, specs, hooks, templates) for references to it by name and fix them in the same change.
- Never use the auto-memory directory. Durable lessons go in `CLAUDE.md`, skills or agents.

## Git

Claude uses git **read-only, always, with two exceptions** (`git clone` into `Sandbox/`, and approved `add`/`commit` through the `commit-message` skill), even if asked, in every repo on this machine. Other writes are done by Xavier (`! git ...`).

Allowed command shapes, blocked shapes and the why: `.claude/git-policy.md`. Read it before any git or `gh` command beyond plain `status`, `log` or `diff`, and before editing the hook. `.claude/hooks/git-read-only.sh` enforces it, in sessions started in PrometeuZZ only.

The hook blocks any Bash command that mentions `git` or `gh`, even as a search pattern or as `.git` in an exclude list (`tar`, `find`). Search with Grep or Read instead; for a copy that must skip `.git`, write a script file and run it.

## Learning projects

A project whose `CLAUDE.md` has a `## Learning` section teaches Xavier a technology; its deliverable is his understanding. Read `.claude/learning-projects.md` before working in one or creating one. It overrides the TDD pacing in "How to work".

## Contributing projects

A project whose `CLAUDE.md` has a `## Contributing` section is an upstream contribution. Read `.claude/contributing-projects.md` before choosing an issue or working in one. Its rules override the style conventions in "Conventions".

## Harnesses

A project whose upstream has no Claude setup keeps its `CLAUDE.md` and `.claude/` in `harnesses/<name>/`, linked into `Sandbox/<name>`. A project made of several repos is an umbrella and works the same way. Read `.claude/harnesses.md` before cloning, working in or creating such a project, and whenever a project's `CLAUDE.md` is missing.

## Experiments

Read `.claude/experiments.md` when Xavier announces an experiment, or asks to revert everything: it holds the HEAD record, the revert commands and the check.

## Penpot

Use the `penpot` MCP, and touch any Penpot file, only when Xavier asks. Read `.claude/penpot.md` before using the MCP or registering it in a project.

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
- Write iteration as an explicit loop block over a collecting variable. Reach for functional idioms (`map`, `filter`, `reduce`, chains) only where they add specific value that the loop lacks; the visual structure of the block is the default. Looking up the first match is one of those places: use `find`, not a loop that keeps the last match.
- One return per function, ending on a named result. Where a conditional varies behavior by state or type, replace it with polymorphism (State, Strategy) before reaching for guard clauses or early returns.
- No ternary operators, in any project. Set a default value and overwrite it in an `if`; where the branch varies by state or type, use polymorphism.
- Private members in TypeScript use the `private` keyword, never `#`, in any project.
- A style rule Xavier states belongs here, not in a project's `decisions.md`, unless he scopes it to one project.
- Code carries no comments, in any project. Intent lives in names, small units and tests; the why of a decision goes in that project's `CLAUDE.md`.
- A rename that resolves a semantic clash covers every derived name: classes, errors, codes, contract schemas, messages, test titles. Search the old term across source, tests and contract, and keep it only where it names the other meaning.
- A function leaves its arguments unchanged. To gather results, return a new value (an object whose methods return the next one) and reassign it in the caller's loop. A helper that writes into what it receives hides its effect from the caller.
- A public method reads as pseudocode: a sequence of calls to private methods, one per thing it handles (`readCallId`, `readBody`). Stop at that level; keep predicates and lookups inside the private method as explaining variables.
- A callback passed as a prop or argument that carries a rule (a predicate, what to render) is a named function declared above the component (`hasNoAlbums`, `showAlbums`), not an inline arrow. The JSX then reads as a declaration of what shows in each state.
- A helper used by one component lives beside it. When a second consumer appears, move it up: to `domain/` if it is a type shared across the app, otherwise to the nearest folder both consumers share. A flat `lib/` is only for what is neither.

## Layout

- **Project**: a directory directly inside `Sandbox/` that is its own git repository and has its own `CLAUDE.md`, or an umbrella directory of several repos (see Harnesses). The folder name is the project name. Anything smaller is not a project.
- `Sandbox/`: the single home for every project PrometeuZZ creates or works on. It is the `Sandbox/` directory at the root of this repo (`~/sandbox/PrometeuZZ/Sandbox/`), so resolve every `Sandbox/...` path from the repo root, never from `~/sandbox/`. The rule applies to new projects; existing ones in `~/sandbox` are left alone.
- `Sandbox/TMP/`: read-only references and scratch material (e.g. clones of reference repos). We read from it, never build in it. It can be deleted at any time without losing work.
- Each project keeps `reference/` (research material), `specs/` (step-by-step plans) and `docs/` (functional concepts) inside its own `.claude/`, never at the project root. Put new ones there without asking.
- A file Xavier asks for with no path goes in the root of the project's `.claude/` (the harness's, for an umbrella), never in the PrometeuZZ root. `.claude/docs/` holds functional concepts only.

## Current project

fotoAlbum (umbrella, `Sandbox/fotoAlbum/`). Xavier names another, or asks for a known project; this section is then updated.

When the user says "let's work" (or similar) without naming a project, work in the current project: read its `CLAUDE.md` and do all changes there, not in PrometeuZZ. With none, ask which project.

Known projects, with repos and references: `.claude/projects.md`. Read it when Xavier names a project, asks which exist, or a project is created.
