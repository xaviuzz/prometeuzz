---
name: review-decisions
description: Reviews a project's recorded decisions for obsolete text, contradictions, duplication, fusions, missing whys and oversized index areas. Use for "revisar las decisiones", "review decisions", or when asked to find inconsistencies or merge decisions in a project's `decisions.md`.
---

A review that keeps the decisions true to the code, one decision per fact, and the index small enough to read by area. Every change is explained before it runs and runs only on Xavier's yes.

The project's `decisions.md` indexes one file per decision under `decisions/`, in the project's `.claude/` (the harness's, for an umbrella). `check-index.sh <that .claude folder>` prints OK when every file has one index line, every line has a file, and no area passes 15; run it after every step.

## 1. Frame

Locate the project's `decisions.md`. Read the index and every decision file. Done when each decision has been read.

Index not shaped as above: stop and propose converting it first.

## 2. Catalog

Check each decision against these classes, and against the code (read the files it names) and the docs before stating any finding as fact; a finding not checked is marked "not verified". Specs are history: never evidence, so a decision's mention of a spec is not checked against it:

- **a. Replaced**: a decision another one replaced, still indexed.
- **b. Obsolete**: text that no longer matches the code, the docs or another decision.
- **c. Contradiction**: two decisions that cannot both hold.
- **d. Duplication**: the same fact in two decisions; a candidate to fuse or reduce.
- **e. No why**: a decision that gives no reason.
- **f. Oversized area**: an index area past 15 (`check-index.sh`).
- **g. Tension**: a conflict whose resolution is Xavier's design choice.

Done when every decision has been tested against all seven and every finding has its evidence.

## 3. Report

Write `.claude/decisions-review.md`: open questions first, then checkbox steps numbered by dependency: **A** corrections (a, b, c, e), **B** fusions (d), **C** area split (f, counted after B), **D** tensions (g). One line per step: the files, what is wrong, the proposed action. Show it to Xavier. Done when Xavier has read it.

## 4. Run, one step at a time

For each unmarked step, in order:

1. Re-check the facts against the code.
2. Explain: what is true, what is wrong, the proposed text, the checks, and the revert (`git checkout` of the files, which Xavier runs).
3. Wait for the yes.
4. Apply, run `check-index.sh`, mark the box.

Done when the index is consistent and the box is marked. Steps that fix the same text together are done together.

Choosing the action for overlap:

- **Fuse** when the decisions tell the same thing from different angles.
- **Reduce** when only facts repeat; keep the file and cut the repetition.
- **Keep apart** when a decision has its own why or its own revisit trigger.
- A decision absorbed is deleted with no note; a decision that really changed keeps a short summary of what it replaced, never a link to a deleted file.

Before deleting or renaming a decision, search its name in the index, `specs/`, `docs/` and the repos' `CLAUDE.md`, and fix each reference in the same change. In closed specs fix names only, not vocabulary.

A step that needs code, tests or a repo's `CLAUDE.md` asks for permission first. For code, run that repo's tests and lint before closing the step.

Git is read-only.

## 5. Tensions

For class g, run `grilling` one round at a time. Write only after Xavier confirms the shared understanding.

## 6. Close

With every box marked, show the balance: decisions before and after, areas, corrections, fusions. Ask before deleting `.claude/decisions-review.md`.
