<!-- local-idea-log owner=K-atlas -->
# Local idea log of K-atlas

Private working log of agent `K-atlas`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `K-atlas/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Atlas F17 x F22 (maybe): the twisted control F_d is an Eisenstein L-function, so barrier B11 = half-shift wall WJ8
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: The fake zeta that killed idea 21, zeta(s-d) zeta(s+d), is a known object: it is the L-function of an Eisenstein series whose 'pitch' is off by d. Example: d = 0.1 gives coefficients sigma_0.2(n)/n^0.1 = 1, 2^0.1 + 2^-0.1 = 2.005 at n = 2. Number theorists exclude such off-pitch objects not prime by prime but by squaring the whole series and looking at where its pole sits (1 + 2d instead of 1).
- claim: sum_n sigma_2d(n) n^(-d-s) = zeta(s-d) zeta(s+d); real tilts = complementary series, imaginary = tempered; mirror positivity (|a_p| >= 2) is the prime-side form of 'locally unitary, not tempered'; the non-local condition that excludes it is quadratic: rightmost pole of L(s, F x F~) at s = 1 (F_d and G_d: 1 + 2d).
- first test: Ask S1-mirror / SP-reflection (posted as board B147). Compute: the Weil form of F_d x F_d against that of F_d on L = 0.75; does the tilt threshold d_c halve?
- kill line: The identification is wrong (check against a source), or the Rankin-Selberg square has no expression on the window.
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #2 · Atlas F12 x F21 (maybe): missing-prime law on the window: first failure at (1/2) log q + eps(q), odd block
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Take the true energy test and delete one prime. The test stays exactly the same until the window is wide enough to see that prime, and breaks almost at once after. Example: delete 5; the prime 5 enters at window half-width 0.8047; at 0.806 the energy is still positive (9.5e-15), at 0.810 it is negative (-4.4e-14).
- claim: Q^(q)(f) = Q(f) + (log q/2 pi) int |fhat(t)|^2 (P_r(t log q) - 1) dt, r = q^(-1/2) (exact); first failure L*(q) = (1/2) log q + eps(q), eps(2) in (0.0234, 0.0284), eps(3) in (0, 0.0107), eps(5) in (0.0013, 0.0053], odd block first. Conjecture: provable unconditionally for every q, as the Nyman-Beurling fee is.
- first test: Done for q = 5 (signs_rm5.log). Next: q = 7, 11 with bisection; an interval-arithmetic certificate for q = 2 at L = 0.40; a uniform proof from an explicit co-Poisson trial vector.
- kill line: eps(q) does not decrease with q, or the even block fails first for some q.
- log:
  - 2026-11-11: NOT NEW as numerics: the omitted-prime-power effect (2, 3, 4, 5, 7) and the sign change of the archimedean form past log 2 are in Connes-Consani arXiv 2106.01715 sec. 2.2, 2.4 (digests rh/library/2106.01715.md, connes-consani-zeta-cycles.md; grepped, not read in full). What I added: the odd-block-first observation for q = 5, the Poisson-kernel identity, and an explicit one-vector witness for 'no primes' on [-0.4, 0.4] (bg2.log), posted as the answer to board B160.
  - 2026-11-11: audit: not promoted: merged into main #14

## #3 · Atlas F9 x F22 (maybe): the near-line visibility law and the tilt threshold are one first-order statement; slope 1/2
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Two instruments measure the smallest displacement of zeros a window can see: moving one pair (round 1) and tilting all of them (seminar). Both say the same thing: the window sees a displacement delta when delta^2 times a huge constant reaches 1, and the constant is 1/(lowest energy). Example: at half-width 1 the lowest energy is 8e-30 and the smallest visible tilt is 4.9e-13.
- claim: d_c(L)^2 = mu_e(L)/c(L); ln(1/d_c) against X = 4 pi e^(2L) has slope tending to 1/2; from S1-parity's table the successive slopes are 0.370, 0.418, 0.412, 0.448, 0.452, 0.458; the surgery fit gives 1/(0.9 log 14.13) = 0.42.
- first test: Posted as board B149. Compute d_c at L = 1.25, 1.5 and check the slope keeps rising toward 0.5 and not beyond.
- kill line: The slope overshoots 0.5 or stalls below 0.47 by L = 1.5.
- log:
  - 2026-11-11: audit: not promoted: merged into main #17

## #4 · Atlas F2 x F22 and F3 x F22 (maybe): the two-halves constant 5/6 as a statement about the pencil (shift form, mirror form)
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: The curvature method loses a factor 2 when asked point by point, 1/6 when asked on the two halves of the window, nothing on the whole. The two-halves version is exactly the 'mirror' picture of idea 21. Example: zeta 0.8364, mean-field model 0.8333, Beurling control 0.8204.
- claim: rho_half is a function of (T, H, lambda_1) and its deficit is the mirror-crossing term (PROVED by S1-curv, B97); open: a two-block certificate given by a formula in T and H.
- first test: Already on the board (B65, B66, B95, B97, B104). Nothing new computed by me.
- kill line: Every two-block certificate is again the cone tensor (then nothing is gained over Lemma C).
- log:
  - 2026-11-11: audit: not promoted: merged into main #24

## #5 · Atlas F12 x F13 (maybe): one price list C(S) for missing primes = main idea #15
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Same as main idea #15; listed here because the atlas pairing reproduces it.
- claim: local(S) <= C(S) <= kappa local(S), kappa < 1.3, for every set S of primes.
- first test: Exact C({3}) (Szego); one thin infinite S.
- kill line: C({q})/fee grows with N past 1.5.
- log:
  - 2026-11-11: audit: not promoted: merged into main #15

## #6 · Atlas yes-pairings (reformulations already on the record): F1 x F6, F2 x F3, F2 x F8, F3 x F8
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Four pairs where one failure supplies exactly what the other lacked, and where the combination has already been made: the window stage answers the convergence wall (idea 8); cubic certificate = curvature (Theorem F, block curve (1+3 theta)/(2+2 theta)); the fibre-bordered form repairs the signature target (Lemma A, B32); signature + two scalars t_e > 1, t_o > -1 = RH on a window (B56).
- claim: See rh/ATLAS.md, pairs F1 x F6, F2 x F3, F2 x F8, F3 x F8. All four are reformulations (owner rule 2): none is a route.
- first test: None needed.
- kill line: n/a
- log:
  - 2026-11-11: audit: not promoted: audit R3-AUD: not promoted: a pointer to four atlas pairings (F1 x F6, F2 x F3, F2 x F8, F3 x F8) already recorded in rh/ATLAS.md, each a reformulation by the seat's own statement; their contents are on main #8, #23, #24

## #7 · NEGATIVE RESULT (atlas F4 x F21, F10 x F21): the impostor's null vector at its first failure is nodeless
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: I expected the special vibration at the moment the impostor's energy first touches zero to be a fast wave tuned to its bad zero (about 46 sign changes). It is not: it has no sign change at all and looks like zeta's own lowest vibration. Example: at half-width 1.72 the energy is -7.9e-30 and the vibration is 48% in the slowest mode.
- claim: DH, L = 0.5, 1.0, 1.6, 1.70, 1.72, 1.74: folded eigenvector of smallest-modulus eigenvalue has 0 sign changes in both blocks. So no key lemma can say 'a null vector must change sign', and the sign pattern of the ground state is not an early warning.
- first test: Done (signs_gs.log). Check wanted: S1-parity's second implementation at 1.72 and 1.74 (asked in board B148).
- kill line: A second implementation finds sign changes at L = 1.72.
- log:
  - 2026-11-11: audit: not promoted: merged into main #8

## #8 · Atlas F22 x F30 (maybe): nodeless minimiser (N) + copositivity on the positive cone (C) for the odd block
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: The energy test splits into an even and an odd half, and the odd half alone decides RH. In the odd half the primes enter through a 'mirror' term that is automatically non-negative whenever the test vibration has one sign. So if the lowest odd vibration always has one sign (it does in every computed case), the whole question becomes an inequality on one-signed vibrations: one square coming from the pole must stay below three non-negative pieces. Example at window half-width 1: the pole square is paid 5.7% by the smaller window, 43% by the trivial zeros and 51% by the primes, of which the prime 2 alone pays 50 points.
- wall: (auditor R3-AUD) Barrier B3 (no slack) and the signature walls WJ13/WP1, for the ODD block, which alone is equivalent to RH (Yoshida 1992 Prop. 1, KNOWN via Suzuki 2606.09096 p. 2). It does not remove B3: it moves all the arithmetic into a COPOSITIVITY statement (C), required only on one-signed functions, where each prime power enters with a definite sign (its mirror term (phi*phi)(log n) is >= 0 for phi >= 0; shift parts of atoms with log n >= L vanish: S1 Fact 1, FORMAL). It meets B3 again exactly as follows (S1-parity, board B207 (3)): on zeta's own odd extremal vector at L = 1.5 the margin of (C) is about 1e-83 of E_+^2 while the prime 19 still carries 1e-64 of the prime share, so dropping any single prime power below e^(2L) breaks (C) on that vector; (C) has no more slack than the block. B1: the Euler product enters only as Lambda >= 0, the impostor's first false line (S1-parity S2_B6 (c): its couplings on its own failure vector sum to -0.033). B2: the impostor does not satisfy the hypotheses of the trichotomy (no pole, signed couplings).
- new input: (auditor R3-AUD) Restriction of Weil's form to the cone of non-negative functions on (0, L] (copositivity on the orthant instead of positive semidefiniteness), made legitimate by a Perron property: the background odd block is a Perron operator (Beurling-Deny plus the method of images; T84, T85), so the odd minimiser can be one-signed, and on one-signed vectors the sign of the prime weights is usable term by term. Exact split (S1-parity S2_B6 (b)): the odd block on phi is Q_half(phi) + sum_{m>=1} E_m^2 + H_Lambda(phi) - E_+^2: one rank-one pole square against three non-negative terms.
- claim: (N) for every L the odd-block minimiser is nodeless; (C) for phi >= 0 on (0, L]: E_+^2 <= T_W + sum_{m>=1} E_m^2 + H_primes. (N) and (C) together are the odd block, hence RH (Yoshida). (N) is proved below (1/2) log 2 and is not arithmetic (the impostor has it); (C) must carry the arithmetic. No exact factor: shares 0.187+0.560+0.259 (L = 0.45) to 0.050+0.413+0.537 (L = 1.25).
- prediction: (auditor R3-AUD) The seat fixed none before computing (FAILS RULE 4 for this entry as written). The one blind prediction on record for the route is S1-mirror's for its first-prime bound (rh/experiments/s1_seminar/mirror/NOTES.md, 00:48 UTC, R1-R4, before firstprime.py.txt ran): R2, R3 hit, R1 half, R4 miss; the bound requires weight >= 1.10 for a 'prime' at 2.1 at L = 0.40, where log 2.1 = 0.742 is available, so that Beurling system is excluded, while the true atom at 2 needs >= 0.407 and has 0.693. Computed afterwards (S1-parity B119, B207): (N) holds on all 11 positive rows (zeta, no primes, one prime, impostor below failure); on 8 failed control rows (N) holds and (C) fails on 3, (N) fails and (C) holds on 1, both fail on 3, impostor at L = 1.8 undecided.
- smallest: (auditor R3-AUD) PROVED already: (N) on every window without an atom, L <= (1/2) log 2 (T85; three independent write-ups S1-parity B169, SP-operator P7, S1-mirror B174; finite Perron step FORMAL B189; existence of a minimiser cited) and the first-prime inequality (T86; S1-mirror PROOF_first_prime.md). Smallest OPEN statement: (C) on (1/2) log 2 < L < (1/2) log 3, where only the prime 2 is present: E_+^2 <= T_W + sum_{m>=1} E_m^2 + c (phi*phi)(log 2) for all phi >= 0 on (0, L]. S1-parity (B207 (2)) names the missing piece: a lower bound for the mirror autocorrelation (phi*phi)(log 2) of a one-signed phi in terms of E_+(phi)^2 minus the Gamma squares, a statement about positive functions that contains no prime. (N) on the same window is open: Beurling-Deny fails at the mirror atom of 2.
- first test: Posted to S1-parity (board). Next: check the (N)/(C) split on the control rows of B119; try (C) on the one-atom window with the cone restriction.
- kill line: A control row where both (N) and (C) hold and the odd block is negative (then the splitting is wrong); or the odd ground state of zeta acquires a node at some L.
- novelty: (auditor R3-AUD) One web query by the auditor, 2026-11-11 ('Weil explicit formula positivity odd test functions copositive one-signed ground state window', titles and summaries only): nothing on parity blocks, copositivity or one-signed ground states; hits were Connes-Consani 2006.13771 (archimedean window; read whole by a reader, digest in rh/library) and Suzuki-operator preprints (one unrefereed numerical paper, arXiv 2607.24830, not read). In the record: atlas pairing F22 x F30 (rh/ATLAS.md), F30 (nodeless ground states), S1-parity S2_B6.md ('I know no exactness theory for copositivity; in finite dimension it is NP-hard in general'). KNOWN parts: odd block alone is RH (Yoshida 1992 via Suzuki p. 2); the Perron step (Reed-Simon IV XIII.43-44, 50, from memory). Not established as new.
- evidence: (auditor R3-AUD) COMPUTED shares of E_+^2 on zeta's odd extremal vector (S1-parity B207, 120-230 digits): L = 1.0: half window 0.057 + Gamma squares 0.430 + prime mirror 0.513; L = 1.5: 0.045 + 0.401 + 0.554; prime 2 carries 0.954 of the prime share at L = 1.5. Seminar S1 closing (rh/experiments/s1_seminar/socrates/CLOSING.md, item B158): S1-mirror's 'odd-block Perron + first-prime inequality' was the one statement offered with controls that violate it; its author: 'it selects nothing'. Notebook N59 (S2): the same split reappears as Vaughan's identity at sqrt(D).
- log:
  - 2026-11-11: promoted to main #28 by R3-AUD

## #9 · Atlas F39 x F41 (maybe): transport the off-line zero into a large value of S_X, where recurrence is free (Turan/Kronecker), then count with the mean value theorem
- status: open
- source: K-atlas
- date: 2026-11-11
- claim: beta > 0 => |S_X| >= X^(delta+beta)/(C log X) on measure >= T r(X) in [T,2T]; mean value bounds it by (T+X) X^(-2 beta) log^2 X; contradiction iff r(X) >> X^(-2 beta). Obstruction: every unconditional recurrence for pi(X) independent frequencies has r(X) = exp(-c X/log X). Classical Turan route; recorded as the precise gap.
- log:

## #10 · Atlas F21 x F38 (maybe): fake weights hiding an off-line quartet on every window must be unbounded in l^1 (B170 argument)
- status: open
- source: K-atlas
- date: 2026-11-11
- claim: If c(L) restores W_inf + poles >= 0 on [-L, L] for every L then sup_L sum|c_s(L)| = infinity. Obstruction: hiding weights are re-optimised per window over a growing set; dual weights already 1e35 at L = 1.8 (N96). Detection criterion, RH-equivalent for zeta.
- log:
