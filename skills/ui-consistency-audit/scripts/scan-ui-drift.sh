#!/usr/bin/env bash

set -u

if ! command -v rg >/dev/null 2>&1; then
  echo "ui-consistency-audit: rg is required" >&2
  exit 1
fi

if [ "$#" -gt 0 ]; then
  scan_paths=("$@")
else
  scan_paths=(src messages)
fi

run_scan() {
  local title="$1"
  local pattern="$2"
  shift 2

  echo
  echo "## $title"
  rg -n --glob '*.{ts,tsx,css,json,mdx}' "$pattern" "$@" || echo "No candidates found."
}

echo "# UI consistency candidates"
echo "Paths: ${scan_paths[*]}"

run_scan \
  "Legacy or competing color utilities" \
  '(^|[^[:alnum:]_-])(sky|blue|cyan|indigo|teal|violet|purple|emerald|green|red|orange)-(50|100|200|300|400|500|600|700|800|900|950)(/[^[:space:]\"'"'"']+)?' \
  "${scan_paths[@]}"

run_scan \
  "Hard-coded color values" \
  '#[0-9A-Fa-f]{3,8}|(rgb|rgba|hsl|hsla|oklch)\(' \
  "${scan_paths[@]}"

run_scan \
  "Direction cues in copy or icons" \
  'Arrow(Left|Right|Up|Down)|Chevron(Left|Right|Up|Down)|[→←↑↓]' \
  "${scan_paths[@]}"

run_scan \
  "Pill and badge candidates" \
  'rounded-full|rounded-\[999|Badge|badge|pill' \
  "${scan_paths[@]}"

run_scan \
  "Low-contrast text candidates" \
  'text-(slate|stone|gray|neutral)-(300|400)|text-(black|white)/([0-4][0-9])|text-\[[^]]+\]/([0-4][0-9])' \
  "${scan_paths[@]}"

echo
echo "## Changed frontend files"
git diff --name-only --diff-filter=ACMR -- \
  'src/**/*.tsx' \
  'src/**/*.ts' \
  'src/**/*.css' \
  'messages/*.json' \
  'public/*' || true

echo
echo "Review candidates in context; semantic success/error colors may be intentional."
