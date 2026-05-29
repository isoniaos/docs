#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc is required but was not found." >&2
  exit 1
fi

if ! command -v xelatex >/dev/null 2>&1; then
  echo "Error: xelatex is required but was not found." >&2
  exit 1
fi

mkdir -p dist

COMMON_ARGS=(
  --from=markdown+footnotes+definition_lists+pipe_tables+fenced_code_blocks+backtick_code_blocks+yaml_metadata_block
  --include-in-header=whitepaper-pdf/header.tex
  --toc
  --pdf-engine=xelatex
)

pandoc site/litepaper.md \
  "${COMMON_ARGS[@]}" \
  --metadata-file=whitepaper-pdf/metadata-litepaper.yaml \
  -o dist/isoniaos-litepaper.pdf

pandoc site/whitepaper.md \
  "${COMMON_ARGS[@]}" \
  --metadata-file=whitepaper-pdf/metadata-whitepaper.yaml \
  --citeproc \
  --bibliography=whitepaper-pdf/references.bib \
  -o dist/isoniaos-technical-whitepaper.pdf

ls -lh dist/isoniaos-litepaper.pdf dist/isoniaos-technical-whitepaper.pdf
