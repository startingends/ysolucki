# FH (foothold seat) PROGRESS

Conventions: f in L^2[-L, L] (log variable), F(r) = int f(x) e^{irx} dx, g = f * f~ supported in [-2L, 2L].
Q_L(f) = (1/2pi) int |F(r)|^2 Psi_L(r) dr + 2 Re[F(i/2) conj F(-i/2)],
Psi_L(r) = Re psi(1/4 + ir/2) - log pi - sum_{log n < 2L} 2 Lambda(n) n^{-1/2} cos(r log n).
(Same form as r1_A/weil.py.txt, validated there against the zeros to 1e-13.)

## Session 1 (2026-11-10/11)

### 1. First observations (PROVED, elementary)
- P1 (monotone in the window). L' <= L implies L^2[-L', L'] is a subspace of L^2[-L, L] and Q_{L'} is the
  restriction of Q_L. So positivity at ONE L gives positivity on every smaller window.
- P2 (frequency form). The prime term is diagonal in frequency: <f, S_u f> = (1/2pi) int |F|^2 e^{iur} dr, so
  the whole form is a Fourier multiplier Psi_L plus the rank-2 pole term (stated above).
- P3 (parity). Q_L(f) = Q_L(f_even) + Q_L(f_odd); pole = +2|F_e(i/2)|^2 - 2|F_o(i/2)|^2.
- P4 (cap). Re psi(1/4 + it) is increasing in |t| (series), so for |r| >= R:
  Psi_L(r) >= beta := Re psi(1/4 + iR/2) - log pi - A_L, A_L = sum 2 Lambda(n)/sqrt n. Hence
  Q_L(f) >= beta ||f||^2 + (1/2pi) int_{-R}^{R} (Psi_L - beta)|F|^2 dr + pole(f): beta*I + (operator with entire
  kernel). In the Legendre basis the matrix entries decay super-exponentially past order ~ e R L/2, so the
  infinite-dimensional remainder can be bounded by a written argument. (I designed this before finding it
  in the literature; see 2.)

### 2. Literature search: how far does the unconditional range go?  (owner rule 5)
Queries (WebSearch, 2026-11-10):
 (q1) "Weil positivity unconditional test functions support beyond [2^{-1/2}, 2^{1/2}] prime 2 proved Yoshida
      Bombieri Burnol Connes-Consani"
 (q2) "Yoshida 1992 "On Hermitian forms attached to zeta functions" positive definite support log 2 numerical K(a)"
Found:
 - **X. Zhu, "Weil positivity in compact windows: a finite reduction, certified two-sided bounds, and a
   Landau-Widom decay law", arXiv 2608.24827 v2 (2 Sep 2026), 34 pp, single author, unrefereed.**
   Claims Theorem 1.2: Q(f) >= 8.9e-18 ||f||^2 for all real even f with supp in [-0.8, 0.8]; Section 6 the odd
   sector; method = exactly the cap P4 ("one-stroke reduction", Thm 1.1) + Legendre basis + Bernstein-ellipse
   quadrature + verified Cholesky. States that the classical record is 2L <= log 2 (Yoshida; Connes-Consani)
   and that "claims beyond log 2 exist in unrefereed preprints". Its v1 claimed a certificate at support 2.38
   and RETRACTED it (wrong direction of a per-prime bound). PDF + text saved in rh/library/src/2608.24827/.
   => The candidate "prove positivity on 0.347 < L <= 0.5" is NOT new as a claim: it is contained in Zhu's
   Theorem 1.2 (if that certificate is sound; nobody in this project has checked it, and the paper is
   unrefereed with one retraction already).
 - "The Three Gates: A Rooted-Operator Approach to Weil Positivity", arXiv 2609.20367: seen in results, unread.
 - A 2021 numerical study (title not captured) reporting that positivity is restored on log 2 <= L' < log 3
   by the prime 2: numerical, matches the project's own computation.

### 3. Decision after the search
The range "prime 2 only" is already claimed (Zhu, unrefereed). I still build our OWN certificate, because the
foothold file needs a proof this project can check line by line, and because the same machinery with a free atom
(position y, weight m) is what a certified "positivity forces the prime" statement needs. Honest status of the
window theorem will be: "proved here independently; the claim is in the literature as an unrefereed preprint".

PREDICTION (written 2026-11-11 before any run of my code): capped form (P4), Legendre basis, R = 40:
 - L = 0.5: lambda_min(even) in [3e-7, 9.3e-7] (r1_A upper bound 9.34e-7), lambda_min(odd) in [5e-5, 2.0e-4];
 - L = (1/2) log 3 = 0.5493: lambda_min(even) in [1e-8, 8e-8], odd in [1e-5, 1e-4];
 - control (must differ): atom moved to y = 0.75 (x = 2.117) at L = 0.5: lambda_min < -0.01 for every weight m;
   no atom at all at L = 0.5: lambda_min(odd) < 0.
