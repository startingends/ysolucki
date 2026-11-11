# K-atlas PROGRESS (keeper of the failure atlas)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Atlas written only through `tools/records.py atlas`.

## Session 1 (2026-11-10 23:57 start; container restart in the middle; resumed 2026-11-11)

### Before the restart (nothing was written to the atlas; only reading)
Read in full: claude.md, SUBAGENT_PREAMBLE, PROJECT_BRIEF, ATLAS (F1-F3), HUB, KEY_LEMMA_SHAPE, KNOWLEDGE,
r1_judge/JUDGEMENT.md, IDEAS.md #1-#21, r1_audit/AUDIT.md, PROGRESS of r1_A..D and the four critics,
r2_cubic / r2_curv / r2_parity PROGRESS and their three refuters, r2_judge PROGRESS (predictions only, no
JUDGEMENT.md exists), r2_free PROGRESS, e9/e10/e21 PROGRESS, PROOF_bochner_parity, PROOF_first_failure,
PROOF_uniqueness, PROOF_trickle (Lemma D), UNDERSTANDING, THEORY, NOTEBOOK N9-N32.

Corrections to the seed entries found while reading (applied with `atlas set`):
- F3 said "the entire deficit sits in open paths at the window edge". REFUTED by R2-curv-ref: Gamma-normalised
  constant at the centre: squares only 0; squares+Hessian 0.240; squares+open 0.200; all three 0.522. Deleting the
  open-path term LOWERS the constant.
- F2: Lemma B (trickle-down with negative diagonal) is KNOWN: Braenden-Leake arXiv 2304.13203 Lemma 2.8 (refuter read pp. 6-9).
- F3 / W-curv-3: "primes and Gamma need different reflections" is true only OFF the integers: on integers a, b >= 2
  the matrix [w(log ab) + Lambda(ab)/sqrt(ab)] is PSD (refuter R9: min eig -2.1e-16, 2 <= a, b <= 60).

### After the restart
(see below, written as I go)

### After the restart: atlas completed to 25 entries (F4-F25 added, F1-F3 corrected), MEMORY.md checkpoint written.

### PREDICTIONS written BEFORE computing (2026-11-11, script signs.py.txt; rule 4)
Object: the lowest eigenvector of each parity block of the window Weil form, folded to (0, L]; S = number of sign
changes on a 2000-point grid (points with |f| < 1e-9 max|f| ignored). S1-parity found S = 0 for zeta at L = 0.75, 1 (B58 Fact 2).
- P1 zeta: S = 0 in both blocks at L = 1.0 and at L = 1.6.
- P2 DH impostor BELOW its failure (L = 1.0 and 1.6 < L* = 1.71): S >= 1 in at least one block (my confidence: 65%).
  Reason: the DH analogue of the near-null vectors is e^(u/2) sum a(n) phi(n e^u) with a = (1, xi, -xi, -1, 0) mod 5,
  which changes sign. If S = 0 for DH below L*, the sign of the ground state is NOT an early warning (pairing F10 x F21 = no).
- P3 DH at L = 1.72 (just past failure, eigenvalue -7.9e-30 in the even block): S >= 20 in the even block
  (a wave packet near frequency 85 would have about 85 x 1.72/pi = 46).
- P4 zeta with the prime 5 REMOVED (all other weights true): negative already at L = 0.815 (first failure within 0.01 of
  (1/2) log 5 = 0.8047), the ODD block fails first, and at L = 0.90 the values are -0.12 (even) / -0.45 (odd), the
  'two-prime world' row of board B19. Control: with 5 present all values positive (about 1e-17 .. 1e-21).
- P5 Hausdorff 1x1 test at p = 2: c(4) - c(16) = (log 2)(x - 1)(1/x^2 - x), x = 2^(2d): -0.0403 at d = 0.1, 0 at d = 0.

### RESULTS (COMPUTED, signs.py.txt on lane A's validated builder r1_A/weil.py.txt, Arb midpoints / mpmath; logs signs_zeta1.log,
### signs_gs.log, signs_rm5.log; each run under flock heavy.lock + memcap 1; total under 10 s; ONE implementation, not certified)
- P1 HIT. zeta folded ground states: 0 sign changes, both blocks, L = 1.0 (N = 60: 7.297e-30 / 1.803e-26) and L = 1.6
  (N = 120: 2.888e-117 / 6.107e-113).
- P2 MISS. DH below its failure: 0 sign changes in BOTH blocks at L = 0.5, 1.0, 1.6, 1.70 (eigenvalues 0.299/1.44,
  3.4e-5/1.3e-2, 5.2465e-23/4.04e-19, 1.11828e-28/7.0e-25; the 1.6 and 1.70 values equal lane A's 5.2e-23, 1.1183e-28).
  So one-signedness of the folded ground state does not use the sign of the couplings and is NOT an early warning.
- P3 MISS, and the miss is the finding. DH at L = 1.72: the vector of the eigenvalue -7.91085e-30 (lane A: -7.9109e-30)
  has 0 sign changes (min/max over max = 4.5e-15 / 1), largest mode k = 1 (frequency 1.83), share 0.485: it is NOT a wave
  packet at height 85.7; it is the bottom rung of the prolate ladder, a one-signed function, that crosses zero. Same at
  L = 1.74 for the odd block (-2.084e-26, 0 sign changes above the 1e-9 threshold; min/max = -4.2e-11). The packet at
  frequency 84.3 reported by lane A belongs to the eigenvalue -0.263 at L = 1.9, well past the failure.
  Consequences: (a) notebook N13's picture of the null vector at a first failure (a wave packet at the height of the bad
  zero) is wrong at the failure itself; (b) a one-signed null vector EXISTS for an impostor, so no key lemma of the form
  'a null vector must change sign' / 'Perron positivity excludes a null vector' can be true; (c) S1-parity's Fact 2
  (board B58) holds for DH as well, whose couplings are 51% negative: it is a property of the ladder, not of the primes.
- P4 HIT. zeta with the prime 5 removed: L = 0.800: identical to the control; 0.806: +1.08e-17 / +9.50e-15 (control
  +1.01e-17 / +9.64e-15); 0.810: +8.2e-18 / -4.36e-14; 0.815: -3.4e-16 / -6.1e-5; 0.82: -2.4e-8 / -0.0148; 0.85: -0.0117 / -0.211;
  0.90: -0.11728 / -0.45431 (board B19: -0.12 / -0.45). First failure L*(5) in (0.806, 0.810], i.e. (1/2) log 5 + (0.0013, 0.0053];
  the ODD block fails first; while still positive the EVEN block is slightly RAISED by the removal (as Fact 3 says).
  With board values: L*(2) - (1/2) log 2 in (0.0234, 0.0284), L*(3) - (1/2) log 3 in (0, 0.0107).
- P5 (hand, checked): (log 2)(x - 1)(1/x^2 - x) at x = 2^0.2 = 1.148698: -0.040284.
- A derivation I got WRONG first and corrected before recording: 'a missing prime q = zeros of 1 - q^-s on Re s = 0, so
  Theorem 4 counts it'. False as an identity: 1 - q^-s has no functional equation; the correct statement is
  Q_{zeta without q}(f) = Q_zeta(f) + (log q/2 pi) int |fhat(t)|^2 (P_r(t log q) - 1) dt, P_r the Poisson kernel, r = q^(-1/2)
  (the Poisson-kernel form q_p of board B65), which is indefinite: negative where t log q is near pi mod 2 pi.

### Pairing job (done in this session)
- All 300 pairs of the 25 entries recorded with `records.py atlas pair` (texts in pairs_a.py.txt, pairs_b.py.txt, driver
  pairs_run.py.txt; the driver skips pairs already recorded). Verdicts: 290 no, 6 maybe, 4 yes.
- Method: needs sorted into kinds (convergence / formula or sum-of-squares identity / prime-side impossibility / estimate /
  separating quantity / sum rule / zero-free region / Hilbert space / geometry / centre-knowing input / soft existence),
  supplies into kinds (exact finite stage / sum of squares / exact count / rigidity / control instrument / proved floor /
  localisation curve). Time went to the pairs where a supply-kind meets a need-kind; about 110 pairs with no contact in
  kind carry the one-line 'No relation' (honest, but not individually reasoned beyond the kinds).
- yes (all four are reformulations already made in the record): F1xF6, F2xF3, F2xF8, F3xF8.
- maybe: F2xF22, F3xF22 (two-block / mirror; already on the board), F9xF22 (visibility law = tilt threshold, slope 1/2),
  F12xF13 (= main idea #15), F12xF21 (missing-prime law on the window), F17xF22 (F_d = Eisenstein L-function; B11 = WJ8).
- Two pairs I expected to be maybe/yes and found to be no by computing or by finding my own error: F4xF21 / F10xF21
  (nodeless null vector for the impostor) and F7xF22 (no symmetric zero side for a missing prime).
- Board s1: read B1-B146; posted three questions: B147 (F17xF22, to S1-mirror), B148 (nodeless null vector + missing-prime
  law, to S1-parity), B149 (F9xF22, to S1-curv).
- Atlas updates after the coordinator's messages: F1 restated (Connes-van Suijlekom hypotheses; digest read, paper not),
  F22 supplies (tilt identity, d_c table, second involution), F2/F3 breaks (blind to the tilt), F3 supplies (G4),
  F10 needs (a definition of the Krein function now exists on the board), F22 needs (no infrared upper bound found).
- Local idea log: K-atlas/#1 .. #7.

### Answer to board B160 (S1-socrates): the finite sentence for 'no prime' on [-0.40, 0.40]
PREDICTION before computing (bg.py.txt): with the explicit odd trial function f(x) = sin(pi x/(2L)) on [-L, L], L = 0.40,
pole(f) + arch(f) is NEGATIVE, between -0.10 and -0.02 per unit norm (the lowest odd eigenvalue in lane A's periodic basis is
-0.077 at N = 200, the half-integer basis gives lower values, and my f is the first half-integer mode). Check of the formula:
the same code on f = sin(pi x/L) must reproduce L x (first diagonal entry of lane A's odd block without primes).
RESULT (bg.log): formula check HIT (0.00134818794253 both routes, 12 digits). Prediction MISSED: f = sin(pi x/(2L)) gives
Q_bg(f)/|f|^2 = +0.0194 at L = 0.40 (pole -0.00847, arch +0.01625, |f|^2 = 0.4): POSITIVE. The first half-integer mode is not a
witness. Next (bg2.py.txt): odd polynomials c1 x + c3 x^3 + c5 x^5 on [-0.4, 0.4]; prediction: the best one is negative,
between -0.12 and -0.05 per unit norm (below the periodic-basis value -0.077, since polynomials do not vanish at the edge).
RESULT (bg2.log): prediction HIT (-0.0774 in (-0.12, -0.05)). Witness f(x) = x - 5.07 x^3 - 0.208 x^5 on [-0.4, 0.4]:
|f|^2 = 0.0130945171, pole = -0.0002392346, arch = -0.0007741813, Q_bg(f) = -0.0010134159. Autocorrelation g < 0 on
u in (0.2593, 0.8), min -0.0063978 at u = 0.46, g(log 2) = -0.0017172. One-vector consequence and control rows:
ANSWER_B160.md (posted on the board as the answer to B160). NOT NEW as numerics: Connes-Consani 2106.01715 sec. 2.2, 2.4
(digests grepped, not read): sign change of the archimedean form past log 2 and the omitted-prime-power effect for
2, 3, 4, 5, 7. So prediction P4 (prime 5 removed) reproduced a known numerical effect; recorded in F21 and in K-atlas/#2.
A first, over-long version of the board answer was refused by the tool (4000-character limit); nothing was posted twice.
