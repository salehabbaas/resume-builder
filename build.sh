#!/usr/bin/env bash
# Assemble each platform's SKILL.md from shared sources.
#
#   SKILL.md = shared/FRONTMATTER.md + <platform>/_platform.md + shared/CORE.md
#
# Edit the source files, never the generated SKILL.md. Run from anywhere:
#   ./build.sh           regenerate claude/SKILL.md and codex/SKILL.md
#   ./build.sh --check    verify committed SKILL.md matches sources (exit 1 if stale)

set -euo pipefail
cd "$(dirname "$0")"

CHECK=0
[ "${1:-}" = "--check" ] && CHECK=1

assemble() {
  # $1 = platform folder (claude|codex)
  local p="$1"
  cat shared/FRONTMATTER.md
  printf '\n'
  cat "$p/_platform.md"
  printf '\n---\n\n'
  cat shared/CORE.md
}

status=0

# Compare a generated artifact ($1) against freshly produced content in $2 (a file).
emit() {
  local out="$1" tmp="$2"
  if [ "$CHECK" -eq 1 ]; then
    if ! diff -q "$out" "$tmp" >/dev/null 2>&1; then
      echo "STALE: $out differs from sources — run ./build.sh"
      status=1
    else
      echo "OK: $out"
    fi
    rm -f "$tmp"
  else
    mv "$tmp" "$out"
    echo "built $out"
  fi
}

for p in claude codex; do
  # SKILL.md = FRONTMATTER + platform header + CORE
  tmp="$(mktemp)"; assemble "$p" > "$tmp"; emit "$p/SKILL.md" "$tmp"
  # RESUME_STYLES.md is shared verbatim
  tmp="$(mktemp)"; cat shared/RESUME_STYLES.md > "$tmp"; emit "$p/RESUME_STYLES.md" "$tmp"
  # reference/*.md are shared verbatim (progressive-disclosure files read on demand)
  mkdir -p "$p/reference"
  for ref in shared/reference/*.md; do
    tmp="$(mktemp)"; cat "$ref" > "$tmp"; emit "$p/reference/$(basename "$ref")" "$tmp"
  done
done
exit $status
