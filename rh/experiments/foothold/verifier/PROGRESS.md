# V-FH (verifier of the foothold seat) PROGRESS

Track: VERIFICATION. Default when unsure: gap / not verified. No commits. Files only in this folder.
All numerical jobs: `python3 tools/memcap.py 1 <cmd>` from the repo root.

## 0. Read (2026-11-11)
docs/SUBAGENT_PREAMBLE.md (full); rh/FOOTHOLDS.md (full); foothold/PROGRESS.md (full);
PROOF_window_prime2.md (full, line by line); PROOF_forcing_prime2.md (full, line by line);
cert.py.txt, forcing.py.txt, validate_x.py.txt, explore.py.txt (full); cert_log3_R40_n56.log, forcing_half.log (full);
r1_A/weil.py.txt (header + build/even_block/odd_block); e9_bootstrap/sieve.py.txt, e10_lorentzian/tests.py.txt (calling pattern).

## 1. Paper check, first pass (before any computation)
Theorem A, by hand: Lemma 1, 2, 3 re-derived: fine. Cap (2.1): fine. Matrix (3.1)-(3.2): re-derived the constants
(F_n = i^n sqrt(2L(2n+1)) j_n(rL), G_jk prefactor 2L/pi, pole sign s_pi): fine. Lemma 4: Poisson integral and the
double-factorial identity re-derived: fine. Cross terms in (4.1): re-derived with the factor 2 (form = diag + 2 Re cross),
both the G part and the pole part: the eps12 of the text is the right half-coefficient. Fine on paper.
Theorem B, by hand: Lemma 5 re-derived (Gauss formula, t = 2x, constant -Ein(4L) + E_1(4L) = -gamma - log 4L): fine.
Lemma 6, 7, 8 re-derived: fine on paper. Points still to test by machine: arb(mid, rad) constructor in Hk, digamma on a
ball containing a pole, integer powers of acb, arb.max/min semantics, and that the sweep's covering is gap-free.

## 2. PREDICTIONS (written 2026-11-11 before running any of my own code; the author's numbers were visible to me,
so items marked [not blind] are reproduction targets)
(i) Fourier/Arb builder r1_A/weil.py.txt, lowest eigenvalue of the true form (truncation N of the periodic basis gives an
    UPPER bound for the infimum over L^2; it can refute a lower bound, never confirm one):
    - L = 0.5: even about 9.3e-7 at N about 40 [not blind: r1_A 9.34e-7], decreasing in N, limit in [8.9e-7, 9.1e-7]
      (the author's polynomial value 9.0567e-7 should be within 1e-8 of the limit); odd limit in [1.90e-4, 1.97e-4].
    - L = (1/2) log 3: BLIND (the author gives no exact-form value at this L): even limit in [5.0e-8, 6.0e-8]
      (my guess 5.4e-8 = capped R=160 value 5.22e-8 times the 1.03 ratio seen at L = 0.5); odd limit in [1.4e-5, 1.6e-5].
      Both must stay ABOVE the certificate's 9.9998e-9 and 3.9999e-6; a value below refutes Theorem A.
(ii) Theorem B at L = 1/2 (box: y in (0.6929395, 0.6971680), m in [0.488558, 0.510367]); lambda*(y) := max over m >= 0 of
    min(lowest even, lowest odd eigenvalue):
    - y = y_left - d, d in {1e-5, 3e-5, 1e-4, 3e-4, 1e-3}: lambda* < 0, about -4e-3 * d (between -1e-3 d and -2e-2 d);
      at d = 1e-5 the Fourier value may be undecidable (truncation error about 3e-8), the polynomial value must be < 0.
    - y = y_right + d, same d: lambda* < 0, same order.
    - m = 0.488558 - d and m = 0.510367 + d, d in {1e-5, 1e-4, 1e-3, 1e-2, 1e-1}: max over y in (0, 1) of the min eigenvalue < 0.
    - inside: (log 2, log2/sqrt2): positive, 9.06e-7 (poly) [not blind]. (0.695, best m): positive. (0.6965, best m):
      positive but smaller. ALSO PREDICTED: the box point (log 2, 0.50) is NEGATIVE (the feasible set is a thin
      sliver inside the box, not the box), i.e. "inside the box" does not mean feasible.
(iii) no atom, L = 1/2: Fourier lowest eigenvalue even in [-0.0325, -0.0322], odd in [-0.3225, -0.3215] [not blind:
    author's -0.03235, -0.32223]; my own polynomial-basis code reproduces the author's values to 6 digits.
(iv) author's scripts rerun: logs reproduce digit for digit except timings.
What would change my mind: any Fourier eigenvalue below a certified lower bound; any point outside the box with a
positive polynomial-basis bottom; a mismatch in the 8th digit between my polynomial code and the author's.

## 3. Machine checks of the Arb semantics the proofs lean on (COMPUTED, `lowlevel.py.txt`)
digamma on a ball containing a pole: non-finite (so acb.integral must bisect, as the proof says); acb ** int: binary
powering, no branch cut (ball straddling the negative axis: finite, equals the product); j_n by 0F1~ against closed forms
for n = 0, 1, 2 at a complex point: agree to 1e-38; arb(mid, rad) in Hk: the ball is [0-, e+] as intended (contains 0 and e);
arb(0,1) = [-1, 1]; arb.max/min are interval max/min; comparisons of overlapping balls are False both ways. No defect found.

## 4. Author's scripts rerun (COMPUTED)
- `cert.py.txt log3 40 56 87/100 1/100000000 4/1000000 128`: 193 s; log identical to cert_log3_R40_n56.log except timings
  (rerun_cert.log). CERTIFICATE HOLDS.
- `forcing.py.txt 28 600 1/2` and `32 800 27/50`: all numbers identical (rerun_forcing_*.log). One print line differs in
  wording only: the committed logs say "[..., 1)" for the right sweep, the current script prints "[..., 2L)"; the script was
  edited after the logs were made (in forcing_0p54.log the "1" was wrong, the upper end is 2L = 1.08).

## 5. Recomputation (i), (iii): Fourier builder (COMPUTED, `fourier_true.py.txt`, Arb 160 bits, float eigenvalues)
see fourier_true.log. Against the prediction:
- L = 0.5 even: 9.50e-7, 9.374e-7, 9.344e-7, 9.336e-7 at N = 40, 80, 160, 320. PREDICTION WRONG in one respect: I expected
  the sequence to head for the author's 9.0567e-7; it does not (it flattens near 9.33e-7). Cause found in section 7: the
  author's number is not at the true atom.
- L = (1/2) log 3 (blind): even 5.535e-8 at N = 320 (predicted limit in [5.0e-8, 6.0e-8]: inside); odd 1.526e-5, still
  falling like 1/N (predicted [1.4e-5, 1.6e-5]: inside). Both above the certified 9.9998e-9 and 3.9999e-6: no refutation.
- no atom, L = 0.5: even -0.0323536 (N = 320), odd -0.32161 and still falling like 1/N towards about -0.3222. As predicted.

## 6. My own polynomial code (COMPUTED, `vlib.py.txt` class Poly, `poly_check.py.txt`)
Written from Lemma 5 after re-deriving it; orthonormal Legendre basis, Gauss-Legendre in u and x, mpmath 34 digits; shares
no code with forcing.py.txt. No-atom lowest eigenvalues, degree < 28, L = 1/2: -0.0323519539485215 (even),
-0.322228344654863 (odd): the author's two Rayleigh quotients to all 15 printed digits. L = 27/50, degree < 32:
-0.0650680866127705, -0.410363725855412: same. A(v) for all 600-odd test vectors of the sweeps agrees with the author's
ball midpoints to 1.6e-33 (cover_check).
`zeros_check.py.txt`: for v = (1/4 - t^2)^4 and t(1/4 - t^2)^4 the form equals 2 sum over the first 150 zeros of |F(gamma)|^2 to
relative 4e-13 and 2e-13: the Q of both proofs IS the Weil form (normalisation of pole, Gamma term and atom all right).

## 7. FINDING: the author's "Rayleigh-Ritz value at the true atom" is not at the true atom (COMPUTED, `bottoms.py.txt`)
forcing.py.txt line 187 uses ylog2 = 693147/10^6 (1.8e-7 below log 2). The form is very sensitive to the position:
| L | degree < | at y = 0.693147 (author's number) | at y = log 2 (mine) | Fourier N = 320, y = log 2 | capped lower value, R = 320 (float, explore.py.txt) |
| 1/2 | 28 | 9.0567e-7 (reproduced: 9.0566673e-7) | 9.4166e-7 (9.3661e-7 at degree < 44) | 9.3357e-7 | 9.097e-7 |
| 27/50 | 32 | 6.447e-8 (reproduced: 6.4472671e-8) | 1.07699e-7 (1.07089e-7 at degree < 44) | 1.06334e-7 | 1.0239e-7 |
So "Upper bounds for the true bottom: 9.06e-7 at L = 1/2, 6.45e-8 at L = 0.54" (PROOF_window_prime2.md section 7, and
PROGRESS.md section 7 of the author, PROOF_forcing section 4 second bullet) is FALSE as labelled: at L = 27/50 the true
bottom lies in about [1.02e-7, 1.07e-7] (float), 60% above the quoted "upper bound". Not part of either theorem.

## 8. Recomputation (ii): Theorem B, box tests (COMPUTED, `boxtest.py.txt`, boxtest.log; `cover_check.py.txt`)
- y direction (best m for each y): every point at or outside the box edge is negative in all three computations
  (polynomials of degree < 28; Fourier N = 160, 320). Left edge: -1.11e-6 at d = 0, -1.85e-6, -3.32e-6, -8.50e-6, -2.34e-5,
  -7.69e-5 at d = 1e-5 ... 1e-3. Right edge: -1.17e-5 at d = 0, then -2.5e-5 ... -1.35e-3. PREDICTION: sign right; size
  WRONG (I predicted about -4e-3 d; the slope is about -7e-2 d on the left and -1.3 d on the right, and the value at the
  edge itself is already -1e-6 / -1e-5, i.e. the certified box is not tight).
- m direction (best y for each m): all negative: below: -1.10e-6 (d = 0) ... -4.1e-3 (d = 0.1); above: -8.0e-5 (d = 0) ...
  -8.7e-2 (d = 0.1). As predicted.
- inside: true prime: +9.417e-7 (poly), +9.336e-7 (Fourier 320). (log 2, 0.50): NEGATIVE (-8.3e-4), as predicted: the box
  is an outer bound, most of the box is infeasible. (0.6965, 0.49): negative. (0.695, 0.50): +1.19e-4 in all three
  truncations; best-m values at y = 0.6935, 0.695, 0.6965: +4.0e-5, +1.4e-4, +2.4e-4 (upper bounds only: these do NOT
  prove feasibility of any point other than the true prime).
- covering (`cover_check.py.txt`, exact rationals): L = 1/2: 47 intervals with union exactly [0, 70957/102400], 19 with
  union exactly [7139/10240, 1], no gap or overlap. L = 27/50: 45 intervals, union [0, 35487/51200]; 25, union
  [71033/102400, 27/25]. At 330 + 350 sample points (both ends, middle and two random points of every interval) the
  author's test vectors, evaluated with MY A(v) and g_v(y), leave an empty set of weights m >= 0 (largest margin
  ub - lb = -5.3e-5 and -3.8e-5).

## 9. Independent recomputation of the certificate's matrix (COMPUTED, `capped_check.py.txt`)
My own quadrature (80 panels x 24 Gauss-Legendre nodes, mpmath 30 digits, Bessel via besselj(n + 1/2)): lowest eigenvalues
of the 28 + 28 blocks 1.60528e-8 and 5.5910963e-6 (cert log: 1.605280e-08, 5.591096e-06). 15 sampled integrals I_jk agree
with acb.integral to 5e-29. Tail constants W, tau, pi_tail, eps12, eps22 reproduced to all printed digits. Lemma 4 tested
on a grid (n up to 80, x up to 57): no violation; the actual tail sum at X = RL is 1.7e-35 against the bound 1.2e-33.
