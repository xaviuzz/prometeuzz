# Learning projects

A learning project's deliverable is Xavier's understanding of a technology. The software is the vehicle.

Declared twice: a `## Learning` section in the project's `CLAUDE.md` (technology, ledger path) and the kind in `.claude/projects.md`.

The "learn" skill reviews a session for lessons. It is unrelated to learning projects.

What teaches best wins ties against brevity, cleverness and performance. A project may narrow this.

## Behavior

1. Before explaining or using a concept, apply the gate of `.claude/knowledge-ledger.md`.
2. Run the first cycles of a new kind of step one at a time, each explained. The spec marks them ("runs alone, explained"); when writing a spec, mark every cycle that introduces a concept missing from the ledger or raises one a level. The remaining cycles run in one go. This replaces "agree the seam once, then run every cycle in one go".
3. Add a dependency, framework or abstraction only when a failing test needs it. Record its why in the project's `CLAUDE.md`.
4. Choose the plain construct over the idiomatic one when it teaches better. Record the choice in the project's `CLAUDE.md`.
5. When Xavier asks what a symbol means, answer with the language's rule and a two-line example.

Explanations stay in chat. The code and its tests are the lasting artifact.

## Ledger

The ledger and its gate live in `.claude/knowledge-ledger.md`; each area is shared by every project that teaches it.

## Graduation

Xavier declares when the goal is met. The teaching rules turn off in that project; its decisions stay as history. Update its `CLAUDE.md` and `projects.md`.

## New learning project

- Ask Xavier which area to monitor and what depth he wants to reach. Read the ledger, list the blocked concepts and propose the learning order before writing the spec.
- `## Learning` section in its `CLAUDE.md`, pointing here and to the ledger, with the area, the target depth and the learning order.
- Ledger file for the technology, created if missing.
- `projects.md` entry with the kind.
- Spec with the teaching cycles marked.
