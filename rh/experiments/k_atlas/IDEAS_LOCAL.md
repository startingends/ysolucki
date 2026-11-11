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

## #3 · Atlas F9 x F22 (maybe): the near-line visibility law and the tilt threshold are one first-order statement; slope 1/2
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Two instruments measure the smallest displacement of zeros a window can see: moving one pair (round 1) and tilting all of them (seminar). Both say the same thing: the window sees a displacement delta when delta^2 times a huge constant reaches 1, and the constant is 1/(lowest energy). Example: at half-width 1 the lowest energy is 8e-30 and the smallest visible tilt is 4.9e-13.
- claim: d_c(L)^2 = mu_e(L)/c(L); ln(1/d_c) against X = 4 pi e^(2L) has slope tending to 1/2; from S1-parity's table the successive slopes are 0.370, 0.418, 0.412, 0.448, 0.452, 0.458; the surgery fit gives 1/(0.9 log 14.13) = 0.42.
- first test: Posted as board B149. Compute d_c at L = 1.25, 1.5 and check the slope keeps rising toward 0.5 and not beyond.
- kill line: The slope overshoots 0.5 or stalls below 0.47 by L = 1.5.
- log:

## #4 · Atlas F2 x F22 and F3 x F22 (maybe): the two-halves constant 5/6 as a statement about the pencil (shift form, mirror form)
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: The curvature method loses a factor 2 when asked point by point, 1/6 when asked on the two halves of the window, nothing on the whole. The two-halves version is exactly the 'mirror' picture of idea 21. Example: zeta 0.8364, mean-field model 0.8333, Beurling control 0.8204.
- claim: rho_half is a function of (T, H, lambda_1) and its deficit is the mirror-crossing term (PROVED by S1-curv, B97); open: a two-block certificate given by a formula in T and H.
- first test: Already on the board (B65, B66, B95, B97, B104). Nothing new computed by me.
- kill line: Every two-block certificate is again the cone tensor (then nothing is gained over Lemma C).
- log:

## #5 · Atlas F12 x F13 (maybe): one price list C(S) for missing primes = main idea #15
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Same as main idea #15; listed here because the atlas pairing reproduces it.
- claim: local(S) <= C(S) <= kappa local(S), kappa < 1.3, for every set S of primes.
- first test: Exact C({3}) (Szego); one thin infinite S.
- kill line: C({q})/fee grows with N past 1.5.
- log:

## #6 · Atlas yes-pairings (reformulations already on the record): F1 x F6, F2 x F3, F2 x F8, F3 x F8
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: Four pairs where one failure supplies exactly what the other lacked, and where the combination has already been made: the window stage answers the convergence wall (idea 8); cubic certificate = curvature (Theorem F, block curve (1+3 theta)/(2+2 theta)); the fibre-bordered form repairs the signature target (Lemma A, B32); signature + two scalars t_e > 1, t_o > -1 = RH on a window (B56).
- claim: See rh/ATLAS.md, pairs F1 x F6, F2 x F3, F2 x F8, F3 x F8. All four are reformulations (owner rule 2): none is a route.
- first test: None needed.
- kill line: n/a
- log:

## #7 · NEGATIVE RESULT (atlas F4 x F21, F10 x F21): the impostor's null vector at its first failure is nodeless
- status: open
- source: K-atlas
- date: 2026-11-11
- plain english: I expected the special vibration at the moment the impostor's energy first touches zero to be a fast wave tuned to its bad zero (about 46 sign changes). It is not: it has no sign change at all and looks like zeta's own lowest vibration. Example: at half-width 1.72 the energy is -7.9e-30 and the vibration is 48% in the slowest mode.
- claim: DH, L = 0.5, 1.0, 1.6, 1.70, 1.72, 1.74: folded eigenvector of smallest-modulus eigenvalue has 0 sign changes in both blocks. So no key lemma can say 'a null vector must change sign', and the sign pattern of the ground state is not an early warning.
- first test: Done (signs_gs.log). Check wanted: S1-parity's second implementation at 1.72 and 1.74 (asked in board B148).
- kill line: A second implementation finds sign changes at L = 1.72.
- log:
