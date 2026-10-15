# Git policy

Claude uses git **read-only, always, with two exceptions** (clone into `Sandbox/`, and approved `add`/`commit`), even if asked. Other writes are done by Xavier (`! git ...`).

- Allowed (read form only): `status`, `log`, `diff`, `show`, `blame`, `ls-files`, `ls-tree`, `rev-parse`, `remote -v`, `branch --list`, `tag --list`, `config --get`, `stash list`, `reflog` (view). `-C <path>` and `--no-pager` are allowed before the subcommand.
- Allowed `gh`: `pr view|list|diff|checks|status`, `issue view|list|status`, `repo view`, `run view|list`, `auth status`.
- First write: `git clone <url> Sandbox/<name>` (or `Sandbox/TMP/<name>`), so a known project can be prepared on request. Only `https://` or `git@host:` sources, exactly two arguments, no flags, no `-C`, no `..` in the destination. The destination must sit inside `Sandbox/`, which is git-ignored, so a clone cannot touch this repo.
- Second write, only through the `commit-message` skill: `git [-C <path>] add -- <explicit paths>` and `git [-C <path>] commit -m '<message>'`. The hook answers "allow" for both, with no permission prompt. The approval is the skill's AskUserQuestion per commit, which lists the files and the message and shows no git command. Why: the permission prompt always shows the command, and Xavier wants to approve files and message only. The cost: only the skill's instructions force the question, not the hook. Blocked shapes: `add .`, `-A`, `-u`, globs, `..`, `.git/`, and `commit` with any flag besides `-m`, so no `--amend`, `-a` or `--no-verify`. A message the hook cannot parse (quotes, `; | & ( ) ` $ >`) is blocked, fail closed.
- Everything else is a write, including `fetch`, `init`, `gh api`, `gh repo clone` and any flag that writes (`--output`, `-d`, `-a`, `--set`).
- Never edit anything under `.git/`. `.gitignore` and `.gitattributes` are ordinary files.
- Applies to every repo on this machine.
- Enforced by `.claude/hooks/git-read-only.sh` (fails closed; tests in `.claude/hooks/test-git-read-only.sh`). The hook only runs in sessions started in PrometeuZZ; elsewhere the rule is on trust.
