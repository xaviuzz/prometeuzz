---
name: move-ts-files
description: Moves TypeScript files between folders and rewrites every relative import in src and test. Use when reorganizing folders or renaming files in a TS project.
---

Run `python3 -I <skill-dir>/move.py <project-root> old=new [old=new ...]`, with paths relative to the project root.

1. Pass src and its mirrored test files in the same call, so imports stay consistent.
2. Remove the folders the move left empty: `find src test -type d -empty -delete`.
3. Run the project's lint fix (the move can break import order), then tests, typecheck and build.

`move.py` rewrites only relative imports in `*.ts`. When the project imports through an alias (`@/`) or moves a `.tsx`, move the files with `mv` and rewrite each alias with `sed -E "s#\"@/old/Name\"#\"@/new/Name\"#g"` over `src` and `test`. Check with `grep` that no old path remains.

A file that moves to a deeper or shallower folder keeps its relative imports (`../../support/X`). Before the checks, run `grep -rn '"\.\./' <moved folders>` and fix each depth by hand; `move.py` skips them in `.tsx`.

A move is done when all four pass and no empty folder remains.
