# Migrations

## What it is

The way Sorzs brings what it has already saved up to date with the shape the current version expects. A new version of Sorzs may keep more things, or keep them differently; what an earlier version saved must keep working without anyone touching it.

## What defines it

- A numbered list of changes, in the order they were made. Number 1 is the first shape Sorzs ever kept.
- The number of the last change applied to what is saved. A newly created store is at 0 and a fully updated one is at the last number of the list.
- Each change does one thing: create something Sorzs keeps, add a detail to it, or rewrite what was saved in an old form.

## Rules

- When the service starts, and before it serves anyone, it applies every change after the store's number, in order, and records each number as it goes. A store already at the last number is left as it is.
- A change is applied whole or not at all. If one fails, the store stays as it was before that change, the earlier changes keep their number, and the service does not start; it says which change failed and why.
- A store at a number higher than the last one this version knows was written by a newer version. The service refuses to start and touches nothing, so an old image never damages data saved by a newer one.
- Changes only go forward. Going back means restoring a copy of the saved file made before the update.
- The first four changes accept a store that already has their effect, because stores saved before the numbers existed are at 0 but hold some or all of those effects. They are creating the list, adding its owner (given to `xaviuzz` for earlier entries), rewriting the old identifier key of each entry, and creating the users. After them such a store is at 4, and every later change is strict.
- The users named in the service setup are not a change. They are checked at every start, as `user.md` says.
- Changing a change that was already applied somewhere is not allowed; a correction is a new change at the end of the list.
- One list serves everything Sorzs keeps, since it is kept in one file.

## What can be done with it

Nothing by hand. Updating is part of starting. Adding a change is a development task: it goes at the end of the list with its own tests.

## Out of scope

Going back to an earlier number, running the changes without starting the service, a dry run or a status report, copies made before updating, keeping separate lists for separate parts of what Sorzs saves.

## Open questions

When the service is deployed, whether a copy of the file before updating should become automatic. Not decided; it would be its own plan.
