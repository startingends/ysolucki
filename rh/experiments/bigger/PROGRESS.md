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
