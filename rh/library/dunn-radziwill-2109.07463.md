BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# A. Dunn, M. Radziwiłł, "Bias in cubic Gauss sums: Patterson's conjecture", arXiv 2109.07463 v3 (May 2024); Ann. of Math. (2) 200 (2024), 967-1057

Reader: READER-7, 2026-11-11. Source: arXiv TeX (`output.tex`, 263,959 characters, 4,096 lines, plus the .bib),
saved under `rh/library/src/cubic_2109.07463/x/`. Refereed (Annals).

## 1. What was read — PARTLY
The lead asked for "the sections on the spectral input they use". Read: **section 1 (introduction, all theorems),
sections 2-4 (Q(omega), conventions, Poisson summation incl. Corollary 4.4), section 5 (Voronoi in the level
aspect: 5.1-5.3 and the statements 5.4 Lemma/Prop "polefunc", the Voronoi Proposition and its proof), section 7
statement of the Type I proposition and its corollary and remarks, section 8 in full (lines 2669-3204: the cubic
large sieve, the proof of Theorem 1.4, Propositions 8.2 and 8.3 with complete proof, the squarefree sieve lemma).**
About 2,050 of 4,096 lines. **NOT read:** section 5.5-5.6 proofs (lines 1500-1925, Dirichlet-series manipulations),
section 6 (cancellation over primes under GRH), sections 7 proof body, 9-12 (Type II, average Type I,
combinatorial decomposition, proofs of Thms 1.1-1.3), appendix (Patterson's tables). Theorem numbers below follow
the order of the TeX environments (labels given).

## 2. Main statements, with their numbers
- **Theorem 1.1** (`thm:main`, GRH for Hecke L-functions over Q(omega)). W smooth, compact support in (0,inf):
  `sum_{p = 1 (3)} (S_p / 2 sqrt p) W(p/X) ~ ((2 pi)^{2/3}/(3 Gamma(2/3))) int W(x) x^{-1/6} dx * X^{5/6}/log X`,
  S_p = sum_{n=1}^p e(n^3/p). Equivalently (eq. after (1.4)) sum over primes varpi of g~(varpi) ~ X^{5/6}/log X.
  This is Patterson's 1978 conjecture (bias of cubic Gauss sums over primes).
- **Theorem 1.2** (`thm:cor`, GRH): the angles theta_p are equidistributed with a secondary term of order
  X^{5/6}/log X proportional to the cos(2 pi x) Fourier coefficient of the test function.
- **Theorem 1.3** (`thm:main3`, GRH): sum over primes of g~(varpi)^k W(N varpi/X) = o(X^{5/6}/log X) uniformly in
  1 < |k| <= X^{1/100}.
- **Theorem 1.4** (`hboptimal`, lower bound under GRH; upper bound unconditional = Heath-Brown 2000). For the operator
  norm B(A,B) of the cubic large sieve over squarefree a, b:
  (AB)^{2/3} << B(A,B) << (AB)^{2/3+eps} for A in [sqrt B, B^2] minus [B^{1-eps}, B^{1+2eps}], and
  (AB)^{2/3-3eps} << B(A,B) << (AB)^{2/3+eps} in the middle range. Extremal sequence: beta_b = conj(g~(b)) W(N(b)/B).
  (Made unconditional by de Faveri-Dunn-Hoffstein 2026, digest `dfdh-2607.07911.md`.)
- **Corollary 4.4** (`corpois`, Poisson in the twist variable). For squarefree n_1, n_2 = 1 mod 3, d = (n_1,n_2):
  `sum_{m = 1 (3)} (m/n_1)_3 conj((m/n_2)_3) V(N(m)/M) = C M g(n_1/d) conj(g(n_2/d)) N(n_1 n_2/d)^{-1} (unit factors)
     * sum_{k in Z[omega]} c~_d(k) conj((k/(n_1/d))_3) (k/(n_2/d))_3 V''(k d sqrt M/(n_1 n_2))`,
  V'' a J_0-Hankel transform, c~_d a Ramanujan-type sum. **Poisson over the family variable m produces products of
  complete cubic Gauss sums g(n_1/d) conj(g(n_2/d)) and a dual sum of length ~ N(n_1 n_2)^2/(N(d)^2 M).**
- **Section 5 (spectral input).** Kubota's cubic theta function theta(w) on H^3, automorphic on Gamma_2 with the
  cubic Kubota multiplier chi, Fourier expansion `theta(w) = sigma v^{2/3} + sum_mu tau(mu) v K_{1/3}(4 pi |mu| v) e(mu z)`,
  sigma = 3^{5/2}/2, with Patterson's exact coefficients tau(mu) (Patterson 1977 Thm 8.1: conj(g(lambda^2, c)) |d/c|
  3^{n/2+2} on mu = +- lambda^{3n-4} c d^3, etc.). Lemma 5.2 (`Ssieve`) isolates the coefficients on
  S = {lambda^{-3} c d^3}; Lemma 5.3 (`functwisteq`) and Cor 5.4 (`autcor`): automorphy under the 27 cusp
  representatives turns a twist by a periodic function psi mod r into a twist by psi~, a sum of cubic Kloosterman
  sums S_{1/3}(x,u;r). **Prop "polefunc"**: Lambda(s, F_1 bar; psi)_S continues to C, single simple pole at
  s = 5/6, residue sigma psi~(0)/(6 N(r)^{5/3}); entire for l != 0; functional equation
  `3 (-1)^l N(r)^{2s} (r bar/r)^l Lambda(s, F_1 bar; psi, l)_S = Lambda(1 - s, F_1* + omega F_19* + omega^2 F_10*; psi~, -l)`.
- **Voronoi Proposition** (`voronoiprop`): for W smooth compactly supported in (0,inf), r = 1 mod 3,
  `sum_{c,d = 1(3), (d,r)=1} |d| g~(c) (cd^3/|cd^3|)^l conj((c/r)_3) W(N(cd^3)/X)
     = delta_{l=0} X^{5/6} W~(5/6) (2 pi)^{5/3} phi(r) conj(g(r)) / (3^{7/2} Gamma(2/3) N(r)^{5/3})
       + conj(g(r)) (dual sum over nu in lambda^{-1} Z[omega], d, of a^dag(nu) b_r^dag(nu) N(nu)^{-1} N(d)^{-5/2} W_l((2pi)^4 N(d^3 nu) X / N(r)^2))`.
  The dual length is N(nu) ~ N(r)^2/X.
- **Type I Proposition** (`prop:typeI`, RH for Hecke L-functions over Q(omega)). r squarefree:
  `sum_{u = 1(3)} g~(ur) (u/|u|)^l W(N(u)/U) = delta_{l=0} W~(5/6) (2pi)^{5/3} U^{5/6} phi(r) / (3^{7/2} Gamma(2/3) zeta(2; 1_r) N(r)^{7/6})
     + O( (1+|l|)^eps ( U^{5/6 - rho} N(r)^{-1/6 - rho} + U^{1/12+eps} N(r)^{7/12+eps} (1 + l^6) ) )`.
  Remark: the main term dominates iff U >= (N(r)(1 + l^6))^{1+o(1)}.
- **Proposition 8.3** (`prop:adj`) and **8.2** (`prop:main`): the "dispersion" / corrected cubic large sieve. For
  beta in C_eta(B, w) (|beta| <= 1, squarefree w-rough support, N(b) ~ B, and square-root cancellation against all
  non-principal cubic characters, axiom 4 of Definition 3.1, a GRH-type hypothesis):
  `sum_{a = 1(3), pi gamma^2 | a} V(N(a)/A) | sum_{(b,a)=1} beta_b g~(b) conj((b/a)_3) - C (conj g~(a)/N(a)^{1/6}) sum_b beta_b N(b)^{-1/6} |^2
     <= main (A^{2/3}/N(pi)) |sum_b beta_b N(b)^{-1/6}|^2 + O( A^{2/3}B^{5/3} w^{-9/10} + (Delta N(pi) X)^eps (B^{2+2eta} N(pi) Delta^2 + X (1 + (B^2/A)^{-1000})) ) + ...`
  (X = AB). Proof: expand the square, **Poisson in the family variable a (Cor 4.4)**; the dual frequencies k with
  d pi^2 gamma k a cube give the main term (a second Poisson over the cube root h gives N(b_1 b_2)^{1/3} A^{-1/3});
  the non-cube k (D_2) form a dual family of length ~ B^2/A and are bounded by the axiom, giving
  D_2 << (A B^{2 eta} + B^{2+2 eta} N(pi) Delta^2) (eq. (8.30)); cross term by the Type I proposition.

## 3. The method in ten lines
Cubic Gauss sums are (up to units, powers of lambda and a cube factor) the Fourier coefficients of Kubota-Patterson's
cubic theta function, the residue at s = 4/3 of the cubic metaplectic Eisenstein series; theta is the residual
spectrum of L^2(Gamma_2\H^3, chi). Its automorphy under SL_2(Z[omega]) (with Patterson's tables at the 27 cusps)
gives a level-aspect Voronoi formula for sums of g~(c) twisted by cubic characters mod r: one pole at s = 5/6 (the
X^{5/6} bias), a dual sum of length N(r)^2/X. That gives Type I sums with an asymptotic. Type II sums need the
cubic large sieve with a correction term (section 8), which is again Poisson in the family + Voronoi; to close the
argument over primes, GRH supplies square-root cancellation of the relevant sequences against all non-principal
cubic characters (axiom 4 of Definition 3.1), and Type III sums at A = B = C = X^{1/3} are handled by a GRH-sharpened large sieve
bound tight up to constants. **No Kuznetsov formula, no metaplectic cusp forms, no spectral large sieve is used**:
`grep` of the whole TeX for Kuznetsov / spectral / eigenvalue / exceptional finds only two bibliography-related
mentions (Young's GL_3 spectral large sieve, Iwaniec-Li's Gamma_1(q) spectral large sieve, both as analogies).

## 4. Where it stops (authors' words, section 1.5)
- Type III sums with A = B = C = X^{1/3}: "Bounding these sums with a power-saving presents a real challenge that we
  do not know how to solve ... executing Voronoi summation on any single variable produces an essentially self-dual
  situation. Furthermore, the only admissible way of applying Cauchy-Schwarz is by grouping two variables together,
  and this then leads to a very long off-diagonal".
- GRH is used to bound the Type III and the narrow Type II range, and in Type I to cancel cubes; "It is unlikely
  that (1.2) can be established unconditionally given the current state of knowledge" (it implies zero-free strips
  for Hecke L-functions with Grössencharacters).
- Section 1.4: "to beat the cubic large sieve, the correction term alone is not enough; we really need to know
  additional information about the sequence beta_b".

## 5. What it changes in our record
- **N55 / SHORT_FAMILY.md, the duality structure.** Proposition 8.3 is a mean square over a family a (size A) of
  twisted sums of length B with Gauss-sum weights; its proof is exactly "Poisson in the family, dual family of
  length B^2/A". The error term B^{2+2 eta} (eq. (8.30)) is at least B^2, which exceeds the diagonal AB whenever
  A < B: the same short-family obstruction as SHORT_FAMILY (2d) and (3a), in a published, refereed setting, with
  GRH-strength cancellation of the coefficients ALREADY assumed. (Reader's reading of (8.30); the paper does not
  discuss the range A < B as such: its Type II use needs A > X^{1/3+eps}.)
- **SHORT_FAMILY (2d), the sextic large sieve term (KD)^{2/3}.** For the CUBIC analogue the (AB)^{2/3} term is
  sharp (Theorem 1.4 under GRH; unconditional in dFDH 2026), the extremizer being Gauss-sum-weighted sequences.
  Nothing here is proved for the sextic sieve.
- **Lead's question (d).** The bias X^{5/6} = residue at s = 5/6 of the normalized Dirichlet series of g~ (s = 4/3
  unnormalized), i.e. the theta (residual) contribution; constant (2 pi)^{2/3}/(3 Gamma(2/3)) per unit of
  int W x^{-1/6}.
- **Lead's question (c).** Short ranges in the LEVEL aspect: the Type I Proposition gives an asymptotic with power
  saving for sums of g~(ur) over N(u) ~ U as long as U >= N(r)^{1+eps} (under GRH); below that, nothing.

## 6. Reliability
Refereed (Annals 2024); the GRH-conditional statements are flagged by the authors. The parts read are carefully
written; constants were not checked. Unread parts (sections 6, 9-12) carry the prime-number part of the argument.
