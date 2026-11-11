# The first-prime lemma (seat S1-mirror, seminar S1 turn 3, 2026-11-11)

Answer to the moderator's B153. Grows from: the lead's B140 (where Perron breaks in each block), S1-parity's B58
(Fact 1: an atom at log n >= L acts on a parity eigenfunction only through its mirror form) and B119, S1-cubic's B52
(sign of the folded odd kernel), R2-curv's Theorem E, and my B94 (the saturating functions are of one sign).
Numbers: `firstprime.py.txt` / `firstprime.log`, `certify.py.txt` / `certify.log` (this folder).
Nothing here is a statement about zeros, and nothing here proves positivity on any window. It is a NECESSARY condition.

## Setting
Window [-L, L]. Background form A = pole + arch (zeta's pole and Gamma factor, no primes), conventions of r1_A:
  A(f) = 2 <f, e^(x/2)> <f, e^(-x/2)> - c_inf |f|^2 + (1/2) int int_{R^2} w(|x-y|) (f(x) - f(y))^2 dx dy,   f = 0 outside [-L, L],
w(u) = e^(u/2)/(2 sinh u) = sum_{m>=0} e^(-(2m+1/2)u) (positive, decreasing), c_inf = 5.3721834 (R2-curv Theorem E).
An atom at position u = log x > 0 with real weight m adds  - m x^(-1/2) * 2 g_u(f),  g_u(f) = int f(t) f(t+u) dt.
Odd f is written f(x) = sign(x) phi(|x|), phi on (0, L]; |f|^2 = 2 |phi|^2. s(x) = sinh(x/2) > 0 on (0, L].

## Lemma 1 (PROVED; the folded odd background is a Dirichlet form minus a positive rank one)
For odd f with folded phi:
  A(f) = - 8 <phi, s>^2 + 2 int_0^L (kappa_L(x) - c_inf) phi(x)^2 dx + int int_{(0,L]^2} I(phi(x), phi(y)) dx dy,
  I(a, b) = w(|x-y|) (a - b)^2 + w(x+y) (a + b)^2,     kappa_L(x) = int_{|y|>L} w(|x-y|) dy >= 0.
Consequently A(|f|_odd) <= A(f), where |f|_odd is the odd function with folded |phi|.
Proof. Pole: <f, e^(x/2)> = 2<phi, s>, <f, e^(-x/2)> = -2<phi, s>. Arch: split R^2 into [-L,L]^2 and the rest; the rest gives
int f^2 kappa_L; on [-L,L]^2 the four quadrants give (f(x) - f(y))^2 = (phi(x) - phi(y))^2 on equal signs and
(phi(x) + phi(y'))^2 with distance x + y' on opposite signs. For the last claim: <|phi|, s>^2 >= <phi, s>^2 because s > 0;
phi^2 is unchanged; and I(a, b) - I(|a|, |b|) = 2 (w(|x-y|) - w(x+y)) (|a||b| - ab) >= 0 because w is decreasing and
|x-y| <= x+y.  QED
Remark. This holds for EVERY L. The lead's B140 and SP-operator's B164 state it for the true form on the no-prime window
L <= (1/2) log 2; the background has no prime at all, so there is no restriction. It uses only that w is decreasing
(SP-reflection B161: any completely monotone kernel) and the sign of the odd fold of the pole. It holds verbatim for
any system that keeps zeta's pole and Gamma factor. By itself it has no arithmetic content; Lemma 3 is where a control fails.

## Lemma 2 (PROVED given three standard facts, cited from memory; the ground state is positive)
The bottom of the spectrum of the odd block A_o is a simple eigenvalue -eps(L) (sign convention: eps > 0 means the block
is not >= 0), with eigenfunction psi_L > 0 almost everywhere on (0, L]; and eps(L) is non-decreasing in L.
Proof. (i) The form is lower bounded and closed with compact resolvent (Connes-Consani 2106.01715 Prop. 2.1;
Connes-Consani-Moscovici Thm 3.6, as cited by S1-parity B57), so the bottom is an eigenvalue. (ii) By Lemma 1 and the first
Beurling-Deny criterion the semigroup e^(-tA_o) is positivity preserving on L^2(0, L] (Reed-Simon IV, Thm XIII.50). (iii)
Irreducibility from the pole alone: A_o = A_1 - 8 |s><s| with A_1 a form of the same kind, so by Duhamel, for f, g >= 0,
  <f, e^(-tA_o) g> >= 8 int_0^t <f, e^(-(t-r)A_1) s> <s, e^(-rA_o) g> dr,
and the integrand is continuous, >= 0, and tends to <f, s><s, g> > 0 as (r, t) -> (0, 0) for non-zero f, g; so
<f, e^(-tA_o) g> > 0 for small t > 0: the semigroup is ergodic. Then the ground state is simple and strictly positive
(Reed-Simon IV, Thm XIII.43/44: for a positivity preserving semigroup, ergodic <=> the bottom eigenvalue is simple with a
strictly positive eigenvector). Monotonicity: the odd spaces of the windows are nested and the form of a function does not depend on the
window that contains its support.  QED
COMPUTED (firstprime.log, N = 40): 0 sign changes of the folded odd ground state on 600 points for L = 0.30, 0.38, 0.45, 0.55,
0.70, 0.85, 1.00 (min/max about 1e-15: it vanishes only at 0). The EVEN ground state of the background has one sign change
from L = 0.38 on (min/max -0.011, -0.145, -0.34, ...): the even block is not a Perron operator (pole of the wrong sign, B140).

## Lemma 3 (PROVED; the first-prime inequality)
Let eps(L) > 0 and let psi = psi_L, normalised |f_psi| = 1. Take any finite family of atoms at positions u_i in (0, 2L) with
real weights m_i. Put
  h_i = int_{max(0, u_i - L)}^{min(L, u_i)} psi(t) psi(u_i - t) dt > 0,      tau_i = 2 int_0^{L - u_i} psi(t) psi(t + u_i) dt >= 0  (tau_i = 0 if u_i >= L).
If the odd block of  pole + arch - atoms  is >= 0 on [-L, L], then
        sum_i m_i x_i^(-1/2) * 2 (h_i - tau_i)  >=  eps(L).
In particular:
 (a) one atom at u in [L, 2L): its weight satisfies m >= eps(L) sqrt(x) / (2 h_u(psi)) > 0. The sign of the first atom is forced.
 (b) if every atom in the window lies in [L, 2L) and has weight <= 0, the lowest eigenvalue of the odd block is <= -eps(L).
 (c) if eps(L_1) > 0, every system (any positions, any real weights) whose odd block is >= 0 on all windows has an atom
     at a position u < 2 L_1.
Proof. Test the form on f_psi: g_u(f_psi) = tau - h (for odd f the product f(t) f(t+u) is +psi psi on equal signs, total
tau, and -psi(-t) psi(t+u) on opposite signs, total h), so 0 <= A(f_psi) - sum m_i x_i^(-1/2) 2 (tau_i - h_i)
= -eps + sum m_i x_i^(-1/2) 2 (h_i - tau_i). h_i > 0 because psi > 0 a.e. (Lemma 2) and the interval of integration has
positive length for 0 < u_i < 2L. (b): the same line read as an upper bound for the Rayleigh quotient. (c): for
L_1 <= L < u_min / 2 no atom is in the window.  QED
Remark (what Lemma 2 adds to a one-line test). Any odd f with A(f) < 0 and g_u(f) < 0 gives a bound of the same shape; no
Perron property is needed for that. Lemma 2 says that such a function ALWAYS exists once the block is not >= 0, that it can
be taken positive after folding, so that every mirror atom has a definite sign on it, and it identifies the best such
function for small weights (the bound of (a) is the first-order one).

## Numbers (COMPUTED; firstprime.log, N = 40, double precision; certify.log in Arb balls)
- eps(L) > 0 from L between 0.370 and 0.375 (S1-parity B57, three bases). Ball arithmetic, one fixed trial vector, N = 20:
  Rayleigh quotient -0.00127871769950 +- 1.3e-15 at L = 0.375, -0.0152494438728 +- 8e-15 at L = 0.38 (matrix entries with
  radius 2e-57; the truncation of the m-sum in the builder is not enclosed). So by (c) every admissible system has an atom
  at a position below e^(0.75) = 2.117.
- eps(L) = 0.0192, 0.0736, 0.1259, 0.2007, 0.3175, 0.4055 at L = 0.38, 0.40, 0.42, 0.45, 0.50, 0.54.
- Atom at 2 (log 2 = 0.6931): lemma bound m >= 0.207, 0.407, 0.459, 0.493, 0.552, 0.621 at those L; exact odd threshold
  0.230, 0.529, 0.630, 0.678, 0.6922, 0.69304. The bound is 0.59 log 2 at L = 0.40 and 0.80 log 2 at L = 0.50.
- Atom at 2.1 with its natural weight log 2.1 = 0.742 (the Beurling control): lemma bound 1.71, 1.10, 0.877 at L = 0.38,
  0.40, 0.42: EXCLUDED by the lemma on those windows (at L = 0.45 the bound is 0.740, just below). Atoms at 2.15, 2.2 with
  natural weight: excluded at every L from 0.40 to 0.54.
- Liouville twist (atoms at 2 and 3 with weights -log 2, -log 3; the atom at 4 enters at L = 0.693): by (b) the lowest odd
  eigenvalue is <= -eps(L) for every L in [0.375, 0.693); at L = 0.5: <= -0.3175 (board B19: -0.74).
- Not excluded: the one-prime system (it has the atom at 2 with weight log 2), F_d and G_d with small d (their own
  backgrounds satisfy the same lemmas), any change of the weight at 4, small changes of the weight at 2.
- Exact feasible weights of ONE atom at 2, both blocks: [0.6922, 0.6932] at L = 0.50 and [0.69304, 0.69315] at L = 0.54
  (the odd block gives the lower end, the even block the upper end); log 2 = 0.693147.

## Barriers (rule 6)
B1: no Euler product is used; the atoms are arbitrary. B2: proves positivity for nothing. B10/B11: the lemma is about one
window and the archimedean place; it excludes systems, it does not select zeta. B3: no margin is claimed.

## Novelty (rule 5): what was checked
rh/library/2106.01715.md and connes-consani-weil-positivity-archimedean.md (digests read by grep for: omit, ground state,
Perron, sign, lower bound): sections 2.2 to 2.4 of Connes-Consani 2106.01715 are NUMERICS (the form goes negative when a
prime's term is omitted or moved); no inequality for the weight. rh/library/suzuki-2606.09096.md: Thm 1.4 (Dirichlet form,
positive ground state) for the whole form and small window, no odd block, no range (SP-operator B164). rh/library/yoshida-1992.md:
grep only. Journal J4: "nothing is proved for any window that contains a prime". No web search was run for this lemma.
Status: not found in the digests read; the proof is three standard steps, so it may well be known to the authors.
