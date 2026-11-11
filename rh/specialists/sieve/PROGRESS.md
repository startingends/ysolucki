# PROGRESS, SP-sieve session 1 (2026-11-11)
- 03:2x read preamble, roster, reflection CHARTER/MEMORY, N49-N58, modular SHORT_FAMILY + S2_B3, operator SHORT_FAMILY + S2_B4, QRH digests, board B1-B18.
- Read Dunn 2403.13151 Vaughan section (TeX); FI 1998 sec. 1 (arXiv PDF, pdftotext in scratchpad); FI 2022 survey secs 1, 3, 10 (msp PDF).
- Searches (summaries): BV for power residue symbols + Vaughan; FI asymptotic sieve; sextic large sieve + Mobius; Saias-Weingartner; Heath-Brown x^3+2y^3; parity + Siegel zeros.
- Computed exponent bookkeeping (typeII_exponents.py.txt, memcap 1 GB, < 1 s). No prediction-type numerics this session (rule 4 not triggered: no impostor number computed).
- Wrote S2_B10d.md; posted B21 (result re B10), B22, B23 (questions to SP-modular), B24 (fix).
- Conclusion: Vaughan route gives zero-density (L^1) information only; L^2 range empty (PROVED); impostor fails at normalisation; wall = parity at the copy row at power strength (Siebert-Granville shape).
- Session 2: read N62-N65 and five mollifier digests; wrote TRANSPORT.md (no numerics); ideas SP-sieve/#5, #6.
- Session 3: COPY_BARRIER.md; squarefull_check.py.txt (memcap 1 GB, seconds); idea #7.
- Session 4: LEMMA_T115.md (proof of T115, no numerics).
- Session 5: seminar S3, B9/B10, S3_B2.md.
- Session 6 PREDICTIONS (written before any computation, UTC time above in the session log):
  Reconstructed comparison system (S3_SLOPE.md): low side sigma0 >= 1 - c h + c b/2 (c = sixth-power density 1/6), high side
  E(h) = (1+delta)(1-l_y)/2 - sigma0 - h c - l/2 + x delta l + h R* + h delta/2 <= 0, R* from Prop 19.2 with copy slope alpha = 1 - c.
  P0 (check): at the paper's geometry and c = 1/6 the system is feasible at 7/8 with margin ~1e-4; optimised over (l_x, b) it gives
     ~0.87496 (Liu's B_new). If not, my reconstruction is wrong and nothing below counts.
  P1 (vary only Lemma 17.6's slope alpha, other sixth-power densities fixed at 1/6): best exponent stays >= 0.86 even at alpha = 1/2.
  P2 (vary c everywhere, alpha = 1 - c): guess sigma_best(c) ~ 1 - 3c/4 (fits 7/8 at c = 1/6) -> about 5/8 at c = 1/2; LOW confidence;
     if it holds, the 3/4 floor is NOT a floor of the whole architecture.
  P3 (relax Lemma 17.1: r + 2z <= 1 + rho): gains small and saturating; still above 3/4 for rho <= 1/2 at c = 1/6.
