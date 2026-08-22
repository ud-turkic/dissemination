# 4th UniDive General Meeting

**Event**: UniDive 4th General Meeting (closing meeting of COST Action CA21167)
**Date**: 27–28 August 2026
**Location**: Bucharest, Romania (Research Institute for Artificial Intelligence of the Romanian Academy)
**Submission deadline**: 1 April 2026

## Abstract

**Title**: From variation to harmonization: the UD Turkic Group initiative
**Submission**: 64
**Authors**: Soudabeh Eslami, Furkan Akkurt, Bermet Chontaeva, Çağrı Çöltekin,
Nikolett Mus, Jonathan Washington
**Track**: Work-in-progress
**WGs**: WG1 (Corpus annotation), WG4 (Quantifying and promoting diversity)
**Outcome**: accepted as an **oral presentation**, 27 August, 25 min (≈20 + 5 Q&A)
**Presenter**: Bermet Chontaeva

## Contents

- `abstract/` — the accepted abstract
  - `main.tex` — LaTeX source (A4, 11pt, 1in margins)
  - `references.bib` — bibliography
  - `review.html` — reviewer feedback
  - `Makefile` — build with `make` (pdflatex + bibtex, 3-pass)
- `slides/` — Typst deck for the oral presentation;
  see `slides/README.md` for the build and the pre-upload checks

## Build

```bash
make -C abstract   # -> abstract/main.pdf
make -C slides     # -> slides/main.pdf
```
