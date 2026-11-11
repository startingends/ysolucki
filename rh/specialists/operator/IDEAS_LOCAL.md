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
  - 2026-11-11: audit: not promoted: merged into main #21

## #2 · RH <=> i(Lambda'/Lambda)(1/2 - iz) is a generalised Nevanlinna function of class N_1 (Lambda = completed zeta without s(s-1)); in general kappa = 1 + number of zeros right of the line
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: The project found that the prime-minus-Gamma form has exactly one growing direction if RH holds, and one more for each pair of zeros off the line. There is a 50-year-old class of functions built for exactly this count: functions whose positivity fails in a fixed finite number of directions. The pole of zeta at s = 1 is the one allowed bad direction. Example: for zeta the count is 1 if RH holds; for the impostor with four known off-line quartets below height 200 it is at least 1 + 8.
- claim: PROVED modulo the convergence bookkeeping for infinitely many real zeros (PROOFS.md P4). It is S1-parity's B32 and S1-cubic's Lemma A in function-theoretic form. KNOWN ingredients: N_kappa has at most kappa poles in C_+ (read: Luger-Ou 2202.13246 sec. 3.2). By owner rule 2 this is a reformulation; its use is that it places N = primes - arch in an existing theory (indefinite canonical systems, de Branges Pontryagin spaces).
- log:
  - 2026-11-11: audit: not promoted: merged into main #22

## #3 · The window family is a de Branges chain as soon as the window form is positive: define lane A's a(L) as h_1(L) = pi d/dL <1, Q_L^{-1} 1>
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Lane A wanted a function of the window size that would show a kick each time a new prime power enters, but never defined it. The window spaces, when their energy form is positive, are exactly the kind of nested spaces for which such a function exists by a 1960s theorem; it is the rate of growth of one number, the largest value at frequency zero that a unit-energy function on the window can have. Example: at L = 0.2 that number is of order 8, at L = 1 of order 1e29.
- claim: PROVED: Fourier image of the window space with norm Q_a is a de Branges space whenever Q_a > 0 (PROOFS.md P1; Suzuki states it under RH only). KNOWN (from memory): pi dK_L(0,0) = h_1(L) dL. Asked S1-parity for the numbers (B135): t_1(L) and its log-derivative across L = (1/2) log n, for zeta and the impostor. No expectation stated.
- log:
  - 2026-11-11: audit: not promoted: merged into main #8

## #4 · Closed-form chain for the archimedean-only window (pole + Gamma, t < (1/2) log 2): read Burnol and write E_t, h_1(t)
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Before the first prime enters the window, the energy form contains only the smooth background. For that piece the nested spaces should be computable exactly (it is said to have been done with Bessel functions). It would be the first piece of a certificate indexed by window size rather than by position, and a test: the background alone must fail near t = 0.37.
- claim: HOLDING, promised to S1-cubic in B127. Nothing proved. Sources to read first: Burnol (Sonine spaces; the 2011 paper Suzuki builds on), Connes-Consani archimedean place.
- log:
  - 2026-11-11: audit: not promoted: audit R3-AUD: not promoted: a reading promise (Burnol; Connes-Consani archimedean place), nothing defined, proved or computed beyond the task; carried as open item 6 of the S1 closing; the de Branges chain itself is noted on main #8

## #5 · Multiplier duality: cosh(du) is Hankel-positive and Toeplitz-indefinite, cos(tu) the reverse; by Schur products every Hankel-type hypothesis is invariant under real twists
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Barrier B11 says every hypothesis used so far survives the twist n -> n^d. There is a two-line reason: the twist multiplies the kernel by cosh(d u), and cosh(d(x+y)) is a sum of two squares while cosh(d(x-y)) is a difference of two squares. So any mirror-type positivity survives automatically and the shift-type positivity (the one RH needs) is the only kind that can notice.
- claim: PROVED (PROOFS.md P3). Posted in B133. Matches SP-reflection B117/B129 (identity involution vs inverse involution; tilt translates Widder's measure).
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #6 · Odd block on the no-prime window: simple positive ground state for every L <= (1/2) log 2, by Beurling-Deny + irreducibility with no perturbation step; breaks exactly when the mirror atom of 2 enters
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: In the odd half of the problem the troublesome pole term has the friendly sign, so a classical theorem about heat-like flows (they keep positive functions positive) applies with no smallness assumption: the lowest odd vibration has no sign change until the first prime enters the window. Example: at L = 0.3 the window contains no prime and the odd ground state is of one sign; at L = 0.35 the prime 2 enters with a term of the unfriendly sign and the theorem no longer applies, although the computed ground state is still of one sign.
- claim: PROVED given two theorems cited from memory (Reed-Simon IV XIII.43-44, XIII.50) and one unchecked core statement: PROOFS.md P7, board B163. Not arithmetic (holds for the impostor's Gamma factor); so it fails the lead's third condition; its value is the exact place where it stops.
- log:
  - 2026-11-11: audit: not promoted: merged into main #28

## #7 · Bridge plank 5: Q_L(f) = W(T) = -Q(f,T): the window form equals the Weil form of the Poisson tail, and equals minus the coupling across the cut
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Take a profile g living on [-lambda, lambda], pile up its rescaled copies (the map E), and cut the result at the window edge. The piece inside the window is f, the piece below is the tail T. Because the whole pile has zero energy against everything, the energy of f equals the energy of T. Example: at L = 0.5 with g = s^2(1-7s^2)(1-s^2)^8 both energies are 5.319033963532e-8 to 13 digits; on the window side this number is a difference of terms 2400 times larger, on the tail side every term has its size.
- claim: PROVED for g in C^1, piecewise C^2, supported in [-lambda, lambda], g(0) = ghat(0) = 0 (PROOF_bridge.md Thm 5.1); explicit corrections otherwise (Prop 5.2); only a limit statement for g with endpoint jumps (Prop 5.3). COMPUTED: rel. difference 5e-14 (L = 0.5), 3e-15 (L = 0.75); five blind predictions hit (bridge/PREDICTION.md). Holds for any Dirichlet series with an explicit formula (controls included). Novelty: not found in two searches; not established.
- log:
  - 2026-11-11: audit: not promoted: merged into main #27

## #8 · Bridge plank 7: on the tail the prime term is 2<T, T_log>, T_log = x^(-1/2) sum (log m) phi(m/x): primes eliminated with no boundary term (co-analytic Toeplitz multiplicativity)
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: On the tail side the primes can be traded for the logarithms of all whole numbers, exactly, because the tail is a pile of shifted copies and the prime term only shifts further in the same direction, away from the cut. Example: at L = 0.5 the prime sum over the tail is -1.1044065020e-10 and the prime-free expression gives -1.1044065023e-10.
- claim: PROVED (PROOF_bridge.md Thm 7.1): V Z = [U, Z] and C V (1-C) = 0. COMPUTED to 3e-10, 5e-11. In my toolkit: T_(-zeta'/zeta) T_zeta = T_(-zeta') for co-analytic Toeplitz operators on a half-line (no Hankel term). Also holds for the controls: all arithmetic is left for plank 8. Not identified with Connes-Consani's Sonin trace.
- log:
  - 2026-11-11: CORRECTION: my board post B206 said the elimination fails on the window side (two cuts). Wrong: the window function has one effective cut. Corollary 7.2 (PROOF_bridge.md): Pi(f) = 2<f, f_log> on the window for any g supported in [-lambda, lambda]; COMPUTED to 1e-48 at L = 0.75 and 1.2 (bridge/plank7a.py.txt). This is the lead's plank 7(a). Corrected in B208.
  - 2026-11-11: audit: not promoted: merged into main #27

## #9 · Bridge plank 6: D_L (least L^2 leak) is a bounded closed form, a Schur complement of 1 - PBP; so Q <= C D is false, and g(0) = 0 is not closable; proposal: define the comparison form on the tail side
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: The 'least leak' of a window function is a perfectly good positive quantity, but it is a tame one: it never exceeds a fixed multiple of the size of the function, whereas the Weil energy grows without bound on fast oscillations. So the two cannot be comparable from above. And one of the two pole conditions (g vanishing at 0) cannot be felt by an L^2 leak at all. Example: wiggle g near 0 on a set of tiny length: the leak changes by almost nothing, g(0) changes by anything.
- claim: PROVED (PROOF_bridge.md Prop 6.1). HEURISTIC proposal: D_tail(f) = inf over admissible companions of |T|^2 or <T, A T>; then plank 8 compares two forms of the same order on the tail.
- log:
  - 2026-11-11: audit: not promoted: merged into main #27

## #10 · Zeros of zeta_K as the spectrum of an energy-dependent point interaction at omega with coupling S = (Q(s)+Q(1-s))/2; fails through the edge resonances
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Put a point-like scatterer at the special point omega of the modular surface. Each zero on the line is then a true bound state, but each for its own strength of the scatterer. Letting the strength depend on the energy in the one way the symmetry s <-> 1-s dictates makes the bound states exactly the zeros, all of them. The catch: that strength function has complex poles at the surface's own resonances (zeros of zeta(2s)), so the operator is not self-adjoint. Example: the first resonance is at s = rho_1/2 = 0.25 + 7.07i.
- claim: PROVED: pencil spectrum = zero set of Phi; -S is in no class N_kappa (infinitely many non-real poles). RISK / open: whether S minus its resonance part is Nevanlinna. The whole picture also holds for a class-number-2 CM point (impostor). OBJECT_PHI.md sec. 4.
- log:
  - 2026-11-11: audit: not promoted: merged into main #31
