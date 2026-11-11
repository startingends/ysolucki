# The mirror criterion (seat S1-mirror, 2026-11-10/11)

Status of each statement is given in capitals. Nothing here is a statement about zeros.
Numerical checks: `mirror2.py.txt` / `mirror2.log` (this folder), `rh/experiments/e21_reflection/mirror.log` (lead),
second route by S1-parity (board B22, B23).

## 0. What is being characterised

c is a real function on the integers; only its values at composite n matter. The mirror matrix is
M_c = [ c(ab) ], a, b >= 2. A real completely multiplicative function is chi : N -> R with chi(mn) = chi(m) chi(n);
it is the same thing as a point t = (chi(p))_p of R^infinity, chi(n) = t^kappa for n = p^kappa.

Idea #21 states: "M_c >= 0 iff c is a positive mixture of real completely multiplicative functions; for an Euler
product, iff the local roots are real with positive multiplicity". The second half is right (Corollary 3). The first
half is right for the matrix on a, b >= 1 under a growth condition, and that is a KNOWN theorem (Theorem 1). For the
matrix on a, b >= 2, which is the one idea #21 needs (the matrix of Lambda on a, b >= 1 is not >= 0, R2-curv D2),
the exact statement has two corrections (Theorem 2): the mixing measure may have infinite mass, and there is an extra
free non-negative term at products of two primes.

## Theorem 1 (KNOWN; cited, not proved here)
Let alpha(n) = O(n^a). Then [alpha(nm)], n, m >= 1, is non-negative iff alpha(n) = int t^kappa dmu(t), n = p^kappa, for a
positive measure mu on R^infinity; mu is unique.
Source: Perfekt and Pushnitski, "On Helson matrices: moment problems, non-negativity, boundedness, and finite rank",
Proc. London Math. Soc. 116 (2018) 101-134, arXiv 1611.03772, Theorem 3.3, credited there to Berezansky-Kondratiev,
Berg-Christensen-Ressel (Harmonic Analysis on Semigroups, 1984) and Samoilenko. Read: sections 1 to 3 in full text.
They call [alpha(nm)] a Helson matrix (multiplicative Hankel matrix). Without a growth condition the statement is
FALSE already in two variables (their section 3.1, citing Berg-Christensen-Ressel section 6.3): there are
non-negative multi-variable Hankel matrices that are not moment sequences.

## Theorem 2 (PROVED here; the version without the index 1)
Let c be real with |c(n)| <= C n^(2a) for composite n (some C, a >= 0). Let X = prod_p [-p^a, p^a] (compact), a point
chi of X being the completely multiplicative function with those values at the primes; 0 denotes the point chi = 0.
The following are equivalent.
 (a) M_c = [c(ab)], a, b >= 2, is non-negative (every finite section is positive semidefinite).
 (b) There are a positive Borel measure sigma on X \ {0} with int chi(n)^2 dsigma < infinity for every n >= 2, and a
     positive semidefinite matrix [w(p, q)] indexed by primes, such that
        c(n) = int chi(n) dsigma(chi)                 for composite n with at least three prime factors (with multiplicity),
        c(pq) = int chi(pq) dsigma(chi) + w(p, q)      for primes p, q (p = q allowed).
The pair (sigma, w) is unique. sigma may have infinite total mass.

Proof. (b) => (a): for finitely supported real phi,
   sum phi_a phi_b c(ab) = int ( sum_a phi_a chi(a) )^2 dsigma + sum_{p,q prime} phi_p phi_q w(p, q) >= 0;
chi(a) chi(b) is integrable because chi(a)^2 and chi(b)^2 are.

(a) => (b). Step 1 (Hilbert space). On finitely supported real functions on {2, 3, ...} put <phi, psi> = sum c(ab) phi_a psi_b.
It is a semi-inner product; let H be the completion of the quotient by null vectors, k_a the class of delta_a. Then
<k_a, k_b> = c(ab). H is separable.
Step 2 (the integers act). For m >= 1 put T_m k_a = k_(ma). On finite combinations v, v':
<T_m v, v'> = sum phi_a psi_b c(mab) = <v, T_m v'>, and <T_m v, T_m v> = <T_(m^2) v, v> <= ||T_(m^2) v|| ||v||.
So T_m maps null vectors to null vectors (it is well defined on H's dense subspace), and by induction
   ||T_m v|| <= ||T_(m^(2^k)) v||^(2^-k) ||v||^(1 - 2^-k).
With B = sum |phi_a| a^(2a): ||T_M v||^2 = sum phi_a phi_b c(M^2 ab) <= C M^(4a) B^2. Hence
||T_(m^(2^k)) v||^(2^-k) <= (C^(1/2) B)^(2^-k) m^(2a) -> m^(2a), so ||T_m v|| <= m^(2a) ||v||. [With the bound written as
n^(2a) the box X should be prod [-p^(2a), p^(2a)]; the exponent is immaterial.] Thus the T_m extend to bounded
self-adjoint commuting operators with T_m T_n = T_(mn). (This is the standard argument for exponentially bounded
positive definite functions, Berg-Christensen-Ressel 4.1.12, from memory.)
Step 3 (spectral theorem). The commuting bounded self-adjoint operators T_p, p prime, have a joint resolution of the
identity E on the compact metrisable space X, T_m = int chi(m) dE(chi). Put mu_(a,b)(B) = <E(B) k_a, k_b>, a finite
signed measure, mu_a = mu_(a,a) >= 0. From T_m k_a = k_(ma):
   (*)  d mu_(ma, b) = chi(m) d mu_(a, b),     hence   chi(b)^2 mu_a = mu_(ab, ab) = chi(a)^2 mu_b.
Step 4 (dividing out). Let U_p = {chi : chi(p) != 0}; the U_p cover X \ {0}. On U_p define sigma = chi(p)^-2 mu_p. By (*)
with a = p, b = q the definitions agree on U_p intersect U_q. So sigma is a well defined sigma-finite positive measure
on X \ {0}. For any a, b >= 2, on U_p: chi(p)^2 mu_(a,b) = mu_(pa, pb) = <E T_a k_p, T_b k_p> = chi(a) chi(b) mu_p
= chi(a) chi(b) chi(p)^2 sigma, so mu_(a,b) = chi(a) chi(b) sigma on X \ {0}. In particular int chi(a)^2 dsigma <= mu_a(X) = c(a^2).
Step 5 (the point 0). Put w(a, b) = mu_(a,b)({0}); [w(a,b)] is the Gram matrix of the vectors E({0}) k_a, so it is
positive semidefinite. By (*), w(ma, b) = chi(m)|_(chi = 0) w(a, b) = 0 for m >= 2. So w(a, b) = 0 unless a and b are both
prime.
Step 6. c(ab) = <k_a, k_b> = mu_(a,b)(X) = int chi(ab) dsigma + w(a, b). A composite n with three or more prime factors
has only factorisations with a composite factor, where w = 0; n = pq has the single factorisation (p, q).
Uniqueness: for composite a the finite measure nu_a = chi(a)^2 sigma has int chi(m) dnu_a = c(m a^2) for all m >= 2; the
functions chi(m), m >= 2, vanish at 0, separate the points of X \ {0} and are closed under products, so they are dense
in the continuous functions vanishing at 0 (Stone-Weierstrass) and determine nu_a; sigma = nu_a / chi(a)^2 on {chi(a) != 0};
then w is determined by c(pq).  QED

Remarks (all PROVED, one line each).
 R1. What the mirror matrix does not see: c(1) and c(p), p prime (ab is composite). For zeta, sigma = sum_p (log p) delta at
     chi_p (chi_p(p) = 1, chi_p(q) = 0), w = 0; the formula c(n) = int chi(n) dsigma also returns c(p) = log p, and
     "c(1)" = sigma(X) = sum_p log p = infinity. That infinity is why the matrix on a, b >= 1 fails (D2), and it is the
     same infinity as the self-energy w(0) = sum_m 1 of the Gamma kernel.
 R2. Twist invariance: for real completely multiplicative psi, M_(c psi) = D M_c D, D = diag(psi(a)). So the set of
     mirror-positive c is a cone invariant under all real multiplicative twists (psi may vanish or be negative at primes).
 R3. Adding to c a non-negative amount at one square p^2 (or a positive semidefinite pattern at products of two primes)
     keeps M_c >= 0: it is the w term. Lowering c(p^2) for zeta breaks it (rank-one block minus a positive multiple of e_1 e_1^T).
 R4. In one variable this is the familiar statement: [s_(i+j)], i, j >= 1, is >= 0 iff s_n = int x^n dsigma for n >= 3 and
     s_2 = int x^2 dsigma + w, w >= 0, with int x^2 dsigma finite (mass at 0 of the measure x^2 sigma + w delta_0).

## Corollary 3 (PROVED; the Euler-product case)
Suppose c vanishes off prime powers and, for each prime p, c(p^k) = (log p) sum_(j=1..r_p) m_j alpha_j^k for k >= 2, with
distinct non-zero complex alpha_j and non-zero complex m_j (the local factor prod_j (1 - alpha_j p^-s)^(-m_j)). Then
M_c is the direct sum over p of the Hankel matrices H_p = [c(p^(i+j))], i, j >= 1 (and zero rows at non-prime-powers), and
   M_c >= 0   iff   for every p all alpha_j are real and all m_j > 0.
The rank of the section a, b <= A is the number of pairs (p, alpha_j) once A >= max p^(r_p) (zeta: pi(A)); the number of
negative eigenvalues of H_p is (number of real roots with m_j < 0) + (number of conjugate pairs of non-real roots).
Proof. c(ab) != 0 with a, b >= 2 forces a = p^i, b = p^j. For real phi_1..phi_K put P(z) = sum phi_i z^i; the form of H_p is
sum_j m_j P(alpha_j)^2. c real and linear independence of the sequences k -> alpha^k give: the set of (alpha_j, m_j) is
closed under complex conjugation. For K >= r_p, Lagrange interpolation gives a polynomial P with P(0) = 0 and any prescribed
values v_j at the alpha_j; if the prescription is conjugation-symmetric, P is real (uniqueness). Real alpha_1: v_1 = 1, others
0, gives the value m_1, so m_1 > 0 is necessary. Non-real pair alpha_j, conj alpha_j: v = z, conj z, others 0, gives
2 Re(m_j z^2), which is negative for a suitable z; so no non-real roots. Conversely sum m_j P(alpha_j)^2 >= 0. The inertia
statement follows the same way: the map phi -> (P(alpha_j))_j is onto the conjugation-symmetric vectors, and a pair
contributes 2 Re(m z^2), of signature (1, 1).  QED

Consequences (PROVED from Corollary 3; COMPUTED in mirror2.log; second route S1-parity B22, B23).
 - zeta, real characters, zeta(2s), zeta * L(chi_4): roots in {1, -1, 0}: mirror positive.
 - L(chi) L(chi-bar), chi mod 5: roots +-i at p = 2, 3 mod 5: NOT mirror positive (c(4) = -2 log 2; min eig -3.89 on 2..12).
 - L(s, Delta) and every form with Ramanujan and non-real roots e^(+-i theta): NOT mirror positive (min eig -3.62 on 2..12).
 - zeta(s) zeta(s-1), zeta(s-d) zeta(s+d): roots 1, p and p^(+-d): mirror positive, zeros OFF the centre line.
 - Liouville twist zeta(2s)/zeta(s): root -1: mirror positive.
 - theta dial n = 4 = (1 - 4^(1-s)) zeta(s) zeta(s-1): at p = 2 the roots are +1 (m = +1) and -2 (m = -1), because
   c(2^j) = log 2 (1 + 2^j) - [j even] 2 log 2 * 2^j = log 2 (1 - (-2)^j). EXACTLY ONE negative eigenvalue for every size;
   it comes from the numerator Euler factor at 2, whose zeros lie ON the centre line (S1-parity's remark, B23).
 So mirror positivity is a test of the local roots (real, positive multiplicity). It is neither necessary nor
 sufficient for zeros on the centre line. The claim field of idea #21 ("holds for every member whose zeros lie on its
 centre line and fails for every member whose zeros do not") is false outside the dial.

## Rule-6 barriers
B1 (Euler product): Corollary 3 is the Euler product, nothing else. B2 (controls): proves RH for nothing; passes
functions that violate RH and Beurling systems. B3 (zero margin): not applicable; the cone has interior.

## Novelty (owner rule 5): queries, sources, how much was read
Queries (web search, 2026-11-10/11):
 1. Perfekt Pushnitski "Helson matrices" moment problems non-negativity boundedness finite rank multiplicative Hankel
 2. "von Mangoldt" multiplicative Hankel matrix "Lambda(mn)" positive semidefinite Helson matrix
 3. Berg Christensen Ressel positive definite functions on abelian semigroups multiplicative semigroup positive integers
    completely multiplicative functions semicharacters moment
 4. "Helson matrix" OR "multiplicative Hankel" "von Mangoldt" positive semidefinite prime powers rank number of primes
 5. "reflection positivity" Weil explicit formula primes zeta "Osterwalder-Schrader" OR "Kallen-Lehmann" Riemann hypothesis
Read: Perfekt-Pushnitski arXiv 1611.03772, sections 1 to 3 (text extracted from the PDF; searched the whole text for
"Mangoldt", "zeta", "Euler": the only hit is zeta(t) in a Carleson-measure statement). Abstract only: Chavan-Sahu-Sinha
arXiv 2407.04124 (Helson matrices induced by measures). Result lists only for queries 2 to 5.
Findings: Theorem 1 is KNOWN (so the criterion of idea #21 is a known theorem for a, b >= 1). The variant for a, b >= 2
(Theorem 2, with the term w and an infinite measure) was NOT FOUND in what was read; it is the routine modification and
is probably folklore. The instance c = Lambda (rank = number of primes) was NOT FOUND in five queries; it is two lines.
Reflection positivity / Kallen-Lehmann with the explicit formula: NOT FOUND in one query (closest: Burnol, "The explicit
formula and a propagator", math/9809119, title and snippet only).
