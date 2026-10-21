#!/usr/bin/env bash
set -eu

project="${1:?usage: next-step.sh <project>}"
root="/home/xaviuzz/sandbox/PrometeuZZ"
specs="$root/harnesses/$project/.claude/specs"
if [ ! -d "$specs" ]; then
	specs="$root/Sandbox/$project/.claude/specs"
fi
if [ ! -d "$specs" ]; then
	echo "no specs directory for $project" >&2
	exit 1
fi

found=0
for spec in $(ls -t "$specs"/*.md); do
	open=$(grep -c '^- \[ \]' "$spec" || true)
	done_count=$(grep -c '^- \[x\]' "$spec" || true)
	if [ "$open" -gt 0 ]; then
		first=$(grep -m1 '^- \[ \]' "$spec")
		echo "$spec"
		echo "  done $done_count, open $open"
		echo "  next: ${first:6}"
		found=1
	fi
done

if [ "$found" -eq 0 ]; then
	echo "no open steps in $specs"
fi
