<!-- local-idea-log owner=SP-operator -->
# Local idea log of SP-operator

Private working log of agent `SP-operator`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `SP-operator/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Twist as conjugation: Q_{F_d} = e^{dX} Q e^{-dX} + e^{-dX} Q e^{dX} = 2cosh(d ad_X) Q on every window
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Multiplying every integer n by n^d (the family F_d = zeta(s-d)zeta(s+d)) does one simple thing to the energy form on a window: it is the ordinary form looked at through a tilted lens e^{dx} on one side and e^{-dx} on the other. Example: for d = 0 nothing happens; for tiny d the lowest energy drops by d^2 times the energy of x times the ground state, so the true zeta is at the top of a smooth hill in d, not at a kink.
- claim: PROVED identity. Consequence: lambda_min(Q_{F_d}) <= 2 lambda_0 - 2 d^2 <x psi,(Q - lambda_0) x psi> + O(d^4); even, analytic, concave at 0, no kink. BLIND PREDICTION (written before reading S1-parity's fd logs or any post after B70): first failing half-width L*(d) solves lambda_0(L) = d^2 c(L), c = <x psi,(Q-lambda_0) x psi>; rough guess before computing c: d=0.25: L* in 0.28..0.33; d=0.1: about 0.35; d=0.05: 0.38..0.40.
- log:
  - 2026-11-11: PREDICTION RESULT: MISS on the numbers (S1-parity fd_first.log / B112: first failure at L = 0.436, 0.476, 0.505 for d = 0.25, 0.1, 0.05; I guessed 0.28-0.33, 0.35, 0.38-0.40). The formula itself is CONFIRMED to 8 digits by S1-parity B136 (Q0_o(x v_e) = 1.4628861e-4 = measured slope at L = 0.75; also L = 1). My error: I took c(L) of order a^2; it is 1.5e-4 because x psi_even is nearly in the near-null odd ladder. The identity was also found independently by S1-mirror (B90), S1-curv (B99), S1-cubic (B103); my part is the sign of the curvature. Proof: PROOFS.md P2.

## #2 · RH <=> i(Lambda'/Lambda)(1/2 - iz) is a generalised Nevanlinna function of class N_1 (Lambda = completed zeta without s(s-1)); in general kappa = 1 + number of zeros right of the line
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: The project found that the prime-minus-Gamma form has exactly one growing direction if RH holds, and one more for each pair of zeros off the line. There is a 50-year-old class of functions built for exactly this count: functions whose positivity fails in a fixed finite number of directions. The pole of zeta at s = 1 is the one allowed bad direction. Example: for zeta the count is 1 if RH holds; for the impostor with four known off-line quartets below height 200 it is at least 1 + 8.
- claim: PROVED modulo the convergence bookkeeping for infinitely many real zeros (PROOFS.md P4). It is S1-parity's B32 and S1-cubic's Lemma A in function-theoretic form. KNOWN ingredients: N_kappa has at most kappa poles in C_+ (read: Luger-Ou 2202.13246 sec. 3.2). By owner rule 2 this is a reformulation; its use is that it places N = primes - arch in an existing theory (indefinite canonical systems, de Branges Pontryagin spaces).
- log:

## #3 · The window family is a de Branges chain as soon as the window form is positive: define lane A's a(L) as h_1(L) = pi d/dL <1, Q_L^{-1} 1>
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Lane A wanted a function of the window size that would show a kick each time a new prime power enters, but never defined it. The window spaces, when their energy form is positive, are exactly the kind of nested spaces for which such a function exists by a 1960s theorem; it is the rate of growth of one number, the largest value at frequency zero that a unit-energy function on the window can have. Example: at L = 0.2 that number is of order 8, at L = 1 of order 1e29.
- claim: PROVED: Fourier image of the window space with norm Q_a is a de Branges space whenever Q_a > 0 (PROOFS.md P1; Suzuki states it under RH only). KNOWN (from memory): pi dK_L(0,0) = h_1(L) dL. Asked S1-parity for the numbers (B135): t_1(L) and its log-derivative across L = (1/2) log n, for zeta and the impostor. No expectation stated.
- log:

## #4 · Closed-form chain for the archimedean-only window (pole + Gamma, t < (1/2) log 2): read Burnol and write E_t, h_1(t)
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Before the first prime enters the window, the energy form contains only the smooth background. For that piece the nested spaces should be computable exactly (it is said to have been done with Bessel functions). It would be the first piece of a certificate indexed by window size rather than by position, and a test: the background alone must fail near t = 0.37.
- claim: HOLDING, promised to S1-cubic in B127. Nothing proved. Sources to read first: Burnol (Sonine spaces; the 2011 paper Suzuki builds on), Connes-Consani archimedean place.
- log:

## #5 · Multiplier duality: cosh(du) is Hankel-positive and Toeplitz-indefinite, cos(tu) the reverse; by Schur products every Hankel-type hypothesis is invariant under real twists
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Barrier B11 says every hypothesis used so far survives the twist n -> n^d. There is a two-line reason: the twist multiplies the kernel by cosh(d u), and cosh(d(x+y)) is a sum of two squares while cosh(d(x-y)) is a difference of two squares. So any mirror-type positivity survives automatically and the shift-type positivity (the one RH needs) is the only kind that can notice.
- claim: PROVED (PROOFS.md P3). Posted in B133. Matches SP-reflection B117/B129 (identity involution vs inverse involution; tilt translates Widder's measure).
- log:

## #6 · Odd block on the no-prime window: simple positive ground state for every L <= (1/2) log 2, by Beurling-Deny + irreducibility with no perturbation step; breaks exactly when the mirror atom of 2 enters
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: In the odd half of the problem the troublesome pole term has the friendly sign, so a classical theorem about heat-like flows (they keep positive functions positive) applies with no smallness assumption: the lowest odd vibration has no sign change until the first prime enters the window. Example: at L = 0.3 the window contains no prime and the odd ground state is of one sign; at L = 0.35 the prime 2 enters with a term of the unfriendly sign and the theorem no longer applies, although the computed ground state is still of one sign.
- claim: PROVED given two theorems cited from memory (Reed-Simon IV XIII.43-44, XIII.50) and one unchecked core statement: PROOFS.md P7, board B163. Not arithmetic (holds for the impostor's Gamma factor); so it fails the lead's third condition; its value is the exact place where it stops.
- log:
