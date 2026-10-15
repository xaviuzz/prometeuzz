#!/usr/bin/env bash
# Plain-bash tests for git-read-only.sh. Run: bash .claude/hooks/test-git-read-only.sh
set -u

hook="$(dirname "$0")/git-read-only.sh"
failures=0

bash_input() { jq -n --arg c "$1" '{tool_name: "Bash", tool_input: {command: $c}}'; }
file_input() { jq -n --arg t "$1" --arg p "$2" '{tool_name: $t, tool_input: {file_path: $p}}'; }

expect() {
  local want=$1 json=$2 label=$3 status got
  "$hook" <<<"$json" >/dev/null 2>&1
  status=$?
  case $status in
    0) got=allow ;;
    2) got=block ;;
    *) got="error($status)" ;;
  esac
  if [[ $got != "$want" ]]; then
    echo "FAIL expected $want, got $got: $label"
    failures=$((failures + 1))
  fi
}

allow_cmd() { expect allow "$(bash_input "$1")" "$1"; }
block_cmd() { expect block "$(bash_input "$1")" "$1"; }
allow_file() { expect allow "$(file_input "$1" "$2")" "$1 $2"; }
block_file() { expect block "$(file_input "$1" "$2")" "$1 $2"; }

# --- git reads
allow_cmd 'git status'
allow_cmd 'git -C ../x log --oneline'
allow_cmd 'git --no-pager diff | head'
allow_cmd 'git log 2>/dev/null'
allow_cmd 'git log 2>&1'
allow_cmd 'git show HEAD'
allow_cmd 'git blame f'
allow_cmd 'git ls-files'
allow_cmd 'git ls-tree HEAD'
allow_cmd 'git rev-parse HEAD'
allow_cmd 'git remote'
allow_cmd 'git remote -v'
allow_cmd 'git remote get-url origin'
allow_cmd 'git branch'
allow_cmd 'git branch --list'
allow_cmd "git branch --list 'feat*'"
allow_cmd 'git branch -a'
allow_cmd 'git branch --show-current'
allow_cmd 'git tag --list'
allow_cmd "git tag -l 'v*'"
allow_cmd 'git config --get user.name'
allow_cmd 'git config --list'
allow_cmd 'git stash list'
allow_cmd 'git reflog'
allow_cmd 'git reflog show'
allow_cmd 'git status && git log | head'

# --- git clone into Sandbox/
allow_cmd 'git clone https://github.com/xaviuzz/pintafrases.git Sandbox/pintafrase'
allow_cmd 'git clone git@github.com:xaviuzz/pintafrases.git Sandbox/pintafrase'
allow_cmd 'git clone https://github.com/x/y.git Sandbox/TMP/y'
allow_cmd "git clone https://github.com/x/y.git $(cd "$(dirname "$0")/../.." && pwd)/Sandbox/y"

# --- git writes
block_cmd 'git'
block_cmd 'git add .'
block_cmd 'git commit -m x'
block_cmd 'git push'
block_cmd 'git pull'
block_cmd 'git fetch'
block_cmd 'git init'
block_cmd 'git clone https://example.com/r'
block_cmd 'git clone https://example.com/r r'
block_cmd 'git clone https://example.com/r ../r'
block_cmd 'git clone https://example.com/r /tmp/r'
block_cmd 'git clone https://example.com/r Sandbox'
block_cmd 'git clone https://example.com/r Sandbox/TMP'
block_cmd 'git clone https://example.com/r Sandbox/../r'
block_cmd 'git clone https://example.com/r Sandbox/a/b'
block_cmd 'git clone --depth 1 https://example.com/r Sandbox/r'
block_cmd 'git clone -c core.fsmonitor=x https://example.com/r Sandbox/r'
block_cmd 'git -C /tmp clone https://example.com/r Sandbox/r'
block_cmd 'git clone /local/repo Sandbox/r'
block_cmd 'git clone ext::sh Sandbox/r'
block_cmd 'git clone https://example.com/r Sandbox/r Sandbox/s'
block_cmd 'git clone https://example.com/r Sandbox/r && git push'
block_cmd 'git checkout main'
block_cmd 'git switch -c x'
block_cmd 'git reset --hard'
block_cmd 'git restore f'
block_cmd 'git merge x'
block_cmd 'git rebase x'
block_cmd 'git stash'
block_cmd 'git stash pop'
block_cmd 'git clean -fd'
block_cmd 'git rm f'
block_cmd 'git mv a b'
block_cmd 'git branch x'
block_cmd 'git branch -d x'
block_cmd 'git branch -m main'
block_cmd 'git tag v1'
block_cmd 'git tag -a v1 -m x'
block_cmd 'git config user.name x'
block_cmd 'git config --unset user.name'
block_cmd 'git config --get a --add b'
block_cmd 'git remote add o u'
block_cmd 'git reflog expire --all'
block_cmd 'git reflog delete x'
block_cmd 'git diff --output=f'
block_cmd 'git log > out.txt'
block_cmd 'git -c core.pager=x log'

# --- git writes hidden in compounds and wrappers
block_cmd 'ls && git push'
block_cmd 'ls; git commit -m x'
block_cmd 'echo $(git reset)'
block_cmd 'echo `git reset`'
block_cmd 'bash -c "git commit -m x"'
block_cmd 'eval "git add ."'
block_cmd 'FOO=1 git commit'
block_cmd '/usr/bin/git commit'
block_cmd 'g=git; $g commit'
block_cmd 'git status | git commit -F -'

# --- gh
allow_cmd 'gh pr view 12'
allow_cmd 'gh pr list'
allow_cmd 'gh pr diff 12'
allow_cmd 'gh pr checks 12'
allow_cmd 'gh pr status'
allow_cmd 'gh issue view 3'
allow_cmd 'gh issue list'
allow_cmd 'gh issue status'
allow_cmd 'gh repo view'
allow_cmd 'gh run view 1'
allow_cmd 'gh run list'
allow_cmd 'gh auth status'
block_cmd 'gh pr create'
block_cmd 'gh pr merge 1'
block_cmd 'gh pr comment 1 -b x'
block_cmd 'gh issue create'
block_cmd 'gh repo clone x/y'
block_cmd 'gh api repos/x/y'
block_cmd 'gh'

# --- bash touching .git/ directly
allow_cmd 'ls -A .git'
allow_cmd 'cat .git/config'
block_cmd 'rm -rf .git'
block_cmd 'echo x > .git/config'
block_cmd 'mv .git .git.bak'

# --- unrelated commands and the hook's own files
allow_cmd 'echo hello'
allow_cmd 'npm test'
allow_cmd 'cat .gitignore'
allow_cmd 'bash .claude/hooks/test-git-read-only.sh'

# --- Edit and Write
block_file Edit 'repo/.git/config'
block_file Write '.git/hooks/pre-commit'
block_file Write './.git/x'
block_file Edit '/home/u/repo/.git/HEAD'
allow_file Edit 'repo/.gitignore'
allow_file Write 'repo/.gitattributes'
allow_file Edit 'src/main.ts'
allow_file Write 'repo/.github/workflows/ci.yml'

# --- other tools and broken input
expect allow "$(file_input Read 'repo/.git/config')" 'Read of .git/config'
expect block 'not json' 'unreadable input'

if ((failures > 0)); then
  echo "$failures failing"
  exit 1
fi
echo "all passing"
