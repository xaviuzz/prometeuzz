---
name: clean
description: Empty Sandbox and Sandbox/TMP, keep their directories and .gitkeep files, and reset the current project to None. User-invoked only.
disable-model-invocation: true
---

Reset the workspace. Resolve every path from the PrometeuZZ root, `/home/xaviuzz/sandbox/PrometeuZZ`, never from `~/sandbox/`. Abort when `CLAUDE.md` is not there.

## 1. List the entries

Entries are everything directly inside `Sandbox/` except `TMP` and `.gitkeep`, plus everything directly inside `Sandbox/TMP/` except `.gitkeep`.

Done when you hold the full list of absolute paths. Empty list: skip to step 4.

## 2. Audit the projects

For each entry directly inside `Sandbox/` that is a repository (`git -C <entry> rev-parse --show-toplevel` prints the entry itself), run read-only git:

- `git -C <entry> status --short`: uncommitted work
- `git -C <entry> log @{u}..`: unpushed commits

A repository with no upstream counts as unpushed. `Sandbox/TMP/` holds read-only references, so it needs no audit.

Done when every repository entry is marked clean or at-risk, with the evidence.

## 3. Confirm

Print the entry list. At-risk entries lead the list, each with its evidence.

- At-risk entries exist: wait for an explicit "yes". Anything else cancels the run.
- All clean: continue without asking.

## 4. Delete

Xavier's `/clean` is explicit authorization to delete every listed entry, `Sandbox/TMP/` included. Run both commands as written, one per directory, with absolute paths:

```
find /home/xaviuzz/sandbox/PrometeuZZ/Sandbox -mindepth 1 -maxdepth 1 -not -name TMP -not -name .gitkeep -exec rm -rf {} +
find /home/xaviuzz/sandbox/PrometeuZZ/Sandbox/TMP -mindepth 1 -maxdepth 1 -not -name .gitkeep -exec rm -rf {} +
```

Done when `ls -A` shows `Sandbox/` holding only `TMP` and `.gitkeep`, and `Sandbox/TMP/` holding only `.gitkeep`.

## 5. Reset the current project

In `CLAUDE.md`, replace the body of the `## Current project` section with:

```
None. Xavier names one, or asks for a known project; this section is then updated.
```

Leave `## Known projects` untouched: it is the record that lets a deleted project be cloned again.

Done when the section reads as above. Report what was deleted and that no project is active.
