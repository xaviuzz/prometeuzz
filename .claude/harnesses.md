# Harnesses

A **harness** is the Claude setup of a project whose upstream has none: its `CLAUDE.md` and `.claude/` (specs, reference). It lives in `harnesses/<name>/` at the PrometeuZZ root, tracked by PrometeuZZ. The project in `Sandbox/` only links to it, so `/clean` never loses it and the fork never commits it.

## Layout

- `harnesses/<name>/CLAUDE.md`
- `harnesses/<name>/.claude/`

## Attach

Run when a project with a harness is cloned into `Sandbox/`, or when Xavier asks to work on it. Done when both links resolve and the project's `git status` lists neither.

1. Clone the project if `Sandbox/<name>` is missing (see `.claude/git-policy.md`).
2. Link both: `ln -s <root>/harnesses/<name>/CLAUDE.md Sandbox/<name>/CLAUDE.md` and `ln -s <root>/harnesses/<name>/.claude Sandbox/<name>/.claude`, absolute targets.
3. Ask Xavier to run `! printf 'CLAUDE.md\n.claude\n' >> Sandbox/<name>/.git/info/exclude` once per clone. Claude never edits `.git/`.

## Detach

Remove the two links and nothing else. Edits made through a link already sit in `harnesses/<name>/`; commit them in PrometeuZZ with `commit-message`.

## New harness

Create `harnesses/<name>/CLAUDE.md`, then attach. Never create the files inside the project first.
