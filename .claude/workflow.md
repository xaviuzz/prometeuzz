# Workflow

## Tests and refactoring

- Tests assert on public behavior. Never widen visibility (`pub`, `export`, a public accessor) only so a test can reach something; test the rule through the behavior that uses it, or delete a test that only reads internals.
- Close every test you finish with the `extract-sut` skill: a test is done once its body reads as behavior only. Value-object tests are exempt.
- Run the project's tests after every refactor step, including a move or rename, before the next step or the report.
- After moving or renaming a folder, list the old location (source and tests) and remove what it left empty. Passing tests do not show a stray file or an empty folder.
- Do the simplest thing that passes, then refactor. Rule of three before abstracting.
- The rule of three gates abstractions shared between types, not wrapping a primitive. A primitive that carries a rule or an identity becomes a value object at first use (`Binding`, `UserAlbumId`); do not propose waiting.
- After a value object appears, search the codebase for Feature Envy toward it (code that parses, compares or inspects its primitive) and propose moving each case into it. A proposal is a list; move nothing until Xavier approves.
- In a TDD run, agree the seam once, then run every planned cycle in one go. Report at the end of the run, or earlier when a cycle contradicts the plan.

## Docs, decisions and specs

- Define each functional concept of a project in `.claude/docs/<concept>.md` before building it: what it is, what defines it, its rules, what can be done with it, what is out of scope, open questions. Write it in English, in business language, without programming terms (no class or field names), after grilling Xavier on the concept. Choose and scope every slice or spec from the docs it touches: read them first, name them in the spec, and update the doc in the same change when a rule is added or changed.
- Record each project decision and its why in that project's `.claude/decisions.md` when it is made; create the file if the project has none, and point to it from the project's `CLAUDE.md`. The repo cannot tell it later. Past three decisions, make `decisions.md` an index by area with one file per decision in `.claude/decisions/` (title as heading, a line in the index for each file), so a session reads only the area it works in. Decisions carry no date; the history holds it.
- End every spec you write or document with a `## Diagram` section: a Mermaid diagram of the feature's flow (sequence for interactions, flowchart or state for rules).
- Every new spec's step 1 is the surface analysis, written as `- [ ] 1. Change surface analysis, no code: run the `surface-analysis` skill on this spec. Done when Xavier confirms the list and the spec carries the tidies and corrections it found.` Write the draft steps first; the skill checks them against the code and rewrites them. Specs written before this rule and the deltas of legacy projects have no such step.
- Mark each step of a spec as done (`- [x]`) when its tests, lint and build pass. "Next step" is the first unmarked one. The code cannot tell which step a file belongs to. A step the spec says is tried by hand is marked only after Xavier confirms it.
- When Xavier asks that something be kept up to date whenever an event happens, write the rule in the project's `CLAUDE.md` and add a PostToolUse hook with its test in `.claude/hooks/` in the same change. A rule in prose is not enforced.
- When moving, renaming or deleting a documented section, search `.claude/` (skills, specs, hooks, templates) for references to it by name and fix them in the same change.
