# PROOF: the Weil form is positive on every window that contains only the prime 2

Seat FH, 2026-11-11. Status: **proved here, computer-assisted, not yet independently checked.**
Not new as a claim: X. Zhu, arXiv 2608.24827 v2 (unrefereed preprint) states certified positivity for half-width
L <= 0.8 by the same kind of reduction (cap + Legendre basis). I found that paper after designing the reduction
and read only its section 1; nothing below is taken from its proofs. This file is an independent certificate for
the sub-range L <= (1/2) log 3, written so that a verifier can check every line.

Labels: PROVED (argument given or classical fact cited), COMPUTED (command and numbers given).

## 0. Statement

Notation. L_0 = (1/2) log 3 = 0.549306..., u = log 2, m = (log 2)/sqrt 2 = 0.490129...
For f in L^2[-L_0, L_0] (complex valued, extended by 0), F(z) = int f(x) e^{izx} dx (entire).
a(r) = Re psi(1/4 + i r/2) - log pi (psi = Gamma'/Gamma), Psi(r) = a(r) - 2 m cos(r u).

    Q(f) = (1/2pi) int_R Psi(r) |F(r)|^2 dr + 2 Re[ F(i/2) conj(F(-i/2)) ].                      (0.1)

Since a(r) >= a(0) > -6 and a(r) ~ log|r|, the integrand is bounded below by -7 |F|^2, so the integral is
well defined in (-inf, +inf]; Q(f) = +inf when int log(2+|r|) |F|^2 = inf.

Relation to zeta (KNOWN, not reproved; Weil's explicit formula, theory entry T1): for f smooth with support in
(-L, L), L <= L_0, Q(f) = sum over nontrivial zeros rho = 1/2 + i gamma of F(gamma) conj(F(conj gamma)).
Reason for the shape of (0.1): the prime-power term of the explicit formula is
-sum_n Lambda(n) n^{-1/2} 2 Re<f, S_{log n} f>, (S_v f)(x) = f(x - v), and Re<f, S_v f> = (1/2pi) int |F|^2 cos(rv) dr
(Plancherel); <f, S_v f> = 0 when v >= 2L, so on a window of half-width L <= L_0 only n = 2 can contribute.
The identity was validated numerically in this project to 1e-13 against 5000 zeros (rh/experiments/r1_A,
validate.py.txt) and the same formula is equation (2)-(3) of Zhu's paper.

**Theorem A.** For every f in L^2[-L_0, L_0]:
  - if f is even, Q(f) >= 9.9998e-9 ||f||^2;
  - if f is odd,  Q(f) >= 3.9999e-6 ||f||^2;
  - in general Q(f) = Q(f_even) + Q(f_odd) >= 9.9998e-9 ||f||^2.
Consequently (Lemma 1) the Weil form is >= 9.9998e-9 ||f||^2 on L^2[-L, L] for every L <= (1/2) log 3: all
windows on which no prime other than 2 enters. (||.|| is the L^2 norm.)

## 1. Three elementary lemmas  (PROVED)

**Lemma 1 (monotone in the window).** If L <= L_0, then L^2[-L, L] is a subspace of L^2[-L_0, L_0] and the Weil
form of the window L is the restriction of Q. Proof: (0.1) depends on f only through F; the atom term vanishes
automatically for those f with <f, S_u f> = 0. For L <= (1/2) log 2 the atom at u is not part of the Weil form,
and indeed <f, S_u f> = 0 there because 2L <= u, so (0.1) still equals the Weil form. []

**Lemma 2 (parity).** Write f = f_e + f_o (even and odd parts). Then Q(f) = Q(f_e) + Q(f_o), and
2 Re[F(i/2) conj F(-i/2)] = 2|F_e(i/2)|^2 - 2|F_o(i/2)|^2.
Proof. F = F_e + F_o with F_e(-z) = F_e(z), F_o(-z) = -F_o(z). |F|^2 = |F_e|^2 + |F_o|^2 + 2 Re(F_e conj F_o) and
the last term is odd in r on the real line while Psi is even, so it integrates to 0 (when one of the integrals
is +inf both sides are +inf). With A = F_e(i/2) = F_e(-i/2), B = F_o(i/2) = -F_o(-i/2):
F(i/2) conj F(-i/2) = (A + B) conj(A - B) = |A|^2 - |B|^2 + (B conj A - A conj B), and the bracket is purely
imaginary. []

**Lemma 3 (the digamma term increases).** For sigma > 0, t real,
Re psi(sigma + it) = -gamma_E + sum_{n>=0} [ 1/(n+1) - (n+sigma)/((n+sigma)^2 + t^2) ]
(real part of psi(z) = -gamma_E + sum_n [1/(n+1) - 1/(n+z)], DLMF 5.7.6). Every term is nondecreasing in |t|.
Hence a(r) is even and nondecreasing in |r|: a(0) <= a(r) <= a(R) for |r| <= R, and a(r) >= a(R) for |r| >= R. []

## 2. The cap  (PROVED)

Fix R > 0 and a rational beta_0 with 0 < beta_0 < a(R) - 2m.
For |r| >= R: Psi(r) - beta_0 >= a(R) - 2m - beta_0 > 0 (Lemma 3 and |cos| <= 1). With Plancherel,
||f||^2 = (1/2pi) int |F|^2, this gives for every f:

    Q(f) >= Q_R(f) := beta_0 ||f||^2 + (1/2pi) int_{-R}^{R} (Psi(r) - beta_0) |F(r)|^2 dr + 2 Re[F(i/2) conj F(-i/2)].   (2.1)

(If Q(f) = +inf there is nothing to prove.) Q_R is a bounded Hermitian form on L^2[-L_0, L_0]:
|Psi - beta_0| <= K := max(|a(0)|, |a(R)|) + 2m + beta_0 on [-R, R] (Lemma 3), so the middle term is at most
K ||f||^2 in absolute value, and |F(+-i/2)| <= ||e^{x/2}|| ||f||.
Lemma 2 holds for Q_R with the same proof. So it suffices to bound Q_R from below on even f and on odd f.

## 3. The matrix of Q_R in the Legendre basis  (PROVED)

Write L = L_0. phi_n(x) = sqrt((2n+1)/(2L)) P_n(x/L), n >= 0, is an orthonormal basis of L^2[-L, L]; phi_n has the
parity of n. Classical formulas (DLMF 10.54.2 and its analytic continuation):
  int_{-1}^{1} P_n(t) e^{izt} dt = 2 i^n j_n(z),   int_{-1}^{1} P_n(t) e^{zt} dt = 2 i_n(z),
j_n the spherical Bessel function, i_n(z) = i^{-n} j_n(iz) the modified one. Hence, with F_n the transform of phi_n,

    F_n(r) = i^n sqrt(2L(2n+1)) j_n(rL),      F_n(-i/2) = int phi_n e^{x/2} dx = p_n := sqrt(2L(2n+1)) i_n(L/2) > 0,
    F_n(i/2) = (-1)^n p_n.

Fix a parity pi in {0, 1}; all indices below are congruent to pi mod 2. For f = sum_n c_n phi_n (c in l^2, complex):
F = sum c_n F_n (convergent uniformly on compacts), and since Q_R is a bounded form,

    Q_R(f) = sum_{j,k} c_j conj(c_k) M_jk,    M_jk = beta_0 delta_jk + G_jk + s_pi 2 p_j p_k,   s_0 = +1, s_1 = -1,   (3.1)
    G_jk = (-1)^{(j-k)/2} (2L/pi) sqrt((2j+1)(2k+1)) I_jk,     I_jk = int_0^R (Psi(r) - beta_0) j_j(rL) j_k(rL) dr.   (3.2)

Derivation of (3.2): F_j conj(F_k) = i^{j-k} 2L sqrt((2j+1)(2k+1)) j_j(rL) j_k(rL) for real r; j - k is even so
i^{j-k} = (-1)^{(j-k)/2}; the integrand is even in r (j_n(-x) = (-1)^n j_n(x)), so (1/2pi) int_{-R}^{R} = (1/pi) int_0^R.
Pole term: F(-i/2) = sum c_n p_n =: S and F(i/2) = (-1)^pi S, so 2 Re[F(i/2) conj F(-i/2)] = s_pi 2 |S|^2. M is real
symmetric, so it is enough to consider it as a real quadratic form (a real symmetric positive semidefinite
matrix is positive semidefinite as a Hermitian form).

## 4. The infinite part: tail bounds  (PROVED)

**Lemma 4.** For real x >= 0 and n >= 0: |j_n(x)| <= min(1, x^n/(2n+1)!!), and for z >= 0:
0 < i_n(z) <= cosh(z) z^n/(2n+1)!!.
Proof. |j_n(x)| = (1/2)|int_{-1}^{1} P_n(t) e^{ixt} dt| <= 1 because |P_n| <= 1 on [-1, 1]. Poisson's integral
(DLMF 10.54.1): j_n(x) = x^n/(2^{n+1} n!) int_{-1}^{1} cos(xt) (1 - t^2)^n dt and
int_{-1}^{1} (1 - t^2)^n dt = 2^{2n+1} (n!)^2/(2n+1)!, so |j_n(x)| <= x^n 2^n n!/(2n+1)! = x^n/(2n+1)!!.
The same integral with cosh(zt) <= cosh z in place of cos gives the bound for i_n. []

Let N be the cut (n_max in the script), X := R L, and for Z > 0

    t_k(Z) := (2k+1) (Z^k/(2k+1)!!)^2,   t_{k+1}/t_k = Z^2/((2k+1)(2k+3)) <= q(Z) := Z^2/((2N+1)(2N+3))  for k >= N.

If q(Z) < 1 then sum_{k>=N} t_k(Z) <= T(Z) := t_N(Z)/(1 - q(Z)). Put

    tau := T(X),    pi_tail := 2L cosh^2(L/2) T(L/2),    W := R (max(|a(0)|, |a(R)|) + 2m + beta_0) >= int_0^R |Psi - beta_0| dr.

By Lemma 4 and (3.2), for all j, k:  |G_jk| <= (2L W/pi) sqrt((2j+1)(2k+1)) u_j u_k,  u_n := min(1, X^n/(2n+1)!!), and
p_k^2 <= 2L cosh^2(L/2) t_k(L/2). Therefore
  sum_{k>=N} (2k+1) u_k^2 <= tau,   sum_{j<N} (2j+1) u_j^2 <= sum_{j<N} (2j+1) = N^2,
  sum_{k>=N} p_k^2 <= pi_tail,      sum_{all j} p_j^2 = ||e^{x/2}||^2_{L^2[-L,L]} = 2 sinh L   (Parseval).

Split a function f of parity pi as f = f_1 + f_2, f_1 = sum_{n<N} c_n phi_n, f_2 = sum_{n>=N} c_n phi_n. By (3.1),
Cauchy-Schwarz (Hilbert-Schmidt bound) and the sums above:

  |sum_{j<N<=k} c_j conj(c_k) G_jk| <= ||f_1|| ||f_2|| (2LW/pi) N sqrt(tau),
  |sum_{j,k>=N} c_j conj(c_k) G_jk| <= ||f_2||^2 (2LW/pi) tau,
  |2 (sum_{j<N} c_j p_j)(sum_{k>=N} conj(c_k) p_k)| <= 2 ||f_1|| ||f_2|| sqrt(2 sinh L) sqrt(pi_tail),
  2 |sum_{k>=N} c_k p_k|^2 <= 2 pi_tail ||f_2||^2.

Set  eps12 := (2LW/pi) N sqrt(tau) + 2 sqrt(2 sinh L) sqrt(pi_tail),   eps22 := (2LW/pi) tau + 2 pi_tail.
If the finite matrix M^(N) = (M_jk)_{j,k<N, parity pi} satisfies M^(N) >= lambda_0 I, then with A = ||f_1||, B = ||f_2||:

    Q_R(f) >= lambda_0 A^2 - 2 eps12 A B + (beta_0 - eps22) B^2 >= ( min(lambda_0, beta_0 - eps22) - eps12 ) ||f||^2,      (4.1)

using 2AB <= A^2 + B^2 and ||f||^2 = A^2 + B^2.

## 5. The finite part: the certificate  (COMPUTED, Arb ball arithmetic)

Script: `rh/experiments/foothold/cert.py.txt`. Command (191 s, one core, < 1 GB):

    python3 tools/memcap.py 1 python3 rh/experiments/foothold/cert.py.txt log3 40 56 87/100 1/100000000 4/1000000 128

Log: `cert_log3_R40_n56.log`. Parameters: R = 40, N = 56 (indices 0..55: 28 even, 28 odd), beta_0 = 87/100,
lambda_0 = 1e-8 (even), 4e-6 (odd), working precision 128 bits. Every quantity is an Arb ball (python-flint 0.9.0).

What the script does, in the order of the proof:
1. L = (log 3)/2, u = log 2, m = log 2/sqrt 2 as balls. a(R), a(0) from `acb.digamma`. It asserts
   a(R) - 2m > beta_0 > 0. Log: a(40) = 1.85097634318867769..., 2m = 0.98025814346854719...,
   a(R) - 2m = 0.87071819972013... > 0.87.
2. The 812 integrals I_jk (j <= k < 56, same parity) of (3.2) with `acb.integral` (rigorous integration of a
   holomorphic integrand, Petras' algorithm; tolerance 2^-88). The integrand is coded as a holomorphic function
   of complex r: a(r) is replaced by A(r) = (psi(1/4 + ir/2) + psi(1/4 - ir/2))/2 - log pi, which equals a(r) for
   real r and is meromorphic with poles only at r = +-i(2n + 1/2); j_n(z) = (sqrt(pi)/2)(z/2)^n 0F1~(n + 3/2; -z^2/4)
   (entire; DLMF 10.47.3 with 10.16.9); cos is entire. No branch cuts occur, so the `analytic` flag needs no
   handling (python-flint documentation of acb.integral: meromorphic integrands are safe). Largest radius of
   a computed integral: 2.51e-25.
3. p_n = sqrt(2L(2n+1)) i_n(L/2), i_n(x) = (sqrt(pi)/2)(x/2)^n 0F1~(n + 3/2; x^2/4).
4. Tail constants of section 4 (function `tail`, which asserts q < 1): W <= 288.898, tau <= 1.2064e-33,
   pi_tail <= 9.83e-247, eps12 <= 1.9651e-13, eps22 <= 1.2188e-31.
5. For each parity the ball matrix M^(N) - lambda_0 I and its LDL^T factorisation in ball arithmetic; all 28
   pivots are certified positive (smallest pivot >= 3.1e-3 even, >= 1.9e-2 odd).
   Why this proves M^(N) >= lambda_0 I: the ball computation encloses the exact LDL^T factors of EVERY real
   symmetric matrix whose entries lie in the entry balls (inclusion property of ball arithmetic, applied to
   the rational formulas d_c = M_cc - sum_{t<c} l_ct^2 d_t, l_rc = (M_rc - sum_{t<c} l_rt l_ct d_t)/d_c); the true
   matrix is one of them; a symmetric matrix with an LDL^T factorisation with all d_c > 0 is positive definite.
6. Output of (4.1): even: min(1e-8, 0.87 - eps22) - eps12 >= 9.99980349e-9; odd: >= 3.99999980e-6.

Independent float reproduction (not part of the proof): `explore.py.txt "log(3)/2" 40 80` (numpy/scipy,
Gauss-Legendre quadrature, a different code path for the Bessel functions) gives lowest eigenvalues 1.608e-8
(even) and 5.60e-6 (odd); the midpoints of the ball matrices give 1.6053e-8 and 5.591e-6. Both are above the
certified lambda_0, as they must be.

## 6. Conclusion

(2.1), Lemma 2 for Q_R, (4.1) and section 5 give Theorem A; Lemma 1 extends it to every L <= (1/2) log 3. []

## 7. What is and is not shown

- The certified constants are lower bounds for the bottom of Q_R, not for the true bottom of Q. Upper bounds
  for the true bottom (Rayleigh-Ritz, exact form, PROGRESS.md section 7): 9.06e-7 at L = 1/2, 6.45e-8 at L = 0.54.
- Dependence on the literature: only classical facts (digamma series, Legendre/Bessel integrals, Plancherel).
  The identification of Q with the sum over zeros is the explicit formula (known) and is not needed for the
  inequality itself.
- Trust base of the computation: Arb's `acb.integral`, `digamma`, `hypgeom_0f1`, ball arithmetic.

## 8. Barrier check (PROJECT_BRIEF standard, item 2 and 3)

- B1 (where is the Euler product?): only through the single atom at log 2 with weight log 2/sqrt 2. On this window
  the "Euler product" is one number. The companion file PROOF_forcing_prime2.md shows the atom cannot be moved:
  that is the control.
- B2 (does it prove too much?): the method is a certificate for one explicit symbol on one window; run on the
  symbol with the atom displaced to y = 0.75 it does not certify anything (float bottom of Q_R: -0.066), and
  PROOF_forcing_prime2.md proves that no weight at that position gives a positive form. For Davenport-Heilbronn
  the same certificate could be run on windows below 1.70 where its form is positive (r1_A); the method makes no
  statement about larger windows for any function.
- B3 (no slack): the certified margin is 1e-8 on a form whose entries are of size 1; the method survives only
  because it is a computation of the actual spectrum, not an estimate.
- B6: this is positivity on a restricted class (small support). It does not approach RH by itself: the margin
  falls doubly exponentially with L and the cap must satisfy a(R) > sum_{log n < 2L} 2 Lambda(n)/sqrt n, i.e.
  R > 2 pi exp(A_L) (Zhu, Theorem 1.4), also doubly exponential.
- B10/B11: nothing here uses the additive structure or the centre beyond the fixed Gamma factor and the value of
  the weight; see the forcing file for how sharply the weight is pinned.
