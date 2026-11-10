#!/usr/bin/env bash
# Plain-bash tests for sorz-not-source.sh. Run: bash .claude/hooks/test-sorz-not-source.sh
set -u

hook="$(dirname "$0")/sorz-not-source.sh"
failures=0
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

repo="$tmp/Sorzs/backend"
mkdir -p "$repo/src" "$repo/test" "$repo/docs" "$tmp/Other/src"
printf 'SqliteSorzListRepository.ts\n' >"$repo/language-exceptions.txt"

write() { printf '%s\n' "$2" >"$1"; }

input() { jq -n --arg p "$1" '{tool_name: "Edit", tool_input: {file_path: $p}}'; }

expect() {
  local want=$1 file=$2 label=$3 status got
  "$hook" <<<"$(input "$file")" >/dev/null 2>&1
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

write "$repo/src/Bad.ts" 'const source = 1;'
write "$repo/src/Capital.ts" 'class SourceList {}'
write "$repo/test/Bad.test.ts" 'test("a source", () => {});'
write "$repo/src/Clean.ts" 'const sorz = 1;'
write "$repo/src/Resource.ts" 'const resource = 1; const Resource = 2;'
write "$repo/src/SqliteSorzListRepository.ts" 'const sourceId = 1;'
write "$repo/src/schema.d.ts" 'type source = string;'
write "$repo/docs/notes.md" 'a source'
write "$tmp/Other/src/Bad.ts" 'const source = 1;'

expect block "$repo/src/Bad.ts" "lowercase word in src"
expect block "$repo/src/Capital.ts" "capitalised word in src"
expect block "$repo/test/Bad.test.ts" "word in test"
expect allow "$repo/src/Clean.ts" "clean file"
expect allow "$repo/src/Resource.ts" "resource is another word"
expect allow "$repo/src/SqliteSorzListRepository.ts" "file listed as an exception"
expect allow "$repo/src/schema.d.ts" "generated schema"
expect allow "$repo/docs/notes.md" "outside src and test"
expect allow "$tmp/Other/src/Bad.ts" "not a Sorzs repo"
expect allow "$repo/src/Missing.ts" "file that does not exist"
"$hook" <<<"$(jq -n '{tool_name: "Bash", tool_input: {command: "ls"}}')" >/dev/null 2>&1 || { echo "FAIL Bash input"; failures=$((failures + 1)); }

if ((failures)); then
  echo "$failures failure(s)"
  exit 1
fi
echo "all passed"
