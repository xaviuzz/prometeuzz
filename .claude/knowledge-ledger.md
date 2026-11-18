# Knowledge ledger

What Xavier understands of the technologies and practices he asks to monitor, in any project. The ledger measures his understanding, not what Claude explained.

## Areas

An area is a technology or practice (Rust, functional programming, TDD). `.claude/concepts/<area>.md` existing is what monitors it; no file, nothing traced and nothing blocked.

- "Monitoriza X": create the file with the table below. Propose first the concepts that seed it.
- Stop monitoring: Xavier says so; propose deleting the file and wait.

## Table

Columns: Concept, Requires, Depth, Where it came up (`project: item`).

`Requires` lists the concepts that must be understood first, comma-separated; one from another area is `area: concept`. Claude proposes the `Requires` of every new row as a numbered list; the row enters after Xavier approves. In an area whose graph was reviewed, an empty cell means no prerequisites; in one not yet reviewed, it means not yet proposed. Review an area's graph only when Xavier asks.

## Depth

| Depth | Meaning | Who sets it |
|---|---|---|
| `unseen` | no understanding yet; the row may exist so its `Requires` and origin survive | Claude, when a prerequisite is below `applied` |
| `seen` | explained in one line | Claude, after explaining |
| `explained` | rule plus example | Claude, after explaining |
| `applied` | Xavier used it with help, or recognized it in other code | Claude proposes with the evidence; Xavier confirms |
| `solid` | Xavier uses it alone, or explains it in his own words | Claude proposes with the evidence; Xavier confirms |
| `teachable` | Xavier taught it, or decided a design with it | Claude proposes with the evidence; Xavier confirms |

Put the evidence in "Where it came up". Nothing lowers a depth until Xavier says he forgot the concept. Only exercises and Xavier's own explanations raise one. `check-understanding` is a separate strategy and never sets one.

## Gate

A concept is **blocked** when any of its `Requires` is below `applied` (`unseen` included). A row may raise its own bar to `solid` with a note.

- Blocked: do not explain it and, in a project whose `CLAUDE.md` has `## Learning`, do not use it in code. Outside such a project, warn about the gap in one line and continue.
- Stop and propose the shortest path: the missing prerequisite plus one minimal exercise where Xavier uses it. Wait for his go-ahead. After he uses it, propose raising the row to `applied`.
- Unblocked: skip `solid` and above, one line for `seen`, full explanation for the rest, then record the depth.
- A concept with no row: propose its `Requires` first, then apply the gate.

## Advancing an area

When Xavier asks to advance in an area:

1. Look in `.claude/projects.md` for a learning project of that area. If there is one, run the exercises in it.
2. If there is none, run them in `Sandbox/TMP/exercises/<area>/<concept>/`.
3. Write each exercise so that a solution that breaks the concept fails on any date or machine: pin time, randomness and environment in the test inputs.
4. Xavier writes the solution; Claude proposes the exercise and gives hints. Record the evidence in the ledger row, since TMP can be deleted at any time and the row is what lasts.

Explanations stay in chat. In a learning project the code and its tests are the lasting artifact; in TMP only the ledger row lasts.
