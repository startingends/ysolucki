# READER-3 memory (reader seat)

Seat: READER-3. Writes only: `rh/library/<id>.md` digests, its rows appended to `rh/library/INDEX.md`,
sources under `rh/library/src/<id>/` (not committed), and this file. No commits, no pushes. Digests are for
knowledge only: never a recommendation, never a ranking (README.md / INDEX.md header).

## Reading list and state (session of 2026-11-11)
| # | paper | state | digest |
|---|---|---|---|
| 1 | Connes, Consani, Moscovici, "Zeta Spectral Triples", arXiv 2511.22755 v1 (27 Nov 2025) | DONE: read whole (93,185 / 93,185 bytes of TeX; 4 figures opened); digest written; INDEX row appended | `2511.22755.md` |
| 2 | Bombieri, "Remarks on Weil's quadratic functional in the theory of prime numbers, I", Rend. Mat. Acc. Lincei (9) 11 (2000), 183-233 | READ WHOLE (167,356 / 167,356 characters of the pdftotext output, 53 PDF pages; 9 pages also viewed as images); digest being written | `bombieri-2000.md` |
| 3 | Connes, Moscovici, "The UV prolate spectrum matches the zeros of zeta", arXiv 2112.05500 | not started | |

## How texts were obtained
- `curl -sSL -o eprint.bin https://arxiv.org/e-print/2511.22755` (gzip tar: `mc2arXiv.tex`, 4 figures), unpacked
  into `rh/library/src/2511.22755/x/`; comment-stripped copy `rh/library/src/2511.22755/clean.tex`
  (1384 lines, 89,702 bytes; the 81 stripped comment lines are journal-template boilerplate plus 5 commented-out
  bibitems, read separately). PDF `paper.pdf` + `pdftotext -layout` -> `paper.txt` used only for theorem and
  equation numbers. `https://export.arxiv.org/api/query` answered 429 (rate limit); the abs page gave metadata.
- Read with the Read tool in chunks of about 280 lines.

## Record compared with (read before writing the "our record" section)
docs/JOURNAL.md J4; docs/IDEAS.md #2, #8, #9, #20, #27; rh/NOTEBOOK.md N34-N39; rh/THEORY.md T10, T11, T35-T44;
rh/library/2608.24827.md; rh/library/connes-consani-zeta-cycles.md; rh/experiments/r1_A/PROGRESS.md lines 30-50.

## Lead's factual question for paper 1, and the answer found
Q: does the paper state or prove "Weil form on the window >= constant x (explicit positive form from prolate
functions / Sonin space / time-and-band limiting)"?
A: NO such inequality anywhere in the paper, for any window, with or without primes. The paper says "Note that
we cannot assert that mu_lambda >= 0" (after Cor. 3.7). "Sonin" does not occur in the text. What it has on the
prolate side: Lemma 7.2 (prolate functions n = 0, 4 within c lambda^-2 of Hermite functions, from
Meixner-Schaefke), Lemma 7.3 (transform of the prolate guess k_lambda -> Xi on |Im z| < 1/2), Figure 4
(log eps_lambda against log(1 - chi(lambda)), 2 <= lambda^2 <= 17, numerical), and one sentence naming Connes's
1999 trace formula as what "relates P_lambda, P_lambda-hat and the map E to QW_lambda" (no formula written).
Missing steps per section 8: (1) lowest eigenvalue of QW_lambda simple with even eigenvector; (2) k_lambda
approximates xi_lambda well enough for the zeros of xi_lambda-hat to converge to the zeros of zeta.

## Key facts of paper 1 (for a restart)
- Numbering (checked against the PDF): Thm 1.1 = Thm 5.10; Lemma 3.1; Prop 3.2-3.5; Thm 3.6 (discrete lower
  bounded spectrum of A_lambda); Cor 3.7 (ground state exists); (3.27) mu_lambda non-increasing in lambda;
  Cor 3.8 (lim mu_lambda = 0 => RH); Lemma 4.1, Prop 4.2, 4.3 (matrix in closed form); Lemma 5.1, 5.2, Def 5.3
  (even-simple), Lemma 5.4, 5.5, Cor 5.6, Prop 5.7, Lemma 5.8, Prop 5.9, Thm 5.10; Lemma 7.1, 7.2, 7.3.
- chi(lambda) in the paper = eigenvalue of the compressed Fourier transform (n = 4), so 1 - chi is HALF the
  record's energy-concentration defect 1 - chi_4(2 pi e^{2L}) (lambda = e^L, c = 2 pi lambda^2).

## Log
- 2026-11-11: seat started; README.md, SUBAGENT_PREAMBLE.md, INDEX.md, other readers' memory files read.
- 2026-11-11: paper 1 read whole (lines 1-1384 of clean.tex + comment lines + 4 figures). Record items read.
- 2026-11-11: paper 1 DONE: digest `rh/library/2511.22755.md`, row appended to INDEX.md. Starting paper 2 (Bombieri 2000): looking for an OPEN copy (bdim.eu = Biblioteca Digitale Italiana di Matematica, EuDML); no access control or bot check to be bypassed.
- 2026-11-11: paper 2 obtained OPENLY from bdim.eu (Biblioteca Digitale Italiana di Matematica, SIMAI/UMI; cover page: free use for research and study): `curl "http://www.bdim.eu/item?fmt=pdf&id=RLIN_2000_9_11_3_183_0"` -> `rh/library/src/bombieri-2000/bombieri2000.pdf` (710 kB, 53 pages = cover + pp. 183-233; PDF page = journal page - 180); `pdftotext -layout` -> `b.txt` (2,985 lines). No bot check, no login.
- 2026-11-11: paper 2 read whole (b.txt lines 1-2985; pages 185, 199, 213, 216, 217, 221, 224, 226, 228 rendered with pdftoppm and viewed to check formulas). KEY FACTS for a restart:
  Thm 1 (RH iff sum g~(rho) conj-g~(1-rho) > 0 for all nonzero g in C_0^inf; forward direction by the O(R)-zeros argument); Thm 2; Lemma 1 (Euler-Lagrange equation (4.2) = our T38 at lambda = 0); Lemma 3 (form = (1/2pi) int Re Gamma'/Gamma |f~|^2 + O(M)||f||^2); Thm 3 (infimum on L^2(E) ATTAINED, E any finite union of intervals); Thm 4 (H^1-normalised problem: attained if negative); Thm 5 (mu^+(M), mu^-(M) even/odd infima are 'continuous decreasing'; written proof = one-sided dilation argument); Thm 6, 7 (resolvent determinant, Problem 1); Lemma 10, Thm 8 (finite symmetric zero set: number of negative eigenvalues of H(Gamma;t) = number of distinct complex conjugate pairs; 0 is an eigenvalue iff a multiple gamma); Lemma 12, Thm 9 (same for K_E(Gamma), any E; symmetric E: even block counts pairs with Re gamma > 0, odd block pairs with Re gamma >= 0) = per-block count with attainment FOR FINITE ZERO SETS, every window; Thm 10, 11 + Corollary (zeta with finitely many off-line zeros: either the form is negative on E or a linear relation among x^-rho on E with >= half the l^2 mass off the line); Thm 12 (|I| < log 2: form >= (log 1/|I| - log+ log 1/|I| - O(1))||F||^2, O(1) not computed); section 13 (fake zero 0.52 + 3.14 i added to N <= 160 zeros: critical t_c^+-, below it the negative eigenvalue -> 0 'exponentially' and the eigenfunction concentrates at the ends).
