# R-read-1 progress (reader seat)

Job: read whole papers (TeX sources under `rh/library/src/`), write one note each. Notes report what is in the
papers; they recommend nothing.

## Sources obtained (2026-11-11)
| paper | arXiv id / version | source file | size |
|---|---|---|---|
| Connes, van Suijlekom, "Quadratic forms, real zeros and echoes of the spectral action" | 2511.23257 v1 (28 Nov 2025) | src/2511.23257/x/Araki-final-oct25.tex (already on disk) | 105 055 bytes |
| Connes, Consani, "Spectral triples and zeta-cycles" | 2106.01715 v1 (3 Jun 2021) | src/2106.01715/Spectraltriples.tex | 148 286 bytes |
| Connes, Consani, "Weil positivity and trace formula, the archimedean place" | 2006.13771 v1 (24 Jun 2020), found through the arXiv API | src/2006.13771/weil-compo.tex | 198 369 bytes |
| Connes, Consani, Moscovici, "Zeta zeros and prolate wave operators" | 2310.18423 v2 (4 May 2024) | src/2310.18423/mainc2m24fine.tex | 99 875 bytes |
| Burnol, "The explicit formula and a propagator" | math/9809119 v2 (22 Nov 1998) | src/math9809119/explicV2.tex | 45 062 bytes |

## Reading log
- record read first: README, KNOWLEDGE (all), THEORY, ATLAS, r1_A/PROGRESS, IDEAS #1, #2, #8, #9, #10, #16 to #21,
  NOTEBOOK N19 to N22.
- paper 1 (2511.23257): read whole (lines 740 to 2149; preamble not read). Note:
  `connes-vansuijlekom-real-zeros.md`. DONE.
- paper 2 (2106.01715): read whole (lines 85 to 1544). Leftover text after `\end{document}`: unpublished
  appendix read; old draft of 2.1 and 6.2 compared by diff, not read line by line. Note:
  `connes-consani-zeta-cycles.md`. DONE.
- paper 3 (2006.13771, identifier found by arXiv API search): read whole (lines 67 to 2431, plus the leftover table
  after `\end{document}`). External data files (Dropbox) not fetched. Note:
  `connes-consani-weil-positivity-archimedean.md`. DONE.
- paper 4 (2310.18423 v2): read whole (lines 159 to 1475, including two `\iffalse` passages). Note:
  `connes-consani-moscovici-prolate.md`. DONE.
- numbering check: the arXiv PDFs of papers 1 to 4 were downloaded and converted with `pdftotext` only to verify
  theorem numbers (paper 4's propositions have a separate counter). All notes use the PDF numbering.
- paper 5 (math/9809119 v2): read whole (lines 1 to 397). Note: `burnol-explicit-formula-propagator.md`. DONE.
- Other seats were writing in `rh/library/` at the same time (READER-1, READER-2; files `INDEX.md`,
  `2511.23257.md`, ...). This seat did not edit their files, `INDEX.md` or `README.md`. READER-1's
  `2511.23257.md` is a second, independent note on paper 1.

## Notes written
| paper | note | read |
|---|---|---|
| Connes, van Suijlekom, arXiv 2511.23257 v1 | `connes-vansuijlekom-real-zeros.md` | whole |
| Connes, Consani, arXiv 2106.01715 v1 | `connes-consani-zeta-cycles.md` | whole (old draft left after `\end{document}` only compared by diff) |
| Connes, Consani, arXiv 2006.13771 v1 | `connes-consani-weil-positivity-archimedean.md` | whole (linked data files not fetched) |
| Connes, Consani, Moscovici, arXiv 2310.18423 v2 | `connes-consani-moscovici-prolate.md` | whole |
| Burnol, arXiv math/9809119 v2 | `burnol-explicit-formula-propagator.md` | whole |

## Places where the project's record turned out wrong, already known, or imprecise (details in part 5 of each note)
1. r1_A PROGRESS heading "Zeros of the transform of the minimiser (reproduces the Connes et al. phenomenon)" and
   its literature line "2106.01715 (... first 31 zeros reproduced)": IMPRECISE. In 2106.01715 the 31 zeros are
   eigenvalues of a perturbed Dirac operator D(lambda, k) at special window sizes, not zeros of the transform of
   a minimiser of the Weil form. Neither 2106.01715 nor 2511.23257 computes zeros of the transform of a Weil
   minimiser.
2. r1_A "Why n = 4, 8, ... (HEURISTIC)" (prolate mechanism of the tiny eigenvalues): ALREADY KNOWN, it is
   section 3 of 2106.01715 (and, in Hermite form, section 3.6 of 2310.18423). The quantitative law
   mu ~ kappa (1 - chi_4(2 pi e^(2L))) is not in those papers.
3. r1_A "Structural identity" / IDEAS #2 "A5 windowed Pick/Loewner identity" (lattice case): ALREADY KNOWN,
   Proposition 4.1 (with converse 4.2) of 2511.23257. The off-lattice version is not there.
4. IDEAS #9 "positions are forced" (atom must sit at 2) and "no atom: negative from L = 0.362"; IDEAS #10 (c):
   ALREADY PUBLISHED as numerical observations in 2106.01715, sections 2.2 and 2.3 (p within 1e-3 of 2 at
   mu = 3). The weight intervals, the zero weight at composites and the exp(-8 sqrt n) law are not there.
5. KNOWLEDGE section 2, "Weil positivity ... at the archimedean place via the prolate operator (Connes-Consani
   2021; Connes-Consani-Moscovici 2022)": IMPRECISE. The theorem is Connes-Consani, arXiv 2006.13771 (Selecta
   2021): same window as Yoshida (support of g in [2^(-1/2), 2^(1/2)], no prime), strengthened by a Sonin-trace
   lower bound, computer-assisted. 2106.01715 and 2310.18423 contain no positivity theorem.
6. IDEAS #1 merged kill line ("... 2106.01715 shows window positivity already published up to log 100"): after
   a full read, NO. It proves positivity for no window; it reports uncertified numerics up to mu = 11.
7. ATLAS F1 ("exact real-rootedness at every finite stage, for free", including minimisers of truncated Weil
   forms): IMPRECISE for minimisers. Theorem 6.1 of 2511.23257 needs a simple isolated lowest eigenvalue with
   even eigenfunction; the paper names verifying this as "the key difficulty".
8. THEORY T4 / IDEAS #10 (sign of the off-diagonal kernel, "not found"): the positive kernel 1/|1 - u| of every
   local term is in Weil 1952, Haran 1990, Burnol 1998, and the archimedean case is remarked in the introduction
   of 2006.13771. Implicit in the literature; not used there as an input.
9. Library README, Burnol row ("the archimedean part solved exactly (notebook N19)"): WRONG for this paper.
   math/9809119 has no Sonine spaces and no exact archimedean solution; N19's recollection concerns other
   Burnol papers (cited in 2006.13771 and 2310.18423, unread). The Painleve part is confirmed by nothing read.
10. IDEAS #20 ("the strategy is that of Connes-Consani-Moscovici, arXiv 2511.22755"): a different paper from
   2310.18423; nothing of that strategy is in 2310.18423. Not checked further.
11. KNOWLEDGE section 7 entry for 2511.23257: statement correct; file size is 105 055 bytes, not 118k; the
   distribution lives on [0, L] (Remark 4.3) and simplicity is in the whole space.

## For FRONTIER.md
Area: the Weil quadratic form on windows, its small eigenvalues, prolate functions, and the Connes-Consani
operator programme (papers: arXiv 2006.13771, 2106.01715, 2310.18423, 2511.23257, math/9809119).
1. Criterion (unconditional equivalence; Weil 1952, Yoshida 1992; restated as Prop. C.1 of 2006.13771): RH iff
   the Weil form is >= 0 on test functions supported in [1/lambda, lambda] for every lambda; vanishing of the
   transform may be imposed at any finite set of non-zeros containing the two pole points. A window involves
   only the prime powers <= lambda^2.
2. Proved positivity of the window form (unconditional): only for the window with no prime, g supported in
   [2^(-1/2), 2^(1/2)] with ghat(+-i/2) = 0 (Yoshida 1992; small intervals around 1 also Bombieri 2000 and
   Burnol 2000, as cited). Connes-Consani (2006.13771, Thm 1 and 6.11; computer-assisted, not
   interval-certified) strengthen it there to W_infty(g * g*) >= Tr(theta(g) S theta(g)*) - c |ghat(0)|^2,
   13 < c < 17, S the projection on Sonin's space. No positivity is proved for any window containing a prime.
3. Exact archimedean identities valid for all supports (unconditional; 2006.13771 Cor. 2.3, Thm 4.7):
   2 theta'(t) + deltahat(t) >= 0 with delta an explicit sine-integral function; and
   tr(theta(f) S) = W_infty(f) + int f epsilon d*rho with epsilon an explicit series in prolate functions of
   bandwidth 2 pi.
4. Structure of the window form (unconditional; 2106.01715 Prop. 2.1 to Cor. 2.4): it is closed and lower
   bounded, trigonometric polynomials are a core, and its lower bound is the limit of the lowest eigenvalues of
   finite truncations. Stated there as known: under RH it is strictly positive with zero radical.
5. Numerical only (2106.01715; no proof, no error bars): positive up to lambda^2 = 11, lowest eigenvalue
   2.389e-48 at lambda^2 = 11; about lambda^2 tiny eigenvalues in the even block and one fewer in the odd
   block; eigenvectors coincide graphically with orthonormalised "prolate vectors" E(prolate function);
   at lambda^2 = 3 the form is negative with 1.9999 or 2.0005 in place of the prime 2, and it is negative just
   past a prime power (2, 3, 4, 5, 7) if that term is omitted.
   No upper or lower bound for these eigenvalues is proved in these papers.
6. Conditional theorem (2511.23257 Thm 6.1): for any real distribution on [0, L], if the form defines a
   lower-bounded self-adjoint operator whose lowest spectral value is a simple isolated eigenvalue with even
   eigenfunction, the Fourier transform of that eigenfunction has only real zeros. No arithmetic input; the
   hypothesis is not verified for the Weil form at any window; the paper says nothing on how those zeros relate
   to the zeros of zeta or on the dependence on L.
7. Spectral realisations (unconditional; they do not locate zeros): zeta-cycles (2106.01715 Thm 6.4, Cor. 6.5):
   the orthogonal complement of Sigma_mu E(S_0) in L^2(R_+^*/mu^Z) is non-zero iff mu^(is) = 1 for some zero
   1/2 + is ON the critical line, and its spectrum consists of such s. 2310.18423 Prop. 3.6: all non-trivial
   zeros as the spectrum of multiplication by s on entire functions of order <= 1 modulo multiples of Xi.
8. Semilocal operator theory (unconditional; 2310.18423 Prop. 4.1, 4.2, Thm 4.6): for a finite set of places S
   the scaling operator with its ground vector has spectral measure |prod_{v in S} L_v(1/2 - is)|^2 ds; Sonin
   spaces are unchanged, as topological vector spaces, when places are added. The semilocal prolate operator
   exists only as a formal expression (no domain, no spectrum computed).
9. Local terms (unconditional; Burnol math/9809119): every local term of the explicit formula, at every place,
   equals (F(-log|x|_nu) * F_nu)(1); the paper proves no positivity ("the positivity has remained elusive").
10. Where the published work stops, in these five papers: (a) positivity, at lambda^2 = 2; there the
   archimedean sufficient condition Id - K_I >= 0 already fails by one eigenvalue (1.05 against 1) and is
   restored by one linear condition; the semilocal case is described as "make sense" and not done;
   (b) real zeros, at the hypothesis: "The key difficulty ... becomes the verification that zero is indeed the
   (simple) minimal eigenvalue"; (c) the semilocal prolate operator, at its definition: "finding the relevant
   selfadjoint extension is delicate", Jacobi coefficients for general S "deferred to a forthcoming paper".

## Coordination notice (2026-11-11, after the lead's message about overlapping reader lists)
Read before writing this: `INDEX.md`, `READER-1_MEMORY.md`, `READER-2_MEMORY.md`, `R-read-2_PROGRESS.md`.
- **State of this seat: list finished, all five papers read whole. No further paper is being started.**
  Nothing is in progress here, so there is nothing for another reader to wait for.
- For other readers, papers this seat has FINISHED (whole, notes written):
  - arXiv 2511.23257 (Connes, van Suijlekom): `connes-vansuijlekom-real-zeros.md`. Also read whole by READER-1
    (`2511.23257.md`): double reading, already noted in INDEX.md.
  - arXiv 2106.01715 (Connes, Consani, zeta-cycles): `connes-consani-zeta-cycles.md`. Also read whole by READER-1
    (`2106.01715.md`): double reading.
  - arXiv 2006.13771 (Connes, Consani, archimedean place): `connes-consani-weil-positivity-archimedean.md`.
    No other reader has it on a list.
  - arXiv 2310.18423 v2 (Connes, Consani, Moscovici): `connes-consani-moscovici-prolate.md`, whole.
    READER-1_MEMORY.md lists this paper as "3b, in progress": it is already finished here.
  - arXiv math/9809119 (Burnol): `burnol-explicit-formula-propagator.md`. No other reader has it on a list.
- This seat's notes have no rows in INDEX.md (the index is kept by READER-1 / READER-2 / the lead; not edited
  here). Rows are missing for 2006.13771, 2310.18423 and math/9809119.
- Not taken by this seat: Bondarenko-Radchenko-Seip 2005.02996 sections 4-7 (R-read-2_PROGRESS.md records a
  full read with note `brs-fourier-interpolation.md`; READER-2's own digest `2005.02996.md` is the partial one),
  Suzuki 1606.05726, Yoshida 1992, Miller, Guo Chen.
