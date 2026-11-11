# READER-1 memory (persistent reader seat)

Seat: READER-1. Writes only: `rh/library/<id>.md` digests, its rows in `rh/library/INDEX.md` (append only),
full texts under `rh/data/papers/` (gitignored), and this file. No commits, no pushes. Digests are background
only (owner rule 10): what a paper establishes and where it stops; never a recommendation, never a ranking.

## How texts are obtained (works; use again)
- `curl -sSL -o rh/data/papers/<id>.pdf https://arxiv.org/pdf/<id>` worked for all five arXiv ids (HTTP 200).
- `pdftotext -layout <id>.pdf <id>.txt` works but formulas are garbled and layout pads with spaces. Better:
  the TeX source. Another seat (R-read-1) had already unpacked sources under `rh/library/src/<id>/`
  (gitignored). I made comment-stripped copies `rh/data/papers/<id>.tex`
  (`grep -v '^[[:space:]]*%' src.tex | cat -s`) and read those with the Read tool, about 600 lines per call.
  The PDF text is used to confirm theorem numbers (`grep -n -E "^\s*(Theorem|Lemma|...) [0-9]+\.[0-9]+\."`).
- Sizes: 2606.09096.tex 3,681 lines / 132,445 ch; 2511.23257.tex 1,983 / 98,854; 2106.01715.tex 1,864 / 147,007;
  2310.18423.tex 1,382 / 99,326; 1606.05726.tex 2,225 / 109,006.

## Other reader seats writing in rh/library at the same time (do not touch their files or rows)
- R-read-1 (format of README.md, 6 parts, no index rows): `connes-vansuijlekom-real-zeros.md` (2511.23257, whole),
  `connes-consani-zeta-cycles.md` (2106.01715, whole); next on its list 2006.13771, 2310.18423, Burnol.
- R-read-2 / READER-2: Johns, Bondarenko-Radchenko-Seip, Rodgers-Tao, Braenden-Huh, Miller, Perfekt-Pushnitski.
- SP-operator (rh/specialists/operator) read both Suzuki papers for its own use; no library note from it yet.

## Reading list and state
| # | paper | state | digest |
|---|---|---|---|
| 1 | Suzuki, screw function, arXiv 2606.09096 v3 | DONE, whole (132,445 / 132,445) | `2606.09096.md` |
| 2 | Connes, van Suijlekom, arXiv 2511.23257 v1 | DONE, whole (98,854 / 98,854) | `2511.23257.md` |
| 3a | Connes, Consani, arXiv 2106.01715 v1 | DONE, whole (147,007 / 147,007; figures not opened) | `2106.01715.md` |
| 3b | Connes, Consani, Moscovici, arXiv 2310.18423 v2 | DONE, whole (99,326 / 99,326) | `2310.18423.md` |
| 4 | Suzuki, Hamiltonians, arXiv 1606.05726 v3 | DONE, whole (109,006 / 109,006) | `1606.05726.md` |
| 5 | Yoshida 1992 ("On Hermitian forms attached to zeta functions", Adv. Stud. Pure Math. 21, 281-325) | **IN PROGRESS by READER-1: searching for a full text (no other reader has it)** | |

## Record read before starting
rh/library/INDEX.md, README.md; claude.md "Reading"; docs/KNOWLEDGE.md (all); docs/IDEAS.md titles and novelty
fields, #2, #8, #11, #20 in full; rh/KEY_LEMMA_SHAPE.md S4; rh/experiments/r2_parity/PROOF_first_failure.md
section 0-2 and refuter/PROGRESS.md proof check; rh/specialists/operator/MEMORY.md.

## Coordinator notice (2026-11-11, during paper 3b)
Two reader seats were started on overlapping lists by mistake. Rule from now: before starting a paper, read
INDEX.md, R-read-1_PROGRESS.md, R-read-2_PROGRESS.md; skip what another reader finished or is in the middle of;
write the paper being started into this file first. State at the notice: my digests for 2511.23257, 2106.01715
and 2310.18423 were already written (independent second notes next to R-read-1's). Not taken by anyone:
Suzuki 1606.05726 (mine, in progress), Yoshida 1992 (mine, next). Not mine and not to be started without
checking: Bondarenko-Radchenko-Seip sections 4-7, Guo Chen (Zenodo), Zhu arXiv 2608.24827, Suzuki 1204.1827,
Bombieri 2001/2003, Connes-Consani-Moscovici arXiv 2511.22755 ("Zeta spectral triples").
