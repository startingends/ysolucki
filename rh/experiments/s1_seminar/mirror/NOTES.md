# S1-mirror: notes (memory between turns)

Seat: S1-mirror, seminar board `s1`. Speaks for idea #21 (docs/IDEAS.md), notebook N32, e21_reflection,
Theorem D of r2_curv/PROOF_bochner_parity.md. Write only here. No commits.

## Turn 1 (started 2026-11-10 23:41 UTC)

### Reading (what the record says, in my words)
- D1 (R2-curv): sum_{a,b>=2} phi(a)phi(b) Lambda(ab)/sqrt(ab) = sum_p log p (sum_k phi(p^k) p^{-k/2})^2. A direct sum of rank-one blocks.
- D3: Gamma kernel w(u) = sum_m e^{-(2m+1/2)u} is Hankel-positive on the whole half line u = x + y, x, y > 0.
- D4/D5: prime atoms are NOT Hankel-positive on the continuum half line; N_even - N_odd = 4 Hankel(K) after folding.
- #21: restricted to integers a, b >= 2 both are Hankel-positive: K(ab) = sum_m (ab)^{-(2m+1/2)} + sum_p log p chi_p(ab).
- NOTE (mine): the matrix [c(ab)], a,b >= 2, never uses c at primes or c(1). Lambda(p) is invisible to it.

### Thoughts BEFORE computing (theory, each to be checked)
T1. Twist invariance. [c(ab) psi(a) psi(b)] = D [c(ab)] D for any real completely multiplicative psi. So mirror positivity
    is invariant under every real multiplicative twist of c; the shift inequality is not. Examples that stay mirror positive:
    (i) Liouville twist c = lambda * Lambda (weights at 2, 3 negated, 4 kept);  (ii) real tilt c(n) n^t;
    (iii) zeta(s-d) zeta(s+d), 0 < d < 1/2: whole Weil kernel multiplied by 2 cosh(d u): integers, Euler product, FE s -> 1-s,
    all couplings positive, mirror positive, Gamma kernel still completely monotone, zeros OFF the centre line (unconditional).
T2. Odd/even: for phi on (0, L], f_pm = phi +- mirror(phi): Q(f_-) - Q(f_+) = 4 [H_Gamma + H_primes - H_pole](phi) (D5 plus pole).
    Mirror positivity helps the odd block and works against the even block; the lowest eigenvalue is in the even block (r1_A).
T3. Multi-time Kallen-Lehmann is TRUE but gives a LOWER bound on the kernel (kernel + self-energy >= 0 on Q_+^x for the height
    extension c(ab), a, b coprime), while RH needs an UPPER bound N <= pole. And the height extension of the Gamma kernel
    w(log ab) is not the Gamma kernel w(|log a/b|) of the Weil form.
T4. Dial n = 4: F = (1 - 4^{1-s}) zeta(s) zeta(s-1); c(2^j) = log 2 (1 - (-2)^j): local roots at 2 are +1 (mult +1) and -2 (mult -1).
    So "exactly one negative eigenvalue" is the numerator Euler factor at 2, not the zeros.
T5. GL(2) with Ramanujan (roots e^{+-i theta}): mirror positivity FAILS (Hankel [2 cos((i+j) theta)] has signature (1,1)).

### TWO-PRIME MODEL: definitions (posted on the board before computing)
Form: Q = pole + arch - primes (r1_A conventions), atoms only at 2^k and 3^k (k log p) with weights c_p(k) p^{-k/2};
true weights c_p(k) = log p.
 Model A ("small window"): all of L^2[-L, L] with e^{2L} < 5 (L <= 0.80). Here zeta's own Weil form contains only the atoms
   2, 3, 4, so the two-prime model IS zeta. Zero margin (mu ~ 1e-15 at L = 0.75). Self-energy: none needed (L^2 functions).
 Model B ("lattice bumps"): f = sum_{x in F} phi(x) b_eps(. - x), F finite subset of Z log 2 + Z log 3 in [-L, L], b_eps a hat
   function of half-width eps. Self-energy of atoms handled by the finite width eps (it is ~ (1/eps)(log(1/eps) + C)); the atomic
   limit eps -> 0 is trivial (diagonal dominates), so eps is a parameter and is reported. Two variants: (B-zeta) all primes present
   (then M is a compression of zeta's form) and (B-23) only the atoms 2^k, 3^k.
 Variations: (V1) weight at 4 times (1 + eta): eta < 0 breaks mirror positivity of [c(2^{i+j})], eta > 0 keeps it.
   (V2) mirror-positive one-parameter family c_2(k) = log 2 (t sqrt 2)^k (twist at 2), truth at t = 1/sqrt 2.
   (V3) Liouville twist (weights at 2 and 3 negated). (V4) Beurling: 2 -> 2.1 (positions k log 2.1, weights log 2.1 * 2.1^{-k/2}).

### BLIND PREDICTION (written 2026-11-10 23:50 UTC, before any computation of this turn)
P1. Model A, L = 0.75, V1: let eta_+ > 0 and eta_- < 0 be the first relative changes of the weight at 4 at which the lowest
    eigenvalue of Q turns negative. PREDICTION: both |eta_+| and |eta_-| lie between 1e-15 and 1e-7, and they are within a
    factor 1000 of each other. I.e. the mirror-preserving direction (eta > 0) is NOT protected.
    Would change my mind: |eta_+| >= 1e-3 while |eta_-| <= 1e-7 (then mirror positivity protects the shift inequality).
P2. Model A, V2: the set of t with Q >= 0 at L = 0.75 is an interval around 1/sqrt 2 of width below 1e-6.
P3. Model A, V3 (Liouville twist, mirror positive): lowest eigenvalue at L = 0.5 negative, between -1 and -0.01.
P4. Model B, eps = 0.05, F = lattice points with |i| <= 2, |j| <= 2 in [-1.5, 1.5], thinned to spacing >= 2 eps: lowest eigenvalue
    positive for the true model AND for V1 with eta = +-0.5, AND for V4 (2.1), all within 20% of each other: the coarse model
    cannot tell. Would change my mind: 2.1 negative while 2 positive at the same eps.
Meaning for the kill line of #21 if P1-P3 hold: "the shift inequality fails for some mirror-positive weights with the true
log 2, log 3" is hit; what survives is the criterion as a control, and the question of what input breaks the twist symmetry.

### RESULTS of turn 1 (2026-11-10 23:50 to 2026-11-11 00:05 UTC). Files: lib.py.txt, modelA.py.txt (+ logs modelA_*.log),
### lead2.py.txt, modelB.py.txt (modelB_150.log, modelB_300.log), mirror2.py.txt, b40.py.txt, PROOF_mirror_criterion.md
Predictions against results:
- P1 (thresholds for the weight at 4, L = 0.75, both in [1e-15, 1e-7], within factor 1000): MISS on size, HIT on content.
  Got eta in [-6.0e-5, +1.4e-5] (L = 0.75), [-3.9e-8, +6.1e-9] (L = 0.80). The mirror-preserving direction breaks FIRST.
  Weight at 2: [-1.4e-11, +1.3e-13]; weight at 3: [-1.7e-9, +9.1e-11] (L = 0.75). Reproduced by S1-parity (B43), second
  basis 5-15% narrower. L = 0.70 rows WITHDRAWN (not converged: atom at 4 is 0.0137 inside the edge; S1-parity B43).
- P2 (twist at 2, interval width < 1e-6): HIT, [-1.4e-11, +1.3e-13].
- P3 (Liouville twist negative in [-1, -0.01] at L = 0.5): HIT, -0.12 even / -0.74 odd.
- P4 (Model B at eps = 0.05: true, eta = +-0.5, 2.1 all positive within 20%): MISS. Weight at 4 x 1.5 is negative (-0.025);
  flipped to -log 2 stays positive (+0.022); 2.1 positive (+0.40): not detected. Self-energy is only ~ log(1/eps).
- One-prime system (B5): fails between L = 0.54 and 0.56 (odd block first), when the missing 3 would enter.
- Two-prime world without 5: true weights fail at L = 0.90 (-0.12 / -0.45).
- Lead's test B12: (a) positive, (b) weight at 4 flipped: negative from 0.75, (c) 2.1: negative from 0.40. But weight at 4 doubled
  (mirror positive) is negative too: -0.144 / -2.5e-4 at L = 0.75.
Kill line of #21, first clause ("shift inequality fails for some mirror-positive weights with the true log 2, log 3"): MET.
Posted as numbers (B47), not as a verdict; the lead decides.

Proved / settled this turn:
- PROOF_mirror_criterion.md: Theorem 1 KNOWN (Perfekt-Pushnitski 2018, Thm 3.3, Helson matrices); Theorem 2 (a, b >= 2 version:
  sigma-finite measure + PSD term w at products of two primes); Corollary 3 (Euler product: real roots, positive multiplicity,
  inertia count). Idea #21's claim field is FALSE outside the dial: mirror test = local roots, not zeros.
  Fails: L(chi)L(chi-bar) mod 5 (-3.89), L(Delta) (-3.62). Passes: zeta(s)zeta(s-1), zeta(s-d)zeta(s+d), Liouville twist.
- Dial n = 4 = (1 - 4^(1-s)) zeta(s) zeta(s-1): roots at 2 are +1 (m=+1), -2 (m=-1): exactly one negative square. (Also S1-parity.)
- Obstruction to B3: real tilt F_d = zeta(s-d)zeta(s+d): kernel x 2cosh(du). Hypotheses closed under real exponentials,
  conclusion only under imaginary ones. S1-parity's extra hypothesis "one wrong-sign square in the mirror form" kills F_d only.
- Three meanings of "the integers": positions / completeness / weights; mirror matrix blind to all three (B50, asked the lead).
- Shifted mirror (B40): mirror at log r is positive only on atoms at r * integers; r = 2, a,b = 3..12: min eig -1.33.
- Two-sided form (B60): positivity on [-L, L] <=> |H_W(phi)| <= T_W(phi) on (0, L], H_W = sum_zeros phihat(g)^2,
  T_W = Weil form on a half-size window; primes in (e^L, e^(2L)] enter only through the mirror form.
- H_primes(phi) = E_+^2 - sum_{m>=1} E_m^2 - sum_zeros phihat(g)^2 on L^2(0, L]: each zero pair gives signature (1,1); explains "half negative".

Open threads (for turn 2):
- Asked: B48 (S1-parity: sign pattern even block caps increases / odd block caps decreases; H_n > T_n on the odd ground state?),
  B49 (S1-cubic: can one fibre node be absorbed by the m = 0 Gamma square?), B50 (lead: which meaning of "the integers" is B10?).
- Promised/accepted: S1-parity computes the first failing window of F_d, d = 0, 0.05, 0.1, 0.25 (B59).
- Offered to S1-curv (B54): profile width at which the comb matrix [K_psi(log ab)] loses positivity. Not computed.
- My own next step (IDEAS_LOCAL #2): doubling on L in (0.347, 0.693), where the half window has NO primes and T_W is purely
  archimedean + pole; check how tight |H_W| <= T_W is and which phi saturate it.
- Not done: Model B with all integer points (not only 3-smooth) and eps ~ e^(-2L) (S1-curv did the comb, B39);
  a numerical check of Theorem 2's w-term (raise c(4), c(6), c(9) by a PSD pattern).
- Literature: 5 queries recorded in the proof file. Not searched: Bisgaard / Ressel on semigroups without identity.

## Turn 2 (resumed after a container restart, 2026-11-11 00:15 UTC)
State on the board: idea 21 marked KILLED by the lead (B69) on the F_d obstruction; barrier B11 recorded. I no longer defend an idea.
Open question of the seminar: inside the mirror-positive cone, what singles out zeta, on the prime side?
To answer: B65 (S1-cubic), B70 (lead), B72, B78 (Socrates). Specialists to question: SP-reflection, SP-operator.

### Theory before computing (turn 2)
U1. F_d form: Q_d(f) = 2 Q(e^(dx) f, e^(-dx) f) (bilinear zeta form), i.e. Q_d = M_d Q M_-d + M_-d Q M_d, M_d = multiplication by e^(dx).
    Expansion: Q_d = 2Q + d^2 [X,[X,Q]] + O(d^4), X = multiplication by x. EVEN and analytic in d: no kink.
    First order in d^2 on the ground state v (Qv = mu v): lambda(d) = 2 mu - 2 d^2 ( Q(xv) - mu |xv|^2 ) + O(d^4).
    Zero side: a function with fhat(g) = 0 contributes -2 d^2 |fhat'(g)|^2 per zero. So d = 0 is a smooth strict local MAXIMUM.
U2. Doubling: for phi on (0, L], odd block: T_W - H_W = Q(phi) + sum_{m>=1} E_m^2 + H_primes(phi) - E_+^2 (B25 cancellation).
    With Yoshida ("one parity block suffices", via S1-parity B57): RH would follow from
       Q(phi) + sum_{m>=1} E_m(phi)^2 + H_primes(phi) >= E_+(phi)^2  for all L, phi in L^2(0, L].
    Left side = (Weil form of half window) + (Gamma mirror squares) + (prime mirror form); right side ONE square.
U3. R = T^-1 H is the compression of complex conjugation to {phihat restricted to the zeros}: the canonical-correlation operator
    between a half window and its mirror image in the geometry of the measure sum of delta at zeros (past/future, Helson-Szego type).

### BLIND PREDICTIONS turn 2 (written 2026-11-11 00:16 UTC, before computing)
Q1 (B70). F_d on L = 0.75, N = 40: lowest eigenvalue of each block is even and smooth in d, lambda(d) = lambda(0) - c d^2, c > 0;
    lambda_even(0) = 2 * 4.6e-15 = 9.2e-15, lambda_odd(0) = 7.5e-12. Sign change at |d*|: even block between 1e-8 and 1e-6,
    odd block between 1e-7 and 1e-4. (lambda(0) - lambda(d))/d^2 constant to 10% for d from 1e-9 to 1e-4.
    Would change my mind: a term linear in |d| (kink), or lambda(d) > lambda(0) for some small d.
Q2 (B72). G_d = zeta(s) L(s-d,chi_4) L(s+d,chi_4), d = 0.1: mirror matrix on 2..12 non-negative (min eig >= -1e-12).
Q3 (doubling, L = 0.6, phi on (0, 0.6]): pencil eigenvalues lam = H_W/T_W all in [-1, 1]; 1 + lam_min between 1e-10 and 1e-8;
    1 - lam_max between 1e-8 and 1e-5; number of eigenvalues with |lam| > 0.99: between 2 and 5 (of ~30).
    At the odd saturator (normalised E_+^2 = 1): H_primes between 0.1 and 0.6, sum_{m>=1} E_m^2 below 0.1, Q(phi) between 0.3 and 0.9.
    Without primes the top eigenvalue of T^-1 (H_pole - H_Gamma) exceeds 1 (between 1.05 and 3).

### RESULTS of turn 2 (2026-11-11 00:18 to 00:30 UTC). New files: fd.py.txt (fd_075.log), doubling.py.txt (doubling_0.5/0.6/0.68.log),
### b72.py.txt (b72.log). PROOF_mirror_criterion.md corrected (exponent in Theorem 2, Step 2; finite form of the boundedness step).
Predictions against results:
- Q1 (B70, F_d at L = 0.75): shape HIT: lambda_even(d) = 9.1965e-15 - 1.46289e-4 d^2, lambda_odd(d) = 7.4532e-12 - 2.45385e-3 d^2,
  constant coefficient to 6 digits for d <= 1e-6. d*_even = 7.9e-6 MISS (predicted 1e-8..1e-6), d*_odd = 5.5e-5 HIT.
  Reproduced by S1-parity (B91) with a second implementation, same coefficients, and continued to imaginary d (eigenvalue rises).
- Q2 (G_d mirror positive): HIT (min eig -2e-16, rank 6). G_d has ONE wrong-sign square and zeros off the line: so that item
  does not single out d = 0; only the size of the roots does (B81).
- Q3 (doubling, L = 0.6): 1 + lam_min = 5.9e-9 HIT; 1 - lam_max = 1.3e-5 MISS (just outside); count near +-1 = 3 HIT;
  shares at the odd saturator (units E_+^2): Q = 0.0997 (MISS), Gamma squares = 0.4988 (MISS), H_primes = 0.4015 (HIT);
  top eigenvalue of R without primes = 61 (MISS, predicted 1.05..3). L = 0.5: 9.1; L = 0.68: 353.
  Even saturator, L = 0.6: 1.710 + 0.059 against 0.750 + 1. Both saturators are of one sign.
  Check of the B25 identity by quadrature of the pieces: 3e-7 (sine family); cosine family 1.3% (jump of the odd extension).
  NOTE: in the "NO atoms" block of the logs the line "H from pieces" still includes the primes (script reuses PR): ignore that line.

Statements added this turn:
- PROVED: Q_d = 2Q + d^2 [X,[X,Q]] + O(d^4). Family analytic in t = d^2; t > 0 real roots p^(+-d) (mirror cone), t < 0 roots on the
  unit circle (Ramanujan side, form >= lambda(0)). For the self-dual local factor 1 - a p^-s + p^-2s: mirror positive iff |a| >= 2,
  Ramanujan iff |a| <= 2. COMPLEMENTARY, meeting at roots +-1. Mirror-positive AND Ramanujan = characters only.
- Odd block on [-L, L]  <=>  E_+(phi)^2 <= Q(phi) + sum_{m>=1} E_m(phi)^2 + H_primes(phi) on L^2(0, L]. With "one parity block
  suffices" (S1-parity Theorem 4 / Yoshida 1992) RH is equivalent to this family. Even block: mirror forms on the small side.
- R = T^-1 H: compression of complex conjugation to {phihat on the zeros}; past/future type operator (asked SP-operator, B84).
- B89: weights item (iii) = rank one per prime + modulus one + mass m_p log p; finite test: [[c(p^2), c(p^3)],[c(p^3), c(p^4)]]
  (normalised) is a positive multiple of [[1, e],[e, 1]]. With a local functional equation rank one <=> modulus one.
- Smallest Ramanujan test at one prime uses c(p) and the degree: |c(p)| <= (degree) log p; these are exactly the values the mirror
  matrix cannot see. (Not yet posted; mention to SP-reflection next turn.)
- Lean nominations (B82): (1) D1 as a finite identity (mathlib vonMangoldt, IsPrimePow); (2) Corollary 3 real-root finite version;
  (3) the boundedness step sum phi phi c(m^2 ab) <= m^(2a) sum phi phi c(ab).

Open threads (for turn 3):
- Waiting: SP-reflection on B83 (boundedness = upper half of Ramanujan? semigroup without identity? Levy-Khinchin for F^t?),
  SP-operator on B84 (Toeplitz +- Hankel identity; R as past/future angle operator; Krein recursion), S1-parity on B48.
- Not done: comb-profile computation offered to S1-curv (B54); doubling for L > 0.693 where the half window contains the prime 2.
- Possible next computation: the rank-one bound form of the odd block, <e, M^-1 e> <= 1 with M = Q + Gamma squares + H_primes,
  e = e^(x/2) on (0, L]: is M positive definite on L^2(0, L] (H_primes is indefinite there), and how does <e, M^-1 e> approach 1?

## Turn 3 (2026-11-11 00:47 UTC)
Aim of the turn (owner rule 6): ONE small statement, provable now, not in the papers read, violated by a control.
Addressed to me: B153 (first-prime lemma from a one-signed odd ground state), B158 (five-part line), B147 (K-atlas).
Read: B120/B137 (SP-reflection: boundedness = upper half; Corollary 3 = Hermite-Jacobi 1856; Theorem 2's w not found; BCR Ch. 8 unread),
B123 (SP-operator: Basor-Ehrhardt for T +- H; R = past/future operator; Suzuki 1606.05726: atom at log n enters at t = (1/2) log n),
B141 (FORMAL machine-checked D1 and the real-root Corollary 3), B161/B164 (candidate A holds for every system on the no-prime window).

### Theory before computing (turn 3)
V1. Fold the odd block of the BACKGROUND (pole + Gamma, no primes) to (0, L]: Theorem E + images give
    A_o(phi) = int V phi^2 + int int [w(|x-y|) - w(x+y)] (phi(x) - phi(y))^2 dx dy - 8 <phi, sinh(x/2)>^2,
    V(x) = 2(kappa_L(x) - c_inf) + 4 int_0^L w(x+y) dy. Jump kernel >= 0 (w decreasing), sinh > 0: so A_o(|phi|) <= A_o(phi)
    (first Beurling-Deny criterion) for EVERY L, not only L <= (1/2) log 2: the background has no mirror atoms at all.
    Hence its ground state is simple and positive (irreducible: the kernel is > 0 everywhere).
V2. First-prime lemma. If A_o has lowest eigenvalue -eps < 0, ground state psi > 0, |f| = 1, and atoms at positions u_i in [L, 2L)
    with weights m_i (unit-weight form U_i, <psi, U_i psi> = 2 x_i^(-1/2) h_i(psi) > 0) give an odd block >= 0, then
    sum m_i <psi, U_i psi> >= eps. One atom: m >= eps / <psi, U psi> > 0. Two lines: test on psi; h > 0 because psi > 0.
    Any positive phi with A_o(phi) < 0 gives a bound; Perron says such a phi exists whenever A_o is not >= 0, and for atoms
    with weights <= 0 (still a Perron operator) the lowest eigenvalue can only go DOWN: lambda <= -eps.
V3. Not excluded by it: one-prime system, F_d. Possibly excluded: Beurling 2.1 at L = 0.40 (weight too small for its late position).

### BLIND PREDICTIONS turn 3 (written 2026-11-11 00:48 UTC, before computing)
R1. Lower bound from the background ground state for the atom at 2: m_lb / log 2 between 0.80 and 0.98 at L = 0.5,
    between 0.40 and 0.90 at L = 0.4.
R2. For an atom at 2.1 at L = 0.40: m_lb > log 2.1 = 0.742 (between 1.0 and 5): Beurling's first prime excluded by the lemma alone.
R3. Background odd ground state: 0 sign changes on (0, L] for every L in 0.38 .. 1.0.
R4. Exact lower threshold of the weight at 2 at L = 0.5 (odd block): between 0.6924 and 0.6931 (log 2 = 0.693147).

### RESULTS of turn 3 (2026-11-11 00:48 to 01:00 UTC). New files: PROOF_first_prime.md, firstprime.py.txt (firstprime.log),
### certify.py.txt (certify.log).
Predictions against results:
- R1: lemma bound for the atom at 2: 0.407 at L = 0.40 (0.59 log 2) HIT; 0.552 at L = 0.50 (0.796 log 2) MISS by a hair (range 0.80-0.98).
- R2: atom at 2.1 at L = 0.40 needs m >= 1.097 > log 2.1 = 0.742: HIT. Also 1.71 at L = 0.38, 0.877 at 0.42; 0.740 at 0.45 (not excluded there).
- R3: background odd ground state: 0 sign changes for L = 0.30 .. 1.00: HIT. Background EVEN ground state: one sign change from 0.38.
- R4: exact odd threshold of the weight at 2 at L = 0.50: 0.69221 MISS (I said >= 0.6924). Both blocks: [0.6922, 0.6932] at L = 0.50,
  [0.69304, 0.69315] at L = 0.54.
Proved: Lemma 1 (fold; Beurling-Deny for every L), Lemma 2 (positive simple ground state; given Reed-Simon XIII.43/44, XIII.50 and
Connes-Consani Prop. 2.1, all cited from memory), Lemma 3 (first-prime inequality, sign and lower bound, monotone statement for
weights <= 0, an atom below e^(2 L_1)). Ball arithmetic: Rayleigh quotient -0.0012787 +- 1e-15 at L = 0.375 (truncation of the
m-sum in the builder not enclosed).
OVERLAP (posted B179): Lemmas 1-2 = S1-parity's B169 (same proof, posted at the same time); Lemma 3 with one vector = K-atlas's
B168(b) (polynomial witness, bound 0.295 at L = 0.40). Mine adds: Perron ground state as test vector, all windows, Beurling row.
Answered: B153 (B174), B158 (B175), B147 (B178). Nominated to FORMAL (B176): F-a, F-b, F-c (finite-dimensional forms).
B147 content: mirror positive at every prime + completely monotone Gamma kernel = complementary series or boundary at every
place, for the family F_d (unitarity range from memory); Rankin-Selberg square = Schur square of the local power sums; on the
tilt family the j-th tensor power has kernel W (2cosh du)^j, so the window detects d from d*/sqrt(j) (first order only).
From the specialists: Corollary 3 = Hermite-Jacobi (1856) (SP-reflection B137); T +- H splitting = Basor-Ehrhardt math/0502039
(SP-operator B123); R = past/future operator for the screw function of zeta; atoms entering at t = (1/2) log n is in Suzuki
1606.05726 Thm 2.1-2.2 with coefficients of zeta(s-w)/zeta(s+w), i.e. F_d as a RATIO; lower half of Ramanujan = reversed shifted
Hankel matrix [c(p^(i+j+2)) - c(p^(i+j))] >= 0 (SP-reflection B120); zeta's chi_p is an idempotent semicharacter.

Open threads (for turn 4):
- Asked K-atlas / S1-parity to recompute eps(0.40)/<psi, U psi> for the atom at 2.1 (mine 1.0966).
- Offered K-atlas: lowest eigenvalue of W (2cosh du)^j, j = 2, 4, 8, at L = 0.75.
- Not done: comb profile (B54); doubling for L > 0.693; upper bound on the weight from the EVEN block as a proved statement
  (the even block is not Perron; any even test function gives an upper bound, e.g. at (L, x) = (0.38, 1.9): m <= 0.26 < log 1.9).
- Possible sharpening of Lemma 3: optimise the test function over the positive cone (the exact odd threshold is 0.529 at L = 0.40
  against the first-order 0.407); and a two-sided 'position-weight' region for the first atom from one odd and one even test function.

## Turn 4: PLANK 9 of Bridge 1 (assignment from the coordinator, 2026-11-11 01:17 UTC)
Read: rh/BRIDGE.md, notebook N40, e27_relative/vec.py.txt and logs. Questions: (1) where does the comparison fail for F_d;
(2) zeta's explicit vectors through the controls' forms; (3) is there an analogue of plank 5 for the impostor.

### Theory before computing (turn 4)
W1. Plank 5 for F_d: E_d(g) = x^(1/2) sum a_d(n) g(nx), a_d(n) = sum_{ab=n} (a/b)^d; identity Q_d(f) = W_d(tail) holds by the same
    formal derivation (conditions: g(0) = 0 and int g y^(+-d) = 0). So plank 5 does not separate F_d.
W2. Where it fails: Q_d(v) = 2 mu - c d^2 on zeta's ground state v (B90). The failing direction IS the bottom ladder vector; the
    failing quantity is Q(x v) = sum |vhat'(gamma)|^2 (multiplication by the log variable). So the lead's guess is right about the
    mechanism and wrong about 'not on the near-null ladder'.
W3. The impostor HAS a Poisson map. Its coefficients (1, xi, -xi, -1, 0) mod 5 are an eigenvector of the finite Fourier transform
    (eigenvalue i sqrt 5; this is what xi is chosen for), so sum_n a(n) g(nx) = (i/(sqrt5 x)) sum_k a(k) ghat(k/(5x)), i.e.
    E_DH(g)(x) = i E_DH(ghat)(1/(5x)) for odd g. Poisson needs the functional equation, not the Euler product. So plank 5 has an
    exact analogue for the impostor, with the classical leak at c = 2 pi e^(2L)/5 (the 1/q that r1_A observed).
    Also plank 7's 'Lambda * 1 = log' is the DEFINITION of the log-derivative coefficients (c * a = a log) for any Dirichlet series.
W4. Consequence to report at once: planks 5-7 are available verbatim for F_d and for the impostor; only the inequality (plank 8)
    separates. The 'chirp tail' mechanism proposed for plank 8 is twist-blind.

### BLIND PREDICTIONS turn 4 (written 2026-11-11 01:23 UTC, before computing)
S1. F_d, d = 5e-6, L = 0.75: Rayleigh quotient of zeta's explicit vectors relative to F_0 = 2 zeta: n = 4: 0.60-0.80;
    n = 6: 0.98-0.999; n = 8 and n = 10: within 1e-3 of 1.
S2. Weight at 4 times (1 + 1e-5): n = 4: 0.3-0.6; n = 6: 1.05-1.25. Times 1.01: n = 4: between -800 and -300.
S3. One-prime system at L = 0.5: ratio exactly 1 (the matrices are identical: 3 is not in the window).
S4. F_d at d = 1e-5 (lowest even eigenvalue negative): its eigenvector has overlap deficiency below 1e-6 with zeta's ground state
    and below 1e-5 with zeta's explicit vector n = 4.
S5. Impostor: its lowest eigenvalues at L = 1.0 and 1.5 are within a factor 10 of prolate defects 1 - chi_n at c = 2 pi e^(2L)/5
    for small odd-function indices (n = 1 for the bottom): the impostor passes plank 1 below its failing window.

### RESULTS of turn 4 / PLANK 9 (2026-11-11 01:23 to 01:40 UTC). New files: bridge9.py.txt (bridge9_0.75.log, bridge9_one_0.5.log,
### bridge9_one_0.6.log), dhladder.py.txt (dhladder_1.0.log, dhladder_1.5.log, dhladder_1.8.log). Posted B199, B200 (claims to the lead).
Predictions: S1, S2, S3, S4, S5 all HIT.
- S1 F_d, d = 5e-6, L = 0.75, zeta's explicit vectors, ratio to 2 zeta: 0.7255 (n=4), 0.99327 (n=6), 0.99988 (n=8), 0.999997 (n=10).
  d^2-coefficients c = 1.445e-4, 2.416e-3, 1.951e-2, 0.1026; rungs fail from the bottom at d = 9.5e-6, 6.1e-5, 4.6e-4, 2.7e-3.
- S2 weight at 4 x (1 + 1e-5): 0.447, 1.155, 0.970, 1.008; x 1.01: -552, +156, -29, +8.6.
- S3 one-prime at L = 0.5: identical to zeta. At L = 0.6: +860, -208, +55, -8.4 (ladder destroyed).
- S4 negative eigenvector of F_d at d = 1e-5: 1 - overlap^2 = 3.5e-9 with zeta's ground state, 5.0e-7 with the explicit vector.
- S5 impostor: Poisson map PROVED (a is a DFT eigenvector, eigenvalue i sqrt5; E_DH(g)(x) = i E_DH(ghat)(1/(5x)));
  ladder / odd prolate defects at c = 2 pi e^(2L)/5: L = 1.0: 2.9, 2.07, 1.61; L = 1.5: 3.96, 2.42, 2.19, 1.94, 1.17;
  L = 1.8 (failed): negative eigenvalues -2.5e-7 / -6.8e-9, remaining ladder still on the defects (5.1, 3.2, 3.8, 4.1, 4.2).
Conclusions posted: (i) planks 5-7 have analogues for both controls; plank 1 holds for the impostor; only inequalities separate.
(ii) F_d fails on the BOTTOM rung (not off the ladder); mechanism = energy of x w (log-variable multiplication). (iii) the impostor
fails plank 8 on one direction per block near the band edge. (iv) the chirp-tail mechanism for plank 8 is not control-sensitive.
CAVEATS: one implementation; N = 28; impostor's explicit vectors not built; F_d's own (Voronoi-type) band-limiting operator
not built, so 'plank 5 for F_d' is formal; my earlier worry about degrees of freedom of the degree-2 leak was withdrawn in my own
notes (companions on the window are fixed by a finite triangular inversion; no resonance argument applies) and NOT posted.
Open for a next turn: explicit impostor vectors E_DH(odd prolates) and the form-level ratio kappa_K for the impostor at L = 1.5, 1.8
(does kappa_K break at the K where the defect is ~1e-7?); F_d's own band-limiting operator (Bessel-type kernel, Nystrom).

## Seminar S2 (board s2), question B7 to me (2026-11-11 03:25 UTC)
Context read: board s2 B1-B9 (lead's B9: model shapes = Deligne's tensor-power positivity; a bootstrap with a margin),
NOTEBOOK N49-N58 (five routes, one wall: Moebius-specific mean square when family <= sum; band edge = self-dual point),
THEORY T60 (S1-cubic: per-prime Poisson in the SHIFT picture, Poisson-kernel forms q_p), idea #6 (Lee-Yang in Bohr variables).
### Theory before computing
X1. MIRROR twin of T60 (per-prime Poisson in the mirror picture). For phi on (0, L] of bounded variation, F(s) := int phi(x) e^{(s-1/2)x} dx:
    log p * sum_{k>=1} p^{-k/2} (phi*phi)(k log p) = sum_{m in Z} F(2 pi i m / log p)^2      (both sides 0 when log p >= 2L).
    With B25/B60: sum_rho F(rho)^2 + sum_{m>=1} F(-2m)^2 + sum_p sum_{m in Z} F(2 pi i m/log p)^2 = F(1)^2.
    One square on the right (pole); on the left holomorphic squares at nontrivial zeros, trivial zeros, and the poles of every
    local Euler factor (Re s = 0). D1 = test functions at the fixed points of x -> -x on the circle R/(log p)Z.
    For degree d with roots alpha: local poles at Re s = log|alpha|/log p; Ramanujan <=> all on Re s = 0; F_d: Re s = +-d.
X2. Widder forbids the SIGN on any class containing L^2 of an interval; the per-prime splitting (no cross terms) survives on
    every class, with signature (1,1) per pair m, -m: same Krein structure as the zeros (B54).
### BLIND PREDICTION (03:25 UTC): identity X1 checked numerically for phi = x^2(1-x) on (0,1]: p = 2 and p = 3 agree to better
    than 1e-8 with |m| <= 2000; p = 11 (log 11 > 2L) gives |sum| < 1e-8.
### RESULTS S2/B7 (03:17-03:35 UTC). Files: s2_poisson.py.txt (s2_poisson.log), S2_B7.md (full answer). Posted s2 B18 (answer), B17 (question to SP-reflection).
- Prediction X1 HIT after fixing my own quadrature bug (first run used mp.quad at frequencies ~1e4: wrong by 1e-3; replaced by the
  closed form; agreement 1e-15 for p = 2, 3, 5, 7; p = 11 gives 3e-16).
- Content: the per-prime mirror Poisson identity (mirror twin of T60); D1 = fixed points of x -> -x on R/(log p)Z; second fixed point gives a
  second positive comb {(i+1/2) log p}; per-prime dualities have p-independent area 2LT/pi and never see e^(2L): the wall is placed by the PNT.
- Near side: exact, no sign: D1's square F(0)^2 cancelled by aliases (99.5% for p = 7 on phi = x^2(1-x)).
- Widder: (W1) interval, (W2) one reflection, (W3) index 0; dropping any one known; none keeps a sign on the near side.
- Outside: Kurasov-Sarnak (unread; recalled via idea #6 novelty note), question B17 to SP-reflection.
