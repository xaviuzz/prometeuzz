#!/usr/bin/env bash
# PreToolUse hook: documents an agent consumes (CLAUDE.md, AGENTS.md, skills) are written
# with the writing-for-agents skill loaded (see "Preferred skills" in PrometeuZZ/CLAUDE.md).
# Fails closed: if the transcript cannot prove the skill was loaded, the edit is blocked (exit 2).
# A guard against slips, not against edits made through Bash.
set -u

skill="mattpocock-skills:writing-for-agents"

input=$(cat)
path=$(jq -r '.tool_input.file_path // empty' <<<"$input")

is_agent_doc() {
  case $1 in
    */CLAUDE.md | CLAUDE.md | */AGENTS.md | AGENTS.md) return 0 ;;
    */skills/*.md) return 0 ;;
    */.claude/*.md | .claude/*.md) return 0 ;;
  esac
  return 1
}

skill_was_loaded() {
  local transcript=$1
  [[ -r $transcript ]] || return 1
  # Matches the Skill tool call or the user's /slash command, never a mere mention.
  jq -e --arg s "$skill" '
    (.message.content // empty) as $c
    | if ($c | type) == "array"
      then any($c[]; .type == "tool_use" and .name == "Skill" and .input.skill == $s)
      else ($c | contains("<command-name>/" + $s + "</command-name>"))
      end
  ' "$transcript" 2>/dev/null | grep -q true
}

is_agent_doc "$path" || exit 0

transcript=$(jq -r '.transcript_path // empty' <<<"$input")
skill_was_loaded "$transcript" && exit 0

echo "agent-docs-need-skill: load the '$skill' skill before editing $path (Skill tool, then retry)." >&2
exit 2
