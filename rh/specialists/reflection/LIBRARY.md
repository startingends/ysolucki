# LIBRARY of seat SP-reflection (grows; first version 2026-11-11, session 1)

Each entry: exact statement with hypotheses, source, and READ STATUS. "Read" means the text was on my screen this
session (TeX source or OCR text), not a search snippet. Theorem numbers from TeX sources are given as the authors'
LABELS when the compiled number was not resolved. Statements marked "from memory" must be re-checked before use.

## Sources and how much of each was read (session 1)
| source | where | how much read |
|---|---|---|
| Perfekt, Pushnitski, "On Helson matrices: moment problems, non-negativity, boundedness, and finite rank", Proc. LMS 116 (2018), arXiv 1611.03772 | `rh/library/src/sp_reflection_1611.03772/` (TeX, 110k chars) | Sections 1-5 in full (lines 1-1320 of 2452). Sections 6-7 (finite rank) and the Appendix: statements of every theorem / lemma / proposition, proofs not read. Whole text searched for "Mangoldt", "Euler", "completely multiplicative", "semigroup": no hits. |
| Biskup, "Reflection positivity and phase transitions in lattice spin models", arXiv math-ph/0610025 | `rh/library/src/sp_reflection_math-ph_0610025/main.tex` (227k chars) | Section 2.2 (infrared bound: statement, equivalent form, discussion) and Sections 4.1-4.3 (definition of reflection positivity, Cauchy-Schwarz lemma, sufficient criterion, the three interactions, Gaussian domination with proof, proof of the infrared bound, statement of the chessboard estimate) in full: about 25% of the text. Chapters 1, 3, 5 and the rest of 2 and 4: section titles only. |
| Neeb, Olafsson, "Reflection Positivity: A Representation Theoretic Perspective", Springer Briefs 2018, arXiv 1802.09037 | `rh/library/src/sp_reflection_1802.09037/book.tex` (434k chars) | Section 2.1 (definition), Chapter 4 introduction and Section 4.1 in full, the classification corollary and the dilation definition of Section 4.3, the notes to Chapter 4: about 6% of the text. Table of contents read. Chapters on Lie groups, the circle, distribution vectors, free fields: not read. |
| Ressel, "Positive definite functions on Abelian semigroups", 4th Winter School on Abstract Analysis, Praha 1976, pp. 135-139 (dml.cz/dmlcz/701062) | `rh/library/src/sp_reflection_ressel1976/` (PDF + OCR text) | All 5 pages, in poor OCR (symbols partly lost; statements reconstructed from context). It is a survey of Berg-Christensen-Ressel, Math. Ann. 223 (1976). |
| Berg, Christensen, Ressel, "Harmonic Analysis on Semigroups", Springer GTM 100 (1984) | not available (paywalled) | NOT READ. Chapter 8 title confirmed by search: "Positive and negative definite functions on abelian semigroups without zero". All theorem numbers quoted from it are from memory. |
| Frohlich, Simon, Spencer, CMP 50 (1976) 79-95; Frohlich, Israel, Lieb, Simon, CMP 62 (1978) | not fetched | NOT READ. Known to me through Biskup's exposition and through citations in Neeb-Olafsson. |
| Jorgensen, Olafsson, "Unitary representations of Lie groups with reflection symmetry", JFA 158 (1998), arXiv funct-an/9707001; and arXiv math/9908031 | not fetched | Search summary only: reflection positivity pairs complementary series with highest weight representations. |

Web searches run (2026-11-11): (1) BCR Theorem 4.2.8 exponentially bounded ... (found the Chapter 8 title and Ressel's
survey, not the theorem); (2) Frohlich Simon Spencer ... Kallen-Lehmann ... canonical commutation relations (bibliographic
data only); (3) Hermite Jacobi theorem Hankel form power sums signature (classical statement confirmed in summaries of
arXiv 2510.23897, 1512.09258, 2205.04211); (4) Jorgensen Olafsson ... complementary series reflection positivity.

---

## A. Positive definite functions on semigroups (Hankel side)

**L1. Hamburger and Stieltjes (one variable).** Let beta = (beta(k))_{k>=0} be complex numbers.
(i) H_1(beta) = [beta(j+k)]_{j,k>=0} is non-negative (as a quadratic form on finite sequences) iff there is a measure
mu >= 0 on R with t^k in L^1(mu) for all k and beta(k) = int t^k dmu(t).
(ii) H_1(beta) >= 0 and H_1(beta(1 + .)) >= 0 iff such a mu exists supported on [0, inf).
Uniqueness is not asserted in general ("unique if the moment sequence does not grow extremely fast").
Source: Perfekt-Pushnitski, first theorem of Section 3 (label thm:hankmoment), as a classical result. READ.

**L2. Hamburger in d variables under a growth condition.** Let beta on N_0^d satisfy
|beta(kappa)| <= C^(|kappa|) kappa_1^kappa_1 ... kappa_d^kappa_d. (i) H_d(beta) >= 0 iff beta(kappa) = int_{R^d} t^kappa dmu
for a positive measure mu; then mu is unique. (ii) H_d(beta(kappa + .)) >= 0 for all kappa iff mu is supported on [0,inf)^d.
WITHOUT a growth condition (i) is false for d >= 2: there are non-negative Hankel forms that are not moment sequences
(they cite BCR Section 6.3). Source: Perfekt-Pushnitski, second theorem of Section 3.1 and the paragraph before it. READ.

**L3. Helson matrices (the multiplicative semigroup).** Let alpha(n) = O(n^a) for some finite a > 0. Then
(i) M(alpha) = [alpha(nm)]_{n,m>=1} >= 0 iff there is a measure mu >= 0 on R^infinity (product Borel sigma-algebra) with
t^kappa in L^1(mu) for all finitely supported kappa and alpha(n) = int t^kappa dmu(t), n = p^kappa. mu is unique.
(ii) M(alpha) >= 0 and M(alpha(p .)) >= 0 for all primes p iff mu is supported on [0, inf)^infinity.
Corollary noted there: then M(alpha(l .)) >= 0 for all integers l >= 1.
Source: Perfekt-Pushnitski Thm 3.3 (label thm:moment), attributed to Berezansky 1968, BCR, Samoilenko 1991; proof sketched
(GNS space of polynomials, commuting symmetric operators A_j = multiplication by t_j, essential self-adjointness from
one-dimensional determinacy via Devinatz, joint spectral theorem, Kolmogorov extension for uniqueness). READ.
Use here: S1-mirror's Theorem 1 is this theorem. The index 1 is INCLUDED; the project's matrix on a, b >= 2 is not covered.

**L4. Bounded positive definite functions on an abelian semigroup with neutral element (identity involution).**
(S, +) abelian semigroup with neutral element 0. f: S -> R is positive definite if it is bounded and
sum c_i c_j f(s_i + s_j) >= 0 for all finite families. A semicharacter is rho: S -> [-1,1] with rho(0) = 1,
rho(s + t) = rho(s) rho(t); the set S^ of semicharacters is a compact semigroup under pointwise convergence.
Lemma: sup |f| = f(0). Theorem: P_1 = {f positive definite, f(0) = 1} is a Choquet simplex (compact, convex) whose
extreme points are exactly the semicharacters; hence every positive definite f is f(s) = int_{S^} rho(s) dmu(rho) for a
UNIQUE Radon measure mu >= 0. Example: S = N_0, S^ = [-1,1] (rho(n) = x^n).
Source: Ressel 1976 survey of Berg-Christensen-Ressel, Math. Ann. 223 (1976). READ (OCR).
Use here: "extreme rays of the mirror cone = single real semicharacters"; "bounded <=> |chi(p)| <= 1".

**L5. Exponentially bounded positive definite functions.** (from memory; BCR book Ch. 4, Theorem 4.2.8 and nearby.)
An absolute value on S is alpha: S -> [0,inf) with alpha(0) = 1, alpha(s+t) <= alpha(s) alpha(t). A positive definite phi
(no boundedness assumed) with |phi(s)| <= C alpha(s) has a unique representing Radon measure concentrated on the compact
set of semicharacters with |rho| <= alpha. A positive definite function that is exponentially bounded (bounded by some
absolute value) has a unique representing measure with compact support. NOT READ. The step used in S1-mirror's
Theorem 2 (||T_m|| <= alpha(m) by iterating Cauchy-Schwarz) is the standard proof, also from memory.

**L6. Negative definite functions and Levy-Khinchin on a semigroup.** psi: S -> [0, inf) is negative definite if
[psi(s_i) + psi(s_j) - psi(s_i + s_j)] is positive semidefinite for all finite families. Equivalent: e^(-t psi) is
positive definite for every t > 0 (Schoenberg type); equivalent: sum c_i = 0 implies sum c_i c_j psi(s_i + s_j) <= 0.
Theorem: every such psi is psi(s) = c + h(s) + int_{S^ \ {1}} (1 - rho(s)) dmu(rho) with uniquely determined c >= 0
(c = psi(0)), h additive (h(s) = lim psi(ns)/n), mu a non-negative Radon measure on S^ \ {1}.
Source: Ressel 1976 survey. READ (OCR). Use here: this is about POINTWISE powers; convolution powers F^t are a
different structure (my own statement P2 below).

**L7. Semigroups without neutral element.** BCR book, Chapter 8, "Positive and negative definite functions on abelian
semigroups without zero". NOT READ; only the title is confirmed. TO READ: whether S1-mirror's Theorem 2 (sigma-finite
measure plus a positive semidefinite term at products of two generators) is there. Also to look for: Bisgaard, Sasvari.

**L8. Widder's theorem (mirror positivity on an interval).** Let -inf <= a < b <= inf. phi: (a,b) -> R has the kernel
phi((x+y)/2), x, y in (a,b), positive definite iff phi(t) = int_R e^(-lambda t) dmu(lambda) on (a,b) for a positive Borel
measure mu on R (growing exponentials allowed). In particular phi is analytic.
Source: Neeb-Olafsson Thm (label thm:widder), citing Widder 1934, 1946. READ (statement).

**L9. Hausdorff-Bernstein-Widder.** For phi: (0,inf) -> [0,inf) equivalent: (i) phi completely monotone
((-1)^k phi^(k) >= 0); (ii) phi is the Laplace transform of a positive Borel measure on [0,inf); (iii) phi is decreasing
and positive definite on the *-semigroup ((0,inf), id).
Source: Neeb-Olafsson Thm (label thm:bern1). READ (statement).
Use here: Theorem D3 (Gamma kernel); "decreasing" = "bounded" is the condition a real tilt destroys.

**L10. Finite rank (Kronecker) and bounded non-negative (Widom, Carleson) forms.** (a) Kronecker: a one-variable Hankel
form has finite rank iff it is a finite sum of derivatives of point evaluations, sum_j sum_k c_j(k) d^k(fg)(lambda_j);
it is bounded on l^2 iff all |lambda_j| < 1 (PP, label thm.kronecker). A finite rank Helson form is non-negative iff
[f,g] = sum_l c_l f(lambda_l) g(lambda_l) with finitely many lambda_l in R^infinity, c_l > 0 (PP, last corollary of Section 6).
(b) Widom: for mu finite positive on (-1,1), beta(k) = int t^k dmu: H_1(beta) bounded on l^2 <=> mu Carleson for H^2(T)
<=> mu(-1,-1+eps) + mu(1-eps,1) = O(eps) <=> beta(n) = O(1/n) (PP, label thm.e1; second theorem of Section 4.2). (c) If M(alpha) >= 0 is bounded on l^2 then
alpha(n) -> 0 and mu is concentrated on (-1,1)^infinity; bounded <=> mu is a Carleson measure for H^2(T^infinity)
(PP, label thm:carleson). (d) Bohr lift: for nu finite positive on (1/2, inf), alpha(n) = int n^(-s) dnu(s): M(alpha) bounded <=>
nu((1/2, s]) <= C (s - 1/2) <=> alpha(n) <= C/(sqrt(n) log n) (PP, first theorem of Section 5). Multiplicative Hilbert matrix
[1/(sqrt(nm) log(nm))]_{n,m>=2}: bounded, spectrum [0, pi], purely absolutely continuous (PP, second theorem of Section 5, citing Brevig et al.).
Source: Perfekt-Pushnitski. READ (statements; proofs of (b)-(d) read, of (a) not).

**L11. Schur product theorem.** The entrywise product of two positive semidefinite matrices is positive semidefinite;
hence the pointwise product of two positive definite functions (same involution) is positive definite. From memory
(BCR Ch. 3). Use here: twist invariance of the mirror cone; invariance of window positivity under multiplication by any
Bochner-positive function g(u) (e.g. 2cos(tau u)).

## B. Positive definite functions on groups (Toeplitz side) and root counting

**L12. Herglotz / Caratheodory-Toeplitz.** A sequence (s(k))_{k in Z} with s(-k) = conj s(k) has all Toeplitz matrices
[s(i-j)]_{i,j=0..n} >= 0 iff s(k) = int_T e^(ik theta) dmu(theta) for a unique positive measure mu on the circle. From
memory (statement); the consequences used on the board are PROVED in NOTES N1: for power sums s(k) = sum m_j alpha_j^k with
m_j > 0, the reflected sequence s(|k|) is positive definite on Z iff all |alpha_j| <= 1.

**L13. Bochner (locally compact abelian groups).** A continuous function on an LCA group is positive definite iff it is
the Fourier transform of a bounded positive Borel measure on the dual group. Source: Neeb-Olafsson Thm (label
thm:bochner), statement for R quoted in their Section 4.1. READ (statement for R).

**L14. Hermite-Jacobi.** For a real polynomial with roots alpha_1..alpha_n (with multiplicity) and power sums
p_k = sum alpha_i^k, the Hankel matrix [p_(i+j)]_{i,j=0..n-1} has rank = number of distinct complex roots and
signature = number of distinct real roots. Source: search summaries (arXiv 2510.23897 calls it classical; arXiv
2601.14491 dates it to Hermite 1856). NOT READ in a primary source. Krein-Naimark's survey (Linear and Multilinear
Algebra 10 (1981) 265-308) not read. Use here: S1-mirror's Corollary 3 is this theorem with weights m_j.

**L15. Polya's criterion.** A real even continuous function on R that is convex and decreasing on (0,inf) with limit
>= 0 is positive definite. From memory (cited as Lukacs Thm 4.3.1 in Neeb-Olafsson). Used in L18.

## C. Reflection positivity

**L16. Reflection positive Hilbert space; the Osterwalder-Schrader quotient.** E a real or complex Hilbert space,
theta a unitary involution, E_+ a closed subspace with <eta, theta eta> >= 0 for eta in E_+. Then
N = {eta in E_+ : <eta, theta eta> = 0} = {eta : <zeta, theta eta> = 0 for all zeta in E_+}, and E^ := completion of
E_+/N in the norm sqrt(<eta, theta eta>). Source: Neeb-Olafsson Def. 2.1.1 (label def:x.1). READ.
Consequence (trivial, PROVED): |<eta, theta eta>| <= <eta, eta>: the mirror form is dominated by the big form.

**L17. Reflection positive functions on the line = Kallen-Lehmann.** A continuous phi: R -> C is reflection positive
for (R, R_+, -id) (both phi(t - s) on R and phi(t + s) on R_+ positive definite) iff
phi(x) = int_[0,inf) e^(-lambda|x|) dnu(lambda), nu a finite positive Borel measure on [0,inf).
Companion: if phi: [0,inf) -> B(F) is bounded, strongly continuous and positive definite on ([0,inf), id), then
psi(t) = phi(|t|) is reflection positive; for a semigroup C_t of hermitian contractions, psi(t) = C_|t| gives the
MINIMAL UNITARY DILATION. Version on Z: Frohlich-Israel-Lieb-Simon 1978, Prop. 3.2 (cited, not read).
Source: Neeb-Olafsson, Section 4.3, labels cor:2.1, cor:repo-ext and the definition following. READ (statements).
Consequence (PROVED, one line): fhat(k) = int 2 lambda/(lambda^2 + k^2) dnu, so 0 <= fhat(k) <= 2 (int lambda dnu)/k^2:
the upper bound needs the first moment of nu (a sum rule).

**L18. Reflection positive functions on a window (Jorgensen-Neeb-Olafsson).** Fix a > 0. Let mu be a finite positive
Borel measure on R for which phi(t) := int e^(-lambda|t|) dmu(lambda) exists for |t| <= a.
(i) If the left derivative of the Laplace transform L(mu) at a is <= 0, then phi is reflection positive on [-a,a]
(both kernels phi((t-s)/2) on (-a,a) and phi((t+s)/2) on (0,a) positive definite) and extends to a symmetric positive
definite function on R. (ii) If phi is reflection positive on [-a,a] and non-constant, there is b in (0,a] with
L(mu)'(b-) < 0. Remark there: the extension need not coincide with phi beyond b. Example: e^(-lambda|t|) +
e^(-beta lambda) e^(lambda|t|) is reflection positive on (-beta, beta) (periodic case), so growing exponentials occur.
Source: Neeb-Olafsson Thm (label thm:5.9), citing Jorgensen-Neeb-Olafsson 2018, Thm 5.8; proof "uses Polya". READ
(statement, examples, remarks; not the proof).
Use here: a bridge "mirror positive + monotone at the window edge => shift positive on the window". Not tilt
invariant. Does not apply to the Weil kernel (sign).

**L19. Reflection positivity for lattice measures; the sufficient criterion.** Torus T_L = (Z/L)^d, L even; a plane P
orthogonal to a lattice direction, through sites or bisecting bonds, splits it into halves T_L^+-; A^+- = functions of
the spins in T_L^+-; theta the reflection. A measure mu is reflection positive w.r.t. theta if
(1) E(f theta g) = E(g theta f) and (2) E(f theta f) >= 0 for all f, g in A^+.
Lemma: product measures are reflection positive for all reflections. Lemma: for mu reflection positive and
A, B, C_a, D_a in A^+: [E e^(A + theta B + sum C_a theta D_a)]^2 <= [E e^(A + theta A + sum C_a theta C_a)]
[E e^(B + theta B + sum D_a theta D_a)]. Corollary (criterion): if -H_L = A + theta A + sum_a C_a theta C_a with
A, C_a in A^+, the torus Gibbs measure is reflection positive for every beta >= 0. The nearest-neighbour ferromagnet,
Yukawa potentials C e^(-mu|x-y|_1) and power laws |x-y|_1^(-s) satisfy the criterion for every plane.
Source: Biskup Section 4.1 (labels def-RP, lemma-product-RP, lemma-CEsimple, lemma-RP-suff, lemma-RPint). READ with proofs.

**L20. Gaussian domination and the infrared bound (Frohlich-Simon-Spencer).** Setting of L19, spins in R^nu with any
a priori measure mu_0, J one of the three interactions, normalised so that the walk kernel has row sums 1.
Z_L(h) := E_{product mu_0} exp(-beta sum_{x,y} J_xy |S_x - S_y + h_x - h_y|^2). Then Z_L(h) <= Z_L(0) for all h.
Infrared bound: with c(x) = E_{mu_{L,beta}}(S_0 . S_x) and chat(k) = sum_x c(x) e^(ik.x):
chat(k) <= (nu / 2 beta) / (1 - Jhat(k)) for k in the reciprocal torus, k != 0. Equivalently for sum_x v_x = 0:
sum v_x conj(v_y) E(S_x . S_y) <= (nu/2beta) sum v_x conj(v_y) G_L(x,y), G_L the Green function of 1 - J on the
complement of constants. Proof: Z(h)^2 <= Z(h_+) Z(h_-) for each mirror; a maximiser with fewest non-constant bonds must
be constant; expand to second order in h.
Source: Biskup, Thm "Infrared bound" (label thm-IRB) in Section 2.2 and Thm "Gaussian domination" in Section 4.2. READ
with proofs. The 1976 paper itself: NOT READ.

**L21. Chessboard estimate.** B < L, B | L, L/B even; block Lambda_B = {0..B}^d; mu reflection positive for all
reflections between neighbouring blocks (planes through sites). For B-block functions f_1..f_m and distinct
t_1..t_m in T_{L/B}: E(prod_j theta_{t_j} f_j) <= prod_j [E(prod_{t in T_{L/B}} theta_t f_j)]^((B/L)^d).
Source: Biskup Thm (label thm-CE), Section 4.3. READ (statement; proof not read).

**L22. Regular unitary dilation of commuting contractions.** (from memory; Sz.-Nagy-Foias, Harmonic Analysis of
Operators on Hilbert Space, Ch. I; Brehmer 1961.) Commuting contractions T_1..T_n satisfying Brehmer's positivity
condition (in particular doubly commuting ones, in particular commuting self-adjoint contractions) have a regular
unitary dilation: n -> prod T_i^(n_i^-)* prod T_i^(n_i^+) is positive definite on Z^n. NOT READ.
Use here: S1-mirror's "multi-time Kallen-Lehmann" (B17).

**L23. Reflection positivity and complementary series.** (search summary only.) Jorgensen-Olafsson (1998, 2000):
the Osterwalder-Schrader construction takes complementary series representations to highest weight representations
(G/K a tube domain). NOT READ. Why it is listed: at one prime, "mirror positive" (real Satake-type roots off the unit
circle) versus "Ramanujan" (unimodular roots) is the dichotomy complementary / tempered; whether that is more than a
parallel is a question for SP-modular.

## D. Statements proved in this seat (with where the proof is)
- **P1** (NOTES N1 / board B117): for m_j > 0, [s(|i-j|)] >= 0 for all n iff all |alpha_j| <= 1; localisation tests
  (i)-(iii) for a mirror-positive c with compactly supported measure; 2x2 minor = |a_p| <= degree.
- **P2** (NOTES N4 / board B120): F^t Helson positive for 0 < t <= 1/D when roots are real with m_j > 0; converse under
  m_j > 0; counterexample (1-z)/(1-2z)^2; zeta^t exactly for t <= 1.
- **P3** (NOTES N5): [Lambda(ab)/sqrt(ab)]_{a,b>=2} bounded with norm log 2; Gamma mirror matrix unbounded only through
  m = 0; trace class beyond.
- **P4** (NOTES N6.3 / board B130): the prime coupling on the lattice of rationals satisfies Biskup's criterion (L19) for
  every coordinate mirror.
- **P5** (board B138, tests_suzuki_q.log): coefficients of zeta(s-d)/zeta(s+d) are the moments of a product probability
  measure for d > 0; Helson matrix non-negative iff d >= 0; rank = number of squarefree integers.
- **P6** (board B121): the mirror space of the full kernel on the integer comb: one positive square, T_n diagonal with
  spectrum n^(1/2), n^(-(2m+1/2)) (m >= 1), p^(-k/2).

## E. Entries whose source still has to be read
L5 (BCR Thm 4.2.8 and the alpha-bounded statement), L7 (BCR Ch. 8), L11, L12 (a primary source), L14 (Krein-Naimark),
L15, L20 (the 1976 paper: does its introduction derive the field-theory bound from Kallen-Lehmann + commutation
relations, as I remember?), L22, L23. Not yet in the library and wanted: Berg-Maserick on exponentially bounded
positive definite functions; the determinacy theory of moment problems (Carleman, Krein density); Glimm-Jaffe Ch. 6
(Kallen-Lehmann, Thm 6.2.4 as cited by Neeb-Olafsson).
