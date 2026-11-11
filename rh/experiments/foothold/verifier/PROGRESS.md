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
