#!/usr/bin/env bash
set -u

hook="$(dirname "$0")/context-warning.sh"
failures=0
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
export CONTEXT_WARNING_DIR="$tmp/state"
export CONTEXT_WINDOW_TOKENS=1000

transcript_with() {
  local file=$1 input=$2 cache_creation=$3 cache_read=$4
  jq -nc '{type: "user", message: {content: "hi"}}' >"$file"
  jq -nc --argjson i "$input" --argjson c "$cache_creation" --argjson r "$cache_read" \
    '{type: "assistant", message: {usage: {input_tokens: $i, cache_creation_input_tokens: $c, cache_read_input_tokens: $r, output_tokens: 999}}}' >>"$file"
}

input() { jq -nc --arg s "$1" --arg t "$2" '{session_id: $s, transcript_path: $t}'; }

expect_output() {
  local want=$1 session=$2 transcript=$3 label=$4 got
  got=$("$hook" <<<"$(input "$session" "$transcript")")
  if [[ $want == warn && $got != *systemMessage* ]] || [[ $want == silent && -n $got ]]; then
    echo "FAIL expected $want, got '$got': $label"
    failures=$((failures + 1))
  fi
}

transcript_with "$tmp/below.jsonl" 2 100 97
expect_output silent below "$tmp/below.jsonl" "stays silent at 19%"

transcript_with "$tmp/at.jsonl" 2 100 98
expect_output silent at "$tmp/at.jsonl" "stays silent at exactly 20%"

transcript_with "$tmp/above.jsonl" 10 100 100
expect_output warn above "$tmp/above.jsonl" "warns at 21%, summing input and both cache counts"
expect_output silent above "$tmp/above.jsonl" "warns only once per session"

transcript_with "$tmp/other.jsonl" 450 0 0
expect_output warn other "$tmp/other.jsonl" "warns a second session independently"

expect_output silent missing "$tmp/missing.jsonl" "stays silent when the transcript does not exist"

jq -nc '{type: "user", message: {content: "hi"}}' >"$tmp/no-usage.jsonl"
expect_output silent no-usage "$tmp/no-usage.jsonl" "stays silent when no assistant message has reported usage"

if (( failures == 0 )); then
  echo "all passed"
fi
exit $failures
