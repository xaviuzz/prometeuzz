#!/usr/bin/env bash
set -u

root="${1:?usage: check-index.sh <the project .claude folder>}"
index="$root/decisions.md"
folder="$root/decisions"
limit=15
problems=0

if [ ! -f "$index" ] || [ ! -d "$folder" ]; then
  echo "PROBLEM: $index or $folder is missing"
  exit 1
fi

for file in "$folder"/*.md; do
  name="$(basename "$file")"
  if ! grep -q "decisions/$name" "$index"; then
    echo "PROBLEM: no index line for $name"
    problems=$((problems + 1))
  fi
done

linked="$(grep -o 'decisions/[A-Za-z0-9._-]*\.md' "$index")"

for link in $linked; do
  if [ ! -f "$root/$link" ]; then
    echo "PROBLEM: index line without file $link"
    problems=$((problems + 1))
  fi
done

duplicates="$(echo "$linked" | sort | uniq -d)"
for link in $duplicates; do
  echo "PROBLEM: duplicated index line $link"
  problems=$((problems + 1))
done

counts="$(awk '
  function flush() { if (area != "") printf "%d\t%s\n", count, area }
  /^## / { flush(); area = substr($0, 4); count = 0; next }
  /^- \[/ { count++; total++ }
  END { flush(); printf "%d\tTOTAL\n", total }
' "$index")"

echo "$counts" | while IFS="$(printf '\t')" read -r count name; do
  mark=""
  if [ "$name" != "TOTAL" ] && [ "$count" -gt "$limit" ]; then mark="  <- past $limit, split it"; fi
  echo "$count  $name$mark"
done

past="$(echo "$counts" | awk -F'\t' -v limit="$limit" '$2 != "TOTAL" && $1 > limit' | wc -l)"
problems=$((problems + past))

if [ "$problems" -eq 0 ]; then
  echo "OK: index is consistent"
else
  echo "FAIL: $problems problem(s)"
  exit 1
fi
