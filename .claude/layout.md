# Layout

- **Project**: a directory directly inside `Sandbox/` that is its own git repository and has its own `CLAUDE.md`, or an umbrella directory of several repos (see `.claude/harnesses.md`). The folder name is the project name. Anything smaller is not a project.
- `Sandbox/`: the single home for every project PrometeuZZ creates or works on. It is the `Sandbox/` directory at the root of this repo (`~/sandbox/PrometeuZZ/Sandbox/`), so resolve every `Sandbox/...` path from the repo root, never from `~/sandbox/`. The rule applies to new projects; existing ones in `~/sandbox` are left alone.
- `Sandbox/TMP/`: read-only references and scratch material (e.g. clones of reference repos). We read from it, never build in it, except the exercises that advance a monitored area with no learning project (`.claude/knowledge-ledger.md`). It can be deleted at any time without losing work.
- Each project keeps `reference/` (research material), `specs/` (step-by-step plans) and `docs/` (functional concepts) inside its own `.claude/`, never at the project root. Put new ones there without asking.
- A file Xavier asks for with no path goes in the root of the project's `.claude/` (the harness's, for an umbrella), never in the PrometeuZZ root. `.claude/docs/` holds functional concepts only.
- A mod made with `plugin-authoring` lives in `~/.claude/dev-mods/<session-id>/` and loads only in that session. To load it in every PrometeuZZ session, keep it in `.claude/skills/<name>/` (`context-band` is there).
