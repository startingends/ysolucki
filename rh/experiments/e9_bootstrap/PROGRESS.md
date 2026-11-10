# e9_bootstrap: first test of idea #9 (lead)

Question: forget which integers are prime; allow a real weight m_n at every integer 2 <= n <= e^(2L);
which weight vectors keep the windowed Weil form non-negative?

BLIND PREDICTIONS (written in docs/IDEAS.md #9 before this folder existed):
- zeta, L = 1.0, other weights at Lambda: feasible interval for m_6 has width < 1e-20.
- conductor-5 odd archimedean term, L = 1.0: feasible set of real weights has diameter > 0.1.
- wrong-picture line: zeta's m_6 interval wider than 1e-6.

Method: reuse lane A's validated matrix code (rh/experiments/r1_A/weil.py.txt, read-only import).
The form is linear in the weights: Q(m) = Q_arch(+pole) - sum_n m_n B_n. B_n is obtained from lane A's
builder with unit weight at n and the archimedean and pole terms switched off. Eigenvalues by mpmath
eigsy at 150 digits on the even and odd blocks (N = 40 Fourier modes).

## Result (COMPUTED, 165 s, `python3 tools/memcap.py 4 python3 boot.py.txt 1.0 40 150`, log boot_L1.0.log)
- zeta, no weights: lowest eigenvalue -1.3153. With von Mangoldt: +8.25e-30 (even), +2.23e-26 (odd)
  (lane A, N = 160: 6.31e-30 and 1.51e-26; ours is N = 40, an upper bound, consistent).
- one-coordinate feasible intervals around von Mangoldt: n=2 [-4.87e-26, 1.0e-28]; n=3 [-3.16e-24, 3.16e-26];
  n=4 [-1.33e-21, 3.65e-23]; n=5 [-3.65e-18, 2.37e-19]; n=6 [-1.15e-13, 1.78e-14]; n=7 [-1.54e-6, 6.49e-7].
- conductor-5 odd term: Re(chi)Lambda feasible (0.0150), impostor coefficients feasible (3.5e-5), midpoint
  feasible, no weights infeasible (-0.099); single weights at n = 4..7 can move by > 10.
- Predictions: m_6 width < 1e-20 MISSED (1.3e-13); conductor-5 diameter > 0.1 HIT (2.18).
## Not done
Joint feasible set (only coordinate directions scanned). No interval certification. No second implementation.
Interval ends are bracketed to a factor 1.2 only; the upper ends at coarse search are powers of ten stepping by 100.
