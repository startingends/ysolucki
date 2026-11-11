# MEMORY of SP-operator

Rewritten at the end of session 8 (2026-11-11). Session 1: seminar S1 (first-session duties). Session 2: planks 5,
6, 7 of bridge 1 (rh/BRIDGE.md, idea #27, owner's rule 12). Session 3: the structural mode (owner's rule 13,
rh/HUNCHES.md part F): one object, Phi(s) = E*(omega, s), expressed in my toolkit: OBJECT_PHI.md.
A session starts by reading this file, CHARTER.md, LIBRARY.md, PROOFS.md and IDEAS_LOCAL.md.

## Files of this seat
- CHARTER.md (fixed): the toolkit, what it can and cannot do.
- LIBRARY.md: 18 entries with exact statements and read status; list "Still to read" at the end.
- PROOFS.md: P1 window space is de Branges when Q_a > 0; P2 twist = conjugation, curvature sign;
  P3 multiplier duality; P4 Poisson splitting, Weyl function, class N_1; P5 Suzuki's dial; P6 derivative of the
  parity determinants; P7 odd block on the no-prime window has a simple positive ground state.
- IDEAS_LOCAL.md: 9 entries (SP-operator/#1..#9; #7-#9 are the bridge planks).
- PROOF_bridge.md and bridge/ (session 2).
- OBJECT_PHI.md (session 3). ladder.py.txt + ladder.log (one small computation).
- board_drafts/: texts of my board posts (p1..p12).
- Library notes written for the project: rh/library/suzuki-2606.09096.md, rh/library/suzuki-1606.05726.md.
- Sources under rh/library/src/: 2606.09096, 1606.05726 (both read in full), basor-chen-0202062 (read in
  full), kaltenbaeck-woracek-1998 (pp. 1-6 of 37 read), luger-ou-2202.13246 (sec. 3.2 read),
  1204.1827 and 2511.23257 (downloaded; only the abstract and theorem list of the latter read).

## SESSION 8 (seminar S3, board s3): answered B5 (exit E6) in B8, long form S3_B5.md; question to SP-sieve in B11
- P1 weighted copy chain; P2 to beat 3/4 need weighted copy fraction C_w/W_tot >= D^(-1/2+2c) at the diagonal.
- P3 PROVED: copies are top singular directions for EVERY weight (weighted Theorem 1); mu's component along them is A_1.
- P4 PROVED: weight on copies contributes exactly C_w''|A_1|^2: copy-concentrated weights / copy-keeping thinnings are circular.
- P5 PROVED identity: Iwaniec amplifier |sum b_l (u/l)_6|^2 is Poisson-able; amplified S = mean square of beta = b*mu (length LD);
  fails at the Gauss-Jacobi step (mu pointwise). P6 RISK: positive-biased b -> parity; b on cubes -> quadratic copies -> exactly 3/4.

## SESSION 7 (seminar S2, board s2): answered B4 in B11 (long form S2_B4.md); question to SP-reflection in B12
- Proposal: tensor factorisation of the divisor matrix T_1 on BOXES {d | P(z)} (exact: image of mu 1_B is the Eratosthenes
  indicator 1_{(j,P)=1} everywhere), glued to the simplex window {1..N} by Buchstab's largest-prime recursion
  R_N(k) = -sum_p R^(<p)_{N/p}(floor(k/p)) (PROVED; checked exactly, 12 cases). Gives Type I/II bilinear forms with exact
  coefficients. RISK prediction: PNT strength only (no power saving); the obstruction is the PARITY barrier (B8): box ->
  simplex is the sieve truncation problem at sifting level s = 1. Impostor fails at the box identity (no tensor product).
  No limit exchange needed; its place is taken by parity. Not Deligne's shape, not a fixed point (B9).
- (d): profinite Gram [1/lcm] (tensor, Haar on Zhat, long family) vs archimedean [1/max] (short); not ordered as forms.
  Asked SP-reflection (B12) for a monotone Markov interpolation between Haar on Zhat and Lebesgue on R_+.

## SESSION 6 (short-family mean square): SHORT_FAMILY.md (122 lines; written without SP-modular's answer)
Read: NOTEBOOK N49, N53; digest openai-qrh-11-12.md (whole).
- PROVED + COMPUTED (30 digits): ||f_c||^2 = sum_k |sum_{d<=N} c_d floor(k/d)|^2/(k(k+1)) under M_c(1) = 0;
  G_N = P_N T_1^T Gamma T_1 P_N, T_1 = divisor matrix (multiplicative Toeplitz, symbol zeta), Gamma = [1/max(m,n)] = A A^T
  (Hardy-Cesaro, norm 4).
- PROVED + COMPUTED (20 digits; first version off by the k = 0 term M_N(1)^2, found by the check): window identity, the
  divisor-closed window makes P_N T_1 P_N invertible with inverse the Moebius matrix; Moebius vector exactly in the kernel of
  P_N(T_1 c - e_1); d_N^2 = sum_{k>=0} int_k^{k+1} |R_N(k) + y M_N(1)|^2 dy/y^2, R_N(k) = sum_{N<d<=k} mu(d) floor(k/d): all
  energy beyond the window, family k ~ X of the same length as its sums (H ~ D borderline). Multiplicative analogue of plank 5.
- Normalised G~_N: multiplicative Toeplitz with SINGULAR symbol (Kronecker line in T^inf); top ~ N; RH = O(1) energy of a
  vector of norm^2 ~ log N (mass O(1/K) above level K); not near the bottom.
- Large sieve D-term = top singular value of non-uniform sampling R_T (node clusters at log-scale 1/T); its extremal vectors
  are the TRIVIAL TWIST (t ~ 0 clusters; rows u = p^6): in the short regime the mean square is equivalent to the trivial-twist
  Moebius sum, no amplification.
- Trivialising object named: Levinson recursion in N with explicit reflection coefficients (needs group-Toeplitz structure
  with a.c. symbol). Fails: symbol on the Kronecker line; window identity does not shorten the tail.
- Impostor: identities hold verbatim (a_1 = 1 only); inverse coefficients (pole at 0.808) saturate the D-term; T_f is a sum,
  not a tensor product over primes.

## SESSION 5 (round 3 on Phi, with SP-reflection): OBJECT_PHI.md section "Round 3" (124 lines)
Read: NOTEBOOK N49-N50; reflection/OBJECT_PHI.md Round 2 (lambda_T(z) = Szego-Krein extremal problem on the orbit, ratio of
Wiener-Hopf determinants, limit (9/(32 pi^2)) ht^-1 e^(2 Dfc)). Abstracts read: DIK 0905.0443, 1206.1292, Fahs 1909.07362,
Claeys-Its-Krasovsky 1004.3696.
- R3.1 stated: strong Szego / Borodin-Okounkov on the line (Basor-Chen, read); one FH zero (Basor-Ehrhardt eq. 12-13);
  finitely many FH singularities on the circle (DIK; Fahs: uniform in locations for FIXED m; nothing for growing m);
  CIK: a singularity reaching the contour (Painleve V crossover) = local model of an off-line zero.
- R3.2 lambda_T = Schur complement of M_T (compact positive, no Fredholm determinant: only ratios are defined) =
  1/K_T(t0,t0) of the Krein-system de Branges space, t0 = i/2 (s = 1). Normalised symbol |zeta_K|^2/|zeta(1+2it)|^2: a double
  FH zero at every on-line zero; smooth part not in H^(1/2) (Mertens divergence). Rate HEURISTIC C/T; Krein coefficient has
  kicks at r = (1/2) log N(a) (lane A's A4 in the right object).
- R3.3 SHARP ANSWER: REFORMULATION. The limit is forced unconditionally by Krein-Szego (2 pi exp P[log w]); RH_K is the
  value of that Poisson integral (BSY for zeta_K); every FH/strong-Szego refinement is a functional of (singular set, smooth
  part) through norms on the line, where an off-line quartet is a smooth bump whose Poisson extension (by reflection) IS the
  factor e^(2 Dfc). A bridge needs the hypothesis "e^(V/2) zero-free analytic in 0 < Im t < 1/2" = RH_K. Exit (H7): compute the
  limit from the ORBIT side, not examined.
- R3.4 off-line zero visible in the determinant (not in the limit of lambda_T) as an FH factor switching off at T ~ 1/delta.
- R3.5 fake first i sqrt5: all theorems apply verbatim. Structural difference: omega's symbol is formally a product of local
  almost-periodic symbols on frequency lattices Z log p, pairwise disjoint (unique factorisation), so Szego-Widom constants
  factor over primes with NO cross terms; at i sqrt5 the symbol is |sum of two products|^2. Exchange of limits T, P = RH again.

## SESSION 4 (round 2 on Phi): OBJECT_PHI.md section "Round 2" (102 lines)
Read: rh/specialists/modular/OBJECT_PHI.md and reflection/OBJECT_PHI.md whole, HUNCHES F4-F5 + H9, NOTEBOOK N43-N46.
- R2.0 PROVED: |Phi| on the line determines Phi (real-analytic, Phi^2 = |Phi|^2 continues); so condition (2) must
  be read as "not weakly continuous in the spectral measure rho_omega". Laguerre-Polya is closed under locally
  uniform convergence (Hurwitz), not under weak convergence of |F|^2 dt; the Euler product converges in neither.
- R2.1 The cyclicity angle of the Green function: cos^2 alpha(z) = |B_z(1)|^2, -log cos alpha = Dfc(z) =
  sum_{Re rho > 1/2} log|rho/(1-rho)|: EXACTLY SP-reflection's defect (third derivation of one object). Non-linear
  (Jensen gap), weakly UPPER semicontinuous (defect can appear in limits, never disappear: F5's wall with its
  direction), each off-line zero adds a quantised log|rho/(1-rho)| ~ (2beta-1)/(2gamma^2). Separates omega from
  i sqrt5 only through zero location.
- R2.2 Structural lever: Dfc additive on products, free on sums; finite Euler products have Dfc = 0; Phi is a
  product (xi . Lambda(chi_-3)), E*(i sqrt5) is a sum of two products.
- R2.3 NEW: matrix Krein function of the Heegner set, Q_D(lambda)_{AB} = G_lambda(z_A, z_B); sheet difference
  v v^T/(1-2s), character components Euler products; for D = -20 the off-diagonal entry r_D = G^reg(z1,z1) -
  G^reg(z2,z2) is canonical (regularisation cancels) and is the Davenport-Heilbronn cross term; linear in the
  matrix measure, so it cannot see the phase (CONJECTURE: no information on off-line zeros). Impostor zeros =
  zeros of a projection <e_1, v> of a vector whose components are Euler products.
- R2.4 judgement (RISK): no number in my toolkit separates omega from i sqrt5 structurally except through
  multiplicativity; needed: a topology where partial Euler products converge AND Dfc is lower semicontinuous.

## SESSION 3 (structural mode): Phi(s) = E*(omega,s) = 3 (sqrt3/2pi)^s Gamma(s) zeta_K(s), K = Q(sqrt-3)
File: OBJECT_PHI.md (196 lines; written BEFORE reading the other seats' answers; no source opened, no
numerics; every KNOWN there is from memory unless marked read). What it says:
- Point interaction at omega: extensions Delta_alpha, Krein function Q = regularised Green function at omega,
  Nevanlinna unconditionally. Phi is the FORM FACTOR: Im Q on the cut = |Phi(1/2+it)|^2/(4t|Lambda(1+2it)|^2).
  Q(s) - Q(1-s) = Phi(s)^2/((1-2s)Lambda(2s)Lambda(2-2s)): zeros of Phi = points where the two sheets of the
  Krein function agree. Each zero ON the line is an embedded eigenvalue of exactly one extension
  Delta_{alpha(gamma)}, alpha(gamma) = Q(1/4+gamma^2) (Aronszajn-Donoghue); zeros off the line are eigenvalues only
  of non-self-adjoint extensions. Phi^2 = Wronskian of the structure functions of two extensions.
- de Branges: (a) string of the point: spectral measure with density |Phi|^2/|xi(1+2it)|^2 + cusp atoms; its
  Fourier transform is the orbit sum over Gamma.omega (pre-trace formula): windows + positivity for free, but
  Phi is in the density. (b) cusp space H(E_0), E_0 = xi(1-2iz) (HB unconditionally): eps = F_omega/E_0;
  RH_K <=> e^{-i tau z} eps outer (tau = log(2/sqrt3)) <=> Green function at omega cyclic for the outgoing
  semigroup (Beurling). (c) Suzuki's dial for zeta_K; unverifiable hypothesis = Theta_d inner for d <= 1/2;
  trivialising object = a Lax-Phillips system with scattering coefficient xi_K(s-d)/xi_K(s+d), d < 1/2;
  arithmetic cusps give d = 1/2 only (modular surface for Q, Bianchi orbifold for K). Second form: zeros are
  real for free for Krein functions and separating constant terms, never for form factors.
- IMPOSTOR: everything holds verbatim for E*(w,s) at a class-number-2 CM point (zeros off the line). What
  omega has is complex multiplication (Hecke correspondences fixing it), not its stabiliser of order 3.
- Colin de Verdiere: fails for the point because (i) capacity zero (pseudo-Laplacian = Delta), (ii) a point
  does not separate. Repairs: smaller form domain -> equation Q(l1) = Q(l2) at two ROOTS, not two SHEETS;
  order-3 character of PSL_2(Z) -> vanishing at omega automatic but cusp closed, spectrum = cusp forms;
  geodesic -> real quadratic zeta as form factor, not eigenvalues; Bianchi orbifold -> zeta_K in the cusp at
  arguments s, s-1 (d = 1/2).
- RISK taken: energy-dependent coupling alpha(lambda) = S = (Q(s)+Q(1-s))/2; its pencil spectrum is exactly the
  zero set of Phi; fails because S has non-real poles at lambda = (rho/2)(1-rho/2) (edge resonances), so -S is
  in no class N_kappa. To decide: is S minus its resonance part Nevanlinna (a statement about central
  L-values |u_j(omega)|^2 and the Hilbert transform of the density)? does the class-number-2 point fail at a
  different place? do the Hecke correspondences at omega act usefully on the deficiency space?
- NOT CHECKED in OBJECT_PHI.md: the normalisation of G_s - G_{1-s}; whether zM(z) is exactly N_1; the Bianchi
  constant-term zero statement (labelled CONJECTURE); every from-memory citation.
- NEXT (session 4): read the other seats' answers on Phi (SP-modular, SP-reflection) and compare; the lead
  asked for that order.

## SESSION 2 (bridge 1): what I built, in one place
Files: PROOF_bridge.md (theorems 5.1, 7.1, propositions 5.2, 5.3, 6.1, numerics, novelty), bridge/PREDICTION.md
(five blind predictions, all HIT), bridge/bridge5.py.txt (closed-form prime-side evaluator of the Weil form on
piecewise exponential sums; validated against lane A's q_00 to 8e-45), bridge/run_L0.5_K8.log,
bridge/run_L0.75_K8.log. Board: results B205 (plank 5), B206 (planks 7 and 6), both re B199.
- PLANK 5, PROVED (Thm 5.1): g even, C^1, piecewise C^2, supported in [-lambda, lambda], g(0) = ghat(0) = 0;
  F = E(g) is a null vector (transform zeta(s) Mg(s)); f = F on the window, T = F below 1/lambda =
  x^(-1/2) sum_m (B_perp ghat)(m/x); then Q_L(f) = W(T) = -Q(f,T) (coupling across the cut with the kernel
  e^{t/2} - sum_{m>=1} e^{-(2m+1/2)t} - primes). Pole bookkeeping (Prop 5.2): with a = ghat(0)/2, b = g(0)/2,
  Q_L(f) = W(T_0) + 2a l_1 - 2b l_0 + (a^2 lambda + b^2/lambda) 0.0461914 + 2ab (-0.0461543). Endpoint jumps
  (Prop 5.3; e27's time-limited prolates): tail decays at the critical rate x^{1/2} (sawtooth), W(T) only
  conditionally convergent, identity only as a limit over mollified g.
- COMPUTED (g = s^2(1-7s^2)(1-s^2)^8 scaled): L = 0.5: 5.319033963532685e-8 vs 5.319033963532956e-8 (5e-14);
  L = 0.75: 3.666016833422033e-11 vs ...022e-11 (3e-15). Window side: difference of terms 2400x larger; tail
  side: pole 1.49e-8, arch 3.82e-8, primes -1.1e-10; W(T)/|T|^2 = 0.75 and 1.51.
- PLANK 7, PROVED (Thm 7.1): V Z = [U, Z] (Lambda * 1 = log) and C V (1 - C) = 0, so Pi(T) = 2<T, T_log>,
  T_log = x^(-1/2) sum_m (log m)(B_perp ghat)(m/x): prime-free, NO boundary term. COMPUTED to 3e-10 / 5e-11.
  In my toolkit: multiplicativity of co-analytic Toeplitz operators on a half-line. W(T) = <T, Acal T> -
  2<T, [U, T_zeta] psi>, Acal = compressed pole + Gamma operator. Not identified with Connes-Consani's Sonin
  trace (digest only read); on the no-prime window their Theorem 1 gives a LOWER bound for W(T).
- CORRECTION made in session 2: I posted in B206 that the primes cannot be removed on the window side
  (two cuts -> Hankel term). WRONG: the window function E(g) has one effective cut; Corollary 7.2 (the lead's
  plank 7(a)): Pi(f) = 2<f, f_log>, f_log = x^{1/2} sum (log n) g(nx); COMPUTED to 1e-48 at L = 0.75, 1.2
  (bridge/plank7a.py.txt). Corrected on the board (B208) and in PROOF_bridge.md.
- Prop 6.2: the foothold seat's corrected D_L (constraints int g = 0 and int_band ghat = 0) is bounded,
  closed, everywhere defined, minimiser attained.
- STATE OF THE BRIDGE when I stopped: the lead has ENDED bridge 1 (rh/BRIDGE.md 'where it ends'): planks 9,
  10, 12 negative; the ladder is a property of the functional equation alone. My planks 5, 7 agree with that
  (impostor-blind identities).
- PLANK 6, PROVED (Prop 6.1): g is determined on 1/lambda <= |y| <= lambda by f (Moebius inversion), free
  inside; D_L = Schur complement of 1 - PBP w.r.t. 1 - P_in B P_in (>= 1 - chi_0(2 pi) > 0): bounded, closed,
  everywhere defined, strictly positive. So Q <= C D is FALSE (Q is of log order); g(0) = 0 is not closable in
  L^2. Proposal (HEURISTIC): comparison form on the tail side.
- PLANK 9 input: planks 5 and 7 use no Euler product, no sign, no root size; they hold for F_d and the
  impostor (S1-mirror's B199 shows the impostor's Poisson map). All arithmetic must enter in plank 8.
- Novelty: 2 web searches (snippets), digests of CC 2106.01715 and CCM 2511.22755: not found; NOT
  established as new; Burnol (co-Poisson, Sonine; arXiv math/0203120, math/0112254; Ann. Inst. Fourier 2007)
  must be read first.
- Asked (B206): rerun e27 form.py with smooth companions so that planks 1-3 are statements about the W(T)
  of Thm 5.1. Not answered when I stopped.

## Holding after session 2 (in addition to the list below)
A. Plank 8 on the tail side: is <T, Acal T> >= c |T|^2 for tails (Acal = pole + Gamma compressed to u < -L)?
   The pole term 2<T,e^{u/2}><T,e^{-u/2}> has no sign a priori; in my two runs it is positive.
B. Relation between Connes-Consani's scaling action theta(f) on L^2(R)_ev and the map E (needed to compare
   the Sonin trace with D_L or with W(T)); read 2006.13771 sec. 4 myself.
C. Read Burnol before any novelty statement. Read Barner's form of the explicit formula (cited from memory
   in Thm 5.1) and Brown-Halmos (cited from memory in Thm 7.1's interpretation).
D. Prop 5.2's prime-side form of l_0, l_1 (Chebyshev's psi) is formal; the size estimate of the corrections
   on the e27 vectors is an order-of-magnitude argument, not computed.
E. Controls: Thm 5.1 / 7.1 not written out for F_d and the impostor (only the remark that the proofs apply).

## What I now know about the project, through my toolkit
1. The project's object is the Weil form Q on windows [-L, L] (log variable; primes <= e^(2L)), Q = pole + arch
   - primes, N = primes - arch. Lane A: lowest eigenvalue ~ exp(-4 pi e^(2L)) (prolate ladder); impostor
   (Davenport-Heilbronn) fails first at L in (1.70, 1.72]. In my language: Q_a is a truncated Wiener-Hopf form
   whose symbol is the zero-counting measure; Q_W(v) = <G v', v'> with Suzuki's continuous screw function g;
   when Q_a > 0 the Fourier image of the window is a de Branges space H(E_a) (P1), and the windows form a
   chain = canonical system with DIAGONAL Hamiltonian (even measure). The tiny eigenvalues are the
   finite-window form of "no Szego condition": forced by the zeros being discrete; only the rate is extra.
2. The three seats' inertia statements (S1-cubic Lemma A, S1-parity B32, B56) are Haynsworth's inertia
   additivity; function-theoretic form: q(z) = i(Lambda'/Lambda)(1/2 - iz) (Lambda without s(s-1)) is in N_kappa
   with kappa = 1 + #zeros right of the line; RH <=> q in N_1 (P4). The "+1" is the pole of zeta.
3. B60 (positivity on [-L,L] <=> |H_W| <= T_W on the half window) is "Toeplitz +- Hankel for even symbols"
   (Basor-Ehrhardt eq. (13)); each parity block has its own Borodin-Okounkov identity with ONE Hankel operator
   of the phase function (their Prop 3.13 + Lemma 3.15; read via machine summary only).
4. Borodin-Okounkov on the Weil form: the exact symbol (discrete measure) has no Wiener-Hopf factorisation
   WITH OR WITHOUT RH (Szego condition); on one window a positive factorisable representative exists iff
   Q_a >= 0 (it is dx/|E_a|^2); so nothing is gained there. The identity has content only for the smoothed dial
   1/|xi(1/2+d+ix)|^2, whose factors are explicit; "factor zero-free in the upper half-plane" = "no zeros right
   of 1/2 + d" (Suzuki Prop 4.3).
5. Barrier B11 / family F_d = zeta(s-d) zeta(s+d): (i) Q_{F_d} = 2cosh(d ad_X) Q; curvature
   -2<x psi,(Q - lambda_0) x psi> <= 0 (P2; confirmed to 8 digits by S1-parity B136); (ii) cosh(d(x+y)) is
   Hankel-positive, cosh(d(x-y)) is Toeplitz-indefinite, the reverse for cos (P3): every Hankel-type hypothesis is
   twist-invariant by Schur products; (iii) 2cosh(du) = e^(-d|u|) + e^(+d|u|): forward Poisson half is harmless
   (positive for d > 1/2 unconditionally), backward half crosses the spectrum; (iv) Suzuki's canonical systems
   H_d(t) are the SAME dial as a ratio zeta(s-d)/zeta(s+d); they exist for d > d0 = sup Re rho - 1/2; d = 0 is
   special only as the fixed point of d -> -d (E_d# = E_{-d}); nothing in the construction knows the centre
   (Suzuki: Ramanujan not needed, Euler product needed).
6. SP-reflection's side, as answered to me: Widder's theorem makes S1-curv's "two test spaces" wall a theorem
   (no kernel with an atom in (0,2L) is mirror positive on L^2(0,L); B146, with a 5-line extension to
   distributions); mirror = identity involution (dual R), Ramanujan = inverse involution (dual T), intersection
   +-1 (B117); local Toeplitz positivity is independent of Bochner positivity on R because of the infinite atom
   at 0 (B146 (3)); every bridge SP-reflection owns gives positivity of PROPAGATORS, the Weil form is an
   inverse propagator (B129); the Jorgensen-Neeb-Olafsson window theorem needs + K where Weil has - K.

## What I was asked and what I answered (board s1)
- B75 (moderator): doubling step known? -> B122: yes, T +- H (Basor-Ehrhardt); no kernel-side theorem gives
  |H| <= T; on F_d the failing hypothesis is "symbol is a positive measure on the real axis".
- B84 (S1-mirror) -> B123: confirmed; R = canonical-correlation operator of adjacent half windows; d/dL log
  (det_even/det_odd) = 2 Gamma_L(L,-L) (P6, for I + K only); atoms enter at t = (1/2) log n in Suzuki's K[t].
- B80 (moderator) -> B124: T_p is the rank-one projection for zeta, eigenvalues p^(+-d) for F_d; d = 0 <=>
  T_p^2 = T_p <=> c(p^(k+1)) = c(p^k), k >= 3; no extension to window shifts can keep an idempotent.
- B93 (S1-parity) -> B125: Haynsworth; class N_1; Krein-Langer does not give the first window at which a
  non-real point is counted; heuristic count rule from the ladder. Check posted in B145 (ladder at L = 1:
  even 8.2e-30, 3.3e-23, 1.9e-17, 1.8e-12, 5.5e-8, 2.8e-4, 0.17; my stated threshold 1e-3 was off by one: MISS).
- B100 (S1-curv) -> B126: nu(L) = norm of differentiation in H(E_L) (Dyakonov / Baranov, from memory);
  commutation relation Q(xg) = Re Q(x^2 g, g) + (1/2)<g, T(sigma'') g>; it does not see the tilt.
- B115 (S1-cubic) -> B127: the t-indexed object is the chain H(E_t) / Hamiltonian; as an existence statement it
  is vacuous (like Lemma C); N_1 is the home of "one positive eigenvalue"; closed form for t < 0.347 PROMISED.
- B138 (SP-reflection) -> B150: Suzuki's K_d[t] is not >= 0 (2x2 minor); I do not know which determinant
  vanishes first; no prime-by-prime factorisation (local factors are not unimodular); continuation problem on
  a window is always indeterminate (deficiency (1,1), Suzuki Lemma 6.2); zero margin = failure of Szego.
- B152 (moderator: the pole in the odd block; novelty check) -> B163: both sentences right; PROOFS.md P7:
  for EVERY L <= (1/2) log 2 the odd block has a simple ground state, positive a.e. after folding (first
  Beurling-Deny criterion + irreducibility; no perturbation); Suzuki has nothing on the odd eigenfunction and no
  explicit range; per the digest yoshida-1992.md the proved positivity on the no-prime window is on the
  hyperplane where the transform vanishes at +-i/2 (secondary sources disagree; primary not read).
- B158 (moderator, to all: name the one statement) -> B164: I have no candidate meeting the lead's three
  conditions; (A) on the no-prime window cannot be violated by any control (archimedean only); it breaks
  exactly when the mirror atom of 2 enters. I said I would try to break (C) (doubling step) and asked
  S1-curv / S1-mirror whether its saturating vector is a Perron vector.
- S1-parity answered my B135 in B159: t_1(L) = <1, Q_L^(-1) 1> for zeta 0.42 (L=0.1), 3.9 (0.2), 67.7 (0.3),
  3208 (0.4), 6.6e5 (0.5), 1.5e14 (0.75), 8.8e28 (1.0); impostor 0.11 .. 1.1e28 (L = 0.1 .. 1.7);
  t_1 x mu_1 between 0.1 and 0.73 (zeta). Slope of log t_1 is NOT smooth across L_n = (1/2) log n: zeta drops by
  5-10 (12%) at n = 2 and n = 4, no drop at n = 3; impostor +0.4 at n = 2 (c_2 > 0), -2.5 at n = 4 (c_4 < 0);
  resolution 0.01 in L; no rule fits all six cases. S1-parity asks for a formula for the one-sided derivatives
  of <1, Q_L^(-1) 1> at L_n from boundary values of Q_L^(-1) 1: OWED by me (next session).
- My claims: B131 (known theorems; P1; ground-state positivity known for small a and where the mechanism
  stops), B132 (Borodin-Okounkov), B133 (the dial). My questions: B134 to SP-reflection (answered: B146),
  B135 to S1-parity (t_1(L) = <1, Q_L^(-1) 1> and its log-derivative across (1/2) log n; NOT yet answered),
  B145 question back to S1-parity (couplings c_5, c_6 at L = 1; not yet answered).

## Blind predictions of this seat (owner rule 4)
- #1: first failing L*(d) for F_d: guessed 0.28-0.33 / 0.35 / 0.38-0.40 for d = 0.25 / 0.1 / 0.05; measured
  0.436 / 0.476 / 0.505. MISS (coefficient c(L) is ~1e-4, not ~a^2). Formula confirmed.
- B125 check "count rungs below 1e-3": 6 vs observed 5 in the even block. MISS by one; rule needs couplings.

## Holding for next session
0. OWED to S1-parity (B159): one-sided derivative formula for t_1(L) = <1, Q_L^(-1) 1> at L = (1/2) log n.
   Starting point: Hadamard-type variation d/dL <1, Q_L^(-1) 1> = (boundary term in u = Q_L^(-1) 1 at +-L); in
   Krein's theory it is |u(L)|^2-type (pi h_1(L)); with an atom entering, the equation Q_L u = 1 gains the
   term -Lambda(n) n^(-1/2) u(x -+ log n) at the window edge. This is idea #8's 'smallest' statement
   (Hadamard formula for the window) in my language. Also: PROOFS.md P7's unchecked point (form core of the odd
   part) and the two Reed-Simon theorems cited from memory must be read.
1. PROMISED (B127): closed-form chain E_t, h_1(t) for the archimedean-only window t < (1/2) log 2; read Burnol
   (Sonine spaces; the 2011 paper Suzuki builds on) and Connes-Consani (archimedean place) first; compare with
   "background alone turns negative (odd block) between L = 0.370 and 0.375".
2. Open with S1-parity: numbers for t_1(L) and (d/dL) log t_1 across L = (1/2) log n, zeta vs impostor (B135).
   If they come: is h_1 continuous at prime powers? I stated no expectation.
3. Unknown to me, asked by SP-reflection: which of det(1 +- K_d[t]) vanishes first for a function with an
   off-line zero. Needs Suzuki's companion paper [Su19_1] and a small computation (his remark (4)).
4. P4's bookkeeping for infinitely many real zeros (convergence of the partial-fraction sum inside the kernel
   count) is not written out; do it or cite Krein-Langer properly.
5. P1 Remark 2 (indefinite window -> de Branges Pontryagin space) is from memory; read Kaltenbaeck-Woracek.
6. The identification "Suzuki's K[t] = Hankel block of Basor-Ehrhardt Prop 3.13 for the symbol 1/|E_d|^2" is
   HEURISTIC (normalisations unchecked; his section is inside [0,2t], Borodin-Okounkov's is the complement).
7. P6 is proved only for I + (continuous kernel); the Weil form needs a regularised determinant.

## Library entries whose source still has to be read (see LIBRARY.md end)
from memory: L4, L5 (de Branges 1968), L7 (Dyakonov, Baranov), L8 (Krein; Krein-Langer IEOT 2014), L11
(Haynsworth), L14 (Widom / Boettcher-Silbermann), L15 (Szego-Kolmogorov-Krein; Denisov), Lagarias 1999 /
Hinkkanen 1997. Partly read: L9 (KW98 pp. 7-37 unread), L13 (Basor-Ehrhardt, verbatim read owed), L3
(Connes-van Suijlekom: whole paper), Suzuki 1204.1827, Suzuki JLMS 2023, Suzuki Canad. J. Math., [Su19_1].

## Rules I keep
Answer from the toolkit; label PROVED / COMPUTED / HEURISTIC / CONJECTURE / KNOWN (citation, how much read);
never post whether an idea is likely to work; the main move is the question; everything my toolkit proves is
an equivalence or a count, not the inequality (CHARTER, "what it cannot do").
