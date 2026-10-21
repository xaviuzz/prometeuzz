#!/usr/bin/env bash
# Plain-bash tests for work-done-needs-timeline.sh. Run: bash .claude/hooks/test-work-done-needs-timeline.sh
set -u

hook="$(dirname "$0")/work-done-needs-timeline.sh"
failures=0
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

project="$tmp/project/.claude"
mkdir -p "$project/specs" "$project/deltas"
printf 'Rows: listed-spec\n' >"$project/timeline.md"

printf -- '- [x] 1. one\n- [x] 2. two\n' >"$project/specs/listed-spec.md"
printf -- '- [x] 1. one\n- [x] 2. two\n' >"$project/specs/unlisted-spec.md"
printf -- '- [x] 1. one\n- [ ] 2. two\n' >"$project/specs/open-spec.md"
printf -- 'no steps here\n' >"$project/specs/stepless-spec.md"

printf -- '- [x] 1. one\n- [x] 2. two\n' >"$project/deltas/listed-delta.md"
printf -- '- [x] 1. one\n- [x] 2. two\n' >"$project/deltas/unlisted-delta.md"
printf -- '- [x] 1. one\n- [ ] 2. two\n' >"$project/deltas/open-delta.md"
printf 'Rows: listed-spec listed-delta\n' >"$project/timeline.md"

bare="$tmp/bare/.claude"
mkdir -p "$bare/specs"
printf -- '- [x] 1. one\n' >"$bare/specs/done-spec.md"

input() { jq -n --arg p "$1" '{tool_name: "Edit", tool_input: {file_path: $p}}'; }

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

expect block "$(input "$project/specs/unlisted-spec.md")" "closed spec missing from timeline"

expect block "$(input "$project/deltas/unlisted-delta.md")" "closed delta missing from timeline"

expect allow "$(input "$project/specs/listed-spec.md")" "closed spec listed in timeline"
expect allow "$(input "$project/deltas/listed-delta.md")" "closed delta listed in timeline"
expect allow "$(input "$project/deltas/open-delta.md")" "delta with an open step"
expect allow "$(input "$project/specs/open-spec.md")" "spec with an open step"
expect allow "$(input "$project/specs/stepless-spec.md")" "spec without steps"
expect allow "$(input "$bare/specs/done-spec.md")" "project without a timeline"
expect allow "$(input "$project/timeline.md")" "edit of the timeline itself"
expect allow "$(input "$project/specs/missing-spec.md")" "spec file that does not exist"
expect allow "$(jq -n '{tool_name: "Bash", tool_input: {command: "ls"}}')" "Bash"

if ((failures)); then
  echo "$failures failure(s)"
  exit 1
fi
echo "all passed"
