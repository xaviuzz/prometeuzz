#!/usr/bin/env bash
# PostToolUse hook: the word "source" names nothing in Sorzs (see "Language" in Sandbox/Sorzs/CLAUDE.md).
# After an edit under src/, test/ or tests/ of a Sorzs repo, the file must not hold it, except files
# listed in that repo's language-exceptions.txt (one file name per line). Exit 2 hands the message back.
set -u

input=$(cat)
path=$(jq -r '.tool_input.file_path // empty' <<<"$input")

repo_of() {
  [[ $1 =~ ^(.*/Sorzs/[^/]+)/(src|test|tests)/ ]] || return 1
  printf '%s' "${BASH_REMATCH[1]}"
}

is_excepted() {
  local repo=$1 name=$2 listed
  [[ -r $repo/language-exceptions.txt ]] || return 1
  while IFS= read -r listed; do
    [[ -n $listed && $name == "$listed" ]] && return 0
  done <"$repo/language-exceptions.txt"
  return 1
}

repo=$(repo_of "$path") || exit 0
[[ $path == */schema.d.ts ]] && exit 0
[[ -r $path ]] || exit 0
is_excepted "$repo" "$(basename "$path")" && exit 0

grep -qiP '(?<!re)source' "$path" || exit 0

echo "sorz-not-source: $path says \"source\"; Sorzs says sorz (list, entry, census) or the real word for where a value comes from (origin). See \"Language\" in Sandbox/Sorzs/CLAUDE.md." >&2
exit 2
