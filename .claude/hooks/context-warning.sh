#!/usr/bin/env bash
set -u

threshold=${CONTEXT_WARN_THRESHOLD:-20}
window=${CONTEXT_WINDOW_TOKENS:-1000000}
state_dir=${CONTEXT_WARNING_DIR:-$HOME/.claude/context-warnings}

input=$(cat)
session_id=$(jq -r '.session_id // empty' <<<"$input")
transcript=$(jq -r '.transcript_path // empty' <<<"$input")
warned_file="$state_dir/$session_id"

used_tokens() {
  jq -s '
    [.[] | select(.type == "assistant" and .message.usage != null) | .message.usage]
    | last // {}
    | (.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)
  ' "$transcript" 2>/dev/null
}

should_warn() {
  [[ -n $session_id && -r $transcript && ! -e $warned_file ]] || return 1
  local tokens
  tokens=$(used_tokens)
  [[ $tokens =~ ^[0-9]+$ ]] || return 1
  (( tokens * 100 / window > threshold ))
}

if should_warn; then
  pct=$(( $(used_tokens) * 100 / window ))
  mkdir -p "$state_dir"
  touch "$warned_file"
  jq -nc --arg m "Context at ${pct}%, over the ${threshold}% threshold." '{systemMessage: $m}'
fi
exit 0
