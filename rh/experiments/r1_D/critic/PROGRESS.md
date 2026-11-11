# r1_D critic PROGRESS

Start: 2026-11-10. Role: refute or confirm the lane-D round-1 proposal (D1..D7).
Plan: (1) read proposer code; (2) independent recompute of key numbers (mpmath instead of python-flint for
the pencil; boolean sieve instead of proposer's method for deletion); (3) literature by search; (4) verdicts.

## Results (all COMPUTED by my own code in this folder unless marked)

### D2 pencil: REPRODUCED (independent method: Hurwitz zeta only, no characters / hardy_z)
`python3 pencil_check.py.txt 200 0.02 mp` (mpmath 20 digits, 175 s) and `python3 pencil_check.py.txt 1000 0.01 flint` (Arb Hurwitz, 103 s).
- |f_DH| at Spira's four off-line zeros: 6.5e-7, 2.6e-7, 6.5e-8, 4.7e-7 (6-digit zeros), at 0.5+5.0941598i: 3e-16.
- real zeros below 200: DH 122, odd member 76, Z1 130, Z2 129. Below 1000: DH 848, odd 597, Z1 904, Z2 904.
- critical values in (0,1) below 200: 85.89903/0.439670, 114.33826/0.487222, 166.50471/0.886095, 176.96664/0.168096 (all max): identical to proposer.
- predicted pairs: lam=+1: 4 (T=200), 28 (T=1000); lam=-1: 27, 153. Direct: (130-122)/2 = 4, (904-848)/2 = 28, (904-597)/2 = 153.5.
- thresholds: 0.074284, 0.027028, 0.015857, 0.001092 at T = 100, 200, 500, 1000 (these are lam_minus; lam_plus = 0.4397, 0.1681, 0.0643, 0.0245).
- critical points below 1000: I find 428 (proposer 430; my grid filter drops extrema with |rho| > 50).
Caveat found: the "equals" in the claim holds up to O(1) boundary terms (zeros crossing height T, and the odd member has a forced zero at s = 1/2), visible as the 153.5.

### D1 deletion: oscillation exponent REPRODUCED, but it does not measure the zero
`python3 beurl_check.py.txt 1e10 <a> <z> <seed>`; S = nextprime(Poisson points), N_B by inclusion-exclusion recursion (self-test against boolean sieve passes), true error against A = prod(1-1/p) * tail.
| a | z | seed | detrended exp (all/upper) | TRUE error exp (all/upper) | mean E at 1e9 |
| 0.55 | 1 | 1 | 0.279/0.282 | 0.242/0.125 | +132 |
| 0.55 | 1 | 2 | 0.290/0.252 | 0.168/0.029 | +175 |
| 0.55 | 0.5 (branch point, NOT a zero) | 1 | 0.278/0.280 | 0.435/0.436 | +2707 |
| 0.55 | 1 | det (quantiles) | 0.225/0.239 | 0.067/0.050 | -162 |
| 0.70 | 1 | 1 | 0.348/0.336 | 0.380/0.346 | +11493 |
- Detrended exponents agree with the proposer (0.25-0.31, 0.222, 0.33-0.37) at 100x larger X.
- CONTROL: z = 0.5 has the same detrended exponent as z = 1. So the detrended oscillation is the square-root noise of
  the deleted set (x^(a/2)), present whether or not a zero is planted.
- The true error N_B(x) - Ax is dominated at reachable x by a one-signed smooth term 3 to 50 times the oscillation;
  for z = 1 it flattens (consistent with Selberg-Delange: the x^a (log x)^(-1-z)/Gamma(-z) term vanishes at integer z),
  for z = 0.5 it grows like x^0.435 (theory: x^a / log^1.5 x, local exponent 0.47 at 1e8).

### D3 and D6 spot checks: REPRODUCED
`python3 small_checks.py.txt`: (log Phi)''(0.42) = -30.4166 (zeta), -5.4081 (DH); min Phi_DH on [0,2] = 5.1e-14 > 0.
Carry zeros tau=0.9: 0.38735358+14.602528i, 0.67481501+21.44609i; tau=0.8: 0.23905567+15.163695i.

### Literature (searched this session)
- BDR arXiv:2309.01567 (ar5iv, first 100k of 112k chars by machine summary): Thm 1.3 as the proposer says; intro: "One may conjecture
  that for all alpha,beta with max >= 1/2, there must exist a corresponding [alpha,beta]-system." Their deletion is random; M_S(x) << x^(alpha/2+eps).
- Groechenig arXiv:2007.12889 and Katkova math/0505174 (search summaries only): RH <=> a function built from 1/xi is PF_infinity. D5's equivalence is known.
- Bombieri-Hejhal / Hejhal / Lamzouri-Lee arXiv:2010.10490 (search summary): off-line zeros of linear combinations expected ~ T log T / sqrt(log log T), i.e. proportion -> 0.

### Walls / lessons
- W(c1): measured "price" a/2 is the price of sqrt-noise of the deleted set, not of the zero. kappa(a) numerics so far say nothing about the conjecture.
- W(c2): a mean-value (Montgomery-Vaughan) heuristic does not contradict beta < a/2 for deletion systems: the excess L2 mass of sum_{p in S} p^{-s}
  can be absorbed by zeros of zeta_S itself near Re s = a/2. Exact statement not proved: "a deletion system with beta < a/2 has >> T^(1-eps) zeros of
  zeta_S in a/2 - eps <= Re s < 1/2 up to height T".
