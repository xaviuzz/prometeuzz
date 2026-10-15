#!/usr/bin/env bash
# PreToolUse hook: git is read-only for Claude, plus clone into Sandbox/ (see "Git" in PrometeuZZ/CLAUDE.md).
# Allow-list, fails closed: whatever it cannot prove to be a read is blocked (exit 2).
# Not a security boundary against deliberate obfuscation, a guard against slips.
set -u

block() {
  echo "git-read-only: $1 Git is read-only for Claude; writes are run by the user with '! <command>'." >&2
  exit 2
}

in_list() {
  local needle=$1 item
  shift
  for item in "$@"; do
    [[ $item == "$needle" ]] && return 0
  done
  return 1
}

only_flags() {
  local allowed=" $1 " arg
  shift
  for arg in "$@"; do
    [[ $allowed == *" $arg "* ]] || return 1
  done
  return 0
}

# Flags select what is listed; bare words are patterns, valid only when listing.
list_form() {
  local allowed=" $1 " listing=0 arg
  shift
  for arg in "$@"; do
    [[ $arg == --list || $arg == -l ]] && listing=1
  done
  for arg in "$@"; do
    if [[ $arg == -* ]]; then
      [[ $allowed == *" $arg "* ]] || return 1
    else
      ((listing)) || return 1
    fi
  done
  return 0
}

writes_a_file() {
  local arg
  for arg in "$@"; do
    case $arg in
      --output*) return 0 ;;
      '>/dev/null' | '1>/dev/null' | '2>/dev/null') ;;
      *'>'*) return 0 ;;
    esac
  done
  return 1
}

sandbox_root=${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}/Sandbox

# The one write Claude may run: clone a remote into Sandbox/<name> or Sandbox/TMP/<name>.
# No flags, no -C, no local or ext:: sources, no '..' in the destination.
clone_into_sandbox() {
  local url=${1:-} dest=${2:-}
  (($# == 2)) || return 1
  [[ $url =~ ^https://[^[:space:]]+$ || $url =~ ^git@[^[:space:]:]+:[^[:space:]]+$ ]] || return 1
  [[ $dest == *..* ]] && return 1
  local inside=${dest#"$sandbox_root"/}
  [[ $inside == "$dest" ]] && inside=${dest#Sandbox/}
  [[ $inside != "$dest" ]] || return 1
  [[ $inside =~ ^(TMP/)?[A-Za-z0-9._-]+$ ]] || return 1
  [[ $inside == TMP ]] && return 1
  return 0
}

git_is_read() {
  local args=("$@") rest arg sub has_dir_flag=0
  while :; do
    case ${args[0]:-} in
      -C)
        ((${#args[@]} >= 2)) || return 1
        has_dir_flag=1
        args=("${args[@]:2}")
        ;;
      --no-pager) args=("${args[@]:1}") ;;
      *) break ;;
    esac
  done
  sub=${args[0]:-}
  [[ -n $sub ]] || return 1
  rest=("${args[@]:1}")
  writes_a_file "${rest[@]}" && return 1

  case $sub in
    clone)
      ((has_dir_flag)) && return 1
      clone_into_sandbox "${rest[@]}"
      ;;
    status | log | diff | show | blame | ls-files | ls-tree | rev-parse) return 0 ;;
    remote)
      ((${#rest[@]} == 0)) && return 0
      [[ ${rest[0]} == get-url ]] && return 0
      only_flags '-v --verbose' "${rest[@]}"
      ;;
    branch) list_form '--list -l -a -r -v -vv --all --remotes --verbose --show-current' "${rest[@]}" ;;
    tag) list_form '--list -l -n' "${rest[@]}" ;;
    config)
      in_list "${rest[0]:-}" --get --get-all --get-regexp --list -l || return 1
      for arg in "${rest[@]}"; do
        in_list "$arg" --add --unset --unset-all --replace-all --edit -e --rename-section --remove-section && return 1
      done
      return 0
      ;;
    stash) [[ ${rest[0]:-} == list ]] ;;
    reflog)
      for arg in "${rest[@]}"; do
        [[ $arg == *expire* || $arg == delete ]] && return 1
      done
      return 0
      ;;
    *) return 1 ;;
  esac
}

gh_is_read() {
  writes_a_file "${@:3}" && return 1
  case "${1:-} ${2:-}" in
    'pr view' | 'pr list' | 'pr diff' | 'pr checks' | 'pr status') return 0 ;;
    'issue view' | 'issue list' | 'issue status') return 0 ;;
    'repo view' | 'run view' | 'run list' | 'auth status') return 0 ;;
    *) return 1 ;;
  esac
}

input=$(cat)
tool=$(jq -er '.tool_name' <<<"$input") || block "Unreadable hook input."

case $tool in
  Edit | Write)
    path=$(jq -er '.tool_input.file_path' <<<"$input") || block "No file_path."
    [[ "/$path/" == */.git/* ]] && block "Editing inside .git/ is forbidden."
    exit 0
    ;;
  Bash) ;;
  *) exit 0 ;;
esac

command=$(jq -er '.tool_input.command' <<<"$input") || block "No command."

# The hook's own file names contain "git"; neutralise them so they do not look like git commands.
command=${command//git-read-only/}
command=${command//2>&1/ }

git_word='(^|[^[:alnum:]_.-])(git|gh)([^[:alnum:]_-]|$)'
dot_git="(^|[/[:space:]\"'])\\.git([/[:space:]\"']|\$)"
read_tools=' ls cat head tail grep rg wc stat '

segments=$(printf '%s\n' "$command" | sed -E 's/[;|&()`]/\n/g')

while IFS= read -r segment; do
  segment=${segment#"${segment%%[![:space:]]*}"}
  [[ -n $segment ]] || continue
  read -ra tokens <<<"$segment"
  first=${tokens[0]}

  if [[ $first == git ]]; then
    git_is_read "${tokens[@]:1}" || block "'$segment' is not an allowed read-only git command."
  elif [[ $first == gh ]]; then
    gh_is_read "${tokens[@]:1}" || block "'$segment' is not an allowed read-only gh command."
  elif [[ $segment =~ $dot_git && $read_tools != *" $first "* ]]; then
    block "'$segment' may write inside .git/."
  elif [[ $segment =~ $git_word ]]; then
    block "'$segment' mentions git or gh outside an allowed read command."
  fi
done <<<"$segments"

exit 0
