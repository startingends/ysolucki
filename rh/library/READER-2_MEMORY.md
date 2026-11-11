# READER-2 memory (persistent reader seat)

Seat: READER-2. Writes only: `rh/library/<paper>.md` digests, its rows in `rh/library/INDEX.md`, full texts
under `rh/data/papers/` (gitignored), and this file. No commits, no pushes. Digests are background only
(owner rule 10): what a paper establishes and where it stops; never a recommendation.

## Reading list and state (session of 2026-11-11)
| # | paper | state | text location | how obtained |
|---|---|---|---|---|
| 1 | Johns, "Positive solutions of Weil's explicit formula for zeta(s)" (+ note on other Gamma factors) | READING | `rh/data/papers/johns/` | curl from raw.githubusercontent.com/nic410/zeta-positive-solutions/main/paper/sections/<file>.tex (9 section files, main.tex, macros.tex, README.md); note = supplementary/notes/critical-conductors/main.tex. Byte-identical to the clone under `rh/library/src/johns/repo/`. |
| 2 | Perfekt, Pushnitski, Helson matrices | not started | | |
| 3 | Bondarenko, Radchenko, Seip, arXiv 2005.02996 | not started | TeX already at `rh/library/src/2005.02996/brs.tex` (fetched by another seat) | |
| 4 | Rodgers, Tao, arXiv 1801.05914 | not started | TeX already at `rh/library/src/1801.05914/fmp-template.tex` | |
| 5 | Braenden, Huh, arXiv 1902.03719 | not started | TeX already at `rh/library/src/1902.03719/lorentzian.tex` | |
| 6 | Guo Chen, Zenodo (May 2026) | not started | | |

## Record read before starting
claude.md (all), rh/library/INDEX.md, rh/library/README.md, docs/KNOWLEDGE.md (all), docs/IDEAS.md entries
#4, #9, #10, #11, #21 in full, titles and novelty fields of the others.

## Notes to self
- Another reader (R-read-1) uses `rh/library/src/` and a 6-part template from README.md; INDEX.md fixes my
  format (8 parts). Append rows to INDEX.md only; never rewrite other rows.
