#!/usr/bin/env bash
# Plain-bash tests for agent-docs-need-skill.sh. Run: bash .claude/hooks/test-agent-docs-need-skill.sh
set -u

hook="$(dirname "$0")/agent-docs-need-skill.sh"
skill="mattpocock-skills:writing-for-agents"
failures=0
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

with_skill="$tmp/with-skill.jsonl"
jq -nc --arg s "$skill" '{message: {content: [{type: "tool_use", name: "Skill", input: {skill: $s}}]}}' >"$with_skill"

with_slash="$tmp/with-slash.jsonl"
jq -nc --arg s "<command-name>/$skill</command-name>" '{message: {content: $s}}' >"$with_slash"

other_skill="$tmp/other-skill.jsonl"
jq -nc '{message: {content: [{type: "tool_use", name: "Skill", input: {skill: "mattpocock-skills:tdd"}}]}}' >"$other_skill"

mentioned_only="$tmp/mentioned-only.jsonl"
jq -nc --arg s "remember to use $skill" '{message: {content: [{type: "text", text: $s}]}}' >"$mentioned_only"

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

# --- agent docs without the skill loaded
for f in /p/CLAUDE.md /p/Sandbox/x/CLAUDE.md /p/AGENTS.md /p/.claude/skills/learn/SKILL.md /p/.claude/skills/learn/NOTES.md \
  /p/.claude/plan.md /p/.claude/commands/commit.md /p/Sandbox/x/.claude/stage-one-plan.md .claude/rel.md; do
  expect block "$(input Edit "$f" "$empty")" "Edit $f without skill"
  expect block "$(input Write "$f" "$other_skill")" "Write $f with another skill"
  expect block "$(input Edit "$f" "$mentioned_only")" "Edit $f skill only mentioned"
  expect block "$(input Edit "$f" "$tmp/missing.jsonl")" "Edit $f transcript missing"
done
expect block "$(jq -n '{tool_name: "Edit", tool_input: {file_path: "/p/CLAUDE.md"}}')" "no transcript_path"

# --- agent docs with the skill loaded
for f in /p/CLAUDE.md /p/AGENTS.md /p/.claude/skills/learn/SKILL.md /p/.claude/commands/commit.md /p/Sandbox/x/.claude/plan.md; do
  expect allow "$(input Edit "$f" "$with_skill")" "Edit $f with Skill call"
  expect allow "$(input Write "$f" "$with_slash")" "Write $f with slash command"
done

# --- everything else is not this hook's business
expect allow "$(input Edit /p/src/main.ts "$empty")" "Edit source"
expect allow "$(input Write /p/README.md "$empty")" "Write README"
expect allow "$(input Edit /p/docs/skills.md "$empty")" "Edit doc outside a skills dir"
expect allow "$(input Edit /p/notes/CLAUDE.md.bak "$empty")" "Edit lookalike name"
expect allow "$(input Edit /p/.claude/settings.json "$empty")" "Edit .claude settings"
expect allow "$(input Edit /p/.claude/hooks/agent-docs-need-skill.sh "$empty")" "Edit .claude hook script"
expect allow "$(input Edit /p/claude/notes.md "$empty")" "Edit md in a folder merely named claude"
expect allow "$(jq -n '{tool_name: "Bash", tool_input: {command: "ls"}}')" "Bash"

if ((failures)); then
  echo "$failures failure(s)"
  exit 1
fi
echo "all passed"
