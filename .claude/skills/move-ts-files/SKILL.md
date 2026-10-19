---
name: move-ts-files
description: Moves TypeScript files between folders and rewrites every relative import in src and test. Use when reorganizing folders or renaming files in a TS project.
---

Run `python3 -I <skill-dir>/move.py <project-root> old=new [old=new ...]`, with paths relative to the project root.

1. Pass src and its mirrored test files in the same call, so imports stay consistent.
2. Remove the folders the move left empty: `find src test -type d -empty -delete`.
3. Run the project's lint fix (the move can break import order), then tests, typecheck and build.

A move is done when all four pass and no empty folder remains.
