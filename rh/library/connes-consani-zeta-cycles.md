# Connes, Consani: Spectral triples and zeta-cycles

Reader: R-read-1, 2026-11-11. This note reports what the paper contains. It recommends nothing.

## 1. Reference and how much was read
- A. Connes, C. Consani, "Spectral triples and zeta-cycles", arXiv 2106.01715 v1 (3 Jun 2021), 56 pages,
  54 figures, dedicated to V. Jones. Published as Enseign. Math. 69 (2023), no. 1-2, 93-148 (reference taken
  from the bibliography of arXiv 2511.23257; the published text was not compared).
- Source: TeX, `rh/library/src/2106.01715/Spectraltriples.tex` (1958 lines, 148 286 bytes).
- Read: **all of the paper**, lines 85 to 1544 (`\begin{document}` to `\end{document}`): abstract,
  sections 1 to 7, bibliography. The 54 figures were not opened; their captions were read, and several results
  of the paper exist only as figures (see part 6).
- The source file continues after `\end{document}` (lines 1546 to 1958) with material that is NOT part of the
  paper: an unpublished appendix "Size of F_mu o w (Prolate)" (lines 1546 to 1658, read in full) and an earlier
  draft of sections 2.1 and 6.2 (lines 1659 to 1958; compared with the main text by `diff`, first and last
  hundred lines read, the middle not read line by line).
- Theorem numbers are computed from the `\newtheorem` declarations in the source (theorems, lemmas,
  propositions, corollaries share one counter per section; definitions have their own). Not checked against
  the published numbering.

Conventions of the paper: test functions on [1/lambda, lambda] in the multiplicative variable u; mu = lambda^2;
L = log mu = 2 log lambda is the full length of the window. Our half-width L_ours (r1_A) is log lambda, so
mu = e^(2 L_ours) and L_paper = 2 L_ours. Fourier transform fhat(s) = int f(u) u^(-is) d*u.

## 2. What it proves
The paper has two kinds of content: (A) theorems, all unconditional, and (B) numerical observations, reported
through figures and tables, with no error analysis.

### (A) Theorems (all unconditional)
- **Proposition 2.1.** For lambda > 1 the semi-local Weil form
  QW_lambda(f, f) = int |fhat(t)|^2 (2 theta'(t)/2 pi) dt + 2 Re(fhat(i/2) conj fhat(-i/2))
  - sum_{1 < n <= lambda^2} Lambda(n) <f | V(n) f>
  is a lower bounded, lower semi-continuous quadratic form on L^2([1/lambda, lambda], d*u) with values in
  (-inf, +inf]. Here theta is the Riemann-Siegel angle and <f|V(n)g> = n^(-1/2)((f* * g)(n) + (f* * g)(1/n)).
- **Lemma 2.2.** With U(u) = u^(i pi/log lambda), the Laurent polynomials C[U, 1/U] are a core for QW_lambda.
- **Proposition 2.3, Corollary 2.4.** QW_lambda(f) = liminf over g_n -> f, g_n in C[U, 1/U]; hence "the lower
  bound of QW_lambda is the limit, when N -> infinity, of the smallest eigenvalue of the restriction of
  QW_lambda to the linear span E_N of the functions U^k for |k| <= N".
- **Lemmas 2.5 to 2.7.** In the real basis xi_n (cosines for n >= 0, sines for n < 0) the matrix splits as
  sigma = sigma^+ (+) sigma^- (even and odd under u -> 1/u); explicit table of the correlations
  (1/2)(xi_n * xi_m^* + xi_m * xi_n^*)(y); the pole term fhat(i/2) + fhat(-i/2) contributes a rank-one matrix to
  each block, with closed forms (2.7); closed formula for the archimedean term
  W_R = (theta_sym(0)/2)(gamma + log(4 pi (e^L - 1)/(e^L + 1))) + int_0^L (e^(x/2) theta_sym(x) - theta_sym(0))
  /(e^x - e^(-x)) dx.
- **Proposition 4.1.** D(lambda, k) := (1 - Pi(lambda, k)) D_0 (1 - Pi(lambda, k)), D_0 = -i u d/du on the circle
  R_+^*/lambda^(2Z), with Pi(lambda, k) the projection on k "prolate vectors" (Definition 3.1), is a finite-rank
  perturbation of D_0 and defines a spectral triple.
- **Proposition 4.2.** For E = 2 pi mu the number N'(E) of non-zero eigenvalues of D(lambda, k) in (0, E], with
  k close to nu(mu) ~ 2 mu, satisfies N'(E) ~ (E/2 pi) log(E/2 pi) - E/2 pi. The proof is a count ("~", "up to a
  log mu term"), not an asymptotic theorem with error term.
- **Lemma 5.1, Proposition 5.2.** For a self-adjoint matrix D and projections P_1 <= P_2, the positive
  eigenvalues of (1 - P)D(1 - P), in decreasing order, satisfy mu_n(D_{P_2}) <= mu_n(D_{P_1}).
- **Lemmas 6.1, 6.2.** For f of bounded variation, rapidly decaying, O(u^2) at 0, with int_0^inf f = 0:
  E(f)(u) := u^(1/2) sum_{n>0} f(nu) is O(u^(1/2)) at 0 and rapidly decaying at infinity, and
  Sigma_mu E(f)(u) := sum_k E(f)(mu^k u) converges geometrically. Scaling commutes with E and Sigma_mu.
- **Definition 6.1 (= 1.1).** "A zeta-cycle is a circle C of length L = log mu such that the subspace
  Sigma_mu E(S_0^ev) is not dense in the Hilbert space L^2(C)." (S_0^ev: even real Schwartz functions with
  f(0) = 0 = int f.)
- **Proposition 6.3.** The n-fold cover of a zeta-cycle is a zeta-cycle.
- **Theorem 6.4 (= Theorem 1.1), the main result.** "(i) Let C be a zeta-cycle. Then the spectrum of the
  action of the multiplicative group R_+^* on the orthogonal complement of Sigma_mu E(S_0^ev) in L^2(C) is
  formed by imaginary parts of zeros of zeta on the critical line. (ii) Let s > 0 be such that
  zeta(1/2 + is) = 0, then any real circle C of length an integral multiple of 2 pi/s is a zeta cycle and its
  spectrum ... contains is."
  Unconditional. It sees ONLY zeros on the critical line: the spectrum consists of unitary characters u^(is),
  s real, of the compact group R_+^*/mu^Z. It says nothing about zeros off the line.
- **Corollary 6.5.** H(L) := (Sigma_mu E(S_0^ev))^perp is non-zero iff there are a critical zero 1/2 + is and an
  integer n with sL = 2 pi n.
- Key identity inside the proof of 6.4: for f in S_0^ev,
  int E(f)(u) u^(-iz) d*u = zeta(1/2 - iz) int u^(1/2) f(u) u^(-iz) d*u, valid down to real z.

### Stated without proof, as known
- "the positivity of the Weil quadratic form QW_lambda for all lambda implies the Riemann Hypothesis (RH), and
  in case RH holds, QW_lambda is known to be strictly positive."
- "In [Yoshida 1992], the positivity was shown to hold for lambda = sqrt 2 using numerical analysis." (That is
  mu = 2: full window length log 2, only the archimedean place and the pole.)
- Under RH the radical of QW restricted to a finite interval is zero (zero-counting argument, section 3).
- The radical of QW (all supports) contains the range of E on S_0^ev (from Connes 1999).

### (B) Numerical observations (no proof, no error bars)
- 2.2: the archimedean contribution alone (with the pole term) to the even block is positive for L in
  [0, log 2] (smallest eigenvalue about 0.00133 at L = log 2) and changes sign for L slightly above log 2;
  adding the prime 2 restores positivity on log 2 <= L < log 3.
- 2.3: at mu = 3 (L = log 3), replacing 2 by a real p in the formula for W_2, "the smallest eigenvalue
  lambda(p) ... is negative for p = 1.9999 and also for p = 2.0005, so that the positivity requirement restricts
  the choice of p to an interval of size < 10^-3 around p = 2". The smallest eigenvalue of sigma^+ at mu = 3 is
  "< 6 x 10^-8".
- 2.4: when mu passes a prime power (2, 3, 4, 5, 7 shown, even and odd blocks) and its term is omitted, the
  smallest eigenvalue becomes negative; with the term it stays positive. Displayed up to mu about 7.
- 2.5: the smallest eigenvalue s(L) of the even block has "an exponential behavior": log s(L) plotted against
  mu = e^L looks linear (figures only; no slope, no formula). The number of very small eigenvalues of sigma^+
  "increases roughly like mu"; sigma^- has one fewer. "when lambda^2 = 11 the smallest positive eigenvalue is
  2.389 x 10^-48".
- 3: the eigenvectors of the smallest eigenvalues coincide graphically with the Gram-Schmidt orthonormalised
  "prolate vectors" epsilon_n (16 half-integer values of mu from 3.5 to 11, first six eigenvalues of each
  parity); the j-th even one starts to agree around mu = j + 1, the j-th odd one around mu = j + 1.5.
- 4: for mu = 5.5, ..., 10.5 the positive eigenvalues of D(lambda, k), k = nu(mu) = 2 mu - 1, below 2 pi mu
  resemble the zeta zeros below 2 pi mu to within a normalised r.m.s. deviation falling from 3.8% to 1.0%
  (tables given; e.g. mu = 10.5: 14.450, 21.455, 25.356, ... against 14.1347, 21.022, 25.0109, ...).
- 5: at special values of mu, forming geometric progressions of ratio exp(2 pi/zeta_n), the n-th eigenvalue of
  D(lambda, k) becomes independent of k, its eigenvector is an eigenvector of D_0, mu^(i lambda_n) = 1, and the
  common value "coincides exactly" with zeta_n. Scanning mu in [5, 16.5] with this criterion gives 31 numbers
  compared with the first 31 zeros (a figure; the paper estimates the chance of a random agreement as 10^-50).

## 3. Method in ten lines
1. Write the explicit formula (Bombieri's form) for g = f* * f with f supported in [1/lambda, lambda]: pole
   term, archimedean term, and finitely many prime powers n <= lambda^2.
2. Show the form is closed and lower bounded (the archimedean symbol 2 theta'(t) grows like log|t|) and that
   trigonometric polynomials are a core, so finite matrices compute the bottom of the spectrum.
3. Compute large truncations numerically, even and odd blocks separately.
4. Explain the tiny eigenvalues: the range of E, E(f)(x) = x^(1/2) sum_{n>0} f(nx), lies in the radical of the
   full Weil form because its transform is zeta(1/2 - iz) times an entire function.
5. If f and fhat were both supported in [-lambda, lambda], E(f) would be supported in [1/lambda, lambda]
   (Poisson: E(fhat)(x) = E(f)(1/x)) and would be a null vector of QW_lambda. That is impossible, but
   Slepian-Pollak's prolate functions PS_{2m,0}(2 pi lambda^2, x/lambda), m <= nu ~ 2 lambda^2, are nearly so.
6. Enforce f(0) = 0 by subtracting a multiple of psi_0 (even family) or psi_1 (odd family); truncate E(phi_n)
   to [1/lambda, lambda]: "prolate vectors", on which QW_lambda is extremely small but not zero.
7. Forget the Weil form: project the Dirac operator of the circle of length L away from the first k prolate
   vectors; observe that its low spectrum resembles the zeta zeros.
8. Observe the k-independent points and the quantisation mu^(is) = 1.
9. Explain them: periodise, Sigma_mu E(f) on the circle R_+^*/mu^Z; a character u^(is) of the circle is
   orthogonal to all Sigma_mu E(f) iff zeta(1/2 + is) = 0 (step 4's identity), which needs mu^(is) = 1.
10. The proved part is steps 1, 2 and 9. The link between the finite prolate projection Pi(lambda, k) of
   step 7 and the subspace Sigma_mu E(S_0^ev) of step 9 is described ("conceptual explanation"), not proved.

## 4. Where it stops
- No positivity statement for QW_lambda is proved for any lambda. Positivity is "tested numerically"; the
  proved facts are that the form is closed, lower bounded and computable by truncation (2.1 to 2.4).
- The tiny eigenvalues are exhibited numerically and explained by the prolate construction, but there is no
  theorem bounding them above or below, no formula for their size, and no proof that the prolate vectors
  approximate the eigenvectors. The comparison is by overlaid graphs. The step "act as if E(phi_n) would
  fulfil E(phi_n)(1/u) = (-1)^n E(phi_n)(u)" is an approximation written with the sign "~".
- The resemblance between the spectrum of D(lambda, k) and the zeros is numerical. Theorem 6.4 concerns the
  orthogonal complement of the infinite-dimensional space Sigma_mu E(S_0^ev); the paper proves no statement
  connecting it to the finite-rank operator D(lambda, k) (no estimate of how close an eigenvalue of D(lambda, k)
  is to a zero, at or away from the special mu).
- Theorem 6.4 detects critical zeros only and is a spectral realisation in L^2 of a circle; the authors present
  it as a variant of Connes's 1999 realisation ("The ad-hoc Sobolev spaces ... are here replaced by the
  canonical Hilbert space L^2(C)"). It does not constrain where zeros are.
- What the authors announce and do not do (section 7, Outlook): a sheaf over the Scaling Site whose cohomology
  would give the spectral realisation "taking care, in particular, of eventual multiplicity" (deferred to "a
  forthcoming paper"); and "to look for a mysterious 'cusp' whose closed geodesics would correspond to
  zeta-cycles".
- The exact point where the method ends: after step 6 the Weil form itself is no longer used; nothing proved
  about the prolate vectors is fed back into a bound for QW_lambda.

## 5. What it changes in our record
- **r1_A PROGRESS, "The law for mu(L): prolate leakage [... qualitative link is known (Connes-Consani)]"**, and
  **IDEAS #2 log (A1 prolate law)**. Confirmed and made exact:
  - Our "why n = 4, 8, ..." paragraph, marked HEURISTIC, IS the construction of section 3 of this paper, step
    for step: near-null vectors E(phi) with phi prolate, Poisson summation, even block <-> Fourier eigenvalue
    +1 (their psi_m, m even, i.e. PS_0, PS_4, PS_8, ...), odd block <-> -1 (PS_2, PS_6, ...), and the condition
    phi(0) = 0 imposed by combining with PS_0 (even) or PS_2 (odd), which removes one function from each
    family. (Their index m is half of ours: their psi_m = PS_{2m,0}.) Their count "sigma^- has one less small
    eigenvalue" agrees with ours. So that paragraph should be marked "known: Connes-Consani 2106.01715,
    section 3 (construction and graphical comparison; no proof)".
  - Our QUANTITATIVE law, mu_even(L) = kappa(L)(1 - chi_4(2 pi e^(2L))) with kappa in [2.1, 6.8], mu_odd
    against 1 - chi_6, and the ladder against 1 - chi_{4j}: **not in the paper**. The paper states only an
    "exponential behavior" of the smallest eigenvalue in mu (figures) and one number.
  - Their one number agrees with ours: 2.389e-48 at mu = 11 (ln = -109.65); linear interpolation in mu of our
    table between mu = 7.39 (ln -67.24) and mu = 12.18 (ln -125.0) gives about ln = -110.8 at mu = 11. Their
    "< 6e-8" at mu = 3 sits next to our 9.3e-7 at mu = e. (Rough comparisons by this reader; nothing was
    recomputed.)
  - Normalisation: their chi(mu, m) = 2 lambda S^(1)_{2m,0}(2 pi mu, 1) is the eigenvalue of the truncated
    Fourier (cosine) transform, close to 1 for m <= nu(mu); the energy-concentration eigenvalue used in our
    prolate.py is, for the same function, its square. Their tables (e.g. chi(5.5, 10) = 0.9507,
    chi(5.5, 11) = 0.572) show the cut-off nu(mu) = 2 mu - 1 for half-integer mu.
  - Range: their eigenvalue data stop at mu = 11 (and the spectral-triple scans at mu = 16.5); ours go to
    mu = e^3.5 = 33.1. Neither is interval-certified.
- **r1_A PROGRESS, last lines, and IDEAS #2**: "Connes-Consani, Spectral triples and zeta-cycles (tiny
  eigenvalues of the truncated Weil form, prolate functions, first 31 zeros reproduced)". Imprecise in one
  respect: the 31 zeros in this paper are NOT zeros of the transform of the minimiser of the Weil form. They
  are eigenvalues of the perturbed Dirac operator D(lambda, k) at the special values of mu (section 5.4), a
  construction that does not use the Weil form. The paper never looks at the zeros of the Fourier transform of
  an eigenvector of QW_lambda. So the heading in r1_A, "Zeros of the transform of the minimiser (reproduces
  the Connes et al. phenomenon)", does not refer to anything in this paper (nor in arXiv 2511.23257, which
  has no zeta numerics). That our L = 1 run found "31 zeros in (0, 110)" is a coincidence of counts.
- **IDEAS #9 (bootstrap), log entry "POSITIONS are forced too"** (one atom at free position, window
  L_ours = 0.5: non-negative only at x = 2.000; fails at 1.994 and 2.014), and **IDEAS #10 prediction (c)**
  (prime 2 moved to 2.1). Already published in substance as section 2.3 of this paper, at a larger window and
  with a tighter result: at mu = 3 the smallest eigenvalue is negative for p = 1.9999 and p = 2.0005. Difference:
  the paper moves p inside the fixed formula (log p) p^(-1/2) (position and weight together); our run frees the
  position and the weight separately and finds the best weight 0.4895 against log 2/sqrt 2.
- **IDEAS #9 log, "with no atom at all the form is negative from about L = 0.362 on"**, and **IDEAS #10 log,
  result (c)** ("the smooth background (Gamma factor + pole) by itself turns negative between L = 0.36 and
  0.38, just past (1/2) log 2"). This is section 2.2 of the paper (figures "Change of sign of the smallest
  eigenvalue of the archimedean contribution ... for L in [log 2 - 0.2, log 2 + 0.2]"; value 0.00133 at
  L = log 2). Our 2 x 0.36..0.38 = 0.72..0.76 lies just above log 2 = 0.693, as in their figure. Already known,
  numerically, in both places.
- **IDEAS #9 log, "positivity sieve"** (weights at n = 2..10 pinned, including ZERO at 6 and 10, with
  half-widths and the fitted law exp(5.2 - 7.97 sqrt(n + 1/2))). Partly in the paper: section 2.4 shows that
  omitting the term of a prime power 2, 3, 4, 5, 7 just past it makes the form negative. Not in the paper:
  allowed intervals for the weights, the composite integers (weight zero), any law for the widths, any
  statement that the weights are determined.
- **IDEAS #1 log, kill line of the merged entry N2** ("a full-text read of Yoshida 1992 or Connes-Consani
  arXiv 2106.01715 shows window positivity already published up to log 100"): after a full read, this paper
  does NOT contain a proof of window positivity for any window. It quotes Yoshida for lambda = sqrt 2 (window
  length log 2, "using numerical analysis") and reports its own uncertified numerics up to mu = 11.
- **KNOWLEDGE section 2**, "Weil positivity for test functions of small support (Yoshida 1992)": per this
  paper's citation the range is lambda = sqrt 2, i.e. test functions supported in [2^(-1/2), 2^(1/2)], before
  any prime enters. (Yoshida's paper itself was not read by this seat.)
- **KNOWLEDGE section 2**, "... and at the archimedean place via the prolate operator (Connes-Consani 2021;
  Connes-Consani-Moscovici 2022)": this paper (2021) contains no positivity theorem; the archimedean theorem
  is in arXiv 2006.13771 (see `connes-consani-weil-positivity-archimedean.md`).
- **r1_A step (b)**, "values ... are ... upper bounds for mu(L) (Rayleigh-Ritz)": the convergence of these
  truncations to the true bottom of the form is Corollary 2.4 of this paper (unconditional).
- **r1_A step (a)**, closed-form matrix: the same matrix is Lemmas 2.6 and 2.7 plus the W_R formula; the paper
  keeps one integral in the archimedean term where our code uses digamma values.
- **IDEAS #20 / r1_A "trial vector theta_L"** (prolate trial vector): the candidate vectors are the epsilon_n of
  Definition 3.1; the paper gives no Rayleigh quotient for them.
- **Theorem 6.4 and zeta-cycles** do not appear anywhere in IDEAS, THEORY or ATLAS (searched by grep for
  "cycle"). Not in our record.
- **ATLAS, THEORY**: no entry is contradicted.

## 6. Reliability
- Published in a refereed journal (L'Enseignement Mathematique) according to the later citation; this note is
  from arXiv v1.
- The theorems (2.1 to 2.4, 6.1 to 6.5) have complete proofs in the text; 6.4 was read line by line and is
  short. A slip: in the proof of Corollary 6.5 "sL = n" should read "sL = 2 pi n".
- The numerical part is experimental by the authors' own description ("discovered numerically at first", "we
  report numerical evidence"). No precision, truncation size N or software is stated for most computations; the
  agreement of eigenvectors and of the 31 zeros is given as pictures; the "10^-50" probability is an estimate
  whose computation is not shown. The tables of section 4 are the only place where eigenvalues can be compared
  digit by digit, and there the agreement is at the level of a few percent.
- "nu(mu) = 2 mu - 1 works well when mu is a small half integer" is an empirical rule.
- The unpublished appendix left in the source (orthogonal polynomials for |Gamma(1/4 - i sqrt(x)/2)|^2 from
  Hermite functions) is not part of the paper and carries no claim.
