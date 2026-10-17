#!/usr/bin/env bash
set -u

thresholds=${CONTEXT_WARN_THRESHOLDS:-5 10 20}
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

used_percent() {
  local percent=0 tokens
  if [[ -n $session_id && -r $transcript ]]; then
    tokens=$(used_tokens)
    if [[ $tokens =~ ^[0-9]+$ ]]; then
      percent=$(( tokens * 100 / window ))
    fi
  fi
  echo "$percent"
}

highest_crossed() {
  local percent=$1 crossed=0 threshold
  for threshold in $thresholds; do
    if (( percent > threshold )); then
      crossed=$threshold
    fi
  done
  echo "$crossed"
}

last_warned() {
  local warned=0
  if [[ -r $warned_file ]]; then
    warned=$(<"$warned_file")
  fi
  echo "$warned"
}

pct=$(used_percent)
crossed=$(highest_crossed "$pct")

if (( crossed > $(last_warned) )); then
  mkdir -p "$state_dir"
  echo "$crossed" >"$warned_file"
  jq -nc --arg m "Context at ${pct}%, over the ${crossed}% threshold." '{systemMessage: $m}'
fi
exit 0
