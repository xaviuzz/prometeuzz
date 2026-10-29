# Harnesses

A **harness** is the Claude setup of a project whose upstream has none: its `CLAUDE.md` and `.claude/` (specs, reference, docs). It lives in `harnesses/<name>/` at the PrometeuZZ root, tracked by PrometeuZZ. The project in `Sandbox/` only links to it, so `/clean` never loses it and the fork never commits it. An upstream `AGENTS.md` is not a Claude setup: the project still gets a harness, whose `CLAUDE.md` points to it.

## Layout

- `harnesses/<name>/CLAUDE.md`
- `harnesses/<name>/.claude/`

## Attach

Run when a project with a harness is cloned into `Sandbox/`, or when Xavier asks to work on it. Done when both links resolve and the project's `git status` lists neither.

1. Clone the project if `Sandbox/<name>` is missing (see `.claude/git-policy.md`).
2. Link both: `ln -s <root>/harnesses/<name>/CLAUDE.md Sandbox/<name>/CLAUDE.md` and `ln -s <root>/harnesses/<name>/.claude Sandbox/<name>/.claude`, absolute targets.
3. Ask Xavier to run `! printf 'CLAUDE.md\n.claude\n' >> Sandbox/<name>/.git/info/exclude` once per clone. Claude never edits `.git/`.

## Detach

Remove the two links and nothing else. Edits made through a link already sit in `harnesses/<name>/`; the editing tool refuses the `CLAUDE.md` link, so edit `harnesses/<name>/CLAUDE.md` directly. Commit them in PrometeuZZ with `commit-message`.

## Umbrella

An **umbrella** is a harness whose project is a plain directory `Sandbox/<name>/` holding several independent repos (`Sandbox/<name>/<repo>`), worked on as one project. The umbrella is not a repo; each repo keeps its own pipeline and its own committed `CLAUDE.md` for stack and commands. `harnesses/<name>/` holds only what crosses the repos: workflow, specs, decisions.

- Attach: link both files into `Sandbox/<name>/` as above. Skip the `.git/info/exclude` step; there is no `.git`.
- Clone each repo with `git clone <url> Sandbox/<name>/<repo>`.
- `commit-message` finds the repos one level inside the umbrella.

## New harness

Create `harnesses/<name>/CLAUDE.md`, then attach. Never create the files inside the project first.
