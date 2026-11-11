# r2_parity  PROGRESS (agent R2-parity, round 2, proof + verification seat)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Times are wall-clock order within the session (2026-11-10).

## T+08 min. Plan
JOB 2 second implementation ("B"), file wb.py.txt, written from my own derivation, mpmath only, no import of the
lead's scripts (boot/sieve/tests) and no import of the r1_A builder:
 - basis: HALF-integer lattice, even block cos(pi (k+1/2) x / L)/sqrt(L), odd block sin(pi (k+1/2) x / L)/sqrt(L)
   (anti-periodic: a different subspace from the builder's periodic basis, so discretisation errors are independent);
 - entries from one single-frequency function Phi(w) = int_0^{2L} K(u) e^{iwu} du (regularised), via
   q(a,b) = 2 Im[ e^{i(a-b)L} (Phi(b) + conj Phi(a)) ] / (a-b),  q(a,a) = 4L Re Phi(a) - 2 Im Phi'(a);
 - Phi_arch by closed form (digamma + geometric tail) AND by direct mpmath quadrature of the kernel
   w(u) = e^{u/2}/(2 sinh u) (cross-check); one value of Q(f) against the sum over zeros (rhlib.zeros).
 - the same code on the INTEGER lattice is compared entrywise with the r1_A builder (route A).

## T+08 min. PREDICTIONS (written before any computation)
P1. B(int lattice) vs builder, L=1, N=12, full zeta matrix: max entry difference < 1e-40 (control: with the prime 2
    moved to 2.1 in B only, the difference must be > 1e-3).
P2. Q(f) from B vs sum over 5000 zeros for a C^1 test function: relative agreement < 1e-9 (control: Beurling shift
    2 -> 2.1 on the prime side changes Q(f) by > 1e-3 relative).
P3. e10(a) will REPRODUCE in sign count: exactly one positive eigenvalue of N = primes - arch at L = 0.5, 0.75, 1.0 in
    the half-lattice basis, and four positive without primes at L = 1. The SECOND eigenvalue digits will NOT reproduce
    digit for digit, because they are Rayleigh-Ritz values of a truncated basis: I predict agreement of -0.012 to 2
    digits at L=0.5, and only order of magnitude (factor < 3) for -9.1e-10 and -2.1e-23 at equal N; they are
    -(lowest eigenvalue of Q restricted to the complement...) i.e. discretisation dependent.
    Control (impostor-type): Beurling shift 2 -> 2.1 at L = 0.5 gives >= 2 positive eigenvalues? I predict NO:
    still one positive eigenvalue of N (signature is blind; pole-free N has one positive direction because of the
    cosh direction), but Q's lowest eigenvalue is negative (-0.066 per lead). So the count "one positive" is NOT
    what separates; prediction: Beurling N-count = 1 or 2, I say 2 (because Q<0 on even block forces N_even > pole
    on a vector; does not force a second positive eigenvalue). Uncertain; recorded as a guess: 1.
P4. Background (arch + pole, no primes): lowest eigenvalue changes sign between L = 0.36 and 0.38: will reproduce
    (prediction: sign change in (0.345, 0.375), i.e. log 2 / 2 = 0.3466 is where 2 enters; lead says >0 at 0.36).
P5. e9 interval at 6 (L=1): in the SAME discretisation (int lattice N=40) reproduces to the printed digits
    [-1.15e-13, 1.78e-14] within the bisection factor 1.2. In the half lattice at N=40: same order of magnitude
    (within factor 5) but not the same digits. With larger N the interval SHRINKS (Rayleigh-Ritz: computed feasible
    sets are OUTER approximations). Control: at the Beurling-shifted base point there is no feasible interval at all.
P6. Sieve table n = 2..8 digits (2.0, 3.5, 4.5, 5.4, 6.2, 6.8, 7.4): reproduce within +-0.3 digit on int lattice at
    the lead's N; half lattice within +-0.7.
P7. Position at L=0.5: feasible only in a tiny neighbourhood of x=2; 1.994 and 2.014 infeasible: will reproduce in
    both lattices. Prediction for the width of the feasible position interval: |x-2| < 1e-3.
P8. Joint feasible set at L=1 in diagonal directions: I predict it is NOT a box: there will be directions (mixing
    several n) in which the extent is >= 10 times the largest coordinate extent of the components involved, and the
    extent along e_6+e_7-type directions is governed by the 7-coordinate scale (1e-6..1e-7), not by 1e-13.
    Counter-prediction that would surprise me: all diagonal extents <= coordinate extents (cross-polytope-like).

## T+31 min. Prediction before the fine position scan (L = 0.5)
The coarse scan shows x = 2.0005, 2.001, 2.002 FEASIBLE (not only 2.000) and 1.9995 infeasible. Prediction: the feasible
positions form an interval [x_lo, x_hi] with x_lo in (1.9995, 2.0000) and x_hi in (2.003, 2.010); the best position
(largest minimal eigenvalue) is to the right of 2, between 2.002 and 2.006. In the half lattice the interval will be
the same to within 1e-3 in x. Control: no control available for a position scan other than the second lattice.

## RESULTS (all COMPUTED; commands: `python3 tools/memcap.py 3 python3 v1.py.txt`, `... v2.py.txt a|bg|pos|sieve int|sieve half|joint int 40|joint half 60`, `... v3.py.txt <lattice> <N> 0.5 <x...>`)
Implementation B = wb.py.txt (mpmath; my own derivation; no import of the lead's scripts or of the builder).
"int" = builder's periodic lattice (same discretisation as the lead), "half" = half-integer lattice (independent subspace).

### Validation of B (v1.log, 1.6 s)
| check | result | prediction |
|---|---|---|
| Phi_arch closed form vs direct quadrature of the kernel w(u), 5 (L, frequency) pairs, dps 50 | agree to 5e-49 (value) and 5e-51 (derivative) | - |
| B(int) vs r1_A builder, full zeta form, L=1, N=12, entrywise | max difference 3.3e-50 (even), 3.7e-50 (odd); control 2 -> 2.1: 0.899 | P1 HIT |
| Q(f) prime side (B, half lattice) vs sum over 5000 zeros (rhlib), C^1 even test function | 2.9613968981891e-6 both; relative 1.1e-15; control Beurling: 1.0055 | P2 HIT |

### Idea #10 (v2_a.log, v2_bg.log)
| claim (lead) | B, int lattice (same N) | B, half lattice | verdict |
|---|---|---|---|
| L=0.5: one positive eigenvalue of N, second -0.01203 | 1 ; -0.012028 | 1 ; -0.013284 | count reproduced; value reproduced digit for digit in the same basis, 10% basis dependent |
| L=0.75: one ; -9.051e-10 | 1 ; -9.0515e-10 | 1 ; -8.3127e-10 | same |
| L=1.0: one ; -2.105e-23 | 1 ; -2.1051e-23 (N=40), -1.7379e-23 (N=60) | 1 ; -2.138e-23 (N=40), -1.7442e-23 (N=60) | count reproduced; the value still moves 20% with N |
| no primes, L=1: four positive (2.613, 1.011, 0.4829) | 4 ; 2.613, 1.011, 0.4829, 0.1324 | 4 ; 2.607, 1.016, 0.479, 0.1361 | reproduced |
| background (Gamma + pole) turns negative between L=0.36 and 0.38 | reproduced and narrowed: between 0.37 and 0.38 | same | reproduced, with a correction: it is the ODD block that turns negative (odd lowest eigenvalue +0.0046..+0.010 at 0.37, -0.018..-0.024 at 0.38); the EVEN block stays positive (0.00105 at 0.38, 0.0006-0.0007 at 0.40) |
Extra: at L = 1 the single positive eigenvalue of N is in the EVEN block (4.3054); the odd block of N is negative
(top -1.07e-20). Control Beurling (2 -> 2.1): N has 3 positive eigenvalues at L=0.5 and 5 at L=1 (both lattices).
P3: count HIT; "second eigenvalue only to a factor 3 across bases" MISS in the good direction (2% at equal N, but 20% in N);
my guess "Beurling keeps one positive eigenvalue" MISS (3 and 5): the signature count does separate this control.
P4: HIT on the sign change, MISS on the location (I said (0.345, 0.375); it is (0.37, 0.38)) and I had not predicted the parity.

### Idea #9 (v2_joint_int40.log, v2_joint_half60.log, v2_sieve_*.log, v2_pos.log, v3_*.log)
Feasible interval of each single weight at L = 1 (delta = m_n - Lambda(n)); lead: boot_L1.0.log (int, N=40, factor-1.2 bisection).
| n | lead | B int N=40 (factor 1.03) | B half N=60 |
|---|---|---|---|
| 2 | [-4.87e-26, 1.0e-28] | [-5.14e-26, 1.114e-28] | [-4.294e-26, 9.475e-29] |
| 3 | [-3.16e-24, 3.16e-26] | [-3.22e-24, 3.338e-26] | [-2.738e-24, 2.788e-26] |
| 4 | [-1.33e-21, 3.65e-23] | [-1.459e-21, 4.068e-23] | [-1.241e-21, 3.398e-23] |
| 5 | [-3.65e-18, 2.37e-19] | [-3.854e-18, 2.458e-19] | [-3.22e-18, 2.054e-19] |
| 6 | [-1.15e-13, 1.78e-14] | [-1.241e-13, 1.811e-14] | [-1.037e-13, 1.512e-14] |
| 7 | [-1.54e-6, 6.49e-7] | [-1.568e-6, 6.494e-7] | [-1.382e-6, 5.523e-7] |
Lowest eigenvalue at the true weights: 8.2493e-30 even, 2.228e-26 odd (int 40; identical to the lead's 5 digits);
6.9205e-30, 1.8704e-26 (half 60). No weights: -1.3152884 (int 40, lead -1.3152884) and -1.3239606 (half 60).
Verdict: the claimed interval at 6 is REPRODUCED (same basis: within the lead's bisection factor; the lead's ends are
lower bounds of the true ends of that discretisation by up to 8-10%). Statement to attach: every computed interval is an
OUTER bound of the true feasible interval (a form that is >= 0 on L^2[-L,L] is >= 0 on every subspace), and it shrinks
as the basis grows (-17% from int 40 to half 60). The true interval is inside [-1.04e-13, 1.52e-14]. P5 HIT.

Sieve table, digits pinned at admission (window L = (1/2) log(n + 1/2)):
| n | lead | B int | B half |
|---|---|---|---|
| 2 | 2.0 | 1.98 | 2.05 |
| 3 | 3.5 | 3.47 | 3.47 |
| 4 | 4.5 | 4.48 | 4.41 |
| 5 | 5.4 | 5.39 | 5.34 |
| 6 | 6.2 | 6.14 | 6.11 |
| 7 | 6.8 | 6.80 | 6.80 |
| 8 | 7.4 | 7.44 | 7.50 |
Eigenvalue at the true weight, int lattice: 1.06e-5, 2.98e-10, 3.84e-15, 4.56e-20, 4.24e-25, 4.35e-30, 4.13e-35: identical to
the lead's three digits in every row. REPRODUCED (P6 HIT: within 0.06 digit in the same basis, 0.1 in the other).

Position of a single atom at L = 0.5 (free weight c; max over c of the lowest eigenvalue):
| x | lead (int 30) | B int 30 | B half 30 |
|---|---|---|---|
| 1.994 | -2.296e-4 infeasible | -2.176e-4 infeasible | -2.228e-4 infeasible |
| 1.9995 | - | -2.3e-6 infeasible | -4.0e-6 infeasible |
| 1.9996 | - | +1.3e-6 FEASIBLE | -3.8e-7 infeasible |
| 1.9998 | - | +8.5e-6 FEASIBLE | +7.0e-6 FEASIBLE |
| 2.000 | +1.578e-5 FEASIBLE | +1.578e-5 FEASIBLE (c = 0.692255) | +1.429e-5 FEASIBLE |
| 2.002 | - | +8.58e-5 FEASIBLE | +8.50e-5 FEASIBLE |
| 2.004 | - | +1.518e-4 FEASIBLE | +1.516e-4 FEASIBLE |
| 2.006 | - | +2.139e-4 FEASIBLE | +2.139e-4 FEASIBLE |
| 2.007 | - | +2.434e-4 FEASIBLE | +2.435e-4 FEASIBLE |
| 2.008 | - | +4.7e-5 FEASIBLE (int 60: +1.0e-5) | +2.72e-4 FEASIBLE |
| 2.010 | - | -1.28e-3 infeasible | -7.7e-4 infeasible |
| 2.014 | -3.77e-3 infeasible | -3.93e-3 infeasible | -3.40e-3 infeasible |
Verdict: the three values the lead quoted reproduce (2.000 feasible; 1.994 and 2.014 infeasible; small differences at
1.994/2.014 are his coarser golden section). But the CLAIM "feasible only at x = 2.000" is NOT correct as a statement
about positions: the feasible positions form an interval of width about 0.009, approximately [1.9996, 2.0085]. The true
position 2 is within 4e-4 of its LEFT end; the most comfortable position is near 2.007-2.008 (lowest eigenvalue 2.4e-4 to
2.7e-4, seventeen times the value at 2). So at this window the Gamma factor pins the first prime to 2.004 +- 0.0045, with
2 near the edge, not at 2.000 exactly. (Outer-bound caveat applies: the true feasible interval is inside this one, and
its left end moved from 1.9996 to between 1.9996 and 1.9998 in the second basis.) P7 MISS (I predicted |x-2| < 1e-3).
T+31 prediction: ends HIT (x_lo in (1.9995, 2.0000), x_hi in (2.003, 2.010)); "best position 2.002-2.006" MISS (2.007-2.008).

JOINT feasible set at L = 1 (new; the lead scanned coordinates only). delta in R^6 on n = 2..7; int 40 and half 60 agree
on every qualitative statement below.
 * Raw diagonals (sup-norm-1 directions): the extent is that of the most tightly pinned coordinate involved:
   e6+e7: 1.81e-14, -e6+e7: 1.24e-13, e5+-e6: 2.46e-19, e2+-e3 and e2+e4 ("move the prime 2 as a whole"): 1.11e-28,
   -(e2+e4): 5.14e-26, all ones: 1.11e-28, minus all ones: 5.05e-26, direction Lambda (rescale all weights): 1.60e-28
   up and 7.23e-26 down, direction log n at every n: 1.60e-28, 1/n: 2.25e-28.
 * Scaled sign patterns d_n = s_n r_n (r_n = coordinate extent on the side s_n; t = 1 would be the corner of the
   coordinate box, t = 1/k the face of the cross-polytope spanned by the k coordinate extents):
   all six + : t = 0.1715 ; all six - : 0.1715 (cross-polytope value 1/6 = 0.1667);
   pairs of equal sign: 0.496 to 0.514 (cross-polytope 1/2); pairs of opposite sign: 1.00 to 1.60;
   26 patterns in all, range 0.17 to 1.60; largest 1.60 at (-e6, +e7).
 * So: the joint feasible set is NOT a box. Along equal-sign directions it is, to 3%, the simplex spanned by the
   coordinate extents (the boundary is flat: a single linear constraint is active on each side), and it bulges to
   at most 1.6 x the box corner in mixed-sign directions. No long thin direction was found: in every direction tested
   the extent is within a factor 1.6 of the box, so the diameter is set by the weight at 7: about 2e-6.
 P8 MISS: I predicted directions with extent >= 10 x the coordinate extents; the largest found is 1.6 x.
 HEURISTIC reading of the flat faces: on the "+" side the active constraint is first order in the lowest eigenvector v,
 sum_n delta_n b_n <= mu_1 with b_n = 2 n^{-1/2} g_v(log n) > 0, g_v the autocorrelation of v; this predicts
 r_n^+ = mu_1/b_n and the simplex. Not checked numerically.

## JOB 1 (proofs) : files and status
* PROOF_parity_index.md: Lemma 1 (parity; pole = +2<f,cosh>^2 on even, -2<f,sinh>^2 on odd) PROVED. Prop. 3 (RH =>
  N has at most one positive direction; kappa_-(Q) <= kappa_+(N) + 1) PROVED. Theorem 4 (sup over windows of the number
  of negative squares of the Weil form = number of distinct zeros with Re > 1/2; per parity block = number of
  quartets; attained for large L) PROVED, self-contained modulo the explicit formula and classical zero facts.
  Corollaries: "at most one negative square on every window" <=> RH; k = 2,3 => at most one quartet;
  "N = primes - arch has at most one positive direction on every window" => at most one off-line quartet (C2).
  First draft of Step 3-4 was WRONG for infinitely many off-line zeros (bare cosine shift cannot isolate quartets);
  repaired with the multiplier cos(tz)[sinc(z-a)^K + sinc(z+a)^K]. Search: the count is reported to be credited to
  Bombieri in a 2026 preprint (not opened): known in substance; parity refinement and C2 not found.
* PROOF_first_failure.md: Theorem 3 (RH false <=> a first L_0 with a null vector; zero set of lambda is a closed interval;
  a null vector at ANY window with Q >= 0 already contradicts RH) PROVED given three cited theorems of Suzuki and one
  ASSUMPTION about the form domain (marked CORE). Lemma 1: lambda(L) is non-increasing (one line). The full equation of
  the null vector is written out. Prop. 5: real, even or odd; support hull exactly [-L_0, L_0]; transform of exact type
  L_0, not vanishing on all on-line zeros, with the energy identity and a phase condition at a single quartet.
  NOT proved: end-point regularity (named), simplicity, parity of the first null vector.
* PROOF_uniqueness.md: N14 step 4 is correct; rigorous proof written (localisation + two Fejer-type multipliers);
  three gaps of the original filled; scope: needs RH, all of R, atomic l^1 perturbation, no atom at 0; false on any
  single window; uses nothing arithmetic. UNSEARCHED.

## Walls named by this seat
WP1. Linear algebra cannot improve "N has one positive direction => at most one quartet" to "=> RH": a one-quartet
     configuration has negative index (1 even, 1 odd), which Prop. 3(b) allows. Deciding it needs a property of N
     beyond its signature (e.g. the sign pattern of the odd block: under RH, N_odd <= -2<f,sinh>^2 < 0).
WP2. End-point regularity of a null vector (PROOF_first_failure 5(e)).
WP3. Theorem U gives no rate: how fast the window-L feasible set shrinks is exactly what is not provable by it.
WP4. Every interval/feasible-set number in idea #9 is an outer bound in a truncated basis; a certified INNER
     statement ("this weight is infeasible") needs only one vector, but a certified statement "this weight is
     feasible on the full window" needs a lower bound for the form on the whole of L^2[-L, L], which nobody has.
