---
name: learn
description: Review the current session for lessons worth keeping and propose where each belongs. Optional argument narrows the focus.
disable-model-invocation: true
---

Review this whole session for **lessons**. If an argument was given, review only that focus. Write nothing until the user approves.

## 1. Collect

Scan the session for:

- corrections the user gave
- approaches the user confirmed
- project facts that code and git cannot tell
- repeated workflows that could become a skill
- friction: failed attempts and wasted detours
- the user's preferences and vocabulary

Keep a lesson only when it passes both tests:

- **Evidence**: quote or point to the exact moment in the session. No evidence, drop it.
- **Durable**: it will matter in a future session, and the repo, git history or environment cannot already tell it.

## 2. Check what exists

Read the project `CLAUDE.md` and the existing skills. Add the global `~/.claude/CLAUDE.md` and agents when they exist.

For each lesson:

- Already recorded: drop it.
- Contradicts an entry: propose an edit or removal.
- Stale entries you notice along the way: propose their removal.

## 3. Choose a destination

Pick one per lesson and give the reason:

- project `CLAUDE.md`
- global `~/.claude/CLAUDE.md`
- new skill, or edit to an existing skill
- new agent
- hook or setting (via `update-config`)

## 4. Draft

Load `mattpocock-skills:writing-for-agents` and write each entry to its rules: short, imperative, with the why. Use the language of the target file; ask the user when the file is in Spanish.

## 5. Propose

Present at most 5 proposals, highest value first, as a numbered list. Each has:

- **Lesson**: one line
- **Evidence**: the moment in the session
- **Destination**: where, and why there
- **Text**: the exact text to add, or the diff for an edit or removal

With no lesson left, say "nothing to learn" and stop.

End by asking for a reply such as "1, 3 yes, 2 no". Write only the approved items, then list what changed.
