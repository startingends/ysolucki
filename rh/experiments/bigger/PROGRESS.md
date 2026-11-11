# BG (bigger-statement seat): diary

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. "(from memory)" = citation not checked.
Two container restarts cut the first session; everything below was rewritten from scratch on 2026-11-11.

## 1. What I read
PROJECT_BRIEF, SUBAGENT_PREAMBLE, UNDERSTANDING, KEY_LEMMA_SHAPE (+ corrections), NOTEBOOK N1-N32, KNOWLEDGE
(B1-B11), IDEAS #8-#21 in full, JUDGEMENT sections 0-3, ATLAS, THEORY, FOOTHOLDS, e9_bootstrap/boot.py.txt.

## 2. How the thinking moved (kept because the route matters)

**2.1 First question: in which direction does truth travel in the families we already have?** (PROVED, each one line)
- window half-width a: positivity on (-a,a) implies positivity on smaller windows. Base case small a (Yoshida).
  RH is a -> infinity. Truth travels DOWN in a; we need UP.
- damping d (kernel e^(-d|x|) W(x), i.e. Re xi'/xi > 0 on Re s > 1/2 + d): Schur product with the positive
  definite e^(-eps|x|) shows truth travels UP in d. Base case d >= 1/2. RH is d = 0. Need DOWN.
- conductor q (W + log q * identity; adding (log q / 2 pi) * Lebesgue measure to the zero side): UP in q.
- heat flow t (de Bruijn-Newman): UP in t; RH is t = 0, and t < 0 is false (Rodgers-Tao).
In every monotone family on record zeta is the EXTREME member. That is barrier B3 seen from the family side:
a Wiles-type induction (truth flowing towards the instance wanted) cannot be run along any of these
parameters, because there is nothing true on the far side of zeta to start from. So a larger statement has
to be of another kind: (a) a rigidity / classification statement ("every abstract solution is arithmetic",
the R = T shape), (b) an identity valid for all parameter values (then analytic continuation carries it),
or (c) a discrete induction (prime by prime).

**2.2 Deligne's pattern, transposed honestly, and where it collapses.** I wrote out what Deligne's
amplification actually uses: (i) traces that are REAL whatever the weights are, so even powers are >= 0;
(ii) an L-function of the whole family whose POLES are known (rationality: H^1 gives zeros, never poles; the
poles come from monodromy invariants); (iii) Landau's lemma. For Dirichlet characters (i) is free:
|P_chi(N)|^(2k) >= 0 with P_chi(N) = sum Lambda(n) chi(n) n^(-1/2) w(n/N). So:
  MH(tau, A): sum over primitive chi of conductor <= Q of |P_chi(Q^tau)|^2 << Q^A.
  PROVED (Mellin transform + positivity, 5 lines): MH(tau, A) for a sequence tau -> infinity with A fixed
  implies GRH for every Dirichlet L-function and RH; more precisely theta := Theta - 1/2 <= A/(2 tau).
  PROVED (multiplicative large sieve): MH(tau, 2 + eps) for tau <= 2. Trivially MH(tau, tau + eps) always.
So the exponent A(tau) is 2 on [0,2], at most tau after, and RH says "no kink". But then I saw that the k-th
power is not needed (k = 1 and N = Q^tau gives the same information) and that the statement is the classical
"variance of primes in progressions to SMALL moduli" (Barban-Davenport-Halberstam below the large-sieve
range). Any flat piece beyond tau = 2 is already a zero-free strip Theta <= 1/2 + 1/(2+eta). So the
transposition is exact but not new, and the first step past the base case is quasi-RH. What is missing
compared with Deligne is (ii): a reason, not passing through the individual members, why the family
Dirichlet series D_tau(w) = sum_q q^(-w) sum_chi |P_chi(q^tau)|^2 has no real singularity to the right of 2.
Recorded as candidate BG-D with that blockage.

**2.3 Kunneth amplification (Kurokawa's tensor product).** If a function with zeros at rho1 + rho2 had an
absolutely convergent non-vanishing product for Re s > 3/2, then Theta <= 3/4. The projection fibration
gives only prod_rho zeta(s - rho), which converges for Re s > 1 + Theta: circular. Deligne's gain comes from
fibrations whose fibres are NEW curves (Lefschetz pencils); nothing plays that role for Spec Z. Known
programme (Kurokawa, Koyama, Akatsuka; from memory); set aside, to be confirmed by search.

**2.4 The damping family and the family F_d.** With the multiplier k(x) = 2 cosh(d0 x) e^(-d'|x|) on the
Weil kernel one gets the damped form of F_d0. It is positive definite when d' >= d0 + theta. So in the
(d0, d') plane the true region is bounded by a line of slope 1 whose intercept is theta = Theta - 1/2;
unconditionally d' >= d0 + 1/2. This is "the quantity that varies with d" asked for by the coordinator:
the critical damping of F_d is d + theta. Also (HEURISTIC until checked against the literature): on the
infinite window the lowest "energy" of the damped form is inf_t 2 Re xi'/xi(1/2 + d + it), and I believe this
equals M(d) = 2 xi'/xi(1/2 + d) (minimum on the real axis); I recall Lagarias 1999 proving exactly that for
sigma > 10 (from memory; to search). I sketched an unconditional proof for every sigma >= Theta by pairing
rho with its conjugate and using convexity of 1/(c^2 + x^2) plus one nearby zero. Then
mu(d, infinity) = M(d) for d >= theta and -infinity below: a first-order jump at d = theta. RH = "no jump on
(0, infinity)" = "the ground energy is analytic in the damping". Honest verdict: this is the zero-free
half-plane family again; the identity is pretty, the transport (analytic continuation in d) needs a bound in
a complex neighbourhood reaching Re d < 1/2, which is the zero-free region itself.

**2.5 The conductor as a Lagrange multiplier.** PROVED (one line): the conductor enters the window form as
+ log q * ||g||^2. So lambda_L (lowest window eigenvalue of zeta) = - log(smallest conductor at which the
TRUE primes stay feasible on window L). The famous degeneracy exp(-4 pi e^(2L)) is a conductor deficit:
on window L zeta would survive a conductor 1 - exp(-4 pi e^(2L)). Consistency check with the Johns preprint
(unreviewed): its certified 1.43e-1060 corresponds to 4 pi e^(2L) = 2440, L = 2.63, primes up to 194.
Also PROVED: if (nu, m) is a positive solution at conductor q' then (nu + (log(q/q')/2 pi) dt, m) is one at
every q > q'. So feasible sets are nested in q, an "old part" (Lebesgue) and a "new part" (atoms), and the
fat feasible set the lead saw at conductor 5 contains everything from conductors 3 and 4. Zeta is rigid
because nothing lies below it.

**2.6 Where this points: thresholds on the integers.** For each archimedean type, let q*_Z be the smallest
conductor at which SOME real weights on the integers make the form non-negative on all windows. For zeta's
type q*_Z = 1 iff RH (+ uniqueness). For the odd type (Gamma_R(s+1), no pole) nobody in the record has
computed it. Either it is 3 with the weights of L(s, chi_-3) (then "the first L-function of each type sits
exactly at the positivity threshold on the integers", a statement about a family of which RH is one member
and whose NON-EXISTENCE half is unconditional and finite-certifiable), or it is below 3 and the threshold
object is something non-arithmetic (then "threshold implies arithmetic" is false and zeta's case is special
because of the pole). Both outcomes say something. This is the candidate I develop (BG-T).

## 3. Predictions written before computing
(see section 4 for the run)

### 3.1 Threshold run (written 2026-11-11 before any run of threshold.py.txt)
Object. Window half-width L, Fourier basis of r1_A/weil.py.txt. For a type (Gamma factor, pole or none) and
real weights m_n on the integers 2 <= n <= e^(2L): Q(m; q) = arch(type) + log q * I - sum m_n B_n.
lambda*_L = max over m of the lowest eigenvalue at a reference conductor q0 (a CONCAVE maximisation, so a
local maximum is global); threshold on the window q*_L = q0 * exp(-lambda*_L). q*_L increases with L.
Reasoning recorded before the run: lambda_min is concave in m. If the form of an L-function at its own
conductor is locally rigid (its near-null space pins every weight), then by concavity nothing anywhere beats
it, and the L-function is the threshold object. By nestedness in q this can only happen for the L-function
of SMALLEST conductor of its type (chi_-4 at conductor 4 cannot be rigid: the segment to chi_-3 + Lebesgue
is feasible). So the candidate statement BG-T: for each real type, the threshold on the integers is the
smallest conductor of an L-function of that type, attained only by it.
Blind predictions:
 P1 (sanity, zeta type): lambda*_L = 0 to within 1e-9 at L = 1.0 and the maximiser is von Mangoldt to 1e-4.
 P2 (odd type, Gamma_R(s+1), no pole): q*_L -> 3 with the weights of chi_-3:
    at L = 1.0: 3 - q*_L < 0.05;  at L = 1.5: 3 - q*_L < 1e-4, and the maximiser at L = 1.5 is within 0.02 of
    Lambda(n) chi_-3(n) for n <= 7 (-log 2, 0, +log 2, -log 5, 0, +log 7).
    My confidence that the limit is 3: about 80 percent (it was 40 percent before the concavity argument).
 P3 (even type, no pole): q*_L -> 5 with the weights of the real character mod 5; at L = 1.5: 5 - q*_L < 0.05.
    Confidence 60 percent (the horizon scales like 1/q, so convergence is slower).
 Wrong-picture lines: q*_L above 3 (odd) or above 5 (even) at any L would mean GRH fails for chi_-3 / chi_5
 or the code is wrong. q*_L levelling off clearly below (3 - q* > 0.1 with successive differences shrinking
 by more than a factor 3 per 0.25 in L) means the threshold object is NOT arithmetic: BG-T false as stated.

### 3.2 Result of the first run (threshold_a.log), and the next prediction, written before running it
COMPUTED (float64, N = 40 modes, one implementation; `python3 threshold.py.txt <type> <L> 40`):
| type | L=0.3 | 0.5 | 0.75 | 1.0 | 1.25 |
|---|---|---|---|---|---|
| zeta (Gamma_R(s), pole) q*_L | 0.99244 | 0.9999846 | 1 - 3e-11 | 1 (to 1e-12) | 1 (to 3e-12) |
| odd (Gamma_R(s+1), no pole) | 2.2978 | 2.7518 | 2.8532 | 2.86034 | 2.86055 |
| even, no pole | 3.0647 | 3.8680 | 4.0252 | 4.03596 | 4.03627 |
P1 HIT: zeta's maximiser is von Mangoldt (0.693147, 1.098612, 0.693147, 1.609438, 0.000000 at 2..6).
P2 MISS, P3 MISS: both thresholds level off BELOW the first arithmetic conductor (2.8606 < 3; 4.0363 < 5),
successive differences shrinking by factors 14 and 34. The maximising weights are not those of a character
(odd: m_2 = -0.880, m_3 = +0.894, m_4 = -1.738; the pair (m_2, m_4) is not of the form (a log 2, a^2 log 2)).
So BG-T as I stated it is FALSE for the two pole-free types: the threshold object on the integers is not
arithmetic there, and chi_-3 sits strictly inside. My 80 percent was wrong; the concavity argument was right
but its hypothesis (local rigidity of chi_-3's own form) fails. Zeta's type is different: threshold exactly 1.
What differs: the pole. New question: put a weight r on the pole term (r = 1 zeta's type, r = 0 the even
pole-free type) and compute q*(r). Reasoning before the run: the family "r * (zeros of zeta) + (1-r) * (Gamma
density) + Lebesgue" is feasible for r <= 1 at conductor exp(5.37 (1-r)) and is infeasible for r > 1 at every
conductor because the Gamma density cannot pay for r > 1 times the zeros at large height.
Blind prediction P4: (a) q*(r) is decreasing in r on [0,1], from 4.036 to 1; (b) for r = 1.1 and 1.25 the
window threshold q*_L does NOT level off: it grows with L (value at L = 1.25 more than 1.5 times the value
at L = 0.75), i.e. r = 1 is the largest pole weight one Gamma factor can carry, and zeta is the corner
(r, q) = (1, 1) of the feasible region. If q*_L(r = 1.1) levels off, zeta is not a corner in r and the pole
weight is not what makes it special.

### 3.3 Result of the pole-weight run (threshold_b.log) and prediction P5, written before the odd+pole run
COMPUTED (same script, 4th argument = pole weight r; even Gamma factor):
| r | q*_L at L = 0.5, 0.75, 1.0, 1.25 | reading |
|---|---|---|
| 0 | 3.868, 4.0252, 4.03596, 4.03627 | levels off: q*(0) = 4.0363 |
| 0.5 | 1.9412, 2.0043, 2.00892, 2.00904 | levels off: 2.0090 |
| 0.9 | 1.13346, 1.14849, 1.14970, 1.14973 | levels off: 1.1497 |
| 1 | 0.9999846, 1 - 3e-11, 1, 1 | 1 |
| 1.1 | 0.9957, 1.0037, 1.0094, 1.0153 | does NOT level off: lambda*_L falls linearly, -0.0235 per unit L |
| 1.25 | 0.9974, 1.0095, 1.0242, 1.0396 | does NOT level off: -0.059 per unit L (= 2.5 x the r = 1.1 slope) |
P4(a) HIT. P4(b): direction HIT (no levelling off for r > 1, slope proportional to r - 1), size MISSED (I said
a factor 1.5 between L = 0.75 and 1.25; it is 1.012: the divergence is linear in L, not exponential).
UNEXPECTED and exact to 6 digits: log q*(r) = (1 - r) * 1.39532 for r = 0, 0.5, 0.9, 1
(0.697659 = 0.5 x 1.395322; 0.139531 = 0.1 x 1.39532). So the threshold is LINEAR in the pole weight on
[0, 1] and jumps to +infinity beyond 1: lambda*(r) is concave with a corner at r = 1, and zeta sits AT the
corner: it is a vertex of the convex body of feasible (pole weight, log conductor, weights).
Why linear (HEURISTIC, one line): the dual certificate of the pole-free problem is a positive-definite g
vanishing at every log n; such a g has Weil value sum_gamma ghat(gamma) = A(g) and on these windows it lies
in zeta's near-null space, so the same certificate is optimal for every r in [0,1].
Odd factor, L = 1.5, N = 60: q* = 2.8605506 (L = 1.25: 2.8605481): the odd threshold is converged to 6 digits
and is 2.86055, not 3.
P5 (blind): the ODD Gamma factor can also carry a pole of weight 1, at conductor 1, with von Mangoldt weights
(explicit solution: zeta's zeros plus the absolutely continuous density
(1/2 pi)(Re psi(3/4 + it/2) - Re psi(1/4 + it/2)) > 0). So I predict: odd type, r = 1: q*_L -> 1 from below
(1 - q*_L < 1e-3 at L = 1.25) with maximiser within 1e-3 of von Mangoldt at n <= 5; r = 0.5: q* =
sqrt(2.86055) = 1.6913 +- 0.005 (linearity again); r = 1.25: no levelling off.
If the odd factor with r = 1 has threshold clearly below 1 (q* < 0.99), then von Mangoldt is not forced by
"pole weight 1 at the smallest conductor" and the vertex picture is wrong.

### 3.4 Odd factor with a pole: a bug, the corrected run, and what it did to P5
BUG (mine): for the odd type my first pole-weight patch replaced the arch term by r x (zeta's whole matrix);
the log is kept as threshold_c_BUGGY.log and must not be used. Fixed: pole term built alone (arch=False).
The even-factor table in 3.3 was not affected (re-checked: r = 0.5, L = 1.0 gives 2.008918818 again).
COMPUTED, corrected (threshold_c.log), odd Gamma factor Gamma_R(s+1) with pole weight r:
| r | q*_L at L = 0.75, 1.0, 1.25 (1.5) | reading |
|---|---|---|
| 0 | 2.8532, 2.86034, 2.86055 (2.8605506) | levels off |
| 0.5 | 1.42123, 1.42377, 1.42384 | levels off; NOT on the chord (the chord would give 1.690) |
| 1 | 0.997972, 0.998362, 0.9983783 (0.9983785) | levels off BELOW 1 |
| 1.25 | 1.00067, 1.00399, 1.00932 | does not level off |
P5: the threshold for r = 1 is 0.99838, so "1 - q* < 1e-3" missed narrowly (1.6e-3) and "maximiser = von
Mangoldt to 1e-3" MISSED clearly: the maximiser is m = 0.68016, 1.05682, 0.66633, 1.4980, 0.0566, 1.7425 at
n = 2..7 (von Mangoldt: 0.69315, 1.09861, 0.69315, 1.60944, 0, 1.94591), and the composite 6 carries weight.
Linearity in r fails for the odd factor (strictly concave). r > 1 infeasible again: HIT.
So: a pole of weight 1 at the smallest conductor does NOT force the primes when the Gamma factor is the odd
one; a slightly different, non-arithmetic object lives at conductor 0.99838 < 1. The primes are forced only
by the EXACT pair (even Gamma factor, pole weight 1). That pair is the corner.

### 3.5 Why the pole weight has a corner at 1 (PROVED given theory entry T5; the rest COMPUTED)
The pole term is +2<f,cosh(x/2)>^2 on even f and -2<f,sinh(x/2)>^2 on odd f (T5). With pole weight r the
form is W + (r-1) Pole on test vectors orthogonal to all the shift forms. For r < 1 the even block loses
(1-r) 2<f,cosh>^2; for r > 1 the odd block loses (r-1) 2<f,sinh>^2. By semidefinite duality
  lambda*_L(r) = min over Y >= 0, tr Y = 1, tr(Y B_n) = 0 for all n, of tr(Y (Arch + r Pole)).
So lambda*_L(r) <= -(1-r) max{2<f,cosh>^2} (r < 1) and <= -(r-1) max{2<f,sinh>^2} (r > 1), the maxima over
normalised f whose autocorrelation vanishes at every log n and whose Weil energy is (near) zero. The first
maximum converges as L grows (1.39532); the second grows linearly in L (0.235 per unit L). That is the
corner. The two one-sided slopes are the two parity blocks of wall WJ13 seen from the dual side.

### 3.6 Characters are not at the threshold (check_chi.log), linearity defect, and one more blind number
COMPUTED (`python3 check_chi.py.txt 1.25 40`): with the weights Lambda(n) chi(n) the form is degenerate at
the character's own conductor (lowest eigenvalue 4e-16 for chi_-3 at conductor 3, 5e-13 for chi_-4 at 4,
2e-11 for chi_5 at 5), as it must be for an L-function with its zeros on the line. So every real character
is feasible exactly from its own conductor on, while OTHER weights on the integers are feasible lower
(2.86055 < 3; 4.0363 < 5). Only for zeta does "the smallest conductor at which its own weights are feasible"
coincide with "the smallest conductor at which anything is feasible".
Linearity defect of the even factor, d_L = lambda*_L(0.5) - (lambda*_L(0) + lambda*_L(1))/2 (>= 0 by
concavity): 1.3e-2, 9.9e-4, 2.55e-5, 1.48e-6 at L = 0.5, 0.75, 1.0, 1.25. So the linearity in 3.3 is a
limit statement, approached fast.
Blind prediction P6 (written before the run): at L = 1.5 (N = 60) the defect is below 1.5e-7 and
q*_L(even, 0) = 4.03628 +- 0.00001. If the defect stops shrinking (above 1e-6) the linear law is not exact.

### 3.7 Searches (2026-11-11, web search, result summaries only; no paper read in full)
1. "Lagarias positivity property Riemann xi function infimum Re xi'/xi ... sigma > 10": Lagarias proved an
   inequality for Re xi'/xi for sigma > 10; Garunkstis improved it to sigma > a for any zero-free half-plane
   sigma > a (as summarised in arXiv 2509.18963, Grigutis-Turcinskas 2025); Hinkkanen: RH iff Re xi'/xi > 0
   on Re s > 1/2; Broughan 2009 for number fields; Goldstein-Grigutis arXiv 2201.08599 near the line for
   large t. So my section 2.4 identity (minimum on the real axis, for sigma >= Theta) is KNOWN in substance.
2. "explicit formula lower bound conductor positivity linear programming sharp ... Odlyzko Mestre Miller":
   Mestre's bound 10.323 for elliptic curves (actual 11); Tchamitchian arXiv 2410.12922 says such bounds are
   not sharp in general; Miller arXiv math/0112196 is the standard reference for the positivity technique.
   Nothing found on thresholds with free real weights restricted to the integers, on extremal non-arithmetic
   objects, or on a pole-weight parameter.
3. "Weil explicit formula positivity semidefinite programming unknown coefficients at integers minimal
   conductor ...": nothing matching; the Johns preprint did not appear in the results.
4. "Kurokawa tensor product ... multiple Euler product Koyama Akatsuka double Riemann zeta": Kurokawa 1992
   absolute tensor product (zeros at sums of zeros); Koyama-Kurokawa 2004 Euler product for
   zeta(s,F_p) (x) zeta(s,F_q); Akatsuka: Euler product for the double Riemann zeta function. The Kunneth
   route of 2.3 is a known programme; no result found that gives a convergence half-plane with a loss
   independent of the number of factors.
