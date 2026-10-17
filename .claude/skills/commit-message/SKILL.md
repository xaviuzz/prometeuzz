---
name: commit-message
description: Commits the uncommitted delta as a series of one-line gitmoji commits, each approved one by one. Use for "commit message", "mensaje de commit", "commit this", or "what do I commit".
---

Plan every commit for the uncommitted changes of each repository, then run them one at a time. Xavier approves each commit in a question that lists its files and message; the hook `git-read-only.sh` lets the safe `add` and `commit` through without a prompt.

## 1. Find the repositories

Work from absolute paths with `git -C`, whatever the shell directory is.

- Without an argument, the repositories are PrometeuZZ (`/home/xaviuzz/sandbox/PrometeuZZ`) and every project directly inside `Sandbox/` except `TMP/`. A directory counts only when `git -C <dir> rev-parse --show-toplevel` prints that same directory.
- A directory inside `Sandbox/` that is not a repository is an umbrella (see `.claude/harnesses.md`): its direct children that count as repositories join the list.
- With an argument, the only repository is `Sandbox/<argument>`; when that is an umbrella, its repositories.

## 2. Read each delta

Per repository, read-only git: `git -C <repo> status --short`, `git -C <repo> diff HEAD`, and open each untracked file. The delta is all of it, staged or not.

Clean repository: skip it. All clean: say so and stop.

## 3. Check the shape

Per repository, your rule: structural and behavioral changes never share a commit. Sort each file as structural (refactor, rename, move, format) or behavioral.

Group the files into commits, one group per change, so no group mixes structural with behavioral. Order the groups so each leaves the build green: structural first.

A single file holding both kinds cannot be split (no `add -p`): warn, and commit it with the dominant group.

Files already staged form the first group as they are. A file with both staged and unstaged changes: warn and leave it out for Xavier.

## 4. Compose

One message per group.

`<gitmoji> <summary>`

- Gitmoji: the Unicode character from the table below, chosen by the dominant change.
- Summary: imperative, English, at most 72 characters in total, lowercase start, no trailing period. Names the change in domain vocabulary, never the files.
- Reword until the summary holds no quote and none of `; | & ( ) ` $ > \`: the hook blocks a message it cannot parse safely.

| Gitmoji | Change |
|---|---|
| ✨ | new behavior |
| 🐛 | bug fix |
| ♻️ | refactor, structural only |
| ✅ | tests |
| 📝 | docs |
| 🔥 | remove code or files |
| 🎨 | formatting, tidying |
| ⚡️ | performance |
| 🔧 | config |
| 📦 | dependencies |
| 🏗️ | architecture or layout |
| 🚚 | move or rename |
| 🧪 | experiment |
| 🎉 | initial commit |
| 🤖 | agent docs and skills (`CLAUDE.md`, `.claude/`) |

## 5. Present the plan

Print the plan first: per repository, each commit in order as its message followed by its files.

## 6. Commit, one by one

For each commit in order:

1. Ask with AskUserQuestion. The question is the message. The first option, "Commit", carries a `preview` that lists the files one per line; the other options are "Skip" and "Stop". Show no git command.
2. On "Commit", run one Bash call: `git -C <repo> add -- <file> <file> && git -C <repo> commit -m '<message>'`. Paths are explicit and repo-relative; the already-staged group runs the `commit` alone. The message has single quotes and no other flag.

The answer to the question is the approval. Run nothing for a commit before its "Commit".

"Skip" moves to the next commit. "Stop" ends the run. On "Stop", report what was committed and what remains. A hook block: reword or fix the shape, never work around it.

Done when every group is committed or declined. Report any message that is not one line, does not start with a table gitmoji, or exceeds 72 characters.

## Examples

| Delta | Message |
|---|---|
| New `RhythmMeter` class with its test | ✨ add rhythm meter for sentence length |
| Null check missing in `parseNote`, test added | 🐛 handle empty note in parser |
| Tests extract a `SUT` class, no expectation changed | ♻️ extract SUT from rhythm tests |
| `README.md` install section rewritten | 📝 clarify install steps |
| `src/util/` folder moved to `src/core/` | 🚚 move util into core |
| Edited `CLAUDE.md` plus a new skill | 🤖 add commit-message skill |
| Refactor of `Parser` plus a new `Tokenizer` feature | ✨ add tokenizer to parser (plus a warning outside the message: split the refactor into its own commit) |
