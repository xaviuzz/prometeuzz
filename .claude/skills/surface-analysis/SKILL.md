---
name: surface-analysis
description: Surface analysis of a spec's change, one reason for change at a time, finding the tidies that make the change easy. Use for step 1 of every spec ("Change surface analysis"), "análisis de superficie", "tidy first".
---

Tidy First: make the change easy, then make the easy change. This skill finds what to tidy and how hard the change is; the spec's steps carry the solution.

1. Read the spec in full, the docs it names and the project's `CLAUDE.md` (its repos and commands). Name the spec's **reasons for change**: the distinct causes that make code change, taken from its draft steps. One reason can span several steps and repos. Done when every draft step belongs to one reason; give the reasons as one numbered line, by dependency.
2. Take one reason. Read the code for its surface. For each thing that changes, count callers and implementers with Grep, find the tests that touch it and whether a helper already concentrates them, and name what catches a miss (typecheck, a contract test, lint, nothing). Done when every claim cites a file; what you did not open is marked "to verify".
3. Report the reason in the conversation: the files that change and why (new, changes, stays), the difficulty (low, medium or high, with its causes) and the tidies. A tidy is a structural change that makes this change easier: duplication the change would copy, a missing seam, a name that would lie, a type copied by hand. Each tidy names the test that protects it and the step it eases. Done when each tidy has its protecting test, or you say none was found and where you looked.
4. Wait for Xavier's go-ahead before the next reason; his answer may add or drop tidies.
5. After the last reason, rewrite the spec:
   - Each tidy becomes its own structural step, before the step it eases, numbered by dependency with "eases step N".
   - Apply the corrections to existing steps (a criterion that cannot hold, a surface a step missed).
   - Move each finding into the step it conditions.
   - Each step's tests need only what earlier steps built; move a test that needs a later step into the step that builds it.
   - Keep the file inventory in the conversation; it goes stale once the code is written.
   - Keep every step a top-level `- [ ]` line, because `next-step.sh` counts only those.

   Done when Xavier confirms the list; only then mark step 1 `- [x]`.
