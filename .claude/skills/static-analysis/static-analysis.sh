#!/usr/bin/env bash
set -euo pipefail

project_dir="${1:?usage: static-analysis.sh <folder with src/ and test/> [file name fragment]}"
focus="${2:-}"
cd "$project_dir"

sources() {
  find "$1" \( -name '*.ts' -o -name '*.tsx' \) -not -path '*/ui/*' -print0
}

count_lines() {
  local folder="$1"
  local files lines blank
  files=$(sources "$folder" | tr -cd '\0' | wc -c)
  lines=$(sources "$folder" | xargs -0 cat | wc -l)
  blank=$(sources "$folder" | xargs -0 cat | grep -c '^\s*$' || true)
  echo "$folder: files=$files lines=$lines code=$((lines - blank))"
}

echo "== LOC"
count_lines src
count_lines test

echo "== COMPLEXITY (cyclo, FTA score, assessment, file; worst first)"
bunx fta-cli src --json | FOCUS="$focus" bun -e '
const everyFile = JSON.parse(await Bun.stdin.text());
const files = everyFile.filter((file) => !file.file_name.split("/").includes("ui"));
files.sort((a, b) => b.cyclo - a.cyclo);
const total = files.reduce((sum, file) => sum + file.cyclo, 0);
const focus = process.env.FOCUS ?? "";
const worst = files.slice(0, 8);
const asked = files.filter((file) => focus && file.file_name.includes(focus) && !worst.includes(file));
console.log("files", files.length, "totalCyclo", total);
for (const file of [...worst, ...asked]) {
  console.log(String(file.cyclo).padStart(3), file.fta_score.toFixed(1).padStart(6), file.assessment.padEnd(15), file.file_name);
}
'
