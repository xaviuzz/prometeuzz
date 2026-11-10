# The CLI domain is grouped by concept

`cli/src/domain/` holds one folder per concept, as the backend does: `session`, `backend`, `source`, `user`, `terminal`, `failure`. Two folders hold mechanics that cross concepts: `command` (what a command is, the registry, the mode) and `access` (`Access` and `Admission`, which work as a pair). A command lives in the folder of the concept it handles, so `AddSourceCommand` sits beside `Sources`; the census belongs to `source`. `test/domain/` mirrors `src/domain/`.

Why: 78 files in one level hid which ones belong together, and a flat `commands/` folder would have split each command from the thing it handles. `GuardedCall` sits in `failure` because it reports and settles errors, though it uses the session.
