---
name: next-step
description: Finds the next unmarked step of a project's specs, or of its deltas in a legacy project. Use first for "next step", "siguiente step", "siguiente paso", or "what's next" in a project with specs or deltas.
---

1. Run `.claude/skills/next-step/next-step.sh <project>`, with the project named by Xavier or the one in "Current project" of `CLAUDE.md`.
2. The script reads `specs/`, or `deltas/` in a legacy project. It prints, for each spec or delta with open steps, newest file first: its path, steps done and open, and its first unmarked step.
3. Take the first spec as the next step. When others print, name them in one line and ask which one Xavier means before going on.
4. Read that spec in full and the docs it names, then continue with what Xavier asked (planning goes through `mattpocock-skills:grilling`).

Done when the step is named with its spec and number, taken from the script output and not from memory.
