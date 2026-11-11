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
[WRONG LABEL, see section 13 and the verifier's C1: the next numbers are at y = 0.693147, NOT at log 2; at log 2 they are 9.4166e-7 / 1.9573e-4 and 1.07699e-7.]
Rayleigh-Ritz values of the exact form at y = 693147/10^6 (float, polynomials of degree < 28 / 32):
L = 1/2: 9.0567e-7 (even), 1.9601e-4 (odd); L = 27/50: 6.447e-8, 2.4997e-5.  Consistent with r1_A (9.34e-7,
2.00e-4, periodic basis) and with the capped lower values (8.77e-7, 1.81e-4 at R = 160).
Validation of the x-space formula and of the ball matrix (validate_x.py.txt, mpmath, 25 digits, v = (1/4 - t^2)^4 and
t(1/4 - t^2)^4, true atom): frequency side 1.17532888468e-8 / x side 1.1753288841703535145e-8 / Arb code
1.1753288841703535145e-8 (even); 5.3447425664043e-9 / 5.344742566406390918e-9 / 5.3447425664063909180e-9 (odd).
The x side and the Arb code agree to 20 digits; the frequency-side quadrature agrees to 9 and 12 digits.

### 8. Novelty search for the forcing theorem (owner rule 5)
(q3) WebSearch 2026-11-11: "Weil quadratic form positivity "prime 2" replaced by real variable p rigidity theorem
interval arithmetic "sensitivity" Connes Consani certified uniqueness of prime from positivity".
Result: only the Connes-Consani numerical section and Groskin's truncated-form paper (arXiv 2607.02828, abstract
line only: finite-cutoff positivity certifies cutoff-free positivity; not read). No theorem pinning the prime from
positivity found. Three queries in total this session; the honest status is "not found in what was read".

### 9. Proof files written
PROOF_window_prime2.md (Theorem A), PROOF_forcing_prime2.md (Theorem B). Both unchecked.

### 10. Candidates of the brief NOT attempted this session (no claim)
- function fields F_q(t): a window statement provable directly. Not started.
- theta dial at n = 2; semi-local versions with finitely many primes. Not started.
- an INNER bound for the forcing theorem (a certified open neighbourhood of (log 2, log2/sqrt2) that is feasible):
  needs cert.py.txt run with ball-valued (y, m); not done.
- two free atoms on (1/2) log 3 < L <= log 2. Not done.

### 11. Walls, named
- W-FH1 (cost wall of every cap certificate; Zhu Thm 1.4, re-derived here in P4): the cap needs
  a(R) > A_L = sum_{log n < 2L} 2 Lambda(n)/sqrt n, i.e. R > 2 pi exp(A_L), A_L ~ 4 e^L; the margin to resolve is
  about exp(-c e^{2L}). Exact statement I cannot prove: a lower bound for Q on L^2[-L, L] whose proof does not
  resolve all frequencies up to 2 pi exp(A_L).
- W-FH2 (rigidity is the converse direction): Theorem B says positivity => the prime; RH on the next window is
  the statement prime => positivity. Exact statement I cannot prove: for L slightly above (1/2) log 3, the form
  with atoms at log 2 and log 3 is >= 0 WITHOUT computing its spectrum (i.e. from the positivity on L = (1/2) log 3
  plus a structural property of the new atom).
What the walls suggest: (1) replace the pointwise bound on the comb in the medium band by the positive measure
of numerically verified zeros (idea FH/#2); (2) study the one-step extension problem "window L -> window L + dL"
as a Krein extension with a SIGN constraint on the new prime-side mass (idea FH/#3).

### 12. End of session 1
FOOTHOLDS.md has entries FH-1 and FH-2 (both proved here, unchecked) and a table of candidates without result.
Idea log: FH/#1, #2, #3. MEMORY.md rewritten. Where the record already had pieces of this: theory T35 (= my P1),
T26 (= P3), T45 (caps = Lemma 8 with fixed position), T47 (open target at L = 1), atlas F21 (needs a certified
lower bound on the whole window: FH-1 supplies it for L <= (1/2) log 3; numbers at L = 0.5 reproduced and now
certified as outer bounds).
One discrepancy with the record to flag: atlas F21 says that with no atom "the even block stays positive";
that refers to L near 0.37. At L = 1/2 the no-atom form is certified negative in BOTH blocks (FH-2 (iii)).

## Session 2 (2026-11-11, later)

### 13. Repair after the verifier's finding 7 (VERDICT.md not yet written when I looked; findings read from verifier/PROGRESS.md)
FINDING (verifier, correct): the "Rayleigh-Ritz values at the true atom" in my section 7 (9.0567e-7 at L = 1/2,
6.447e-8 at L = 27/50; and "consistent with ... 8.77e-7 <= . <= 9.06e-7") were computed at y = 693147/10^6, not at
log 2. At y = log 2: 9.4166e-7 and 1.07699e-7 (verifier). My label was FALSE; the two theorems do not use these
numbers. Repaired in PROOF_window_prime2.md section 7 and PROOF_forcing_prime2.md section 4. Lesson: the bottom
moves by about 0.2 per unit of y, so a 1.8e-7 error in the position is a 4% (L = 1/2) or 40% (L = 0.54) error in
the bottom. No other finding so far in the verifier's log (sections 1-9 read by grep for findings only).

### 14. Plank 8, task (2') : the pencil (Q, D_L) on ALL polynomials of degree < 28 at L = 1/2 (float exploration)
Why this instead of only the span of K explicit vectors: the bridge ends if kappa_K falls without bound as K grows;
the polynomial space contains good approximations of the whole ladder AND of the bulk directions, and my exact
ball matrix of Q on it already exists (forcing.py.txt). D_L is computed from its definition in N40:
companion g on [1/lambda, lambda] forced by f (g(x) = x^(-1/2)[f(log x) - 2^(-1/2) f(log 2x) 1_{2x <= lambda}]),
free even h on (0, 1/lambda), D_L(f) = min_h ||out-of-band part of (g + h)^||^2 (band [-lambda, lambda], transform
with e^{-2 pi i x xi}), computed as a Schur complement; variant with the constraint ghat(0) = 0.
PREDICTION (written before running, 2026-11-11): the lowest generalised eigenvalue kappa_poly of Q v = kappa D v
on polynomials of degree < 28 is between 0.05 and 0.35 in the even block and between 0.03 and 0.22 in the odd
block (it must be <= about the lead's kappa_4 = 0.35 / 0.22 if his D is close to the true D_L on his vectors, and I
expect the drift with K to continue a little but not to zero, because in the bulk Q is of size 0.3-1 and D <= 3).
It would surprise me, and wound plank 8, if kappa_poly < 0.01 or negative.

### 15. Outcome of the pencil experiment (COMPUTED, float, ONE implementation: pencil.py.txt; logs pencil_a/b/c.log)
Command: `python3 tools/memcap.py 1 python3 pencil.py.txt 28 16 <L>` for L = 17/50 (no prime), 1/2, 27/50.
Q = my exact ball matrix (midpoints) on polynomials of degree < 28, atom at log 2 to 17 digits. D_L from the
definition (Schur complement over the free part h on (0, 1/lambda), 16 Legendre functions; nh = 14, 22 give the
same digits). FINDINGS:
(a) DEFINITION. With the companion h = 0, D is not small on the ladder (lowest eigenvalue 0.045 against Q's 9.4e-7):
    the free part is essential. With "min over h" and NO pole condition, or with ghat(0) = 0 only, the UPPER
    comparison fails by 1e7 to 1e10 (kappa_max = 7.8e10, 5.1e7 at L = 1/2): D then has near-null directions
    (Poisson images of prolates with g(0) != 0) on which Q is of size 1e-6: these carry the pole. The condition
    g(0) = 0 of N40 has no effect on an infimum over L^2 unless it is imposed as a continuous functional. With
    BOTH conditions as continuous functionals, ghat(0) = int g = 0 and (Bg)(0) = int_{-lambda}^{lambda} ghat = 0,
    the two ladders are parallel: lowest eigenvalues of D: 1.27e-6, 2.58e-4, 2.15e-2; of Q: 9.42e-7, 1.96e-4,
    1.81e-2 (L = 1/2).
(b) D_L is NOT parity-diagonal (largest mixing entry 0.32 of entries of size 1): the definition treats g (hard
    support) and ghat (soft band) asymmetrically. The pencil must be taken on the full space, or D symmetrised
    under u -> -u.
(c) THE NUMBERS (both conditions; full polynomial space of degree < 28, both parities together):
| L | lowest eig of Q | kappa_min | kappa_max (grows like log degree) | kappa_min, D symmetrised | per block even / odd |
|---|---|---|---|---|---|
| 17/50 (no prime) | 1.609e-3 | 0.33170 | 2.48 | 0.33850 | 0.3385 / 0.4059 |
| 1/2 | 9.417e-7 | 0.33074 | 2.32 | 0.35639 | 0.3564 / 0.3597 |
| 27/50 | 1.080e-7 | 0.32812 | 2.33 | 0.33653 | 0.3365 / 0.3741 |
    Stable in the degree (L = 1/2: 0.33189, 0.33086, 0.33074 at degree < 12, 20, 28). The minimiser is a
    small-leak direction (D(v)/|v|^2 = 4e-2, 4e-2, 2.3e-5), not the bottom rung (Rayleigh ratios on the three
    lowest D-eigenvectors: 0.76-1.16) and not the bulk.
Against my prediction (0.05-0.35 even, 0.03-0.22 odd): MISSED on the high side in the odd block (0.36), inside in
the even block (0.356). I had assumed the lead's D (leak of one specific companion) equals D_L; the true infimum
is smaller, so the ratio is larger. kappa does NOT fall with the number of directions: on 28 directions it is
0.33 at all three windows, across the entry of the prime 2, while the bottom of Q falls by 4 orders.
Not certified; a second implementation is needed (S1-parity). L = 27/50 lowest eigenvalue 1.080e-7 agrees with
the verifier's 1.077e-7 (its section 7).

### 16. Task (1): what a certificate of "Q >= kappa D on the whole window" needs; does Connes-Consani Thm 1 give it?
Read for this: the library digest connes-consani-weil-positivity-archimedean.md parts 1-3 (in full) and the
paper's introduction (lines 100-145 of weil-compo.tex); the proofs in sections 4-6 of the paper NOT read.
(A) What the certificate needs (my machinery, both windows). Q - kappa D >= Q_R - kappa D_up, where Q_R is the capped
form of PROOF_window_prime2.md (lower bound of Q, any f) and D_up is the leak of ANY admissible companion chosen
linearly in f (an upper bound of the infimum D_L). So only an explicit linear choice f -> h(f) with the two
conditions satisfied exactly is needed; then D_up = (bounded multiplication-type operator) - (operator with the
entire kernel sin(2 pi lambda (x - y))/(pi (x - y)) transported to the log variable) + finite rank. Remainders:
  (i) the cap remainder of Q, discarded with a sign as before; the cap now needs a(R) - A_L - kappa ||D_up|| > 0
      (||D_up|| <= about (1 + 2^(-1/2))^2 (1 + ||h-map||)^2, a number of size 3 to 10);
  (ii) the Legendre tail of the D_up kernel: frequencies in u up to c = 2 pi e^(2L) (18.8 at L = 0.55), below the
      R = 40 already resolved: same type of bound as Lemma 4, no new kind of remainder;
  (iii) entries of D_up: two-dimensional integrals of analytic functions on 3 x 3 pieces; rigorous but about 1000
      of them (not done).
  On the no-prime window the Moebius term of the companion disappears (g = x^(-1/2) f on the window), nothing else
  changes. So a certificate with kappa = 0.3 is a finite job of the size of FH-1 at L <= (1/2) log 3. Not done.
(B) Connes-Consani Theorem 1 does NOT give plank 8 on the no-prime window as it stands, for three exact reasons:
  1. Its right side is Tr(theta(g) S theta(g)*) with S the Sonin projection at cutoff 1 (prolate parameter c = 2 pi,
     fixed), acting on the window function by scaling, with no summation over integers. D_L is the least leak of a
     companion at c = 2 pi e^(2L), which changes with the window. A further inequality "Sonin trace >= kappa D_L on
     the window" between two explicit prime-free forms is needed; I did not find it in the digest and have no
     proof. (It can be tested numerically: by their Theorem 4.7, Sonin trace = W_infty + integration against an
     explicit prolate series epsilon.)
  2. It holds on the subspace ghat(i/2) = 0 = ghat(0) (codimension 2), or with - c |ghat(0)|^2, c about 17, on
     ghat(-i/2) = 0. Plank 8 is on the whole window, where the pole directions are handled by the two
     conditions built into D_L (finding (a)).
  3. Its proof uses numerical facts that are not interval-certified (digest part 6).
  What my numbers say instead: on the no-prime window L = 0.34 the direct pencil gives kappa = 0.33 on all
  polynomials of degree < 28 (float), with no vanishing condition.

### 17. Task (3): does the FH-1 certificate, run for Q - 0.1 D, escape the cost explosion?  NO. Exact reason:
The certificate has two costs. (1) The cap: R must exceed 2 pi exp(A_L + kappa ||D||); this comes from the band
T* = 2 pi e^(2L) < |r| < 2 pi e^(A_L), where the pointwise bound on the prime comb is the only control. In that band
D is NOT small: every function is out of band there, D is about ||g||^2, so "Q >= kappa D" there is plain positivity
with a margin of order 1, and the cap needs exactly what it needed before (slightly more). The matrix size is
about e R L/2: doubly exponential in L, unchanged. (2) The precision: the finite matrix M_Q - kappa M_D in a fixed
basis (Legendre) still has eigenvalues of the size of the ladder (1 - kappa/kappa_true) x 1e-30 at L = 1, so its
entries must still be known to absolute accuracy below the ladder: unchanged. But this cost was never the
explosion: digits needed grow like e^(2L), polynomially in the matrix size.
So the comparison does not help a certificate in a fixed basis at all. What it changes is what an ESTIMATE has
to achieve, and only if two things are added:
  - plank 5 (the identity Q(f) = W(tail)), which gives the ladder block of Q with RELATIVE accuracy, and bounds the
    coupling of a ladder vector v to any w by |Q(v, w)| = |W(T_v, w)| <= C sqrt(D(v)) (form norm of w): the Schur
    complement then needs C^2 < kappa x (bulk constant), an inequality between numbers of size 1;
  - a proof that Q >= c > 0 on the complement of the ladder, for which the comparison gives nothing. THAT is where
    the comb-alignment wall W-FH1 lives (and where a zero off the line would show: detection height about 2 T*).
Numerically the binding constant 0.33 sits on small-leak combinations, section 15 (c), not in the bulk; I have not
computed the bulk constant (lowest eigenvalue of Q on the D-orthogonal complement of the ladder) separately.

### 18. Verifier's verdict and repairs (verifier/VERDICT.md, read 2026-11-11)
Theorem A: VERIFIED AS STATED. Theorem B: VERIFIED AS STATED. No gap in either proof. Corrections: C1 (my false
label, section 13; the stale line in section 7 is now marked), C2 (the two forcing logs regenerated with the
current script: identical intervals, 66 and 70; the float-check line now uses log 2 to 17 digits: 1.9573e-4 odd at
L = 1/2), C3 (wording, removed). The only change to forcing.py.txt after verification is that float-check line.
FOOTHOLDS.md: FH-1 and FH-2 set to `checked`; FH-3 added as a candidate (float).

## Session 3 (2026-11-11): the pencil at larger windows (coordinator's question: does kappa_min hold, grow, or fall like e^(-2L)?)

### 19. PREDICTION, written before any run at L > 0.54
Data so far: kappa_min = 0.3317, 0.3307, 0.3281 at L = 0.34, 0.5, 0.54 (slope about -0.02 per unit of L).
The two hypotheses to separate: FLAT (stays near 0.33) against FALL like e^(-2L) (from 0.33 at L = 0.5: 0.24 at
0.65, 0.20 at 0.75, 0.16 at 0.85, 0.12 at 1.0).
My prediction: nearly flat with a slow decrease: kappa_min in [0.30, 0.34] at L = 0.65, [0.28, 0.34] at 0.75,
[0.26, 0.34] at 0.85, [0.24, 0.34] at 1.0; stable in the degree to 2 digits once the degree exceeds about
2 pi e^(2L) L + 40. Minimiser: still a small-leak combination (D(v)/|v|^2 below 1e-3, most of its norm on the first
6 rungs of Q), not the bulk. kappa_max between 2 and 4, attained on the highest-degree directions (Q grows like
the log of the frequency, D is bounded), increasing with the degree.
What would move the bridge: kappa_min(1.0) below 0.15, or a minimiser that sits in the bulk with D(v)/|v|^2 of order 1.

### 20. Outcome: the whole-space pencil at L = 0.65, 0.75, 0.85, 1.0  (COMPUTED, multiprecision, ONE implementation)
Script pencil_mp.py.txt (a NEW builder of Q: Gauss-Legendre quadrature of the x-space formula in Arb, all prime
powers below e^(2L); D_L as in section 15 with the Moebius inverse for several integers; mpmath for the pencil).
Commands: `flock <scratchpad>/heavy.lock python3 tools/memcap.py 2 python3 pencil_mp.py.txt <L> <NB> 40 <prec> <K1,K2>`
with (L, NB, prec) = (13/20, 68, 360), (3/4, 80, 400), (17/20, 96, 440), (1/1, 116, 520). Logs pencil_mp_0p65.log,
pencil_mp_0p75.log, pencil_mp_0p85.log, pencil_mp_1p0.log (18 s to 99 s each).
Validation of the new builder: at L = 1/2, degree < 28 it gives kappa_min = 0.330738, kappa_max = 2.31888 against
0.33074, 2.3189 from the exact rational matrix of forcing.py.txt (section 15). Lowest eigenvalues of Q: 3.696e-15
(L = 0.75), 5.979e-30 (L = 1.0); r1_A's upper bounds were 3.68e-15 and 6.31e-30.

(1) kappa_min and its stability in the degree
| L | prime powers | lowest eig of Q | kappa_min at three degrees | second kappa |
|---|---|---|---|---|
| 0.34 | none | 1.6e-3 | 0.3317 (deg < 28) | |
| 0.50 | 2 | 9.4e-7 | 0.33189, 0.33086, 0.33074 (12, 20, 28) | 0.3557 |
| 0.54 | 2 | 1.08e-7 | 0.3281 (28) | 0.3466 |
| 0.65 | 2, 3 | 3.98e-11 | 0.327977, 0.327954, 0.327945 (40, 54, 68) | 0.3421 |
| 0.75 | 2, 3, 4 | 3.70e-15 | 0.326542, 0.326508, 0.326506 (48, 64, 80) | 0.3279 |
| 0.85 | 2, 3, 4, 5 | 4.29e-20 | 0.301935, 0.301831, 0.301787 (64, 80, 96) | 0.3059 |
| 1.00 | 2, 3, 4, 5, 7 | 5.98e-30 | 0.297958, 0.297900, 0.297833 (84, 100, 116) | 0.3002 |
kappa_min does NOT fall like e^(-2L) (that law, from 0.33 at L = 0.5, gives 0.20 at 0.75 and 0.12 at 1.0) and does
not grow. It decreases slowly: 0.33 up to L = 0.75, a step to 0.30 between 0.75 and 0.85 (the integer 5 enters at
L = 0.805), 0.298 at 1.0. Against my prediction (section 19): all four inside the predicted ranges. Stable in the
degree to 3 digits (the last digit still drifts down by about 1e-4 per 16 degrees).
The ladders of Q and D are parallel over 24 orders at L = 1: Q: 5.98e-30, 1.53e-26, 2.23e-23, 2.25e-20, 1.44e-17,
5.75e-15, 1.40e-12, 2.42e-10, 3.99e-8, 4.25e-6; D: 6.12e-30, 1.62e-26, 2.18e-23, 2.02e-20, 1.37e-17, 6.16e-15,
1.47e-12, 2.37e-10, 4.08e-8, 4.61e-6 (rung-wise ratios between 0.92 and 1.12).

(2) the minimiser. CORRECTION of section 15 (c) and of my session-2 report: "a small-leak combination, not the
bulk" was an artefact of normalising by the L^2 norm. A generalised eigenvector can carry any amount of the
bottom rungs for free (both forms are tiny there): at L = 1 the minimiser has 99.6% of its NORM on rung 1 and 1% of
its ENERGY on rungs 1..6. By energy (share of Q(v) carried by the eigenvectors of Q):
 L = 0.65: rungs 12, 16, 7 (eigenvalues 1.38, 1.60, 0.83): 48%, 18%, 11%; rungs 1..6: 4%.   -> bulk
 L = 0.75: rungs 21, 12, 17 (1.69, 1.03, 1.53): 31%, 12%, 11%; rungs 1..6: 7%.             -> bulk
 L = 0.85: rungs 5, 3 (4e-9, 3e-14): 23%, 15%; rungs 1..6: 46%; off-ladder part w (Q-eigenvalue >= 0.01): 48% of Q(v)
           but only 31% of D(v), with Q(w)/|w|^2 = 1.23, D(w)/|w|^2 = 2.65 (ratio 0.46).  -> half ladder, half bulk
 L = 1.00: rungs 13, 15 (0.158, 0.72): 20%, 9%; rungs 88..93 (3.7-3.9): 24%; rungs 1..6: 1%. -> transition + bulk
So the binding direction is NOT on the ladder; it is a mixture of transition/bulk directions with ladder
directions, and at L = 0.85 (the one window where I separated the parts) 53% of its leak D(v) is the CROSS TERM
between the ladder part and the off-ladder part: D is not block-diagonal in the ladder/bulk splitting of Q, and
the constant 0.30-0.33 is a coupling constant, lower than both the ladder ratios (0.92-1.12) and the bulk ratio of
that vector (0.46). No monotone drift into the bulk with L is visible in four windows.

(3) kappa_max: 3.05 (0.65), 3.18 (0.75), 3.56 (0.85), 4.19 (1.0) at the top degree, and NOT converged in the degree
(L = 1: 3.21, 3.65, 4.19 at degree < 84, 100, 116). Its energy sits on the highest rungs of the truncated space
(eigenvalues about 6) plus mid-bulk rungs. Reason: Q grows like the log of the frequency and D is bounded, so
kappa_max -> infinity with the degree: the upper comparison Q <= C D is FALSE on the whole window space for a
trivial reason, and would need D weighted by the log of the frequency off the band.

Not done: a second implementation; the off-ladder decomposition at L = 0.65, 0.75, 1.0 (added to the script after
those runs had started); any window above 1.0; any certificate.

## Session 4 (2026-11-11): the damped form Q_eps against the same D_L (Hunch 3)

### 21. Definition used and PREDICTION (written before any run)
Q_eps(v) := the Weil functional applied to e^(-eps|x|) g_v(x) (g_v = autocorrelation). In the x-space formula of
PROOF_forcing_prime2.md, Lemma 5 (valid for any Lipschitz even test function supported in [-2L, 2L]) this is
  Q_eps(v) = -(log 4 pi L + gamma) g(0) + int_0^{2L} (g(0) - e^(-eps x) g(x))/x dx - int_0^{2L} h(x) e^(-eps x) g(x) dx
             + 4 int_0^{2L} cosh(x/2) e^(-eps x) g(x) dx - sum_n 2 Lambda(n) n^(-1/2-eps) g(log n),
using pole(v) = 2 E+ E- = 4 int_0^{2L} cosh(x/2) g(x) dx. So the pole IS damped exactly (no shortcut needed); at eps = 0 the
quadrature form of the pole is checked against the rank-two form. D_L unchanged.
Heuristic behind the prediction: on the zero side Q_eps(v) = sum over zeros of (|V|^2 * Poisson kernel of width eps)(gamma),
so for the ground state (V nearly vanishing at the low zeros) d mu/d eps at 0 is (1/pi) sum_gamma int |V(t)|^2/(gamma - t)^2 dt,
a number of size 1 per unit norm, not of the size of mu.
PREDICTION:
 (1) mu(eps) = mu(0) + c eps (1 + o(1)) with c = v0^T Q'(0) v0 in [0.03, 0.3] at L = 0.5 and in [0.1, 2] at L = 0.75;
     c/mu(0) of order 1e5 (L = 0.5) and 1e13-1e15 (L = 0.75). mu(1/16) in [2e-3, 2e-2] at L = 0.5.
 (2) kappa_min(eps) is non-decreasing in eps on [0, 1/2]; it rises from 0.33 to somewhere in [0.35, 0.6] already at
     eps = 1/16 (the ladder directions become expensive for Q and stop helping the minimiser) and is then roughly flat.
 (3) the near-null ladder is not visible at eps >= 1/16 at either window: the eigenvalues that were 1e-15..1e-3
     become a cluster of size eps x (0.05..2), no longer geometrically spaced. The minimiser of the pencil sits in the
     bulk (energy on eigenvalues of size 0.1-2) for every eps >= 1/16.
 Would surprise me: kappa_min decreasing with eps, or mu(eps) staying below 1e-4 at eps = 1/16.

### 22. Outcome: damped pencil (Q_eps, D_L) at L = 0.5 and 0.75  (COMPUTED, multiprecision, ONE implementation)
Script pencil_eps.py.txt (pencil_mp.py.txt with the kernel damped exactly, pole included; at eps = 0 the pole by
quadrature agrees with the rank-two pole to 4e-88 / 7e-119, and the eps = 0 rows reproduce section 20).
Commands: `python3 tools/memcap.py 1 python3 pencil_eps.py.txt 1/2 36 40 300 0,1/1024,1/16,1/8,1/4,3/8,1/2` (14 s, log
pencil_eps_0p5.log); `flock ... memcap.py 2 python3 pencil_eps.py.txt 3/4 80 40 400 0,1/1048576,1/1024,1/16,1/8,1/4,3/8,1/2`
(166 s, log pencil_eps_0p75.log). Degree < 36 and < 80; no second degree was run for eps > 0.
| eps | mu(eps) L = 0.5 | kappa_min L = 0.5 | mu(eps) L = 0.75 | kappa_min L = 0.75 |
|---|---|---|---|---|
| 0 | 9.382e-7 | 0.330703 | 3.696e-15 | 0.326506 |
| 2^-20 | | | 9.207e-8 | 0.327829 |
| 1/1024 | 1.012e-4 | 0.331987 | 9.326e-5 | 0.327871 |
| 1/16 | 6.335e-3 | 0.332507 | 5.948e-3 | 0.324096 |
| 1/8 | 1.258e-2 | 0.330073 | 1.189e-2 | 0.318139 |
| 1/4 | 2.495e-2 | 0.324504 | 2.375e-2 | 0.305836 |
| 3/8 | 3.726e-2 | 0.319027 | 3.560e-2 | 0.294205 |
| 1/2 | 4.953e-2 | 0.313877 | 4.743e-2 | 0.283516 |
(1) FIRST-ORDER LIFT. c_r = q_r^T Q'(0) q_r on the six lowest rungs: L = 0.5: 0.1027, 0.1348, 0.2237, 0.3067, 0.2232,
    0.0139; L = 0.75: 0.1002, 0.1213, 0.1612, 0.2485, 0.4417, 0.6984. So d mu/d eps at 0 is 0.10 at both windows, and
    c_1/mu(0) = 1.1e5 (L = 0.5), 2.7e13 (L = 0.75). mu(eps) is linear in eps over the whole range to within 5%:
    mu(eps) = 0.099 eps (L = 0.5), 0.095 eps (L = 0.75). PREDICTION (1): HIT (c in range at both windows, at the lower
    edge at 0.75). HEURISTIC reading: (1/pi) sum_gamma int |V|^2/(gamma - t)^2 dt for a transform concentrated near
    frequency 0 is 4 sum_{gamma > 0} gamma^-2 = 0.092.
(2) kappa_min IS NOT MONOTONE in eps: it rises by about 0.0015 for very small eps (maximum near eps = 1/16 at L = 0.5,
    near 1/1024 at L = 0.75), then falls: -5% (L = 0.5) and -13% (L = 0.75) at eps = 1/2. PREDICTION (2): MISSED on both
    counts (I predicted non-decreasing and a rise to 0.35-0.6). Reason for the miss: the minimiser was a bulk
    direction already at eps = 0 (energy on Q-eigenvalues 0.9-1.7; section 20), so making the ladder expensive
    changes nothing for it. For every eps the energy share of the minimiser on eigenvalues below 0.1 is under 4%
    (11% at L = 0.75, eps = 0).  kappa_max explodes as it must: about c_1 eps / (lowest eigenvalue of D) = 81, 5.1e3,
    4.1e4 at L = 0.5 and 2.5e7 ... 1.3e13 at L = 0.75.
(3) THE LADDER DISSOLVES RUNG BY RUNG, at eps of the size q_r/c_r, i.e. immediately for the bottom rungs. L = 0.75,
    eight lowest eigenvalues: eps = 0: 3.7e-15, 3.4e-12, 1.2e-9, 2.5e-7, 4.4e-5, 3.7e-3, 0.089, 0.58;
    eps = 2^-20: 9.2e-8, 1.1e-7, 1.6e-7, 4.9e-7, 4.4e-5, 3.7e-3, 0.089, 0.58 (rungs 1-3 already merged);
    eps = 1/1024: 9.3e-5, 1.05e-4, 1.3e-4, 2.5e-4, 5.0e-4, 4.4e-3, 0.090, 0.58;
    eps = 1/16: 5.9e-3, 6.5e-3, 8.0e-3, 1.2e-2, 2.7e-2, 5.1e-2, 0.14, 0.63 (a cluster at c_r eps, no geometric spacing).
    At L = 0.5: eps = 1/16: 6.3e-3, 8.6e-3, 3.2e-2, 0.38. PREDICTION (3): HIT; the precise statement is stronger than
    I predicted: no threshold in eps, each rung is gone once eps exceeds about 10 times its eigenvalue.
Consistency with the two ends: at eps = 3/8 and 1/2 everything is positive, with bottoms 0.036-0.050.

## Session 5 (2026-11-11): does the whole-space kappa_min see the impostor's failure before its eigenvalue does?

### 23. Set-up and PREDICTION (written before any run of the impostor pencil)
Impostor = Davenport-Heilbronn f (tools/controls.py: a_n = 1, kappa, -kappa, -1, 0 for n = 1..5 mod 5),
Lambda_f(s) = (5/pi)^(s/2) Gamma((s+1)/2) f(s). x-space form (Lemma 5 redone with psi(3/4 + ir/2) + log(5/pi), no pole):
  Q_DH(v) = -(log(4 pi L/5) + gamma) g(0) + int_0^{2L} (g(0) - g(x))/x dx - int_0^{2L} hD(x) g(x) dx - 2 sum_{n < e^(2L)} c_n n^(-1/2) g(log n),
  hD(x) = e^(-x/2)/sinh x - 1/x (Gamma rates 2m + 3/2), c_n = coefficients of -f'/f (any sign, not on prime powers).
Leak D_L^DH: companion g ODD on R (the Gamma factor Gamma((s+1)/2) is the odd one), support [-lam, lam],
E_f(g)(x) = x^(1/2) sum_n a_n g(n x) = f on the window, inverted by the Dirichlet inverse b of a; free odd part on
(0, 1/lam); band [-lam/5, lam/5] (prolate parameter c = 2 pi e^(2L)/5, the coordinator's choice); no pole
conditions (none needed: no pole, and an odd g has ghat(0) = 0 = (Bg)(0) automatically).
Known (r1_A, midpoint arithmetic): impostor's bottom 3.1e-18 (L = 1.5), 5.2e-23 (1.6), 1.1e-28 (1.7), -7.9e-30 (1.72);
from 1.5 to 1.7 these follow the prolate defect at c = 2 pi e^(2L)/5 (ln-steps 11.0 and 13.1 against 2 dc = 11.2,
13.6), i.e. the eigenvalue gives NO warning until it crosses.
PREDICTION:
 (P1) kappa_min^DH at L = 1.0 is within 20% of zeta's 0.298 and stays within 20% of its own L = 1.0 value through
      L = 1.65 (bulk constant; the impostor's Gamma factor and atoms are bounded perturbations there).
 (P2) It falls only at the very end: kappa_min^DH(1.68) >= 0.7 kappa_min^DH(1.0); kappa_min^DH(1.70) in [0, 0.25].
      The reason I expect it: the off-line zero (0.8085 + 85.70 i) is felt first by ONE direction, whose ratio Q/D
      starts near 1 (ladder ratios are 0.9-1.1) and must fall below the bulk constant 0.3 before kappa_min moves.
 (P3) The better early warning is that rung's own ratio (Rayleigh quotient Q/D on the lowest D-eigenvectors): it drops by
      more than 10% already at L = 1.65 and by more than a factor 2 at 1.68.
 (P4) Against the coordinator's hypothesis: kappa_min^DH tracks zeta's within 20% until 1.65 (agree), then the fall is
      not gradual but sudden (between 1.68 and 1.70), so as an early warning it is at most 0.02-0.04 in L ahead of the
      eigenvalue sign change.
 Would surprise me: kappa_min^DH at L = 1.0-1.5 far below zeta's (< 0.15): then the comparison already "knows" the
 impostor is wrong away from the failure, which would be the opposite of plank 9's ladder finding.

### 24. First impostor numbers (COMPUTED; script pencil_dh.py.txt, chain of runs in progress)
Checks of the new script: zeta branch at L = 1/2, degree < 28 reproduces kappa_min = 0.330738, kappa_max = 2.31888;
impostor c_n agree with r1_A's dh_logderiv_coeffs exactly for n <= 29; impostor bottom at L = 3/2 (degree < 110) is
2.949e-18 against r1_A's 3.1e-18 (Fourier N = 120, an upper bound): consistent.
FIRST RESULT, before the rest of the chain: kappa_min^DH = 0.54884 at L = 1.0 (degree < 40, 50, 60: 0.548865, 0.548846,
0.548841) and 0.13773 at L = 1.5 (degree < 80, 95, 110: 0.137748, 0.137740, 0.137730). A fall by a factor 4 between
L = 1.0 and 1.5, at windows where the impostor's lowest eigenvalue still follows the prolate law (2.9e-18 at 1.5) and
0.2 in L before its first failure. At L = 1.5 the minimiser sits ON the ladder (half of its energy on rungs 1..6,
85% on rungs 1..12; largest: rung 5, eigenvalue 1.4e-6, 35%), and the Rayleigh ratios Q/D on the eigenvectors of Q
are 1.16, 0.91, 0.63, 0.46, 0.32, 0.31, 0.47, 0.83 for rungs 1..8 (the middle rungs are depressed).
Prediction (P1) MISSED: I expected the impostor's constant to stay within 20% through 1.65.
Chain so far (impostor, kappa_min at three degrees each): L = 1.0: 0.548841; 1.1: 0.465823; 1.2: 0.432984; 1.3: 0.431069;
1.4: 0.156987 (0.1585, 0.15723 at lower degree); 1.5: 0.137730; 1.6: 0.137596. The fall happens between L = 1.3 and
1.4, then a plateau at 0.1376-0.1377. Diagnostic added to pencil_dh.py.txt (impostor only): the contribution of the
four off-line quartets (r1_A's zeros at 85.70, 114.16, 166.48, 176.70) to Q(v), by the zero side of the explicit
formula, for the minimiser and the bottom eigenvectors. At L = 1.0 it is negligible (< 0.5% of Q(v) for all four
vectors). Reruns of 1.3-1.6 with the diagnostic queued (logs *_off.log).
Diagnostics so far: (i) L = 1.3 and 1.5: the off-line quartets contribute -4e-5 and +3.4e-5 of the MINIMISER's Q(v)
(and at most 1.4% of Q on the bottom eigenvectors). So the fall of kappa_min between 1.3 and 1.4 is NOT the direct
contribution of the off-line zeros. (ii) nh = 60 instead of 40 at L = 1.5: kappa_min = 0.13773 again (not the free
part). (iii) memory: the first L = 1.65 run hit the 1 GB cap and stalled; killed; D is now assembled in chunks of 300
nodes (identical results at L = 0.5 zeta and L = 1.0 impostor), and 1.65 is requeued.
CONTROL added, because the fall could be a property of "conductor 5 + my D" rather than of the impostor:
pencil_ctl.py.txt, kind chi5 = L(s, chi_5), chi_5 the quadratic character mod 5 (Euler product, even, conductor 5,
zeros on the line as far as computed): Gamma(s/2), constant log(5/pi), atoms chi(n) Lambda(n), companion even with
mu(n) chi(n), band [-lam/5, lam/5], no conditions. L = 1.0: kappa_min = 0.39913; ladders parallel (Q: 2.03e-6,
5.84e-4, 6.44e-2; D: 1.78e-6, 5.75e-4, 6.29e-2). PREDICTION for the control (written before its runs at 1.3-1.6):
if the impostor's fall is impostor-specific, kappa_min^chi5 stays within 20% of 0.40 through L = 1.6; I expect that
(probability about 0.6); the alternative is the same fall between 1.3 and 1.4 (then it is a conductor-5 effect of
the comparison, not a warning).
(iv) L = 1.68, degree < 145 (log pencil_dh_dh_42_25.log): kappa_min = 0.13758 at degree < 115 and < 130, but 0.05331 at
degree < 145 (second 0.0672). For this new minimiser the off-line quartet at 85.70 contributes -3.67 Q(v) (on-line part
4.67 Q(v)): without it the ratio would be 0.249. The bottom eigenvector of Q (9.13e-28) has off-line share -2.0 Q(v) and
ratio Q/D = 0.10. So the off-line zero IS seen directly, but only by a basis that resolves its height: a Legendre
degree of about 85.7 L (= 144 at L = 1.68). My runs at 1.5 and 1.6 (degree < 110, 130 < 85.7 L) could not see it, so
"the off-line zeros do not contribute" at those windows was a statement about the truncated space. All impostor
windows from 1.5 up are being rerun with degree >= 85.7 L + 20 (chain 6).
(v) Zero-by-zero decomposition of Q(v) added (zero side of the explicit formula, 2|F(gamma)|^2 per on-line zero below 200,
plus the off-line quartets; impostor zeros from r1_A/dh_zeros.json, zeta zeros by mpmath zetazero at 42 digits, cached in
zeta_zeros_200.json). Validation: it reproduces Q(v) of the minimiser to 5e-4 (impostor, L = 1.3) and 2.4e-4 (zeta, L = 0.5),
the rest being zeros above 200. WHERE THE MINIMISER SITS, on the zero side:
  zeta, L = 0.5: 90% of Q(v) on the first zero 14.13, 8% on 21.02.
  impostor, L = 1.3: 48% on 22.160 and 42% on 23.345: a close pair (gap 1.19, mean spacing there 2.17: normalised 0.55).
  The impostor's next close pair is 40.163 / 40.683 (gap 0.52, normalised 0.29), and the fall of kappa_min happens
  exactly when the window starts to resolve height 40 (4 pi e^(2L)/5 = 33.9 at L = 1.3, 41.3 at L = 1.4).
  HYPOTHESIS (to be tested on the chain-6 logs): kappa_min is set by the closest pair of zeros the window resolves;
  the plateau 0.1376 at L = 1.5-1.65 is the pair at 40.4; the fall to 0.053 at 1.68 is the off-line quartet.
Chain 6 results as they come (degree >= 85.7 L + 20 from 1.5 up):
  impostor 1.4, degree < 100/110/120: 0.156987, 0.156917, 0.156591; minimiser: 43% on 40.163, 43% on 40.683; off-line -0.2%.
  impostor 1.5, degree < 120/135/150: 0.137727, 0.137722, 0.137721; minimiser: 48% on 40.163, 51% on 40.683; off-line +7e-5.
  precision check 1.5 at 420 bits (degree < 110): 0.13773, unchanged.
  control chi5: 1.0: 0.399131; 1.2: 0.394102.
  impostor 1.6, degree < 130/145/160: 0.137596, 0.137595, 0.137594 (still the pair at 40.4: 48% + 51%); but the THIRD
     pencil value fell to 0.2011 (0.3727 at 1.5), and the bottom eigenvector of Q now has off-line share -20% (Q/D 0.53).
  impostor 1.65, degree < 140/155/165: 0.129097, 0.122895, 0.120533 (NOT converged in the degree; Rayleigh-Ritz, so these
     are upper bounds of the whole-space kappa_min). The minimiser has left the pair: its Q sits on the on-line zeros
     80.33-90.72 around the off-line point (on-line part 2.15 Q(v)) and the off-line quartet at 85.70 takes -1.19 Q(v);
     without it the ratio would be 0.264.
  control chi5: 1.3: 0.393311; 1.4: 0.384047 (no fall).
  impostor 1.68, degree < 145/158/168: 0.0533096, 0.0515305, 0.0513273; minimiser on on-line zeros 80.3-90.7 (on-line part
     4.78 Q(v)), off-line quartet 85.70: -3.81 Q(v); without it 0.246.
  impostor 1.70, degree < 150/160/170: 0.0419647, 0.0415746, 0.0412366; on-line part 5.77 Q(v), off-line -4.87 Q(v);
     without it 0.241. Bottom of Q: 1.052e-28 (r1_A: 1.1e-28), i.e. the eigenvalue still follows the prolate law.
  control chi5: 1.5: 0.326345; 1.6: 0.325258.
  impostor 1.72, degree < 150/162/172: -0.0445159, -0.0478683, -0.0479638; bottom of Q -7.335e-30 (r1_A: -7.9e-30).
  zeta 0.75 (degree < 80): 0.326506; minimiser: 70% on the first zero 14.13, 13% on the pair 48.01/49.77.
  zeta 1.0 (degree < 116): 0.297833; minimiser: 51% on 59.347 and 29% on 60.832 (zeta's closest normalised pair below
     the resolution height 4 pi e^2 = 93); the step of kappa_min between L = 0.75 and 0.85 (section 20) is the window
     starting to resolve this pair (4 pi e^(2L) = 56 at 0.75, 69 at 0.85).
PREDICTION for zeta at L = 1.25 (written while that run is in progress, before reading it): the minimiser sits on the pair
111.030/111.875 (normalised gap about 0.39, the closest below the resolution height 153) and kappa_min falls to [0.15, 0.25].
  zeta 1.25 (degree < 170/200, 640 bits): 0.204672, 0.204610; bottom of Q 5.19e-55 (r1_A: 5.02e-55); minimiser: 58% on 111.875,
     39% on 111.030. PREDICTION (pair 111.03/111.88, kappa in [0.15, 0.25]): HIT.

### 25. Summary of session 5 (COMPUTED, multiprecision, one implementation, NOT certified)
| L | impostor kappa_min (degree) | impostor: where the minimiser's Q(v) sits | chi5 control | zeta |
|---|---|---|---|---|
| 1.0 | 0.5488 (60) | mixed | 0.3991 | 0.2978 (116): 80% on the pair 59.35/60.83 |
| 1.1 | 0.4658 (70) | | | |
| 1.2 | 0.4330 (80) | | 0.3941 | |
| 1.25 | | | | 0.2046 (200): 97% on the pair 111.03/111.88 |
| 1.3 | 0.4311 (90) | 90% on the pair 22.16/23.35 | 0.3933 | |
| 1.4 | 0.1566 (120) | 86% on the pair 40.16/40.68 | 0.3840 | |
| 1.5 | 0.1377 (150) | 99% on 40.16/40.68 | 0.3263 | |
| 1.6 | 0.1376 (160) | 99% on 40.16/40.68 (third value 0.201, falling) | 0.3253 | |
| 1.65 | <= 0.1205 (165, not converged) | zeros 80-91 + off-line quartet 85.70 at -1.19 Q(v) | | |
| 1.68 | 0.0513 (168) | off-line quartet -3.81 Q(v) | | |
| 1.70 | 0.0412 (170) | off-line quartet -4.87 Q(v) | | |
| 1.72 | -0.0480 (172) | off-line quartet +5.16 Q(v), Q(v) < 0 | | |
Answers to the coordinator: (1) the impostor's kappa_min is NOT within 20% of zeta's at L = 1 (0.55 against 0.30) and it
does NOT stay flat: it falls by a factor 2.8 between L = 1.3 and 1.4, 0.3 before the failure, but the cause is a close pair
of on-line zeros (40.163, 40.683), not the coming failure (the off-line zeros carry < 0.3% of that minimiser's Q). (2) The
coming failure itself takes over kappa_min from L = 1.65 (0.05-0.07 in L before the eigenvalue changes sign between 1.70
and 1.72, while the eigenvalue still follows the prolate law at 1.70), and only in a basis that resolves height ~90
(Legendre degree >= about 90 L). (3) The decisive by-product: for zeta the minimiser also sits on the closest resolved
pair, and kappa_min falls when a closer pair enters: 0.33 (L <= 0.75) -> 0.30 (pair normalised gap 0.53) -> 0.205 at
L = 1.25 (pair 111.03/111.88, normalised gap 0.39). HEURISTIC consequence: since ever closer pairs exist (Lehmer pairs, GUE),
kappa_min(L) for zeta is expected to tend to 0; plank 8 with a constant bounded below would then be false, and the
comparison constant is a measure of the closest pair of zeros, i.e. barrier B3 (no slack) in a new form.
Predictions: P1 MISSED (fall at 1.3-1.4, not flat to 1.65); P2 partly (no fall at 1.68 from the off-line zero as I
predicted, it was already at 0.05 there); P3 HIT in substance (the off-line channel is visible from 1.6 as the falling
third value 0.37 -> 0.20, identity of that vector not checked); control prediction (chi5 within 20% of 0.40 to 1.6): HIT
(0.325 = -19%). Zeta 1.25 prediction: HIT.
Not done: certification; second implementation; the identity of the third pencil vector at 1.6; impostor degree beyond
172 at 1.65 (value still falling with the degree); a law kappa(normalised gap).
