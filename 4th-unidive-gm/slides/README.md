# Slides — From variation to harmonization: the UD Turkic Group initiative

**Event**: 4th UniDive General Meeting (closing meeting of COST Action CA21167)
**Location**: Bucharest, Romania — Research Institute for Artificial Intelligence of the Romanian Academy
**Slot**: Thursday 27 August 2026, **oral presentation**, 25 min (≈20 min talk + 5 min questions)
**Presenter**: Bermet Chontaeva
**Target for finalizing**: 23 August 2026

Built from the accepted abstract in `../abstract/main.tex` (submission 64).

## Build

```bash
make          # -> main.pdf
make check    # pre-upload sanity check (run before sharing)
make preview  # -> page-1.png ... to page through every slide
make clean
```

Requires [Typst](https://github.com/typst/typst) (built with 0.14.2). The
`--font-path fonts/` flag is what makes Fira Sans resolve; the Makefile passes
it for you.

## Checking the deck before sharing it

`make check` catches the four things that actually go wrong here:

1. **Overflow** — compares rendered page count against the number of declared
   slides. Typst silently spills a too-full slide onto a second page instead of
   erroring, so this is the one that bites. A mismatch means some slide is
   over-stuffed and needs its text trimmed or `#set text(size:)` lowered.
2. **Leftover placeholders** — `TODO`, `TBD`, "see README" and friends.
3. **Image references** — flags any `image()` path that does not exist, and any
   file in `images/` that nothing uses (dead weight in the upload).
4. **Real images** — checks each file in `images/` really is an image. A failed
   download saved as `.png` is usually an HTML error page, and Typst's error for
   that is not obvious.

A clean `make check` does not mean the slides *read* well. Follow it with
`make preview` and page through the PNGs, or just open `main.pdf`. Worth a
particular look at:

- the two dependency trees on the negation slide (they are scaled to 52% and
  will collide with the takeaway box if any text above them grows)
- the "What we found" table, which is the densest slide in the deck
- the title slide logos

## Working on typst.app (for collaborating with Bermet)

[typst.app](https://typst.app) is the Overleaf equivalent for Typst: browser
editor, live preview, real-time co-editing, no local install. Sharing and
collaboration are on the free tier; only comment-based review needs Pro.

**Upload these 13 files, keeping the folder names:**

```
main.typ
fonts/    (4 files)  FiraSans Regular / Bold / Italic / BoldItalic
images/   (8 files)  unidive, cost, eu + 5 institution logos
```

Total 2.7 MB. `Makefile` and `README.md` are not needed in the web project.

Two things differ from a local build:

- **Fonts.** The web app discovers `.otf`/`.ttf` files anywhere in the project
  automatically, so `--font-path` has no equivalent and is not needed. Fira Sans
  is *not* in the web app's built-in library, so the `fonts/` folder must be
  uploaded or every slide silently falls back to another face.
- **Packages.** `touying` and `unidep` resolve from the registry in the browser,
  so nothing needs vendoring.

To create it: new blank project → drag the files in → make `fonts/` and
`images/` folders and drop the right files into each. Then share the project
with Bermet from the share menu and she can edit it live.

Only 4 Fira Sans weights are included (Regular, Bold, Italic, BoldItalic).
Renders were compared against the full 10-weight family and are identical, so
the other six were dropped to keep the upload small.

## Dependencies

| Package | Version | Used for |
|---|---|---|
| `touying` | 0.6.1 | slide framework (`university` theme) |
| `unidep` | 0.1.4 | CoNLL-U dependency trees |

Both come from the Typst package registry, so the first build on a machine with
a cold cache needs network access. Both are already in the local cache here.

## Structure (21 slides)

| # | Slide | Minutes |
|---|---|---|
| 1–2 | Title, outline | 1 |
| 3–6 | The UD Turkic Group: who we are, coverage, sources of variation | 4 |
| 7–8 | How the group works: methodology | 2 |
| 9–13 | Research topics: four strands, negation worked example, parallel treebanks | 6 |
| 14–17 | **Impact on UD treebanks** — the question, what we found, reading the result | 5 |
| 18–19 | Prospects, summary | 2 |
| 20–21 | Acknowledgements, references | — |

The centre of gravity is the impact section. It reports a clean negative
result: none of the group's three proposals have been taken up by treebanks
outside the group's own maintenance, and `advmod:neg` occurs zero times across
all 25 Turkic treebanks. The talk frames that as a dissemination gap rather
than a problem with the analyses.

## Before the talk

- [x] **UniDive, COST and EU logos** added to the title slide (copied from the Yerevan poster).
- [ ] Confirm the author order and affiliations on the title slide.
- [ ] Optionally send the PDF to `pc.unidive2026@cjvt.si` — the chairs offered
      to host oral slides on the UniDive website.

## Sources

- Abstract: `../abstract/main.tex`, `../abstract/references.bib`

  Note: `../abstract/references.bib` still lists the UDW 2026 negation paper as
  Çöltekin et al., "To appear". The published paper (16 May 2026, Palma de
  Mallorca) has **Mus** as first author — see `../../udw2026/main.tex`. The
  slides use the correct citation; the bib entry is still stale.

- Negation trees adapted from `../../udw2026/poster/main.typ`
- Fonts and institution logos copied from `../../udw2026/poster/`
