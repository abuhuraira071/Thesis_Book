#!/usr/bin/env bash
# ==========================================================================
#  build.sh -- one-command thesis build
#
#  Always produces a PDF with correct Contents / List of Figures /
#  List of Tables page numbers and resolved [n] references, regardless
#  of how stale the auxiliary files are.
#
#  Usage:
#      ./build.sh            # fast path (Tectonic if available)
#      ./build.sh xelatex    # force the XeLaTeX + BibTeX four-pass route
#      ./build.sh clean      # remove all auxiliary files only
# ==========================================================================
set -euo pipefail

MAIN="Thesis_Book"

clean() {
    rm -f "$MAIN".aux "$MAIN".log "$MAIN".toc "$MAIN".lof "$MAIN".lot \
          "$MAIN".out "$MAIN".bbl "$MAIN".blg "$MAIN".fls \
          "$MAIN".fdb_latexmk "$MAIN".xdv
    echo "Auxiliary files removed."
}

if [[ "${1:-}" == "clean" ]]; then
    clean
    exit 0
fi

# ---- Route 1: Tectonic (runs TeX/BibTeX as many times as needed) ----------
if [[ "${1:-}" != "xelatex" ]] && command -v tectonic >/dev/null 2>&1; then
    echo "== Building with Tectonic =="
    tectonic "$MAIN.tex" 2>/dev/null && {
        echo "Done: $MAIN.pdf"
        exit 0
    }
    echo "Tectonic build failed; falling back to XeLaTeX." >&2
fi

# ---- Route 2: XeLaTeX + BibTeX four-pass sequence -------------------------
if ! command -v xelatex >/dev/null 2>&1; then
    echo "Neither Tectonic nor XeLaTeX found." >&2
    exit 1
fi

echo "== Building with XeLaTeX (four-pass) =="
xelatex -interaction=nonstopmode "$MAIN.tex" >/dev/null
bibtex "$MAIN" >/dev/null
xelatex -interaction=nonstopmode "$MAIN.tex" >/dev/null
xelatex -interaction=nonstopmode "$MAIN.tex" >/dev/null

# Fail loudly if anything is unresolved.
if grep -q "undefined" "$MAIN.log"; then
    echo "WARNING: undefined references/citations remain; see $MAIN.log" >&2
    exit 1
fi

echo "Done: $MAIN.pdf"
