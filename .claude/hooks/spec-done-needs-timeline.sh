#!/usr/bin/env bash
# PostToolUse hook: a spec whose steps are all marked done must appear in the project's timeline.md
# (see "Vertical slices" in harnesses/fotoAlbum/CLAUDE.md). Applies to any project that keeps
# a timeline.md beside its specs/ folder. Exit 2 hands the message back to Claude after the edit.
set -u

input=$(cat)
path=$(jq -r '.tool_input.file_path // empty' <<<"$input")

is_spec() {
  case $1 in
    */.claude/specs/*.md) return 0 ;;
  esac
  return 1
}

is_closed() {
  local spec=$1
  [[ -r $spec ]] || return 1
  grep -q '^- \[x\]' "$spec" || return 1
  grep -q '^- \[ \]' "$spec" && return 1
  return 0
}

is_spec "$path" || exit 0

timeline="$(dirname "$path")/../timeline.md"
[[ -r $timeline ]] || exit 0

is_closed "$path" || exit 0

name=$(basename "$path" .md)
grep -q -- "$name" "$timeline" && exit 0

echo "spec-done-needs-timeline: every step of '$name' is done; add it to $timeline (gantt bar, summary row, overview day) in this change." >&2
exit 2
