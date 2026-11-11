# r1_D · Lane D (new structures) · proposer, round 1

Date 2026-11-10. All scratch code is `*.py.txt` in this folder; every number below has its command.
Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Citations not opened in this session are "(from memory)".

## 0. What was done, in order

1. Read preamble, brief, KNOWLEDGE (B1-B10), IDEAS #1-#5. Started from B10.
2. E1 `beurling.py.txt`: move every rational prime a little (p -> p(1+eps_p)) so that a zero is planted off the
   line, count the resulting "Beurling integers", measure how irregular they become.
3. Literature check (WebSearch + arXiv 2309.01567 read with pdftotext): Broucke-Debruyne-Revesz 2023/24,
   "Some examples of well-behaved Beurling number systems". This REFUTED my first conjecture (see 1.3).
4. E1b `deletion.py.txt`, `deletion_det.py.txt`: their construction (delete a sparse set of primes), measured.
5. E2 `pencil.py.txt`: the straight line of functions between the two Euler products L(s,chi), L(s,chibar) mod 5;
   Davenport-Heilbronn is its midpoint. Predicted DH's four off-line zeros from critical values of one real function.
6. E3 `kernel.py.txt`: does the Fourier kernel Phi of zeta have a shape property the DH kernel lacks? (No.)
7. E2 extended to height 1000 and cross-checked by direct sign-change counts (section 2b).
8. D6 `carry.py.txt`: a family from the zeta function of F_2[T] to zeta; zeros tracked; killed (section 4).
9. Not done: second implementation of E1/E1b/E3; Beurling runs beyond X = 1e8; pencil beyond T = 1000;
   D4, D5, D7 are untested proposals.

## 1. E1 / E1b: Beurling rigidity ("what does a zero off the line cost the integers?")

### 1.1 Setup
A discrete Beurling system = any list of real "primes" 1 < q_1 <= q_2 <= ...; its "integers" are all finite products.
N_B(x) = number of integers <= x, zeta_B(s) = prod (1-q^-s)^-1. Integer exponent beta_int := inf{b : N_B(x) = Ax + O(x^b)}.
For Z: beta_int = 0. Hilberdink 2005 (PROVED, cited via BDR): prime exponent and integer exponent cannot both be < 1/2.

### 1.2 Displacement family (COMPUTED)
q_p = p(1+eps_p) for p >= 50, eps_p = Re(c p^(rho0-1)), c = 2/rho0 ("smooth": to first order multiplies zeta by
(s-rho0)(s-conj rho0), HEURISTIC), or same rms size with random signs ("random", plants nothing).
b(n) = prod q_p^{v_p(n)} computed for all n by an additive sieve; N_B(x) exact for x <= X.
Residual = N_B(x) - (best local linear fit) on windows [x,2x]; exponent = slope of log rms vs log x (upper half of windows).

Commands: `python3 beurling.py.txt 3e7 <beta0> 4 1 <smooth|random> 50` (9 s each, numpy float64).

| relative displacement p^-theta | mode | rms at x~8e6 | fitted exponent (all / upper half) |
|---|---|---|---|
| theta=0.4 (rho0=0.6+4i) | smooth (zero planted at Re 0.6) | 102.2 | 0.421 / 0.428 |
| theta=0.4 | random | 138.6 | 0.429 / 0.451 |
| theta=0.7 (rho0=0.3+4i) | smooth | 61.5 | 0.394 / 0.405 |
| theta=0.7 | random | 80.8 | 0.411 / 0.416 |
| theta=1.0 | random | 34.3 | 0.377 / 0.370 |
| theta=2.0 | random | 5.3 | 0.477 / 0.336 (pre-asymptotic, amplitude tiny) |
| none (Z itself) | - | 0 | residual identically 0 (sanity) |

Reading (HEURISTIC): moving infinitely many primes by ANY power-small relative amount wrecks the integers to
about x^(0.35..0.45), whether or not a zero is planted. A combinatorial count (r-fold products of displaced primes,
each ~x^(1/(r+theta)), gives x^(r/(2(r+theta))) -> x^(1/2) as r grows) predicts the true exponent is 1/2 with
sub-power corrections; the fits (rising with x, below 1/2) are consistent with that and not with the naive
"singularity only" prediction max(beta0-1/2, 2beta0-1) = 0.2 for rho0 = 0.6+4i. Not proved.

### 1.3 A conjecture I made and that the literature kills (PROVED dead, by citation)
First guess BR: "discrete system with beta_int < 1/2  =>  all zeros of zeta_B in Re s > beta_int lie on Re s = 1/2".
BR would imply RH (Z has beta_int = 0). But Broucke-Debruyne-Revesz, arXiv:2309.01567v2, Theorem 1.3 (read in
this session): assuming RH there are [alpha,beta]-systems (their alpha = prime exponent, beta = integer exponent)
for 1/2 < alpha < 2/3 and 2alpha/(alpha+2) <= beta < 1/2. So BR => RH => not BR. BR is false. Recorded so nobody
re-proposes it. The same paper states the expectation "one may conjecture that for all alpha, beta with
max >= 1/2 there must exist a corresponding [alpha,beta]-system", which is the exact opposite of 1.5 below.

### 1.4 Deletion family (COMPUTED) - numerically better than the proved BDR bound
BDR's device: delete a sparse set S of rational primes with pi_S(x) ~ Li(x^a). Then zeta_B = zeta/zeta_S gets a
REAL zero at s = a (for a > 1/2 this violates RH for the system). N_B(x) = #{n <= x coprime to S}: exact by sieve.
Commands: `python3 deletion.py.txt 1e8 <a> <seed>` (random S, P(p in S) = p^(a-1), p >= 50; 3 s each),
`python3 deletion_det.py.txt 1e8 <a> 0` (deterministic S: the prime where the expected count crosses k - 1/2).

| a (planted real zero) | random S, seed 1 | random S, seed 2 | deterministic S | a/2 | BDR proved 2a/(a+2) |
|---|---|---|---|---|---|
| 0.55 | 0.251 / 0.266 | 0.282 / 0.311 | 0.222 / 0.226 | 0.275 | 0.431 |
| 0.70 | 0.330 / 0.334 | 0.337 / 0.365 | 0.278 / 0.292 | 0.350 | 0.519 |
| 0.85 | 0.392 / 0.391 | 0.386 / 0.393 | 0.355 / 0.296 | 0.425 | 0.596 |

(entries: fitted exponent of the detrended rms, all windows / upper half of windows, windows [x,2x], x = 1e3..3.3e7.)
Reading: random deletion is consistent with integer exponent a/2 (HEURISTIC reason: the error is a sum of
~x^a fractional parts {x/l} with square-root cancellation); the deterministic choice is lower by 0.05-0.10 in this
range. Fit error is about +-0.04 (seed-to-seed spread), so "0.22 < 1/4 at a = 0.55" is NOT established.
Caveat: the local detrend removes smooth secondary terms, so these are oscillation exponents = lower-bound
witnesses for beta_int, and upper-bound evidence only heuristically.

### 1.5 What survives: the "price of a zero" function
Define kappa(a) := inf{ beta_int(B) : B discrete Beurling system, zeta_B has a zero with real part a }, a in (1/2,1).
- PROVED (BDR Thm 1.3, cond. on RH): kappa(a) <= 2a/(a+2) for 1/2 < a < 2/3.
- COMPUTED (this folder): deletion from Z reaches about a/2 (random) and 0.22-0.30 (deterministic), X = 1e8.
- CONJECTURE D1 (power cost): kappa(a) > 0 for every a > 1/2. Equivalent: a discrete Beurling system with
  N_B(x) = Ax + O(x^eps) for all eps > 0 has no zeta zero in Re s > 1/2. For B = Z this is RH, and the statement uses
  no functional equation: the additive side enters only through the regularity of the counting function.
- The opposite (BDR's expectation at beta = 0): there is a discrete system with integer exponent 0 and prime
  exponent > 1/2. Exactly one of the two holds. This dichotomy is decidable by constructions or by a
  discrepancy-type lower bound.
- Proved prototypes of "regular counting + multiplicativity => arithmetic": Hilberdink 2005 (max >= 1/2);
  Klurman-Mangerel 2018, Chudakov's conjecture: completely multiplicative f with sum_{n<=x} f(n) = cx + O(1) is a
  Dirichlet character (from memory). Roth 1964: 2-colourings of [N] have AP-discrepancy >= c N^(1/4) (from memory);
  the deletion problem is a discrepancy problem on homogeneous progressions.

### 1.6 Walls (exact)
- W1. Zeros do not move under Beurling perturbations, they are planted: zeta_B = zeta * exp(-U(s)), and exp(-U) has
  no zeros where U is analytic (PROVED, trivial). So "follow a zero off the line" is impossible here; the cost
  must be read from the growth of exp(-U) in vertical strips, which is where discreteness enters.
- W2. For the deletion family the natural proof of a cost (Hilberdink's mean-value argument applied to the
  subsystem generated by S, rescaled) needs polynomial bounds for 1/zeta_S in Re s > a/2, and a/2 < 1/2 lies left
  of the critical line of zeta itself, where 1/zeta is not controlled. Statement not proved: "if S is a set of
  primes with pi_S(x) = Li(x^a) + O(x^a'), a' < a, a > 1/2, then #{n <= x : (n,S) = 1} - Ax = Omega(x^c) for some
  c = c(a) > 0." This is a statement about ordinary integers and is the smallest theorem on this route.
- W3. Even exponent-0 rigidity would only give "the system is essentially Z", i.e. hand RH back. The content is
  in a quantitative cost bound that does not pass through classification.

## 2. E2: the pencil between two Euler products (control-group homotopy)

Z_1, Z_2 = Hardy functions of L(s,chi), L(s,chibar), chi mod 5, chi(2) = i (python-flint `dirichlet_char(5,2)`,
`(5,3)`, `.hardy_z`, prec 64). Pencil member Z_lam = Z_1 + lam Z_2, lam real: all satisfy the same functional equation.
PROVED (elementary): Z_lam has a zero at s iff lam = R(s) := -L_1(s)/L_2(s) (up to a fixed phase); R is real on the
critical line, rho(t) := -Z_1(t)/Z_2(t). So off-line zeros of the member lam are born or die exactly when lam
crosses a critical value of the real function rho; GRH for L_1 says R omits 0 on the open half-plane, GRH for
L_2 says R omits infinity; a member has only real zeros near height t iff rho is monotone there iff the zeros
of Z_1 and Z_2 interlace there (Hermite-Kakeya-Obreschkoff, from memory).

Command: `python3 pencil.py.txt 200 0.01` (16 s). COMPUTED:
- lam_DH = 1.000000000000000 (three DH zeros 5.0941.., 8.9399.., 12.1335.. give 0.9999999999999994, 1.0000000000000016,
  1.000000000000001): Davenport-Heilbronn = Z_1 + Z_2 in flint's normalisation.
- zeros below 200: 130 (L_1), 129 (L_2); interlacing fails in 65 of 258 gaps; rho has 65 critical points.
- Critical points with value between 0 and lam_DH = 1, all local maxima:
  t_c = 85.89903 (rho = 0.439670), 114.33826 (0.487222), 166.50471 (0.886095), 176.96664 (0.168096).
  Prediction: DH has exactly 4 off-line pairs below 200, near these heights. Known (lane A, `r1_A/dhzeros.py.txt`):
  0.808517+85.699348i, 0.650830+114.163343i, 0.574356+166.479306i, 0.724258+176.702461i. Match 4/4.
- The member Z_1 + 0.17 Z_2 already has an off-line pair below height 200 (critical value 0.168 at t = 176.97);
  on the negative side the first one appears at lam = -0.027 below height 200, -0.074 below 100, -0.109 below 50.
- Higher range: see section 2b (appended when the T = 1000 / 4000 runs finish).

Reading: (i) B2 gets a mechanism: the impostor fails because the zeros of the two Euler products do not
interlace (their S(t) fluctuate independently), and each off-line pair is located by one critical value.
(ii) B3 in the arithmetic direction: the admissible lam-interval around the Euler product shrinks as the height
grows. (iii) Use as a lab: any proposed positivity criterion can be evaluated along lam and must change sign
exactly at the listed critical values; this is a sharper control than the single DH point (IDEAS #1).

Wall W4: R is of bounded type in the half-plane (log|L| is integrable against the Cauchy kernel), so Nevanlinna's
second main theorem gives nothing: "R omits exactly the two eigen-values 0 and infinity" cannot come from
value-distribution theory alone. Exact identity available (Jensen): for every complex lam,
(1/2pi) int log|L_1 + lam L_2|(1/2+it) dt/(1/4+t^2) - log|L_1(1) + lam L_2(1)| = sum over zeros rho' of L_1+lam L_2
in Re s > 1/2 of log|rho'/(1-rho')| >= 0 (PROVED modulo the standard Blaschke/Jensen hypotheses; this is
Balazard-Saias-Yor 1999 applied to the pencil, from memory). The left side is a subharmonic function of lam.

## 3. E3: shape of the kernel Phi, zeta versus the impostor (negative result)

Xi(t) = int Phi(u) e^{itu} du. Phi_zeta(u) = sum (2 pi^2 n^4 e^{9u/2} - 3 pi n^2 e^{5u/2}) exp(-pi n^2 e^{2u});
Phi_DH(u) = 2 e^{3u/2} sum a(n) n exp(-pi n^2 e^{2u}/5), a = (1, xi, -xi, -1, 0) mod 5.
Command: `python3 kernel.py.txt` (mpmath, 40 digits, about 2 min). COMPUTED:
- checks: Phi(0.3)/Phi(-0.3) = 1.0 for both; Xi_DH(5.094159844571095)/Xi_DH(0) = -5.6e-18; Xi_zeta(gamma_1)/Xi_zeta(0) = 2.2e-18.
- On the grid u = 0.02, 0.04, ..., 1.98: both kernels are positive, log-concave ((log Phi)'' < 0), and satisfy the
  Csordas-Varga condition d/du(Phi'/(u Phi)) < 0 (log Phi(sqrt u) concave).
- Turan inequalities gamma_m^2 > gamma_{m-1} gamma_{m+1} for m = 1..40 hold for both; the ratio
  gamma_m^2/(gamma_{m-1} gamma_{m+1}) at m = 40 is 1.01098 (zeta) and 1.01430 (DH).
  (The script also prints an ad hoc 4-term inequality; I do not rely on it.)
Conclusion: none of the pointwise shape properties tested separates zeta from a function with zeros off the line.
Any "ferromagnetic" property of Phi alone that pins zeros must be invisible to these tests. Kill for the
family of ideas "RH from positivity + log-concavity type properties of Phi".

## 2b. Pencil, larger heights (COMPUTED)

Command: `python3 pencil.py.txt 1000 0.02` (about 6 min; output `pencil_T1000.log`, data `pencil_T1000.json`).
- zeros below 1000: 904 (L_1), 904 (L_2); rho = -Z_1/Z_2 has 430 critical points.
- Predicted off-line pairs below 1000 from critical values (#local maxima with value in (0,lam) minus #local
  minima with value in (0,lam); mirrored for lam < 0):

| lam | 0.01 | 0.03 | 0.1 | 0.3 | 1 (DH) | 3 | 10 | 100 |
|---|---|---|---|---|---|---|---|---|
| lam > 0 | 0 | 1 | 5 | 20 | 28 | 24 | 6 | 0 |
| lam < 0 | 1 | 6 | 44 | 113 | 153 | 123 | 48 | 0 |

- Independent check in this lane (direct sign changes of Z_1 +- Z_2 on a 0.01 grid, inline script recorded below):
  Z_1 + Z_2 has 848 real zeros in (0,1000), so (904 - 848)/2 = 28 off-line pairs: equals the prediction 28.
  Z_1 - Z_2 has 597 real zeros, so about 153.5 off-line pairs: prediction 153.
  Cross-lane check at T = 200: predicted on-line count 121.5, lane A (`r1_A/dh_zeros.json`, mpmath Hurwitz zeta) 122.
- New observation: the second real-coefficient member Z_1 - Z_2 (odd in t) has 34 percent of its zeros below 1000
  off the line, DH itself (Z_1 + Z_2) 6 percent. I have not found this stated; not searched beyond one query.
- Threshold (smallest |lam| with an off-line pair below T'): 7.4e-2 (T'=100), 2.7e-2 (200), 1.6e-2 (500),
  1.1e-3 (1000). With N = number of zeros of L_1 below T': threshold x N = 4.0, 3.5, 6.3, 1.0. Four points of an
  extreme-value statistic: consistent with a power decay in N, exponent not determined.
- The run to T = 4000 was stopped unfinished (hardy_z cost); no data from it is used.

Inline check script (run from the repo): builds `ts = arange(0.005, 1000, 0.01)`, evaluates
`c1.hardy_z(acb(t)) +- c2.hardy_z(acb(t))` with `c1 = dirichlet_char(5,2)`, `c2 = dirichlet_char(5,3)`, prec 64,
and counts sign changes: 848 and 597.

## 4. D6 first test: carry deformation (COMPUTED, killed in this form)

Z_tau(s) = sum_n (2^floor(log2 n))^{-(1-tau)s} n^{-tau s}. tau = 0 is the zeta function of F_2[T] with the degree norm,
1/(1-2^{1-s}), no zeros; tau = 1 is zeta. Command: `python3 carry.py.txt` (about 3 min, mpmath 30 digits; blocks
k < 7 by Hurwitz zeta, tail by Euler-Maclaurin, checks: |Z_1(1/2+i gamma_1)| = 6e-16, Z_1(2) - zeta(2) = 2e-31,
Z_0 exact to 5e-32, Z_0.5(3) = 1.248053 against direct summation 1.248046).
Zeros continued from tau = 1 downwards:

| tau | zero 1 | zero 2 | zero 3 |
|---|---|---|---|
| 1.0 | 0.5 + 14.1347i | 0.5 + 21.0220i | 0.5 + 25.0109i |
| 0.9 | 0.3874 + 14.6025i | 0.6748 + 21.4461i | 0.4023 + 25.5457i |
| 0.8 | 0.2391 + 15.1637i | 0.7388 + 21.9553i | 0.2366 + 26.1729i |
| 0.7 | 0.0622 + 15.8673i | 0.6992 + 22.5594i | lost |
| 0.6 | -0.1174 + 16.8132i | 0.5475 + 23.2938i | lost |
| 0.4 | lost | -0.0988 + 25.6756i | lost |

The zeros leave the line at first order, in both directions (zero 2 moves right, zeros 1 and 3 left), then drift
into Re s < 0. No line, no sign-definite motion. Kill line hit for the naive family. What it suggests: a
deformation that keeps neither the Euler product nor the functional equation has nothing to hold the zeros;
a useful family must keep one of the two exactly at every tau (the pencil of section 2 keeps the functional
equation; Beurling systems keep the Euler product).

## Ideas (title · claim · first test · kill line)

- D1 Price of a zero (Beurling rigidity) · kappa(a) > 0 for all a > 1/2, equivalently: integers regular to
  O(x^eps) plus free generation forces all zeros in Re s > 1/2 off (no zeros there) · push deletion / hybrid
  families to X = 1e10 and several a; · killed by any discrete family with a planted zero at a > 1/2 whose
  measured integer oscillation exponent is below 0.10 over three decades (then proved). Status: tested, alive;
  first version BR killed by BDR Thm 1.3.
- D2 Pencil lab · the number of off-line pairs of Z_1 + lam Z_2 below T equals the signed count of critical values of
  rho = -Z_1/Z_2 between 0 and lam · done to T = 1000 (28 = 28, 153 = 153.5, 4/4 heights) · killed if a member's
  direct count disagrees. Status: tested, alive.
- D3 Shape of Phi is not the mechanism · positivity, log-concavity, Csordas-Varga concavity, Turan (m <= 40) all hold
  for the DH kernel too · done · (the result is the kill of shape-only ferromagnetic ideas).
- D4 Discrepancy form of the cost · for S a set of primes of density x^(a-1), a > 1/2, the count of integers
  coprime to S has error Omega(x^c(a)), c(a) > 0 · integer programme / greedy search for the best S at X <= 1e6 and
  fit of the optimum · killed if the optimal error stays below X^0.1.
- D5 Totally positive density from Moebius · g = inverse Laplace transform of xi(1/2)/xi(1/2+sqrt w), computed on
  Re w = c > 1/4 where 1/zeta is an absolutely convergent Dirichlet series, is a Polya frequency density iff RH ·
  compute 2x2 and 3x3 minors for zeta and for DH · killed if no minor of order <= 6 separates DH from zeta.
- D6 Carry deformation F_2[T] -> Z · zeros arrive along curves with a monotone quantity · done · KILLED (section 4).
- D7 Threshold law · the admissible interval of lam around an Euler product shrinks like a power of the zero
  count · extend the pencil to T = 1e4 with a faster Hardy-Z · killed if the threshold stops decreasing.
