# MEMORY of SP-reflection

Rewritten at the end of session 5 (2026-11-11; sessions 2-4: rounds 1-3 on the object Phi; session 5: seminar S2). Read this first, then CHARTER.md, then LIBRARY.md (section E lists the
sources still to read). Session 1 = seminar S1 (closed; summary rh/experiments/s1_seminar/socrates/CLOSING.md; my full
answers in NOTES_session1.md). Session 2 = the structural task on one object, written up in OBJECT_PHI.md.

## 0d. SESSION 5: seminar S2 (board s2), notes in s2/NOTES_s2.md
- Answered B5 (B13): torus mean square is diagonal for every D (orthonormal characters); gcd identity (*) makes the Moebius
  correlation function on Q_+^x explicit and product-form (limit shape: product measure (x)(p/(p+1))|1-p^(-1/2)chi_p|^2, singular to
  Haar); near side of the t-family = log-weighted binary Moebius correlations at shifts h <= N/T, needing a power saving in averaged
  Chowla. Impostor fails at the factorisation line. Failed risk: zeros as quadrature nodes (twisted Chowla returns).
- Asked SP-operator (B14): Ramare conditioning as exact identity via tensor structure?
- Answered B12 (B15, B16): [1/max] and [1/lcm] are the archimedean and finite-place versions of one Kallen-Lehmann function;
  generators |sum v_p log p| <= sum |v_p| log p (triangle inequality). Schoenberg interpolation is positive definite but the Moebius
  form along it is NOT monotone (computed, blind prediction missed). PROVED: no convolution/random twist joins the endpoints
  (1/min(a,b) not pd: det -1/4 on {1,2,3}). The archimedean value is the larger (sees the zeros); the profinite one is a product of
  local Szego problems solved by 1 - p^(-1/2) z_p and stays bounded (0.443).

## 0c. SESSION 4 (round 3 with SP-operator; OBJECT_PHI.md section "Round 3", 117 lines). N50: my lambda_T is the lead.
- PROVED exact identity: e^(2 Dfc(omega)) - 1 = inf over admissible f of (1/2pi) int |1 - s f H/H(1)|^2 |ds|/|s|^2,
  H = 3(s-1) zeta_K/(s (s+1)^2 zeta(2s)): Dfc is EXACTLY a continuous Nyman-Beurling distance for zeta_K (Pythagoras + Krein-Szego).
- Rate (HEURISTIC mechanism, CONJECTURE law, blind): each obstruction point on the line costs 1/(T|s|^2) (Paley-Wiener
  resolution 2pi/T). Zeros of zeta_K give 2 lambda_1^K/T, lambda_1^K = 1 + log(sqrt3/2pi) + L'/L(1,chi_-3) = 0.0797107 (computed;
  the same mechanism reproduces BBLS's 2 + gamma - log 4pi for zeta). Cusp-form atoms (even forms with u_j(omega) != 0) give the
  LEADING (1/6)(log T)/T by Weyl. Round 2's "C/T" corrected: (1/6) log T/T for the full orbit form; 0.15942/T for the
  Eisenstein-projected form. Cusp of the surface (s = 1, 3/pi) sets the level and the weights 1/|s|^2.
- Moebius test vector: f* = H(1)/(sH) = (H(1)/3)(s+1)^2 zeta(2s)/((s-1) zeta_K(s)); true minimiser = f* B/B(1), so f* in L^2 iff RH_K.
  Truncated version: explicit double sum of Moebius of Z[omega] against orbit counts eps(m) r_K(m) r_K(m+3) with kernel of
  cos(xt)/(1/4+t^2) (regularised at the constant mode: Kronecker-limit object). Approach to the bound = mollified second moment of
  zeta_K with mollifier exponent 1/2 (that is the cost).
- Quasi-RH: Dfc(omega) = sum over zeros with Re <= 7/8 exactly; worst-case factor 3/4 per zero; Moebius vector grows <= e^(3u/8).
  Certificate (new in kind, unsearched): Dfc(omega) <= (1/2) log(1 + NB-integral(B)) for any admissible B, no zero located;
  quantitatively useless (~0.16/log X).
- Fake i sqrt5: everything holds verbatim except the explicit vector: 1/E(i sqrt5, s) has abscissa > 1 (zeros right of 1),
  so the "Moebius function of x^2+5y^2" sums diverge at s = 1. Ladder of growth exponents: i sqrt5 > 1/2; omega <= 3/8; RH 0.
HOLDING from session 4: test the rate law on lambda_T^Eis(omega) for moderate T (blind number already written: 0.15942/T);
read Burnol 2002 and Bercovici-Foias 1984 (continuous NB distance as Blaschke quantity: is R3.0 known for Dedekind zeta?);
compare with SP-operator's Fisher-Hartwig answer (it should give the same 2pi/T per double zero).

## 0b. SESSION 3 (round 2 on the common object; OBJECT_PHI.md section "Round 2", 99 lines)
Read: the other seats' OBJECT_PHI.md (operator: Phi is the FORM FACTOR of the point interaction at omega, zeros = where the
two sheets of the Krein function agree, RH_K <=> Green function at omega cyclic for the outgoing semigroup; modular: Phi is a
torus period, omega distinguished by RANK ONE of the Hecke module of delta_omega, impostor twin E*(i sqrt5, s), Bombieri-Garrett
operator), HUNCHES F4-F5, H9 (linear identities return Phi(rho) = 0), NOTEBOOK N43-N46.
Question: a non-linear object at omega, not a function of |Phi| on the line, zero-free. My answer:
- R0 corrections: the wave kernel of delta_omega is positive definite only after removing the constant mode (cosh(u/2), one
  negative square); the H^-1 divergence of delta_z sits in the cusp-form atoms.
- The extra datum beyond |Phi| on the line = the atom of the spectral measure at the trivial representation (s = 1, 3/pi,
  universal) + the exponential type log ht(z). Dfc compares tempered density with complementary atom through a log.
- Four zero-free definitions: D1 Jensen; D1' a FAMILY Dfc(z; sigma) at evaluation point 1/2 + sigma = Poisson transform of the
  off-line displacements (weight 2 delta sigma/(sigma^2 + gamma^2); uses only convergent lattice sums for sigma > 1/2); D2
  Szego-Krein: lambda_T(z) = min of the Wiener-Hopf form of W_z(u) = <cos(uD) g_z, g_z>, g_z = (Delta+2)^-1 delta_z, subject to
  int phi e^(-u/2) = 1; lambda_T decreases to (9/(32 pi^2)) ht^-1 e^(2 Dfc); RH_K <=> lambda_T(omega) -> bound; computable from the
  orbit distance distribution only; D3 phase defect (Kramers-Kronig): Dfc = -log |Poisson mean of e^(i theta)|.
- What differs at omega vs i sqrt5: not the definitions; the orbit counts. omega: eps(m) r_K(m) r_K(m+3), one shifted
  convolution of one Hecke eigenfunction; i sqrt5: cosh d = 1 + N(beta)/10, N(alpha) - N(beta) = 20, counts = congruence-restricted
  r_Q(m) r_Q(m+20), r_Q = 1*chi_-20 + chi_-4*chi_5 (formula checks passed, tests_orbit_isqrt5.log): four shifted convolutions.
  And D2's extremal vector at omega under RH has Mobius-of-Z[omega] coefficients (1/G_omega = (s/(s-1)) zeta(2s)/(3 zeta_K(s))).
- RISK R5: Mobius vector in the orbit form = a bilinear form in Mobius of Z[omega] against lattice counts of x^2+xy+y^2; it is
  Nyman-Beurling for zeta_K translated; needs an asymptotic, not a power saving.
HOLDING from session 3: (a) does sum m(a) m(b) eps r_K r_K(...) unfold into a single sum? (b) search Nyman-Beurling for Dedekind
zeta functions; (c) SP-operator: is D2's limit his outgoing cyclicity, and does Krein's theory give a rate; (d) compute
Dfc(i sqrt5; sigma) at sigma near the first off-line zero's height, blind prediction first; (e) CONJECTURE rate
lambda_T/bound - 1 ~ C/T under RH (unsearched).

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
