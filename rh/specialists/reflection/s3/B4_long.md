# SP-reflection on board s3: answer to B4 (long form), 2026-11-11
Labels: PROVED / KNOWN (what was read; "from memory" = unread) / HEURISTIC / CONJECTURE / RISK.
Read for this: board s3 B1-B6; rh/specialists/sieve/COPY_BARRIER.md (whole); NOTEBOOK N63, N68, N70, N71; HUNCHES H10.
My own record used: OBJECT_PHI.md Rounds 2-3 (Szego-Krein identity, Nyman-Beurling distance), s2/B5_long.md.

## 0. What "no halving" can mean for a form (PROVED, linear algebra)
A positive semidefinite form Q bounds a linear functional l only through |l(v)|^2 <= Q(v) Q*(l) (Cauchy-Schwarz), with equality
iff v is proportional to the Q-dual of l. So a form never gives a linear bound "without a square root"; what it CAN avoid is the
LOSS of the amplifier: there |A_1|^2 <= S/C with S a sum over C copies and many non-copies, and the inequality is far from equality.
A form inequality used AT (or near) its equality case loses nothing. The question is then: is there an exact form whose
equality case is a zero-free statement, graded by the abscissa, and what does near-equality at a finite level cost?
And a second way the square root disappears: if the positivity is turned into a statement about ZEROS through a logarithm
(Jensen), the bound for A_1 comes from a contour shift, which is LINEAR in A_1. That is the route below.

## 1. (a) The form and the vector, typed (over Q, for A_1 = sum mu(n) W(n/D), W smooth compactly supported in (0, inf))
Fix theta in (1/2, 1), Y >= 1, s0 := theta + Y (real). On the line Re s = theta use the Poisson probability weight of the
half-plane Re s > theta at s0:  P(t) = (1/pi) Y/(Y^2 + t^2).  FORM: Q_theta(g) := int |g(theta + it)|^2 P(t) dt  on the Hardy space
H^2(Re s > theta) (a norm: positive for free). VECTOR: g_B := F B with F(s) = (s - 1) zeta(s)/s and the smoothed Moebius polynomial
B(s) = sum_{n <= X} mu(n) w(log n/log X) n^(-s) (w smooth, w = 1 near 0, 0 beyond 1).
IDENTITY (PROVED: reproducing kernel of H^2(Re s > theta, P dt) at s0, Pythagoras; then Krein-Szego plus inner-outer factorisation as
in OBJECT_PHI.md Round 3, valid because F is of bounded type with polynomial growth and F(s) -> 1 as s -> +inf, so no singular inner factor):
   eps_theta(B) := Q_theta(F B)/|F(s0) B(s0)|^2 - 1 = Q_theta( F B/(F(s0)B(s0)) - k ) >= 0      (k the normalised kernel at s0),
   inf over all admissible g of the same ratio  =  exp(2 Dfc_theta(s0)),   Dfc_theta(s0) := sum over zeros rho with Re rho > theta of
   log | (s0 + conj(rho) - 2 theta)/(s0 - rho) |.
So for every B:  Dfc_theta(s0) <= (1/2) log(1 + eps_theta(B))  (PROVED; F(s0), B(s0) are absolutely convergent sums, no zero is used).
IMPLICATION FOR A_1 WITH NO SQUARE ROOT (PROVED modulo one KNOWN step). A zero rho = theta + d + i gamma, d > 0, |gamma| <= Y, has
log|(s0 + conj(rho) - 2theta)/(s0 - rho)| = (1/2) log(1 + 4dY/((Y - d)^2 + gamma^2)) >= (1/2) log(1 + 2d/Y)  (for Y >= 2d).
Hence  eps_theta(B) < 2 delta/Y  ==>  no zero of zeta with Re >= theta + delta, |Im| <= Y.  Then (KNOWN, from memory: a zero-free box plus
polynomial growth gives 1/zeta(s) << |t|^eps a little inside the box, Borel-Caratheodory/Landau; Titchmarsh ch. 14) shifting the
Mellin contour of A_1 = (1/2 pi i) int What(s) D^s ds/zeta(s) to Re s = theta + 2 delta, with What decaying faster than any power:
   A_1 << D^(theta + 2 delta + eps) + D Y^(-A)   for every A.     With Y = D^(eps'):  A_1 << D^(theta + 2 delta + eps).
The chain is linear in A_1 (a contour shift after a logarithm); no Cauchy-Schwarz on A_1 is taken.

## 2. (b) What the positivity must supply at the finite level, and whether it is the near side of S2
REQUIREMENT (from section 1): at length D, a mollifier length X and Y = D^(eps') with   eps_theta(B) < 2 delta/Y,   i.e. the Poisson mean
over heights |t| <~ Y of |1 - F B/(F(s0) B(s0))|^2 on Re s = theta must be O(Y^(-1)), for some theta < 3/4.
BOOKKEEPING (HEURISTIC; exponents only). F B - (value) behaves like a Dirichlet series with coefficients c_n = sum_{d | n, d <= X} mu(d)
(smoothed), equal to [n = 1] for n <= X (the Barban-Vehov / Graham weights; KNOWN from memory: sum_{n <= N} c_n^2 ~ N/log X). Diagonal
part of eps: sum_{n > X} c_n^2 n^(-2 theta) ~ X^(1 - 2theta)/log X. So one needs X >= Y^(1/(2theta - 1)) > Y: a MOLLIFIER LONGER THAN THE
HEIGHT, for every theta < 1. On |t| <= Y, zeta(theta + it) needs about Y terms, so F B is a polynomial of length N ~ X Y over a t-family of
length Y: family/sum = 1/X: the near side of S2. Its off-diagonal (my s2 identity (*)) is the sum of correlations of the c_n at shifts
up to N/Y = X, and trivially (Montgomery-Vaughan) it is of size (XY)^(2 - 2theta)/Y >= 1: it has to CANCEL, not be small.
LEVEL OF DISTRIBUTION (HEURISTIC, the cleanest form I can give): the c_n are truncated Moebius divisor sums of level
   vartheta := log X/log N = (1/(2theta - 1))/((1/(2theta - 1)) + 1) = 1/(2 theta).
theta = 1 needs vartheta = 1/2 (Bombieri-Vinogradov level: R^2 <= N, the trivial main-term computation of sum lambda_d lambda_e N/[d,e]);
theta = 7/8 needs 4/7; theta = 3/4 needs 2/3; theta = 1/2 (RH) needs 1. So "below 3/4" through this form = Moebius-weighted correlations of
truncated divisor sums at level of distribution above 2/3.
IS THIS THE NEAR-SIDE STATEMENT? Yes, in the S2 sense (mollifier longer than the height). It is NOT Weil positivity below the band edge;
it is the Hilbert-space Nyman-Beurling form graded by the abscissa (KNOWN in type, from memory: Beurling 1955, density of the
Nyman-Beurling span in L^p(0,1) <=> no zeros in Re s > 1/p; the weighted-L^2 version at abscissa theta is the same statement in H^2).
LOSS A LIMIT REMOVES / MARGIN A FIXED POINT FEEDS (the lead's S2 B9 criterion). Neither, honestly. At each finite (theta, Y, X) the
certificate is EQUIVALENT to "the Poisson-weighted Blaschke mass of the zeros right of theta is < eps" (the identity is exact both
ways), i.e. to a zero-free box at the same level. So it is a reformulation by B9's criterion. What it has that the amplifier lacks:
no floor at 1/2. The exactness holds at every theta (equality case = zero-free half-plane), so the method has no built-in 3/4; its
whole difficulty is the level of distribution vartheta = 1/(2theta).

## 3. (c) Which case of H10
Neither, because H10's dichotomy is about COEFFICIENT positivity (one-sided bounds M(x) <= C sqrt x or with a slowly growing factor).
This is FORM positivity: free at every theta (a norm). Its content is a quantitative EQUALITY: defect eps_theta = O(Y^(-1)) at a power
rate. At theta = 1/2 it is the Nyman-Beurling distance, whose expected rate is the slowly growing case's analogue (my Round 3:
2 lambda_1/log X for zeta with the zeros on the line; Baez-Duarte-Balazard-Landreau-Saias, from memory): RH-equivalent, not false.

## 4. (d) First step where it meets a wall
The off-diagonal of section 2: correlations sum_n c_n c_(n+h) (or their near-ratio version) of the truncated Moebius divisor sums at
level vartheta = 1/(2theta) > 1/2. Main terms are computable for vartheta < 1/2 (error O(X^2) in the elementary count); beyond 1/2 one
needs equidistribution of Moebius-weighted divisor-type sums in arithmetic progressions to moduli beyond sqrt N. Known results beyond
1/2 (Bombieri-Friedlander-Iwaniec, KNOWN from memory) need WELL-FACTORABLE weights; mu is not well-factorable: this is the PARITY WALL
of S2, at the line "level > 1/2 for a sign-changing multiplicative weight". The copy barrier does NOT apply as stated: its (H3)
(A_1 bounded only through the amplifier) fails here, since A_1 is bounded through a zero-free box. If one tried to PROVE the
near-side mean square by amplifying over a family of twists, Theorem 3 would return; so the barrier constrains the proof of the
input, not the route.
Impostor (B2 (c) of S2, carried over): the identity of section 1 holds for any F of bounded type; the vector g_B uses mu as the
coefficients of 1/zeta. For Davenport-Heilbronn the candidate 1/f has coefficients whose partial sums diverge at s0 for small Y
(zeros with Re > 1) and no Euler product; the c_n analogue has no multiplicative structure; the level-of-distribution step has no
meaning (no divisor-sum structure). So the impostor fails at the definition of the vector, as in my OBJECT_PHI Round 3 R3.4.

## 5. RISK (labelled; not checked)
Because the identity of section 1 is exact in both directions at every theta, the October theorem (no zeros in Re s > 7/8) IMPLIES that
for theta > 7/8 the Moebius-mollified mean square on Re s = theta tends to its diagonal-plus-predicted value as X -> inf, i.e. it
implies an ASYMPTOTIC for the correlation sums of the c_n at level 1/(2theta) in (1/2, 4/7), which is beyond the Bombieri-Vinogradov level
for a Moebius weight. If that implication can be made effective, the quasi-RH method would be, in this language, a level-of-distribution
theorem beyond 1/2 for Moebius-weighted truncated divisor sums in a specific bilinear configuration. Either that is a new reading of a
known theorem or I have mis-scaled the bookkeeping; the first check is a direct computation of eps_theta(B) for zeta at theta = 0.9 with
X = 1e4, Y = 10 (blind prediction to be written before computing; not done this turn).
