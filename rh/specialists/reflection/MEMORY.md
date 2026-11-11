# MEMORY of SP-reflection

Rewritten at the end of session 2 (2026-11-11). Read this first, then CHARTER.md, then LIBRARY.md (section E lists the
sources still to read). Session 1 = seminar S1 (closed; summary rh/experiments/s1_seminar/socrates/CLOSING.md; my full
answers in NOTES_session1.md). Session 2 = the structural task on one object, written up in OBJECT_PHI.md.

## 0. SESSION 2: the object Phi(s) = E*(omega, s) (owner rule 13; rh/HUNCHES.md part F)
Task: express Phi and "Phi = 0 only on Re s = 1/2" in my toolkit, without reading the other specialists first. Done:
rh/specialists/reflection/OBJECT_PHI.md (173 lines). I have NOT yet read SP-modular's and SP-operator's answers.
What I established (labels as in the file):
- PROVED: Phi(s) = 3 Lambda_K(s), K = Q(sqrt-3); Phi is a function Psi of lambda = s(1-s).
- KNOWN (from memory) + reading: the spherical unitary dual of PSL_2(R) is {lambda real >= 0}; RH+ (zeros on the line or
  real) <=> phi_rho positive definite at every zero <=> zeros of Psi(lambda) real. The complementary series = Siegel zeros.
- KNOWN + COMPUTED: the Gamma-orbit of omega is a positive definite measure on K\G/K (matrix coefficient of L^2(Gamma\G) at
  delta_omega); orbit counts = eps(m) r(m) r(m+3) (shifted convolution of the norm form; exact check m <= 40); its
  Bochner-Godement measure mu_omega has continuous density (1/4pi)|Phi(1/2+it)|^2/|xi*(1+2it)|^2, atoms |u_j(omega)|^2 and
  3/pi at lambda = 0. This positivity is FREE and sees only |Phi|^2 on the line.
- Ideal semigroup of Z[omega]: three involutions (identity, inverse, Galois conjugation with a a* = N a). Trivially true:
  zeta_K has degree one over K (rank-one mirror squares, roots 1; pushed to norms: roots (1,1), (1,-1), (1)); cubic residue
  characters are positive for the inverse involution (and Galois for rational u), not for the identity; |g|^2 = N is
  Plancherel on O/c; normalised Gauss sums are a character of a central extension by mu_3. I found NO positive-definiteness
  on the semigroup equivalent to RH: there the equivalents are CYCLICITY statements (Nyman-Beurling / Baez-Duarte). The
  continuous part of mu_omega is, up to the outer weight 1/|zeta(1+2it)|^2, the Nyman-Beurling measure of zeta_K; n^-it is the
  one-sided dilation y -> ny, not a Hecke operator.
- Wall B3: PROVED: RH+ <=> Theta_Phi(t) = sum e^(-t rho(1-rho)) completely monotone (a Grommer-type reformulation). Candidate
  representation L^2(Gamma\H) with delta_omega; missing exactly: (a) the vector is not in the space (twice), (b) zeros are
  zeros of a DENSITY, not atoms, (c) a SIGN: Phi(1/2+it) is real, the free object knows Phi^2, RH <=> E(omega, .) is the
  minimum-phase (outer) square root. Trivialising object = a causal (Lax-Phillips outgoing) structure + cyclicity, not a
  positivity. Reversal against session 1: the zero measure fails the Szego condition; mu_omega satisfies it.
- RISK (idea SP-reflection/#5): A(z) := (1/2pi) int log|E(z,1/2+it)| dt/(1/4+t^2) = log(3/pi) - (1/2) log ht(z) + Dfc(z),
  Dfc(z) = sum over zeros with Re > 1/2 of log|rho/(1-rho)| >= 0: a defect function on the modular surface, zero exactly at
  RH points. Constant checked exactly at omega (special values) and crudely numerically (A(i) = -0.04609 vs -0.04612).
  At one point it is Balazard-Saias-Yor; new only as a family in z. Two searches: not found; Lagarias-Suzuki
  arXiv math/0412039 found and NOT READ (must be read first next session).
HOLDING from session 2: (1) read Lagarias-Suzuki math/0412039; (2) compare with SP-modular (is A(z) a known automorphic
function, a companion of Kronecker's limit formula?) and SP-operator (does delta_omega lie in the Lax-Phillips outgoing
subspace after a shift by log ht?); (3) regularity of A and a formula for its Laplacian in z; (4) Dfc at a class number 2
CM point, with a blind prediction first; (5) the instance "r(m) r(m+3) has spectral density |zeta_K|^2/|zeta(1+2it)|^2" was
not searched; (6) Waldspurger's local statement (1.6) and the spherical dual (1.1) are from memory: read a source.
Reliability note: the first numerical run at omega was 50 percent off at N = 500 and oscillates (0.0395, 0.0287, 0.0252
against 0.0258); the rule is crude; the exact check is the special-value one.

## 1. What the project is doing, seen through my toolkit
- Idea #21 (mirror positivity of the prime kernel on the integers as a bridge to Weil positivity) is KILLED: the hypotheses
  are invariant under real tilts n -> n^d, the conclusion is not (control F_d = zeta(s-d)zeta(s+d), barrier B11). A second
  control G_d = zeta(s) L(s-d,chi_4) L(s+d,chi_4) (Socrates B72, S1-mirror B81, S1-parity B118) keeps one pole and fails
  only the root size; it fails the window inequality from L = 0.845 (d = 0.1).
- The seminar's working identities: Q(phi +- mirror) = 2[T_W +- H_W] (B60: positivity on [-L,L] <=> |H_W| <= T_W on
  (0,L]); H_W = E_+^2 - sum_{m>=1} E_m^2 - H_primes = sum over zeros of phihat(gamma)^2 (B25, B54); Q_{F_d} = 2Q(e^{dx}f,
  e^{-dx}f) = 2cosh(d ad_X) Q (B90, B99, B133); lambda_min(d) = lambda(0) - c(L) d^2, analytic in t = d^2, mirror side
  t >= 0, Ramanujan side t <= 0.
- In my words: the mirror form is positivity for the IDENTITY involution of a semigroup (dual: real semicharacters), the
  Weil form is positivity for the INVERSE involution of a group (dual: unitary characters). The same object diagonalises
  with real exponents on the integer comb (one square of one sign = the pole, T_n = n^(1/2); Gamma at n^-(2m+1/2), m >= 1;
  one point per prime, chi_p idempotent) and with imaginary exponents on L^2 (zeros; signature (inf, inf)). Widder's theorem
  forbids mirror positivity of anything with atoms on a test class containing L^2: that is why the two test classes are
  disjoint. Structurally the Weil form is an INVERSE propagator (pole - reflection-positive coupling); my bridge theorems
  (Kallen-Lehmann, Jorgensen-Neeb-Olafsson on a window, infrared bound) all give positivity or upper bounds for
  PROPAGATORS / correlations.

## 2. What I was asked and what I answered (board numbers)
| asked | by | my answer | content |
|---|---|---|---|
| B74 | S1-socrates | B117 | "roots of modulus 1" = positive definiteness for the other involution (Herglotz on Z); tests: reflected Toeplitz [s(\|i-j\|)] >= 0 <=> \|alpha\| <= 1; for mirror-positive c: shifted Hankel tests; c(p^(k+2)) = c(p^k) <=> roots +-1. Smallest test at p=2 for F_d: 2x2 det = -4 sinh^2(d log 2) = -0.019249 (d=0.1). G_d at p=3 needs 3x3 (-0.0485); at p=2 nothing sees G_d. |
| B83 | S1-mirror | B120 | (1) boundedness = upper half, yes; lower half HAS an intrinsic test (reversed shifted Hankel); T_p^3 = T_p; for zeta T_p is a rank-one projection (idempotent semicharacter). (2) BCR Ch. 8 covers semigroups without neutral element: NOT READ; his Theorem 2 checked by reading, no gap found. (3) Levy-Khinchin: for convolution powers, real roots & m_j>0 => F^t Helson positive (identity included) for t <= 1/D; converse needs m_j > 0 (counterexample (1-z)/(1-2z)^2); zeta^t exactly t <= 1. |
| B79 | S1-socrates | B121 | reconstruction on the comb: index-1 space, T_n diagonal, explicit spectrum; on L^2 a Krein space; what is missing = a dilation theory for an EXPANDING symmetric operator in a Pontryagin space on a window (SP-operator's). |
| B101 | S1-curv | B129 | class positive for both involutions = reflection positive functions = int_[0,inf) e^(-lambda\|x\|) dnu; a tilt translates Widder's measure; window theorem of Jorgensen-Neeb-Olafsson (mirror positive + decreasing at the edge => shift positive); does not apply to zeta (sign). Two-exponential test: C* = 1.028 at (a,b,c,L) = (.5,2.5,1,1), governed by the growing exponent a. |
| B116 | S1-cubic | B130 | exact hypotheses of the infrared bound (Biskup); line: no version (D4, B54); lattice of rationals: prime coupling satisfies the hypothesis, Gamma does not; conclusion is about a Gibbs state; hypotheses sit on the MIRROR side (tilt invariant). No Perron theorem for T - H in my toolkit. |
| B158 | S1-socrates (to all) | B161 | no window candidate; statements (D), (E) in the requested form; question on candidate (A). |
| B134 | SP-operator | B146 | Widder holds for distribution kernels (proof in NOTES N9) => no atom is mirror positive on L^2; primes = joint eigenvectors of the multiplicative family, off the Bohr curve; local Toeplitz positivity is independent of Bochner positivity on R (infinite atom at the identity; with Weil weights the local statement is the trivial bound \|alpha\| <= sqrt p). |
Unprompted: B137 (which posted statements are KNOWN + what distinguishes a point of the cone: not extreme ray, not
determinacy, yes boundedness, and with Weil weights only as a MIDPOINT), B139 (infrared question in one place),
B138 (two questions to SP-operator).

## 3. What I am holding (open, in order of weight)
1. **B138 was ANSWERED by SP-operator in B150.** (1) Suzuki's K_d[t] acts on L^2(-inf, t) and is NOT >= 0 for any d > 0
   (two bumps at a < 0 < b; equivalently my Widder obstruction: K_d is not analytic at 0). So my Helson positivity of
   [q_d(nm)] (product probability measure, independent X_p in {0, p^d}, P = 1 - p^(-2d); >= 0 iff d >= 0; rank = number of
   squarefree integers) lives on atoms at log-integers only: the same comb-versus-L^2 wall as idea 21. What Suzuki has
   instead: K[t] is the compression of a unitary involution (multiplication by the inner function Theta_d composed with
   z -> -z) and ||K[t]|| < 1. The product structure does not appear in his proof; there is no prime-by-prime Wiener-Hopf
   factorisation (local factors are not unimodular on the line). SP-operator does not know which of det(1 +- K) vanishes
   first. (2) Krein continuation from a window: INFINITELY MANY continuations for every window with Q_a > 0 (deficiency
   indices (1,1)); the pinning intervals are Weyl-disc quantities (1/(top eigenvalue of a pencil in Q_a^-1)); and
   'zero margin' <=> 'Szego condition fails' <=> 'determinate in the limit' <=> 'deterministic process': forced by the
   zeros being DISCRETE, nothing arithmetic; only the rate exp(-4 pi e^(2L)) carries more (circle case KNOWN from memory,
   line case to be read by SP-operator: Krein, Denisov's survey).
   STILL MINE TO DO next session: read Suzuki 1606.05726 sections 2-4 myself (rh/library/src/1606.05726) so that idea
   SP-reflection/#3 is either closed or given a test class between the comb and L^2.
2. **B161 (my answer to Socrates's B158, 'name the one statement'):** I said I have no window candidate; laid out (D)
   zeta^t Helson positive iff t <= 1 (a test of local degree, rejects zeta L(chi_4) at t = 1) and (E) the ratio-dial
   product measure (dies at the comb/L^2 wall); and asked S1-parity and the lead whether candidate (A) (odd block on the
   no-prime window has a nodeless ground state / is a Perron operator) holds verbatim for ANY completely monotone kernel and
   any pole exponent (then it is the method of images and no control violates it). Watch for the answer.
3. **Question to all in B139 (4):** is any quantity on any seat's page a CORRELATION of a family like X_p (so that an
   infrared-type bound could apply)? No answer yet.
4. Unproved in my own statement P2: 'F^t fails to be Helson positive for EVERY t > 1/D' (computed for zeta, F_d and one
   numerator example only).
5. Not opened: the SP-modular x SP-reflection pairing ('mirror positivity holds exactly where Hecke operators exist';
   the parallel complementary series / tempered at one prime, LIBRARY L23).

## 4. Things to remember about my own reliability this session
- I first believed "(a) <=> (b)" in the Levy-Khinchin statement and found the counterexample only while writing the proof
  (numerator factors). Posted in corrected form. Lesson: write the proof before posting an equivalence.
- My first Toeplitz script used the two-sided matrix for root sets not closed under alpha -> 1/alpha (meaningless,
  non-symmetric); fixed before posting. tests_b74.py.txt now prints the reflected version always and the two-sided one only
  when legitimate.
- Posts are limited to 4000 characters; long forms are in posts/ and NOTES_session1.md.
- Theorem numbers from TeX sources are given by label; compiled numbers were not resolved.

## 5. Library entries whose source still has to be read (see LIBRARY.md section E)
BCR book: Thm 4.2.8 / alpha-bounded statement (L5) and Chapter 8 (L7, to settle S1-mirror's Theorem 2); a primary source
for Herglotz / Caratheodory-Toeplitz (L12) and Hermite-Jacobi (L14, Krein-Naimark); Polya (L15); the 1976
Frohlich-Simon-Spencer paper itself and FILS 1978 Prop. 3.2 (L17, L20: does the introduction derive the field-theory bound
from Kallen-Lehmann plus commutation relations?); Sz.-Nagy-Foias / Brehmer (L22); Jorgensen-Olafsson (L23).
Wanted and absent: moment-problem determinacy (Carleman, Krein), Berg-Maserick, Glimm-Jaffe Ch. 6.

## 6. Files of this seat
CHARTER.md (fixed) · LIBRARY.md (23 entries + 6 own statements) · NOTES_session1.md (N1-N9: full answers and proofs) ·
IDEAS_LOCAL.md (5 ideas: #1 two involutions, #2 F^t and the generator, #3 ratio dial / product measure, #4 inverse
propagator, #5 defect function on the modular surface) · OBJECT_PHI.md (session 2) · posts/ (texts as posted) · tests_*.py.txt with logs (all small, double precision or mpmath 50-80 digits,
one implementation each, run under tools/memcap.py 1). Sources downloaded to rh/library/src/sp_reflection_* (untrusted
text: Perfekt-Pushnitski, Biskup, Neeb-Olafsson, Ressel 1976).
