# READER-2 memory (persistent reader seat)

Seat: READER-2. Writes only: `rh/library/<paper>.md` digests, its rows in `rh/library/INDEX.md`, full texts
under `rh/data/papers/` (gitignored), and this file. No commits, no pushes. Digests are background only
(owner rule 10): what a paper establishes and where it stops; never a recommendation.

## Reading list and state (session of 2026-11-11)
| # | paper | state | text location | how obtained |
|---|---|---|---|---|
| 1 | Johns, "Positive solutions ..." (+ note on other Gamma factors) | DONE (digest johns-2026-part1.md) | `rh/data/papers/johns/` | curl from raw.githubusercontent.com/nic410/zeta-positive-solutions/main/paper/sections/<file>.tex (9 section files, main.tex, macros.tex, README.md); note = supplementary/notes/critical-conductors/main.tex. Byte-identical to the clone under `rh/library/src/johns/repo/`. |
| 2 | Perfekt, Pushnitski, Helson matrices | DONE (digest 1611.03772.md) | | |
| 3 | Bondarenko, Radchenko, Seip, arXiv 2005.02996 | PARTLY (sections 1-3; digest 2005.02996.md) | TeX already at `rh/library/src/2005.02996/brs.tex` (fetched by another seat) | |
| 4 | Rodgers, Tao, arXiv 1801.05914 | not started | TeX already at `rh/library/src/1801.05914/fmp-template.tex` | |
| 5 | Braenden, Huh, arXiv 1902.03719 | not started | TeX already at `rh/library/src/1902.03719/lorentzian.tex` | |
| 6 | Guo Chen, Zenodo (May 2026) | not started | | |

## Record read before starting
claude.md (all), rh/library/INDEX.md, rh/library/README.md, docs/KNOWLEDGE.md (all), docs/IDEAS.md entries
#4, #9, #10, #11, #21 in full, titles and novelty fields of the others.

## Notes to self
- Another reader (R-read-1) uses `rh/library/src/` and a 6-part template from README.md; INDEX.md fixes my
  format (8 parts). Append rows to INDEX.md only; never rewrite other rows.

## Log
- 2026-11-11, paper 1 DONE. Johns Part I v1.4 read whole: 9 section files 213 667 / 213 667 characters,
  main.tex, macros.tex, README.md, companion note N3 (critical conductors, 39 795 / 39 795), supplementary
  README; Part II README only. Digest: `rh/library/johns-2026-part1.md`; index row appended. Running notes
  kept at `rh/data/papers/johns/NOTES_reader2.md`.
- DISCOVERED: another seat, R-read-2 (progress file `rh/library/R-read-2_PROGRESS.md`, sources under
  `rh/library/src/`, README.md's 6-part template), wrote `johns-positive-solutions.md` on the same paper and
  has BRS, Rodgers-Tao, Braenden-Huh, Miller, Perfekt-Pushnitski on its list. My files use different names
  (arXiv ids) so nothing is overwritten. Before each paper: `ls rh/library/` to see what exists.
- Paper 2 (Perfekt-Pushnitski) = arXiv 1611.03772 v2 (found through the arXiv API, export.arxiv.org/api/query).
- 2026-11-11, paper 2 DONE. Perfekt-Pushnitski arXiv 1611.03772 v2: TeX via `curl -L https://arxiv.org/e-print/1611.03772v2`
  (gzip'd tar; `tar -xzf`), kept in `rh/data/papers/perfekt-pushnitski/src/`; body 105 787 / 105 787 read. Digest
  `rh/library/1611.03772.md`; index row appended. Main correction found: T19's credit "Berezansky-Kondratiev" is not
  what the paper cites (Berezanskii 1968 monograph); the a,b >= 2 variant is not in the paper.
- R-read-2 has meanwhile written `brs-fourier-interpolation.md` and `rodgers-tao-newman.md` (my papers 3 and 4).
  My digests of those go under `2005.02996.md` and `1801.05914.md` (independent second readings).
- 2026-11-11, paper 3 PARTLY done, session out of room. BRS arXiv 2005.02996 v3: TeX at
  `rh/data/papers/2005.02996/brs.tex` (curl -L https://arxiv.org/e-print/2005.02996, gzip of a single .tex).
  READ lines 88-1254 (sections 1-3, 74 157 chars). UNREAD lines 1255-2711 (sections 4-7, 86 807 chars).
  Partial digest `rh/library/2005.02996.md`, index row marked "partly". Running notes:
  `rh/data/papers/2005.02996/NOTES_reader2.md`.
  NEXT SESSION: resume at line 1255 of brs.tex (read in chunks of <= 350 lines: 710 lines exceeded the tool's
  limit), then rewrite the digest and the index row. In sections 4-7 look for: section 4.4 (values of the
  Riemann-Weil functional on the basis; Johns claims two slips there), line 1362 (strengthening of Knopp's
  abundance principle; bears on THEORY T18 / idea #13), section 5.3 (other Dirichlet series).
- NOT STARTED: paper 4 Rodgers-Tao 1801.05914 (TeX already at rh/library/src/1801.05914/fmp-template.tex, 136k;
  R-read-2 has a note `rodgers-tao-newman.md`), paper 5 Braenden-Huh 1902.03719 (TeX at
  rh/library/src/1902.03719/lorentzian.tex, 270k), paper 6 Guo Chen Zenodo May 2026 (not searched yet).
- Lesson: budget about 60k tokens of reading per 160k-character TeX paper; write the digest before starting
  the next paper; one session held two full papers (Johns 300k chars with companions, Perfekt-Pushnitski 106k)
  plus half of a third.
