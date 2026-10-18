#!/usr/bin/env bash
# Plain-bash tests for frontend-components-need-skills.sh. Run: bash .claude/hooks/test-frontend-components-need-skills.sh
set -u

hook="$(dirname "$0")/frontend-components-need-skills.sh"
shadcn="/p/Sandbox/fotoAlbum/frontend/.claude/skills/shadcn/SKILL.md"
vercel="/p/Sandbox/fotoAlbum/frontend/.claude/skills/vercel-react-best-practices/SKILL.md"
failures=0
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

read_line() { jq -nc --arg p "$1" '{message: {content: [{type: "tool_use", name: "Read", input: {file_path: $p}}]}}'; }

both="$tmp/both.jsonl"
{ read_line "$shadcn"; read_line "$vercel"; } >"$both"

only_shadcn="$tmp/only-shadcn.jsonl"
read_line "$shadcn" >"$only_shadcn"

other_read="$tmp/other-read.jsonl"
read_line "/p/Sandbox/fotoAlbum/frontend/CLAUDE.md" >"$other_read"

mentioned_only="$tmp/mentioned-only.jsonl"
jq -nc --arg s "remember $shadcn and $vercel" '{message: {content: [{type: "text", text: $s}]}}' >"$mentioned_only"

empty="$tmp/empty.jsonl"
: >"$empty"

input() { jq -n --arg t "$1" --arg p "$2" --arg tr "$3" '{tool_name: $t, tool_input: {file_path: $p}, transcript_path: $tr}'; }

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

component=/p/Sandbox/fotoAlbum/frontend/src/components/catalogue/AlbumRow.tsx

expect block "$(input Edit "$component" "$empty")" "Edit component without reads"
expect block "$(input Write "$component" "$only_shadcn")" "Write component with one skill read"
expect block "$(input Edit "$component" "$other_read")" "Edit component with another file read"
expect block "$(input Edit "$component" "$mentioned_only")" "Edit component skills only mentioned"
expect block "$(input Edit "$component" "$tmp/missing.jsonl")" "Edit component transcript missing"
expect block "$(jq -n '{tool_name: "Edit", tool_input: {file_path: "/p/Sandbox/fotoAlbum/frontend/src/components/Header.tsx"}}')" "no transcript_path"

expect allow "$(input Edit "$component" "$both")" "Edit component with both skills read"
expect allow "$(input Write /p/Sandbox/fotoAlbum/frontend/src/components/making/AlbumMaking.tsx "$both")" "Write component with both skills read"

expect allow "$(input Edit /p/Sandbox/fotoAlbum/frontend/src/components/ui/card.tsx "$empty")" "Edit shadcn ui component"
expect allow "$(input Edit /p/Sandbox/fotoAlbum/frontend/src/pages/HomePage.tsx "$empty")" "Edit page"
expect allow "$(input Edit /p/Sandbox/fotoAlbum/frontend/src/lib/PresentedAlbum.ts "$empty")" "Edit lib"
expect allow "$(input Edit /p/Sandbox/fotoAlbum/frontend/test/components/catalogue/AlbumRow.test.tsx "$empty")" "Edit component test"
expect allow "$(input Edit /p/Sandbox/fotoAlbum/backend/src/components/Thing.tsx "$empty")" "Edit outside the frontend"
expect allow "$(jq -n '{tool_name: "Bash", tool_input: {command: "ls"}}')" "Bash"

if ((failures)); then
  echo "$failures failure(s)"
  exit 1
fi
echo "all passed"
