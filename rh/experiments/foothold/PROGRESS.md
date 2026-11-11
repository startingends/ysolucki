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

### 4. Float exploration of the capped form (COMPUTED, not a certificate)
Command: `python3 tools/memcap.py 1 python3 explore.py.txt <L> <R> <nmax> [y m | none]`; log explore_a.log.
| L | R | lambda_min even | lambda_min odd |
|---|---|---|---|
| 0.5 | 20 | -3.5e-3 | -3.5e-4 |  (cap too low: loss too big)
| 0.5 | 40 | 5.79e-7 | 1.09e-4 |
| 0.5 | 80 | 7.96e-7 | 1.62e-4 |
| 0.5 | 160 | 8.77e-7 | 1.81e-4 |
| (1/2) log 3 | 40 | 1.61e-8 | 5.60e-6 |
| (1/2) log 3 | 160 | 5.22e-8 | 1.35e-5 |
| 0.5, NO atom | 40 | -0.034 | -0.328 |
| 0.5, atom at y = 0.75 (x = 2.117), m = 0.54 | 40 | -0.066 | -0.071 |
Against the prediction: L = 0.5 both inside; L = (1/2) log 3 even inside, odd BELOW my range at R = 40 (5.6e-6;
1.35e-5 at R = 160): I overestimated the odd margin. Controls negative as predicted (the capped form is only a
lower bound, so the control numbers are indications, not proofs of negativity).
The cap at R = 40 keeps both blocks positive at L = (1/2) log 3, so a certificate with 40 + 40 Legendre modes is in reach.

### 5. What the sources say about the known range (reading record, owner rule 5)
- Zhu arXiv 2608.24827 v2: READ abstract + section 1 in full (pdftotext lines 1-330 of 1894, about 17%); sections
  2-15 NOT read. Its Theorem 1.1/1.2 are quoted in section 2 above.
- Suzuki arXiv 2606.09096 (TeX in rh/library/src/2606.09096/clean.tex, 132 352 bytes): read lines 136-182, 215-240,
  330-420 (the history paragraph and Theorems 1-3 statements), about 8% of the file. What it says on the range:
  Yoshida "prov[ed] that it is positive for sufficiently small a > 0 [Yo92, Lemma 2] or for appropriate
  subspaces K_N(a) of finite codimension [Lemma 3]". No explicit a there.
- Connes-Consani arXiv 2006.13771 (weil-compo.tex, 198 369 bytes): read lines 100-145 (intro + Theorem 1.1), <3%.
  Says: for smooth positive definite f with support in (1/2, 2) whose Fourier transform vanishes at +-i/2,
  W_infty(f) >= 0, "proved in [Yoshida] by reducing it to an explicit computation"; their Thm 1.1 strengthens it
  on functions g supported in [2^{-1/2}, 2^{1/2}] with ghat(i/2) = ghat(0) = 0. NOTE the vanishing conditions:
  this is positivity on a subspace of codimension 2 or 3 of the window, not on the whole window.
- Connes-Consani arXiv 2106.01715 (Spectraltriples.tex): read lines 170-210 and 567-590 myself, plus the digest
  rh/library/connes-consani-zeta-cycles.md (first 60 lines). Says: "In [Yoshida], the positivity was shown to
  hold for lambda = sqrt 2 using numerical analysis"; NUMERICALLY (no error analysis): the archimedean part alone
  stops being positive a little beyond log(lambda^2) = log 2, the prime 2 restores it on log 2 <= L < log 3;
  section 2.3: at mu = 3 (our L = (1/2) log 3), replacing 2 by a real p in the formula of W_2, the smallest
  eigenvalue is negative for p = 1.9999 and p = 2.0005 (their Figure "sensitive2"). So the "positivity forces
  the prime 2" OBSERVATION is published (numerical, 2021); no theorem.
- Yoshida 1992 and Bombieri 2001/2003: NOT read (not available to me in this session); what I know of them is
  the three second-hand descriptions above, which do not agree on whether a = (log 2)/2 was proved or
  numerically verified by Yoshida.
Conclusion (as far as read): proved positivity on the whole window is classical only for "sufficiently small a"
(Yoshida Lemma 2) and, with vanishing conditions, up to a = (log 2)/2; beyond log 2 the only claim found is
Zhu's unrefereed certificate (L <= 0.8).

### 6. CERTIFICATE for the window L = (1/2) log 3 (prime 2 only)  [COMPUTED with Arb balls + written tail bound]
Command: `flock <scratchpad>/heavy.lock python3 tools/memcap.py 1 python3 cert.py.txt log3 40 56 87/100 1/100000000 4/1000000 128`
Log: cert_log3_R40_n56.log (191 s). R = 40, beta0 = 87/100 < a(R) - A_L = 0.870718..., 28 + 28 Legendre modes,
812 integrals by acb.integral (max radius 2.5e-25), tail constants eps12 <= 1.97e-13, eps22 <= 1.3e-31.
Result: M_even - 1e-8 I and M_odd - 4e-6 I certified positive definite by interval LDL^T, hence
   Q(f) >= 9.9998e-9 ||f||^2 (even f),  Q(f) >= 3.99999e-6 ||f||^2 (odd f),  for all f in L^2[-(1/2)log 3, (1/2)log 3].
Float eigenvalues of the midpoint matrices: 1.6053e-8 (even), 5.591e-6 (odd): agree with explore.py.txt (1.608e-8,
5.60e-6), an independent numpy/scipy implementation.
Proof text: PROOF_window_prime2.md.

### 7. "Positivity forces the prime 2": certified OUTER bounds  [COMPUTED with Arb balls + exact rationals]
PREDICTION (2026-11-11, before the run; the S1-parity outer bound (1.9996, 2.0080) was known to me from the
coordinator's message, so this is a reproduction target, not a blind one): on L = 1/2 the certified infeasible
set will leave a residual position interval inside (1.999, 2.009). Blind part: at L = 27/50 the residual
interval is at least 3 times narrower than at L = 1/2 (Connes-Consani report < 1e-3 at L = (1/2) log 3 with the
weight tied to the position).
Method (script forcing.py.txt): the EXACT form (no cap) on polynomials of degree < NB via the x-space formula
  Q_{y,m}(v) = A(v) - 2 m g_v(y);  A as a matrix of Arb balls, g_v(y) a polynomial with rational coefficients;
  with m' = m (2L - y) and q_v = g_v/(2L - x) the box (y-interval) x (all m >= 0) is refuted by explicit rational
  test vectors.  Commands and logs:
  `python3 tools/memcap.py 1 python3 forcing.py.txt 28 600 1/2`    -> forcing_half.log (7 s, 66 intervals)
  `python3 tools/memcap.py 1 python3 forcing.py.txt 32 800 27/50`  -> forcing_0p54.log (12 s, 70 intervals)
| L | certified: no m >= 0 is feasible for | residual position e^y | residual weight m | true (2, 0.4901291) |
|---|---|---|---|---|
| 1/2 | y in (0, 0.6929395] and y in [0.6971680, 1) | (1.999585, 2.008058) | [0.488558, 0.510367] | inside |
| 27/50 | y in (0, 0.6931055] and y in [0.6936816, 1.08) | (1.999917, 2.001069) | [0.489943, 0.492420] | inside |
Also certified: with NO atom (or the atom outside the window, y >= 2L) the form is negative on an explicit
vector in BOTH parity sectors: A(v)/||v||^2 = -0.03235 (even), -0.32223 (odd) at L = 1/2.
Against the prediction: L = 1/2 residual (1.999585, 2.008058): inside (1.999, 2.009), agrees with S1-parity;
L = 27/50: width 1.15e-3 against 8.5e-3: 7.4 times narrower (predicted >= 3).  Note m < 0 must be excluded:
a negative atom near y = 0 raises the low-frequency symbol and can be feasible (first version of the sweep
found the float optimum at m = -2); the statement is for m >= 0.
Rayleigh-Ritz values of the exact form with the true atom (float, polynomials of degree < 28 / 32):
L = 1/2: 9.0567e-7 (even), 1.9601e-4 (odd); L = 27/50: 6.447e-8, 2.4997e-5.  Consistent with r1_A (9.34e-7,
2.00e-4, periodic basis) and with the capped lower values (8.77e-7, 1.81e-4 at R = 160).
Validation of the x-space formula and of the ball matrix (validate_x.py.txt, mpmath, 25 digits, v = (1/4 - t^2)^4 and
t(1/4 - t^2)^4, true atom): frequency side 1.17532888468e-8 / x side 1.1753288841703535145e-8 / Arb code
1.1753288841703535145e-8 (even); 5.3447425664043e-9 / 5.344742566406390918e-9 / 5.3447425664063909180e-9 (odd).
The x side and the Arb code agree to 20 digits; the frequency-side quadrature agrees to 9 and 12 digits.
