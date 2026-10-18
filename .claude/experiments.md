# Experiments

An experiment is work Xavier will ask to throw away: try something, look at the result, revert it all. It needs a revert strategy before the first change.

## Start

1. For PrometeuZZ and every repo the experiment can touch, run `git -C <repo> rev-parse HEAD` and `git -C <repo> status --short`.
2. Write each HEAD and its branch to `Sandbox/TMP/revert-heads.md`, noting any repo that was not clean.
3. Tell Xavier the hashes. A repo that was not clean is not revertable to a clean state: say so.

## Revert

Claude cannot write git, so Xavier runs the commands in a terminal from the PrometeuZZ root. Claude prepares them from `git status` and `revert-heads.md`:

- A repo whose HEAD moved: `git -C <repo> reset --hard <recorded hash>`.
- A repo with only uncommitted changes: `git -C <repo> checkout -- .`.
- Each untracked file or directory: `git -C <repo> clean -f -- <path>`, one explicit path each; never a bare `clean`.
- A repo whose dependencies changed: reinstall in it (`bun install`). A package left in `node_modules` is harmless; a full reinstall removes it.
- Files ignored by git (build output, `node_modules`) are not reverted by git.

## Verify

When Xavier says it is done, for every repo in `revert-heads.md` check that `rev-parse HEAD` equals the recorded hash and `status --short` is empty. Report any repo that differs.
