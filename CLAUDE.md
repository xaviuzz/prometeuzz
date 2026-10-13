# PrometeuZZ

Personal harness for all of Xavier Gost's (XaV1Uzz) activities as a technologist.
Language, stack and commands depend on each project and live in that project's own `CLAUDE.md`. Do not assume any; read it, or ask or propose.

## Principles

1. **Simplicity**, per John Maeda's *Laws of Simplicity*: reduce, organize, save time, learn, differences, context, emotion, trust, failure, the one. When in doubt, remove.
2. **Best practices in programming**: clear names, small units, no duplication, tests as a safety net, no speculative generality.
3. **Hard object orientation**: behavior lives with the data it belongs to. Tell, don't ask. Avoid anemic models, primitive obsession and procedural code dressed up as classes. Prefer composition over inheritance.
4. **Patterns**: use them when they name a real force in the code, and name them in the code (e.g. `*Strategy`, `*Factory`). Never add a pattern ahead of need.

## Influences

Use their vocabulary and practices as the reference when making design decisions:

- **Martin Fowler**: refactoring catalog, patterns of enterprise architecture, evolutionary design.
- **Kent Beck**: TDD, Extreme Programming, Tidy First, "make the change easy, then make the easy change".
- **Ron Jeffries**: XP, incremental design, "do the simplest thing", the three Cs, working from the story.
- **GeePaw Hill**: Many More Much Smaller Steps (MMMSS), small steps, safe changes, taking the next small, safe step.

## How to work

- Work test-first, in the smallest steps that keep the build green.
- Separate structural changes (refactor) from behavioral changes. Never mix them in one step.
- Do the simplest thing that passes, then refactor. Rule of three before abstracting.
- Record each project decision and its why in that project's `CLAUDE.md` when it is made. The repo cannot tell it later.
- In a TDD run, agree the seam once, then run every planned cycle in one go. Report at the end of the run, or earlier when a cycle contradicts the plan.
- Mark each step of a spec as done (`- [x]`) when its tests, lint and build pass. "Next step" is the first unmarked one. The code cannot tell which step a file belongs to.
- Do not invent facts, APIs or requirements. If something is unknown, say so and ask.
- Do not modify files outside the task without asking. Propose first when scope is unclear.
- Do not add dependencies, frameworks or tooling without asking.
- Never use the auto-memory directory. Durable lessons go in `CLAUDE.md`, skills or agents.

## Git

Claude uses git **read-only, always, with no exception**, even if asked. Writes are done by Xavier (`! git ...`).

- Allowed (read form only): `status`, `log`, `diff`, `show`, `blame`, `ls-files`, `ls-tree`, `rev-parse`, `remote -v`, `branch --list`, `tag --list`, `config --get`, `stash list`, `reflog` (view). `-C <path>` and `--no-pager` are allowed before the subcommand.
- Allowed `gh`: `pr view|list|diff|checks|status`, `issue view|list|status`, `repo view`, `run view|list`, `auth status`.
- Everything else is a write, including `fetch`, `clone`, `init`, `gh api` and any flag that writes (`--output`, `-d`, `-a`, `--set`).
- Never edit anything under `.git/`. `.gitignore` and `.gitattributes` are ordinary files.
- Applies to every repo on this machine.
- Enforced by `.claude/hooks/git-read-only.sh` (fails closed; tests in `.claude/hooks/test-git-read-only.sh`). The hook only runs in sessions started in PrometeuZZ; elsewhere the rule is on trust.
- The hook also blocks any Bash command that mentions `git` or `gh`, even as a search pattern. Search with Grep or Read instead.

## Preferred skills

Reach for these first, before improvising a process:

- `mattpocock-skills:tdd`: building features or fixing bugs test-first.
- `mattpocock-skills:codebase-design`: designing modules, interfaces and seams.
- `mattpocock-skills:domain-modeling`: shared terminology, CONTEXT.md, ADRs.
- `mattpocock-skills:grilling`: stress-testing a plan or decision before building.
- `mattpocock-skills:writing-for-agents`: **always**, before creating or editing any `CLAUDE.md`, `AGENTS.md`, skill or `.md` under a `.claude/` directory, in any project. Load it first, then write. Enforced by `.claude/hooks/agent-docs-need-skill.sh` (fails closed; tests in `.claude/hooks/test-agent-docs-need-skill.sh`). Like the git hook, it runs only in sessions started in PrometeuZZ.
- `commit-message`: one-line gitmoji commit message for the whole uncommitted delta (staged, unstaged, untracked). Project-local by Xavier's choice; like the hooks, it loads only in sessions started in PrometeuZZ. It only prints the message, because git is read-only for Claude. No trailer, so the line stays one line.

## Conventions

- Language: Xavier is Spanish-first. Conversation may be in Spanish or English; reply in the language used. Code, identifiers and commits in English unless told otherwise.
- Name every intermediate result in an explaining variable (Fowler's *Introduce Explaining Variable*), in any project. A chained expression becomes one named step per line.
- Code carries no comments, in any project. Intent lives in names, small units and tests; the why of a decision goes in that project's `CLAUDE.md`.

## Layout

- **Project**: a directory directly inside `Sandbox/` that is its own git repository and has its own `CLAUDE.md`. The folder name is the project name. Anything smaller is not a project.
- `Sandbox/`: the single home for every project PrometeuZZ creates or works on. The rule applies to new projects; existing ones in `~/sandbox` are left alone.
- `Sandbox/TMP/`: read-only references and scratch material (e.g. clones of reference repos). We read from it, never build in it. It can be deleted at any time without losing work.

## Current project

`Sandbox/pintafrase`: an Obsidian plugin that displays the rhythm of the sentences in a note. Reference: `Sandbox/TMP/obsidian-paste-image-as-note`.

When the user says "let's work" (or similar) without naming a project, work in the current project: read its `CLAUDE.md` and do all changes there, not in PrometeuZZ. To switch projects, the user says so and this section is updated.

## Open decisions (to fill as they are made)

- Scope: which activities the harness covers first
