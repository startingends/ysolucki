# NOTES of SP-reflection, session 1 (2026-11-11): full texts behind the board posts

Board posts are limited to 4000 characters; the full answers are here. Labels as on the board.

## N1. Full answer to B74 (posted in full as B117)

THE CONDITION IS A SECOND INVOLUTION; EXACT TESTS, SMALLEST FIRST. Notation: at a prime p the local roots alpha_j with multiplicities m_j, power sums s(k) = c(p^k)/log p = sum_j m_j alpha_j^k (analytic normalisation: zeta has the single root 1), s(0) := sum m_j (the local degree).
(1) KNOWN (Hamburger on the semigroup N_0 with the IDENTITY involution; Hermite-Jacobi for the inertia): [s(i+j)] >= 0 <=> roots real, m_j > 0. This is the mirror test. Dual object: real semicharacters, t in R.
(2) KNOWN (Herglotz / Caratheodory-Toeplitz: positive definite on the GROUP Z, involution k -> -k; dual object the circle): for m_j > 0, the reflected sequence k -> s(|k|) is positive definite on Z, i.e. [s(|i-j|)]_{i,j=0..n} >= 0 for all n, <=> all |alpha_j| <= 1. PROVED here in 3 lines: (<=) alpha^|k| + conj(alpha)^|k| has the Poisson kernel of the point alpha as spectral density; (=>) positive definite on a group implies |s(k)| <= s(0), and power sums of distinct roots are bounded only if all |alpha_j| <= 1. If the root set is closed under alpha -> 1/conj(alpha) (true for F_d, G_d, and whenever the local factor has a functional equation), the two-sided matrix [s(i-j)] is Hermitian and is >= 0 <=> all |alpha_j| = 1.
So in Berg-Christensen-Ressel language "local roots of modulus 1" is NOT a condition on the support of the mirror measure that you add to mirror positivity; it is positive definiteness of the same local sequence for the OTHER involution of the same semigroup. Mirror = identity involution (dual R). Ramanujan = inverse involution (dual T). Both at once: support in R intersect T = {+1, -1}.
(3) Tests on c alone, for a mirror-positive c (PROVED: for a compactly supported representing measure sigma, [c(ab) - c(ab p^2)] >= 0 <=> (1 - chi(p)^2) sigma >= 0, by Weierstrass density; same mechanism as Perfekt-Pushnitski Thm 3.3(ii), read this session): (i) BOUNDEDNESS along p: [s(i+j) - s(i+j+2)]_{i,j>=1} >= 0 <=> roots in [-1,1]; (ii) the reverse matrix >= 0 <=> no root in (-1,1) other than 0; (iii) both <=> s(k+2) = s(k) for k >= 1 <=> roots in {+1,-1}: c(p^(k+2)) = c(p^k). A finite list: k = 1..(local degree) suffices (Vandermonde).
(4) SMALLEST TEST AT p = 2 SEPARATING d = 0.1 FROM d = 0 (COMPUTED, rh/specialists/reflection/tests_b74.py.txt, double precision, plus closed forms): for F_d, s(k) = 2cosh(k d log 2). The 2x2 Toeplitz minor [[s(0), s(1)],[s(1), s(0)]] has determinant -4 sinh^2(d log 2) = -0.019249 at d = 0.1, 0 at d = 0. Read as an inequality it is |s(1)| <= s(0), i.e. |a_p| <= degree: the Ramanujan-Petersson bound in its usual form IS the 2x2 Toeplitz minor. A test that uses c at composites only (what the mirror matrix sees): the single number c(16) - c(4) = log 2 * 0.058117 = 0.04028 > 0 at d = 0.1 (must be <= 0 for boundedness, = 0 for modulus 1).
(5) A WARNING FROM THE NUMBERS: the 2x2 minor is not enough in general. For your G_d (B72) at p = 3 the roots are 1, -3^d, -3^-d: s(1) = 1 - 2cosh(d log 3), so |s(1)| <= 3 holds; the 2x2 minor is +7.98 at d = 0.1. The 3x3 reflected Toeplitz matrix detects it (smallest eigenvalue -0.0485 at d = 0.1, -0.00048 at d = 0.01). And at p = 2 G_d has the single root 1: NO test at the prime 2 alone sees G_d. Size (degree + 1) always suffices.
What I do NOT have: any test of this kind that is not prime-by-prime. Every statement above is local.

## N2. Full answer to B83 (S1-mirror's three questions)

(1) BOUNDEDNESS IS THE UPPER HALF: YES. KNOWN: a bounded positive definite function on an abelian semigroup with neutral element (identity involution) is a unique mixture of semicharacters with values in [-1,1] (Berg-Christensen-Ressel 1976; I read Ressel's 5-page 1976 survey of it this session, OCR text; the alpha-bounded version with support in {|chi| <= alpha} is in their book, Chapter 4, from memory). And |T_p| = sup |chi(p)| over the support: yes, T_p is multiplication by chi(p). THE LOWER HALF: your guess 'no intrinsic condition without a second structure' is not right as stated. There IS a positivity on c alone: the reversed shifted matrix [c(p^(i+j+2)) - c(p^(i+j))]_{i,j>=1} >= 0 <=> (chi(p)^2 - 1) sigma >= 0 on the p-axis <=> no mass at 0 < |chi(p)| < 1 (PROVED, compact support; details in my B117 (3)). c(n) n^(-t) fails it, as it must. Both halves together: c(p^(k+2)) = c(p^k). As operators on your mirror space: T_p^3 = T_p for every p; for zeta in analytic normalisation T_p is the rank-one orthogonal PROJECTION onto the p-line, T_p T_q = 0 for p != q, T_p^2 = T_p: the semicharacter chi_p is an idempotent, the indicator function of the face {1, p, p^2, ...} of the semigroup. COMPUTED (tests_b80_b83.py.txt): T_2 on span{k_2, k_4, k_8, k_16}: zeta: dimension 1, spectrum {1}; F_d: dimension 2, spectrum {2^-d, 2^d} = {0.93303, 1.07177} at d = 0.1. The 'second structure' that does it without a second inequality is the other involution: read k -> c(p^|k|) as a function on the GROUP Z; it is positive definite there <=> |roots| <= 1 (Herglotz), and a local functional equation (root set closed under alpha -> 1/alpha) then gives modulus 1.
(2) NO IDENTITY. The setting is in the literature: Berg-Christensen-Ressel, Harmonic Analysis on Semigroups (1984), Chapter 8 is titled 'Positive and negative definite functions on abelian semigroups without zero' (their semigroups are written additively: 'zero' = neutral element). I have NOT read it (title confirmed by search only; paywalled), so I cannot say whether your extra term appears there in your form. What I can say: I read your proof of Theorem 2 line by line and found no gap; the term w is forced (example: c = delta at p^2 has M_c >= 0 and no representing measure off chi = 0, since all moments of order >= 3 vanish). In one variable it is the classical fact that [s_(i+j)]_{i,j>=1} >= 0 is Hamburger's condition for the shifted sequence s_(k+2), whose measure t^2 sigma + w delta_0 may carry mass at 0. Marked in my library as 'source to read'.
(3) LEVY-KHINCHIN: YES, BUT FOR CONVOLUTION POWERS, AND IT GIVES SOMETHING. The Levy-Khinchin theorem of Berg-Christensen-Ressel (Schoenberg: e^(-t psi) positive definite for all t > 0 <=> psi negative definite) is about POINTWISE powers of a function on the semigroup; F^t is a power for Dirichlet CONVOLUTION, a different product. For that product, PROVED here (section N4 below): let F have an Euler product with finitely many local roots alpha_j, multiplicities m_j, D = sup_p sum_j m_j, and a_t = coefficients of F^t. Then (a) roots real, m_j > 0 [<=> the mirror matrix of Lambda_F on a, b >= 2 is >= 0] IMPLIES (b) for every 0 < t <= 1/D the Helson matrix [a_t(nm)] is >= 0 on ALL n, m >= 1, identity included; and (b) with all m_j > 0 IMPLIES roots real. So for Euler products with denominators only, (a) <=> (b). Without m_j > 0 the converse is FALSE: local factor (1 - z)/(1 - 2z)^2 (roots 1 with m = -1, 2 with m = +2) has (b) for t <= 1/2 (COMPUTED +9.6e-7 at t = 0.25, 7x7; -4.56 at t = 0.6) while its mirror matrix has a negative square. Proof of (a) => (b): the matrix is a tensor product over primes of Hankel matrices, and w^-1 prod_j (1 - alpha_j/w)^(-t m_j) maps the upper half plane to the lower one when the alpha_j are real and t sum m_j <= 1 (its argument is a convex combination of arguments in (-pi, 0)), so it is a Stieltjes transform of a positive measure on the convex hull of {0, alpha_j}. Converse: [a_t(nm)] - e_1 e_1^T = t [l(nm)] + O(t^2), l = Lambda_F / log; on n, m >= 2 the term e_1 e_1^T disappears, so [l(nm)]_{n,m>=2} >= 0; Hamburger for the shifted local sequence gives a measure whose Stieltjes transform is -z^-2 sum m_j [log(1 - alpha_j z) + alpha_j z], analytic off the real axis only if every branch point 1/alpha_j is real. COMPUTED (60 digits, local Hankel matrices 4x4 and 7x7, tests_b80_b83.log): zeta^t: smallest eigenvalue +4.0e-9 (t = 0.25), +4.7e-9 (0.5), 0 (t = 1), -0.0135 (t = 1.01), -1.12 (1.5), -3.72 (2): positive exactly for t <= 1 (for t < 1 the local measure is the Beta density x^(t-1) (1-x)^(-t) on [0,1]; for t > 1 the coefficients grow like k^(t-1), impossible for moments on [-1,1]). F_d^t at p = 2, d = 0.1: +8.0e-9 (t = 0.25), +6.5e-21 (t = 0.5), -0.0076 (0.51), -3.57 (t = 1): positive exactly for t <= 1/2. TWO THINGS THIS EXPLAINS. First, why the index 1 has to be removed (R2-curv's D2): the mirror matrix of Lambda is the t-derivative at t = 0 of a family of non-negative matrices that starts at the rank-one e_1 e_1^T, and such a derivative is non-negative only on the complement of e_1 (a 'conditionally positive' generator). Second, does it see the size of the roots: only the upper half again (the representing measure of F^t at p lives on the convex hull of {0, roots}; bounded in the BCR sense iff all roots are <= 1 in modulus). What is new in it for your list: the largest t for which F^t is mirror positive WITH the identity is 1/(local degree) in both computed families; zeta is the extreme case t = 1.

## N3. Full answer to B79 (reconstruction with one wrong-sign square)

WHAT MY TOOLKIT GIVES, AND WHAT IT NEEDS FROM SP-operator. (a) On the test class where the board has proved the statement (atoms at log a, a >= 2 an integer) the reconstruction is defined and is completely explicit; nothing exotic happens. The mirror form of the full kernel is  [E_+]^2 - sum_{m>=1} [E_m]^2 - sum_p log p [e_p]^2,  E_+ = sum phi(a) a^(1/2), E_m = sum phi(a) a^(-(2m+1/2)), e_p = sum_k phi(p^k) p^(-k/2). Quotient by the null vectors and complete: a space with ONE positive square and infinitely many negative ones (a Pontryagin space with index 1 after an overall sign). The operators are the T_n (a -> na), symmetric for the indefinite form, commuting, and DIAGONAL in the basis above: T_n = n^(+1/2) on the positive vector; n^(-(2m+1/2)) on the m-th Gamma vector, m >= 1; on the p-th prime vector p^(-k/2) if n = p^k and 0 otherwise. PROVED (it is D1 + D3 + B25 read as a spectral decomposition). In exponents (chi(n) = n^(-s)): the positive square sits at s = -1/2, the negative ones at s = 2m + 1/2 >= 5/2 and, along each prime, at s = +1/2. The only eigenvalue of T_n larger than 1 is on the positive vector. A continuous translation semigroup does NOT act on this class (the comb is invariant under shifts by log n only): the 'generator of translations' of Osterwalder-Schrader is replaced by the commuting family log T_p, one per prime, and they are not functions of one operator, because T_p kills the q-vectors.
(b) For F_d: the pole part has the two squares at s = -(1/2 + d), -(1/2 - d), the primes two per p at +(1/2 - d), +(1/2 + d). As d -> 0 the two positive vectors become parallel (the Gram matrix of the two pole functionals degenerates): the positive index drops from 2 to 1, and continuing to imaginary d the pair becomes one positive and one negative square (kernel 2cos(tau u) e^(u/2)): the classical picture of two real eigenvalues of one sign type colliding and leaving the axis. So for F_d the change at d = 0 is the index, as you say. But your G_d (B81) shows the index is not the invariant: index 1 for all d. What changes at d = 0 in BOTH families, read on the operator: the spectrum of T_p on the negative part. zeta: non-zero spectrum of T_p on the prime vectors is exactly {p^(-1/2)} = the inverse of its eigenvalue p^(+1/2) on the positive vector. F_d and G_d: p^(-1/2 +- d). I have no statement that is not this one (it is S1-mirror's B81 in other words).
(c) THE TWO-SIDED BOUND. In my field the pair (shift form T, mirror form H) on a half space is a triple (E, E_+, theta): a Hilbert space E with a unitary involution theta, and H(phi) = <theta phi, phi>. KNOWN and trivial: if T >= 0 on the whole symmetric space, then |H| <= T on E_+ (Cauchy-Schwarz with theta unitary); conversely |H| <= T on E_+ is exactly positivity on E_+ + theta E_+. So B60's bound is the statement 'the big space exists as a Hilbert space'; reflection positivity is the extra statement H >= 0, which the Weil form does NOT have on L^2 (S1-mirror B54: H_W = sum over zeros of phihat(gamma)^2, signature (infinity, infinity)). Under RH the triple is E = l^2(zeros), theta = the swap gamma <-> -gamma, and for a measure with no Szego condition I expect E_+ = E (S1-mirror's 'deterministic process', B84): then there is no quotient, no semigroup of contractions, and the Osterwalder-Schrader construction returns E itself with the indefinite form <theta . , . >: a Krein space, not a Pontryagin space. WHAT IS MISSING, exactly: the reconstruction theorem I own goes from (positive mirror form + CONTRACTION semigroup) to (unitary group on a Hilbert space) by the minimal unitary dilation (Kallen-Lehmann; Sz.-Nagy; Neeb-Olafsson, Reflection Positivity, 2018, Cor. to Prop. 4.3.x: bounded positive definite on ([0,inf), id) => phi(|t|) reflection positive; read this session). Here one would need the same passage for a form with one positive square whose operator is EXPANDING there (n^(+1/2)), on a window, not on the whole group. A unitary dilation of an expanding symmetric operator cannot live in a Hilbert space; whether there is a dilation theory in a Pontryagin space with a window (Krein-Langer continuation) is SP-operator's question, and I put it to that seat below.


## N4. Proofs promised in N2 (3)

Setting. F(s) = prod_p prod_j (1 - alpha_j(p) p^-s)^(-m_j(p)), finitely many (alpha_j, m_j) per prime, alpha_j distinct
non-zero, D = sup_p sum_j m_j < infinity when all m_j > 0. a_t = Dirichlet coefficients of F^t (t > 0), multiplicative,
a_t(p^k) = coefficient of z^k in L_{p,t}(z) = prod_j (1 - alpha_j z)^(-t m_j). c = Lambda_F, c(p^k) = log p sum m_j alpha_j^k.
l = Lambda_F / log, l(p^k) = (1/k) sum m_j alpha_j^k (coefficients of log F).

**Lemma 1 (PROVED).** [a_t(nm)]_{n,m>=1} is the tensor product over primes of the Hankel matrices [a_t(p^(i+j))]_{i,j>=0}
(restricted to finitely supported multi-indices), because a_t is multiplicative: a_t(p^(kappa+kappa')) = prod_p a_t(p^(k_p+k'_p)).
Every finite section is a principal submatrix of a finite tensor product. Hence it is >= 0 iff each local Hankel matrix is >= 0
(each local matrix has (0,0) entry 1 > 0, so no factor can be <= 0 non-trivially).

**Lemma 2 (PROVED).** If all alpha_j are real, m_j > 0 and theta := t sum_j m_j <= 1, then a_t(p^k) = int x^k dmu(x) for a
positive measure mu on the convex hull of {0, alpha_j}. Proof. G(w) := w^-1 L(1/w) = w^(theta - 1) prod_j (w - alpha_j)^(-t m_j),
analytic in the upper half plane. For Im w > 0: arg G = -(1 - theta) arg w - sum_j t m_j arg(w - alpha_j), a combination with
non-negative weights summing to 1 of numbers in (-pi, 0). So Im G < 0 on the upper half plane, G(w) ~ 1/w at infinity, G real on
the real axis outside the hull: G is the Stieltjes transform int dmu(x)/(w - x) of a probability measure on the hull
(Nevanlinna representation; KNOWN, from memory: Akhiezer, The classical moment problem, Ch. 3). Expanding at infinity gives the
moments. For zeta (one root 1, m = 1): mu = (sin(pi t)/pi) x^(t-1) (1-x)^(-t) dx on [0,1] for 0 < t < 1 (Beta integral:
(t)_k/k! = B(k+t, 1-t)/(Gamma(t)Gamma(1-t))), mu = delta_1 at t = 1.

**Lemma 3 (PROVED for one root; COMPUTED for two).** zeta^t, t > 1: a_t(k) = (t)_k/k! ~ k^(t-1)/Gamma(t) is unbounded with
sub-exponential growth; a Hamburger moment sequence with |a(k)| <= C_eps (1+eps)^k for every eps has its measure in [-1,1],
hence is bounded: contradiction. So zeta^t is Helson positive exactly for 0 < t <= 1. COMPUTED (tests_b80_b83.log,
tests_lk_counter.log): F_d^t at p = 2 fails at t = 0.51 (-0.0076); the factor (1-z)/(1-2z)^2 fails at t = 0.6. The general
statement 'fails for every t > 1/D' is NOT proved.

**Lemma 4 (PROVED, assuming all m_j > 0).** If [a_t(nm)]_{n,m>=1} >= 0 for all sufficiently small t > 0, then all
alpha_j are real. Proof. a_t = delta_1 + t l + O(t^2) coefficientwise (exp of t log F). On vectors supported in n >= 2 the
delta_1 term (the matrix e_1 e_1^T) vanishes, so (1/t)[a_t(nm)]_{n,m>=2} -> [l(nm)]_{n,m>=2} entrywise; limits of positive
semidefinite finite sections are positive semidefinite. Its local block is [b(i+j)]_{i,j>=1}, b(k) = s(k)/k,
s(k) = sum m_j alpha_j^k. By Hamburger applied to the shifted sequence b(k+2) (growth C R^k, so the measure is unique and
supported in [-R, R]): b(k+2) = int x^k dnu(x), nu >= 0. Then int dnu(x)/(1 - xz) = -z^-2 sum_j m_j [log(1 - alpha_j z) +
alpha_j z] near z = 0. The left side is analytic off the real axis; the right side has a logarithmic branch point at each
1/alpha_j (distinct points, coefficients m_j != 0). So every alpha_j is real.  QED
For real roots nu = sum_j m_j |x| 1_[between 0 and alpha_j] dx.

**CORRECTION made while writing this down (found by me, before posting).** Without the hypothesis m_j > 0 the converse is
FALSE: the density of nu at x is |x| times the sum of the m_j over the roots beyond x, which can be >= 0 with some m_j < 0.
Example: roots 1 (m = -1) and 2 (m = +2) at one prime, i.e. local factor (1 - p^-s)/(1 - 2p^-s)^2. Then
G(w) = w^(t-1) (w-1)^t (w-2)^(-2t) has argument -(1-t) a_0 + t a_1 - 2t a_2 with 0 < a_0 <= a_1 <= a_2 < pi, which lies in
(-pi, 0) for t <= 1/2: F^t IS Helson positive for small t, while the mirror matrix of Lambda_F is not >= 0
(form -P(1)^2 + 2 P(2)^2). So the correct statement is:
   (a) roots real and m_j > 0  ==>  (b) F^t Helson positive (identity included) for 0 < t <= 1/D;
   (b) and all m_j > 0        ==>  roots real.
For Euler products with denominators only (m_j > 0, the usual L-functions) the two are equivalent. The mirror matrix of
Lambda_F on a,b >= 2 is the stronger test when numerator factors are present (it is what detected the dial at n = 4).

**Remark (why the index 1 must be dropped).** e_1 e_1^T + t [l(nm)] + O(t^2) >= 0 for small t requires [l(nm)] >= 0 only on
the orthogonal complement of e_1: the generator of a curve of positive semidefinite matrices issuing from a rank-one matrix is
'conditionally positive'. With l(1) undefined (log F has no constant term) this is the exact analogue of the infinite
self-energy sigma(X) = sum_p log p = c(1) in S1-mirror's Remark R1.

## N5. Facts read off Perfekt-Pushnitski for the project's two kernels (PROVED, one line each)
- [Lambda(ab)/sqrt(ab)]_{a,b>=2} is a BOUNDED operator on l^2: it is the orthogonal direct sum over p of (log p) v_p v_p^T with
  |v_p|^2 = sum_{k>=1} p^-k = 1/(p-1); norm = sup_p log p/(p-1) = log 2 = 0.6931; eigenvalues log p/(p-1) -> 0 (compact, not
  trace class).
- The Gamma mirror matrix [w(log ab)] = sum_{m>=0} u_m u_m^T, u_m(n) = n^-(2m+1/2): |u_0|^2 = sum 1/n = infinity, so the form
  is UNBOUNDED on l^2, and only because of m = 0; sum_{m>=1} u_m u_m^T is trace class (trace sum_{m>=1} (zeta(4m+1) - 1)).
  In Perfekt-Pushnitski's first theorem of Section 5 (measures nu on (1/2, infinity), alpha(n) = int n^-s dnu(s); bounded iff
  nu((1/2, s]) <= C (s - 1/2)) the m = 0 term is an atom AT the boundary point s = 1/2. It is the same square that cancels the
  e^(-x/2) half of the pole (S1-parity B25).
- Their Theorem 3.3 (ii): M(alpha) >= 0 and M(alpha(p .)) >= 0 for all primes p iff the measure sits on [0, infinity)^infinity.
  Positivity of a SHIFTED Helson matrix localises the support. The tests (i)-(iii) of N1 (3) are the same mechanism with the
  shift p^2 and the functions 1 - t_p^2, t_p^2 - 1.

## N6. The infrared bound: what exists and why it does not give the bound the project needs (posted in short as a claim)
See LIBRARY.md entries L17-L21 for the exact statements read. Summary of the argument:
1. One variable, KNOWN: f(x) = int_0^inf e^(-m|x|) drho(m) has fhat(k) = int 2m/(m^2+k^2) drho(m), so 0 <= fhat(k) <=
   (2 int m drho)/k^2. The UPPER bound needs the first moment of the Kallen-Lehmann measure (a sum rule: the jump of f' at 0).
   For the Gamma kernel w(u) = sum_m e^(-(2m+1/2)u): rho = sum_m delta_(2m+1/2), total mass and first moment infinite; the
   symbol grows like log|k| and there is no bound of this type.
2. Frohlich-Simon-Spencer (statement read in Biskup's notes, Thm 2.? 'Infrared bound'): on the torus, for a Gibbs measure
   with coupling J reflection positive for all bond reflections, chat(k) <= (nu/2 beta) / (1 - Jhat(k)), k != 0. Hypotheses:
   a MEASURE (a priori measure on spins x exp of the coupling); a TORUS; every coordinate hyperplane reflection is a SYMMETRY
   and the crossing part of -H is a sum of C_a theta(C_a). Conclusion: an upper bound on the CORRELATION by the inverse
   dispersion of the COUPLING, on the complement of the constants.
3. PROVED (same computation as Biskup's Lemma 4.? for Yukawa in d = 1): on the lattice Z^(P) = positive rationals with
   prime support in a finite set P, the prime coupling J(a, a p^k) = (log p) p^(-|k|/2) satisfies the reflection positivity
   criterion for every coordinate reflection v_p -> 1 - v_p: the crossing term is sum over p-free u of
   (log p) (sum_{i>=1} r^(i-1/2) S_(u,i)) (sum_{j>=0} r^(j+1/2) S_(u,-j)), r = p^(-1/2), which is sum_u C_u theta(C_u).
   So Gaussian domination and the infrared bound HOLD for every spin model on that lattice with that coupling (after
   periodising): correlation <= const / (Jhat(0) - Jhat(theta)), Jhat(theta) = sum_p log p (P_r(theta_p) - 1), P_r the
   Poisson kernel. On the line theta_p = t log p, Jhat = -2 Re zeta_P'/zeta_P(1/2 + it) (Euler factors over P).
4. WHY THIS IS NOT THE NEEDED BOUND. (i) Direction: it bounds a correlation by 1/(Jhat(0) - Jhat); Weil positivity is an upper
   bound on the form of the coupling itself, 'primes - arch <= pole'. The infrared bound's own inequality about the coupling,
   Jhat(theta) <= Jhat(0), is the trivial one (J >= 0), and Jhat(0) = sum_p log p * 2r/(1-r) diverges with P exactly like the
   pole. (ii) Symmetry: the Gamma kernel w(|log a - log b|) is not invariant under a coordinate reflection (S1-curv B27), so
   with the Gamma term the hypothesis fails; the only reflection that is a symmetry of everything, a -> 1/a, is a POINT
   reflection of Z^(P), and its 'half space' {a > 1} is cut by the irrational hyperplane sum v_p log p = 0; reflection
   positivity for it holds on the cone of integers and fails on rationals (S1-parity B24: -0.475 at 3/2, 4/3). (iii) Every
   hypothesis that is coordinatewise is Beurling-true: the multi-time object is determined by the numbers r_p, and whether
   r_p^-2 are the primes is invisible to it (barrier B10). (iv) Per-prime two-sided bounds from multi-time Kallen-Lehmann are
   (1-r)/(1+r) <= P_r <= (1+r)/(1-r) (S1-cubic's q_p); summed over p both sides diverge.
5. So: NO multi-time infrared bound exists in the literature I read that has the Weil inequality as its conclusion, and items
   (i)-(iii) say why a theorem with coordinatewise reflection hypotheses cannot have it. What a theorem of infrared type would
   need here, stated as hypotheses: a measure (not only a quadratic form) whose two-point function is the object to be bounded;
   a family of reflections that are symmetries of BOTH the prime and the Gamma part; and an input that knows the embedding
   n -> log n. I know no candidate for the measure.

## N7. A known bridge theorem of the type asked in B3, with the sign the Weil form does not have
KNOWN (Jorgensen-Neeb-Olafsson 2018, Thm 5.8; statement read in Neeb-Olafsson's book, Theorem 4.1.x 'Characterization of
reflection positive functions on [-a,a]'): let mu be a finite positive measure on R and phi(t) = int e^(-lambda|t|) dmu(lambda)
for |t| <= a (by Widder's theorem this is exactly: phi(|.|) with the kernel phi((s+t)/2) positive definite on (0,a); growing
exponentials allowed). (i) If the left derivative of the Laplace transform at a is <= 0, then phi((t-s)/2) is positive definite
on (-a,a) and phi extends to a positive definite function on R. (ii) Conversely if both kernels are positive definite and phi
is not constant, the Laplace transform is strictly decreasing somewhere in (0,a]. Proof by Polya's criterion (even, convex,
decreasing => positive definite).
This IS 'mirror positivity on a window + one more condition => shift positivity on the window'. The extra condition
(monotone at the window edge) is exactly what a real tilt e^(du) destroys, so the theorem is not tilt-invariant: it has the
shape B15 said a bridge must have. It does not apply to the Weil form because there the mirror-positive kernel K = w + primes
enters with a MINUS sign: off the diagonal the Weil kernel is pole - K. In the language of field theory the Weil form has the
structure of an inverse propagator (mass term minus a reflection-positive coupling), and the theorems of my toolkit give
positivity of propagators, not of inverse propagators.

## N8. Other answers posted this session (full texts in posts/)
- B129 (answer to S1-curv B101: two involutions; window theorem; two-exponential test): posts/p4_b101.txt, tests_b101.log.
- B130 (answer to S1-cubic B116: infrared-bound hypotheses; Perron with another cone; tilt): posts/p5_b116.txt.
- B137 (claim: which posted statements are known; what distinguishes a point of the cone): posts/p6_known.txt.
- B138 (questions to SP-operator: Suzuki's Hankel coefficients are mirror positive for d > 0; determinacy on the
  Toeplitz side): posts/p7_q_operator.txt, tests_suzuki_q.log.
- B139 (claim: the infrared question in one place): posts/p8_ir.txt.
- B146 (answer to SP-operator B134: Widder for distributions; what the primes are in the reconstruction; restriction to
  Z log p): posts/p9_b134_full.txt (long form), posts/p9_b134.txt (as posted).

## N9. Proof of the distribution form of Widder's theorem used in B146 (PROVED)
Let k be a distribution on (0, 2L) with <k(x+y), phi(x) phi(y)> >= 0 for all real phi in C_c^inf(0, L). Let psi in
C_c^inf(-eps, eps) be real, Psi = psi * psi. Then k_psi := k * Psi~ (Psi~(u) = Psi(-u)) is a smooth function on
(2 eps, 2L - 2 eps) and for phi supported in (eps, L - eps):
int int k_psi(x+y) phi(x) phi(y) = <k(x+y), (phi * psi~)(x) (phi * psi~)(y)> >= 0, since phi * psi~ is supported in (0, L).
By Widder k_psi(u) = int e^(-lambda u) dmu_psi(lambda): non-negative and convex. Take psi_n -> delta; k_(psi_n) -> k in
distributions on every compact subinterval. A sequence of convex functions on an interval converging in D' is bounded in
L^1_loc, hence locally uniformly bounded and equi-Lipschitz on smaller intervals, hence (a subsequence, then all of it)
converges locally uniformly to a convex continuous function, which represents k. The kernel k(x+y) is a pointwise limit of
positive definite kernels on (0, L), so it is positive definite as a function kernel, and Widder gives
k(u) = int e^(-lambda u) dmu(lambda), mu >= 0 on R; k is real-analytic.  QED
Corollary: a distribution with an atom, a jump or any non-analytic point in (0, 2L) is not mirror positive on C_c^inf(0, L).
(R2-curv's D4 is the explicit negative direction for an atom.)
