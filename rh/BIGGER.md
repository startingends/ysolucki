# The bigger statement

A track with one question (owner, 2026-11-10): **what is RH a shadow of, and does the larger statement have a
provable base case?** (The Wiles pattern: the theorem asked for was a corollary of something larger and more
rigid, which could be attacked because it had a base case and an induction.)

A candidate is admissible only if (1) it is strictly larger than RH (RH is one instance or one consequence),
(2) it is stated precisely enough that an instance can be computed or checked, (3) it has at least one
instance that is a theorem or could become one, and (4) there is some relation between instances (an order,
a deformation, an induction) along which truth could travel. Each entry: statement · the instances and which
are known · the relation between instances · what a base case would be · what would refute it.

## Candidates
Written by seat BG, 2026-11-11. Working files, scripts and logs: `rh/experiments/bigger/` (diary: PROGRESS.md).
Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Nothing here has been checked by a second seat.

### Before the candidates: in every monotone family on record, zeta is the last member (PROVED, one line each)
| parameter | truth travels | proved end | where RH is |
|---|---|---|---|
| window half-width a | to smaller a (restriction) | small a (Yoshida) | a = infinity |
| damping d (kernel e^(-d\|x\|) W, i.e. Re xi'/xi > 0 on Re s > 1/2 + d) | to larger d (Schur product) | d >= 1/2 | d = 0 |
| conductor q (W + log q; add (log q / 2 pi) Lebesgue to the zero side) | to larger q | - | q = 1 |
| heat time t (de Bruijn-Newman) | to larger t | t >= 0.2 | t = 0, and t < 0 is false |
| pole weight r (BG-1 below) | none for r > 1: nothing is feasible there | - | r = 1 |
So an induction of the Wiles kind cannot run along any of these: there is no true statement on the far side
of zeta to start from (barrier B3 read as a statement about families). A larger statement has to be of
another kind: a description of a whole convex body of which zeta is a corner (BG-1), an identity in a
parameter (BG-3), or a mean value over a family (BG-2).

### BG-1 · The body of positive solutions on the integers; zeta is its corner  (developed; computed)
**Objects.** Window half-width L, Fourier basis of `r1_A/weil.py.txt`. Arch_G = archimedean form of the Gamma
factor G (even: Gamma_R(s); odd: Gamma_R(s+1)); Pole = the pole form (+2<f,cosh(x/2)>^2 on even f,
-2<f,sinh(x/2)>^2 on odd f, theory T5); B_n = the shift form of the integer n. For a pole weight r, a
conductor q and REAL weights m_n on the integers n >= 2 (not assumed to sit on primes, not assumed positive):
  Q(G, r, q, m) = r Pole + Arch_G + (log q) I - sum_n m_n B_n.
lambda*_L(G, r) = max over m of the lowest eigenvalue on window L at q = 1 (a concave maximisation, so every
local maximum is global); threshold on the window q*_L = exp(-lambda*_L), increasing in L; q*(G, r) its limit.
The body is B(G) = {(r, log q, m) : Q >= 0 on every window}: closed, convex, defined with no primes and no zeros.

**Statement (CONJECTURE V).**
 (V1) q*(even, 1) = 1 and the maximiser converges to the von Mangoldt weights.
 (V2) q*(G, r) = infinity for every r > 1 and both G: one Gamma factor cannot carry more than one pole.
 (V3) log q*(even, r) = (1 - r) c0 + e(r) on 0 <= r <= 1 with c0 = 1.39532 and 0 <= e(r) <= 2e-6: the
      threshold is linear in the pole weight to six digits (not exactly: see "refutation").
 (V4) for every pole-free type the threshold object is NOT an L-function: q*(odd, 0) = 2.86055 < 3 and
      q*(even, 0) = 4.0363 < 5, although the first real characters of these types have conductors 3 and 5.
RH is inside V1: PROVED (PROGRESS section 4, P-a): V1 implies RH (restrict the maximiser of window L to a
fixed smaller window and let L grow); RH implies q*(even,1) <= 1. V as a whole says zeta is a corner of the
body in the (pole weight, conductor) plane: left slope c0, right slope infinite.

**Instances and their status.**
| instance | status |
|---|---|
| each finite (G, r, L): the number lambda*_L | COMPUTED (float64, one implementation). Certifiable without RH: a weight vector m bounds it below, a density matrix Y with tr(Y B_n) = 0 bounds it above; each is a finite interval-arithmetic statement |
| "no real weights on the integers are feasible below conductor q*_L" for the L computed (odd: 2.8605; even pole-free: 4.0362; zeta's type: 1 - 3e-12) | unconditional once certified (upper bound on lambda*_L); not yet certified |
| V2 at each r > 1 | COMPUTED: lambda*_L falls linearly in L (-0.0235 per unit L at r = 1.1, -0.059 at r = 1.25, even factor); provable route: exhibit normalised odd f with vanishing autocorrelation at all log n, small Weil energy and large <f,sinh>^2 |
| existence of the limit q*(G, 0) | PROVED: the sequence is monotone and bounded (the zero weight vector is feasible at conductor pi e^(-psi(1/4)) = 215, where the Gamma density is non-negative) |
| q*(even, 1) = 1 with maximiser von Mangoldt | this is RH plus uniqueness (idea #9; Johns preprint, unreviewed) |
| real characters chi_-3, chi_-4, chi_5 | COMPUTED: each is feasible exactly from its own conductor (form degenerate to 4e-16, 5e-13, 2e-11 at L = 1.25) but is not the threshold object of its type |
| odd Gamma factor with pole weight 1 | COMPUTED: threshold 0.99838 < 1, maximiser close to but not von Mangoldt (0.680, 1.057, 0.666, 1.498, 0.057 at n = 2..6) |

**Numbers (COMPUTED, `python3 rh/experiments/bigger/threshold.py.txt <zeta|even0|odd> <L> <N> [r]`, logs threshold_a..e.log).**
| G, r | q*_L at L = 0.5, 0.75, 1.0, 1.25, 1.5 |
|---|---|
| even, 1 | 0.9999846, 1 - 3e-11, 1, 1, 1 (to 1e-11); maximiser = Lambda(n) for n <= 19 at L = 1.5 |
| even, 0.9 | 1.13346, 1.14849, 1.14970, 1.14973, - |
| even, 0.5 | 1.9412, 2.0043, 2.008919, 2.009045, 2.009046 |
| even, 0 | 3.8680, 4.0252, 4.03596, 4.03627, 4.036276 |
| even, 1.1 | 0.9957, 1.0037, 1.0094, 1.0153, - (no levelling off) |
| odd, 0 | 2.7518, 2.8532, 2.86034, 2.860548, 2.8605506 |
| odd, 0.5 | -, 1.42123, 1.42377, 1.42384, - |
| odd, 1 | -, 0.997972, 0.998362, 0.9983783, 0.9983785 |
| odd, 1.25 | -, 1.00067, 1.00399, 1.00932, - (no levelling off) |

**Relations between instances ((i)-(iv) PROVED, elementary, PROGRESS section 4; (v) is a change of normalisation, HEURISTIC until written out).** (i) lambda*_L decreases in L. (ii) lambda*_L(G, r)
is concave in r: two feasible points give everything between them; one dual certificate at r0 bounds every
other r from above. (iii) Arch_odd - Arch_even is a non-negative form, so everything feasible for the even
factor is feasible for the odd one at the same conductor. (iv) Feasibility at q' gives feasibility at q > q'
by adding Lebesgue measure: an "old" part and a "new" part, as for modular forms of different levels.
(v) The body for the pair Gamma_R(s-d) Gamma_R(s+d) with poles at 1 +- d and positivity normalised by
2cosh(dx) is the SAME body (the whole kernel is zeta's times 2cosh(dx), barrier B11): V says the same true
thing about every member of the family F_d, and what distinguishes d = 0 is only which Gamma factor is given.

**How truth could travel.** Along r towards the corner from the fat side: for r < 1 and log q above the
line the feasible set has interior, so ONE explicit positive solution suffices and there is room for
estimates (no zero margin there). PROVED (closedness, PROGRESS section 4, P-b): if for a sequence r_k -> 1 there are positive
solutions with pole weight r_k at conductors tending to 1 whose weights converge to von Mangoldt, then RH.
The margin shrinks to zero only in the limit.

**Base case.** (a) Any single finite instance, certified in interval arithmetic: smallest proposal, "no real
weights on the integers make the odd form non-negative at conductor below 2.86 on the window L = 1.25"
(an unconditional non-existence theorem about Dirichlet-series-like objects; the least conductor of an
actual odd character is 3). (b) The first instance that needs an idea: an explicit positive solution for the
pole-free even factor at some conductor above 4.0363 (say 4.2) on ALL windows. It is not an L-function, has
slack, and nothing arithmetic is at stake; a proof would be the first existence proof on the boundary curve
that does not go through an L-function. Not attempted here; blocked at: no closed form for the weights
(m_2 = -1.3505, m_3 = 0.9306, m_4 = -2.3716 are stable to 5 digits; no pattern recognised).

**What would refute it, and the test run.** Blind predictions in PROGRESS 3.1-3.8, six in all. Hits: zeta's
type has threshold 1 with von Mangoldt maximiser; q*(r) decreasing; r > 1 infeasible for both factors;
q*_1.5(even,0) = 4.03628. Misses that changed the statement: I predicted the odd and even pole-free thresholds
would be 3 and 5 (the first characters): they are 2.86055 and 4.0363, so "threshold objects are arithmetic"
is FALSE off zeta's type; I predicted the odd factor with a full pole would again give von Mangoldt at
conductor 1: it gives a different object at 0.99838; I predicted the linear law exact: its defect at r = 0.5
falls 1.3e-2, 9.9e-4, 2.6e-5, 1.4e-6 and then stalls at 1.1e-6 (unchanged from 60 to 80 modes), so V3 is a
six-digit law, not an identity. Still open tests: certify one instance; windows beyond L = 1.5 in higher
precision; the pair of Gamma factors (is zeta_K of Q(sqrt -3) at its threshold? Adding zeta's solution to the odd
threshold object gives a solution of that type at 2.86055 < 3, given RH, so presumably not); line-positivity for the type of F_d, where nothing should be feasible.
**Novelty (searched 2026-11-11, summaries only, PROGRESS 3.7).** Known: the positivity technique for conductor
bounds (Odlyzko, Mestre 10.323 against 11, Miller math/0112196) and that such bounds are not sharp in general;
positive solutions and a conductor threshold for zeta with free positions (Johns preprint, unreviewed; idea #9).
Not found in two searches: free REAL weights restricted to the integers, the pole weight as a parameter, the
corner, the non-arithmetic threshold objects with their numbers. Not established as new.

### BG-2 · Deligne's amplification transposed: a mean value over the family of characters  (exact; base case a theorem; not new)
**Statement MH(tau, A).** P_chi(N) = sum_n Lambda(n) chi(n) n^(-1/2) w(n/N) (w(x) = x e^(-x); main term
removed for the trivial character). MH(tau, A): sum over primitive chi of conductor <= Q of |P_chi(Q^tau)|^2
<< Q^A. **PROVED** (Mellin transform and positivity of each term, PROGRESS section 4, P-d): MH(tau, A) implies that no
Dirichlet L-function and not zeta has a zero with real part above 1/2 + A/(2 tau); GRH implies MH(tau, 2 + eps)
for every tau. **Instances:** tau <= 2 is a theorem (multiplicative large sieve), A = tau + eps is trivial
for all tau; in between everything is open. **Relation:** the single parameter tau; the exponent
A(tau) = 2 on [0, 2], and RH says "no kink ever". **Base case:** tau <= 2. **Blocked at:** any flat piece
A(tau) = 2 beyond tau = 2 already gives a zero-free strip; the statement is the classical variance of primes
in progressions to small moduli (Barban-Davenport-Halberstam below the large-sieve range). What Deligne has
and this lacks is a reason, independent of the individual members, why the family series
sum_q q^(-w) sum_chi |P_chi(q^tau)|^2 has no real singularity to the right of w = 2 (in his case: the poles
of the family L-function are known from monodromy, and H^1 only gives zeros). **Refutation test:** none run.

### BG-3 · The damping plane: the critical damping of zeta(s-d) zeta(s+d) is d + theta  (exact; base case a theorem; known family)
**Statement.** For the multiplier k(x) = 2cosh(d x) e^(-d'|x|) on the Weil kernel (the damped form of
F_d): positive definite on all windows iff d' >= d + theta, theta = Theta - 1/2 (up to the boundary case).
**Instances:** d' >= d + 1/2 unconditional; RH is theta = 0, i.e. the true region is the whole wedge
d' >= d. On the infinite window the lowest value is inf_t 2 Re xi'/xi(1/2 + d' + it), which for a zero-free
half-plane equals its value at t = 0 (Lagarias for sigma > 10, Garunkstis for any zero-free half-plane, as
summarised in arXiv 2509.18963; summaries only). So the ground value is the explicit function
2 xi'/xi(1/2 + d') above theta and minus infinity below: RH = "no jump in d' on (0, infinity)".
**Relation:** Schur products (truth moves to larger d' only); **base case:** d' >= d + 1/2;
**blocked at:** moving to smaller d' is the zero-free half-plane problem (Hinkkanen's criterion).
This answers "how does a quantity vary with d" for the family F_d (a line of slope 1 whose intercept is
theta) but adds no mechanism. **Refutation test:** none run.

### Named and set aside
- Grand RH / Selberg class / Langlands functoriality / Weil positivity for all global fields / Deninger's
  cohomology / the arithmetic site: larger statements without a base case that the literature does not
  already use; nothing added here.
- Kunneth amplification through Kurokawa's absolute tensor product (zeros at sums of zeros): a known
  programme (Kurokawa 1992; Koyama-Kurokawa 2004; Akatsuka; search summaries). What Deligne's argument would
  need is a convergent product for the k-fold object with a loss independent of k; the only fibration
  available, the projection, gives prod_rho zeta(s - rho), which is circular (PROGRESS 2.3).
- The conductor threshold with free positions (Johns preprint; idea #9, notebook N16): BG-1 grows from it.
