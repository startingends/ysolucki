<!-- local-idea-log owner=SP-reflection -->
# Local idea log of SP-reflection

Private working log of agent `SP-reflection`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `SP-reflection/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Ramanujan is the second involution: mirror positivity = Hamburger on N_0 (dual R), root size = Herglotz on Z (dual T); both = roots +-1
- status: open
- source: SP-reflection session 1, from board B74 (Socrates), B15 (S1-mirror), barrier B11; Berg-Christensen-Ressel two-involution framework
- date: 2026-11-11
- tags: B11,known,translation
- plain english: A list of numbers attached to the powers of one prime can be tested in two ways. Test A (mirror): arrange them by the SUM of two exponents; it passes exactly when the hidden 'notes' of the prime are real numbers. Test B (shift): arrange them by the DIFFERENCE of two exponents; it passes exactly when the notes have size at most 1. Zeta's single note is 1, which passes both. The impostor zeta(s-d)zeta(s+d) has notes 2^d and 2^-d at the prime 2: real, so it passes A, but 2^d is bigger than 1, so it fails B. Example: d = 0.1 gives the two-by-two table [[2, 2.0048],[2.0048, 2]], whose determinant is -0.019: negative, so test B fails; at d = 0 the determinant is exactly 0.
- wall: W-curv-3 / B11 (the centre must be used). Does not attack a wall by itself: it names what the missing hypothesis is in the language of the toolkit.
- new input: FAILS RULE: a translation of a known condition (Ramanujan) into a known theorem (Herglotz); no new input.
- claim: For m_j > 0: [s(|i-j|)] >= 0 for all sizes iff all local roots have modulus <= 1; with a local functional equation, iff modulus = 1. The 2x2 minor is the usual bound |a_p| <= degree. For a mirror-positive c: c(p^(k+2)) = c(p^k) iff roots in {+1,-1}.
- prediction: Stated before computing in my reasoning, not on file: 2x2 Toeplitz determinant of F_d at p = 2 equals -4 sinh^2(d log 2); computed -0.019249 at d = 0.1. Not blind in the project's sense.
- smallest: Done: the equivalences above. Open: any version that is not prime-by-prime.
- novelty: NOT SEARCHED as a statement about L-functions. Herglotz / Caratheodory-Toeplitz and Hermite-Jacobi are classical. Almost certainly folklore.
- evidence: PROVED (NOTES_session1.md N1; board B117). COMPUTED tests_b74.log, tests_b74b.log: F_d 2x2 det = -4 sinh^2(d log 2) = -0.019249 at d = 0.1; G_d at p = 3 needs the 3x3 matrix (-0.0485).
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #2 · F^t is Helson positive (identity included) for t <= 1/degree; the mirror matrix of Lambda on a,b>=2 is the generator at t = 0
- status: open
- source: SP-reflection session 1, from S1-mirror's question B83(3) (Levy-Khinchin) and R2-curv's D2
- date: 2026-11-11
- tags: mirror,levy-khinchin,small-proved
- plain english: Take the list 1, 1, 1, ... (the coefficients of zeta). Its 'half power' is the list of coefficients of the square root of zeta: at powers of 2 they are 1, 1/2, 3/8, 5/16, ... The multiplication table built from these numbers (entry for n and m is the coefficient at n times m) has no negative directions; the same is true for every power t between 0 and 1, and stops being true the moment t exceeds 1 (at t = 1.01 a negative direction of size -0.0135 appears). The mirror matrix of the primes that idea 21 studied is the speed at which this family leaves its starting point at t = 0; that is why the number 1 has to be left out of it.
- wall: None attacked: a structural statement about the mirror cone (why index 1 is excluded).
- new input: FAILS RULE as an attack on RH. As mathematics: a one-parameter semigroup (convolution powers) whose generator is the mirror matrix; the threshold t = 1/D.
- claim: (a) local roots real with positive multiplicities => (b) [a_t(nm)]_{n,m>=1} >= 0 for 0 < t <= 1/D; (b) and m_j > 0 => roots real. Converse false with a numerator factor: (1-z)/(1-2z)^2. zeta^t: exactly t <= 1.
- prediction: Before computing I expected zeta^t positive for all t in (0,1] and failing above 1 (from the Beta integral); computed: +4.7e-9 at 0.5, 0 at 1, -0.0135 at 1.01. For F_d^t I expected the threshold 1/2: computed +6.5e-21 at 0.5, -0.0076 at 0.51. For the converse I expected equivalence and was WRONG: counterexample found while writing the proof.
- smallest: Prove 'fails for every t > 1/D' for real roots with m_j > 0 (a statement about when prod (1 - alpha_j z)^(-t m_j) is a Stieltjes transform).
- novelty: NOT SEARCHED. Complete monotonicity / Stieltjes property of (1-z)^(-t), t <= 1, is classical; the Helson-matrix reading was not looked for.
- evidence: PROVED NOTES_session1.md N4 (Lemmas 1-4). COMPUTED tests_b80_b83.log, tests_lk_counter.log (60-80 digits). 'Fails for every t > 1/D' in general: NOT proved.
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #3 · Ratio dial: the coefficients of zeta(s-d)/zeta(s+d) are moments of a product probability measure for d > 0; d = 0 is on the boundary of the mirror cone
- status: open
- source: SP-reflection session 1; SP-operator's B123/B132 (Suzuki's Hankel kernel K_d has these coefficients), my toolkit (BCR moments on the multiplicative semigroup)
- date: 2026-11-11
- tags: B11,mirror,suzuki,measure,open
- plain english: For the product zeta(s-d)zeta(s+d) the mirror test passes for every d, so it cannot find d = 0. For the RATIO zeta(s-d)/zeta(s+d), which is the object in Suzuki's determinant formula, the mirror test passes for d > 0, gives the trivial table at d = 0 and fails for d < 0. Picture: for each prime flip an independent coin that shows p^d with probability 1 - p^(-2d) and 0 otherwise; the coefficient at n is the average of the product of the coins over the prime factors of n. At d = 0 every coin always shows 0. Example at the prime 2, d = 0.1: the coin shows 1.0718 with probability 0.1294; the coefficient at 4 is 0.1294 x 1.0718^2 = 0.1487.
- wall: B11 / the kill of idea 21: an object whose mirror positivity is NOT indifferent to d. Whether it reaches Suzuki's operator K_d[t] on its real test space is unknown (asked of SP-operator, B138).
- new input: A probability measure (independent two-point variables indexed by primes) behind the Hankel kernel of a determinant formula equivalent to GRH; a candidate for 'the measure' that an infrared-type bound needs. Not yet connected to any inequality.
- claim: [q_d(nm)]_{n,m>=1} >= 0 iff d >= 0; rank on n,m <= A equals the number of squarefree integers <= A; representing measure = product of p^(-2d) delta_0 + (1 - p^(-2d)) delta_(p^d).
- prediction: NOT YET STATED. To state before computing next session: the sign of the smallest eigenvalue of Suzuki's truncated K_d[t] on L^2 at d = 0.1, t = 0.5 (needs his definition of G).
- smallest: Decide, from Suzuki's definitions, whether K_d[t] >= 0 on his space for d > 0 or only on atoms at log-integers.
- novelty: NOT SEARCHED. Suzuki 1606.05726 not read by me (SP-operator read it in full).
- evidence: PROVED (two lines: q_d(p^k) = (1 - p^(-2d)) p^(kd), tensor product of local Hankel matrices). COMPUTED tests_suzuki_q.log, 50 digits: d = 0.1, 0.3: 0 negative eigenvalues, rank 8 (A = 12), 19 (A = 30); d = -0.1: 5 and 11 negative, min -0.576, -0.934.
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #4 · The Weil form is an inverse propagator: pole minus a reflection-positive coupling; every bridge in the toolkit gives positivity of propagators
- status: open
- source: SP-reflection session 1; Theorem E (R2-curv), B25, Jorgensen-Neeb-Olafsson Thm 5.8, Frohlich-Simon-Spencer via Biskup
- date: 2026-11-11
- tags: atlas,B10,W-curv-3
- plain english: In the physics that reflection positivity comes from there are two kinds of object: a coupling (who talks to whom) and a correlation (how strongly two places end up agreeing). The theorems say: if the coupling passes the mirror test, the correlation is positive and cannot exceed a known size. In the Weil form the primes and the Gamma term play the part of the coupling, and RH asks that the coupling itself not exceed the pole. Example: with one exponential coupling e^(-|u|) the theorem bounds the correlation 1/(1 + k^2) by 1/k^2; it says nothing about whether the coupling is smaller than some other given function.
- wall: W-curv-3 (named more exactly: sign of the reflection-positive part), barrier B10 (coordinatewise hypotheses are Beurling-true).
- new input: FAILS RULE: a diagnosis, not an attack.
- claim: No theorem read this session has an upper bound on a reflection-positive coupling as its conclusion; JNO Thm 5.8 would be a bridge of the right kind but needs the opposite sign.
- prediction: none
- smallest: none
- novelty: One query pre-existing on the board (S1-mirror) found nothing on reflection positivity with the explicit formula; I ran none of my own on this.
- evidence: KNOWN statements read (LIBRARY.md L17-L21). PROVED: prime coupling on the lattice of rationals satisfies the FSS hypothesis for coordinate mirrors (NOTES N6.3).
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #5 · Defect function on the modular surface: A(z) = Poisson mean of log|E(z,1/2+it)| = log(3/pi) - (1/2) log ht(z) + Dfc(z), Dfc >= 0, zero exactly at RH points
- status: open
- source: SP-reflection session 2 (task: the object Phi = E*(omega,s), HUNCHES F3); Balazard-Saias-Yor applied to the Eisenstein family; session-1 exchange with SP-operator on the Szego condition (B150)
- date: 2026-11-11
- tags: B3,B1,object-phi,risk
- plain english: Every point z of the modular surface has a 'spectrum': how strongly it is felt at each frequency t of the continuous spectrum. Take the logarithm of that strength and average it over t with a bell-shaped weight. For every point this average is at least a fixed number (it depends only on the area of the surface and on how high the point sits), and the excess over that number is a sum of positive penalties, one for each zero of the point's zeta function lying off the critical line. So the excess is a non-negative function on the surface, and it is zero exactly at the points whose zeta function obeys the Riemann hypothesis. Example: at z = i the average was computed as -0.04609 and the fixed number is log(3/pi) = -0.04612: no visible excess, as expected for the Gaussian integers. RH for the field of omega says omega is one of the zeros of this excess function.
- wall: B3 (no slack): turns 'positivity is exact' into 'equality case of Jensen for a free positive measure'; does not remove it. Hits B1 at once: a proof must use what is special at omega.
- new input: The FAMILY in z: one non-negative function on the modular surface instead of one function of s; the height term; the constant 1/vol = the atom of the spectral measure at eigenvalue 0. At a single point it is BSY (a reformulation).
- claim: A(z) = log(3/pi) - (1/2) log ht(z) + sum over zeros rho of E(z,.) with Re rho > 1/2 of log|rho/(1-rho)|. RH for zeta_K (class number one) <=> Dfc(z_K) = 0.
- prediction: Stated before computing: A(omega) = log(sqrt2 3^(3/4)/pi) = 0.0258 and A(i) = log(3/pi) = -0.0461. Computed as above. TO STATE NEXT (blind): Dfc at a class number 2 CM point, from tabulated off-line zeros of its Epstein zeta function.
- smallest: Regularity of A on the surface and a formula for its Laplacian in z; or a proof that Dfc vanishes to infinite order at any RH point.
- first test: (auditor R3-AUD) The seat's blind rate law, stated before computing (OBJECT_PHI.md Round 3; notebook N54): lambda_T(omega)/limit - 1 ~ 2 lambda_1^K / T = 0.15942/T under RH_K, against (1/6) log T / T for the full orbit form; compute lambda_T(omega) to the largest feasible T. Second, Dfc at the class-number-2 point i sqrt 5 from tabulated off-line zeros of its Epstein zeta function (prediction to be written first, as the seat planned).
- kill line: (auditor R3-AUD) As a route, met already in substance (N52, N54): e^(2 Dfc(omega)) - 1 is exactly a continuous Nyman-Beurling distance for zeta_K and any unconditional rate for lambda_T is RH_K itself (a reformulation, rule 2); the unconditional certificate Dfc(omega) <= (1/2) log(1 + NB integral) is about 0.16/log X and cannot certify 0. As an instrument it is dead if the rate law cannot tell omega from i sqrt 5 at any computable T.
- novelty: Two web searches 2026-11-11 (queries in OBJECT_PHI.md section 5): BSY and variants found; no Epstein/Eisenstein version found; Lagarias-Suzuki math/0412039 found and NOT read. Status: not found in two queries.
- evidence: PROVED given the inner-outer factorisation (OBJECT_PHI.md section 4); constant checked exactly at omega through L(1,chi_-3), zeta(2) and the BSY value; COMPUTED crude: A(i) = -0.04609 vs -0.04612; A(omega) = 0.0252..0.0287 vs 0.0258.
- log:
  - 2026-11-11: Round 2 (session 3): four zero-free definitions written (OBJECT_PHI.md Round 2): Jensen; a family Dfc(z; sigma) = Poisson transform of off-line displacements using only convergent lattice sums for sigma > 1/2; Szego-Krein Christoffel limit of the Wiener-Hopf form of the orbit wave kernel (lambda_inf = 9/(32 pi^2) ht^-1 e^(2 Dfc)); phase defect. omega vs i sqrt5 differ only in the orbit counts (one versus four shifted convolutions) and in the multiplicative (Mobius) candidate minimiser. Equivalent to Nyman-Beurling for zeta_K; no slack.
  - 2026-11-11: Round 3: Dfc(omega) is exactly a continuous Nyman-Beurling distance for zeta_K (e^(2Dfc)-1 = inf NB integral). Blind rate law: lambda_T^Eis/bound - 1 ~ 2 lambda_1^K/T = 0.15942/T under RH; full orbit form ~ (1/6) log T/T from cusp forms. Fake i sqrt5 fails at the explicit Moebius vector (abscissa > 1).
  - 2026-11-11: promoted to main #31 by R3-AUD
