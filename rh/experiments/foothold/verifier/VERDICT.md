# VERDICT of the independent verifier V-FH on the two foothold proofs

Date: 2026-11-11. Objects: `rh/experiments/foothold/PROOF_window_prime2.md` (Theorem A) and
`PROOF_forcing_prime2.md` (Theorem B), scripts `cert.py.txt`, `forcing.py.txt`. Working record: `PROGRESS.md` in this
folder; every number below has its script and log here. Labels: PROVED / COMPUTED as in the project rules.
"Verified" below always means: every written lemma re-derived by hand by me, the certificate rerun, and the numbers
recomputed by a route that shares no code with the author's. It does not mean formalised, and it rests on the
correctness of Arb / python-flint 0.9.0 (ball arithmetic, `acb.integral`, `digamma`, `hypgeom_0f1`), which I did not
audit beyond the behaviours tested in `lowlevel.py.txt`.

## 1. Verdicts

**Theorem A: VERIFIED AS STATED.** For every f in L^2[-L, L], L <= (1/2) log 3: Q(f) >= 9.9998e-9 ||f||^2 (even f),
>= 3.9999e-6 ||f||^2 (odd f). No gap found. One false remark outside the theorem (section 3, C1), already repaired
by the author while I was working.

**Theorem B: VERIFIED AS STATED** (parts (ii) and (iii) for L = 1/2 with degree < 28 and L = 27/50 with degree < 32;
part (i) is Theorem A). No gap found. The covering of the complement of the box is complete, not sampled (section 2,
B-logic). Same false remark C1 outside the theorem, repaired. Scope limits in section 5.

Neither theorem is a step towards the Riemann Hypothesis and I do not say so. A is positivity on windows so small
that a single prime is visible; B is a statement about which single atom is compatible with the Gamma factor on two
such windows.

## 2. Lemma by lemma

### Theorem A (PROOF_window_prime2.md)
| item | verdict | what I did |
|---|---|---|
| (0.1), well defined, a(0) > -6 | proved | a(0) = psi(1/4) - log pi = -5.3722 (COMPUTED); integrand >= -7 abs(F)^2 |
| Q is the Weil form (normalisation) | cited by the author; COMPUTED here | `zeros_check.py.txt`: for v = (1/4 - t^2)^4 and t(1/4 - t^2)^4 the form equals 2 sum over the first 150 zeros of abs(F(gamma))^2 to relative 4e-13 and 2e-13 |
| Lemma 1 (monotone in the window) | proved | re-derived; at L = (1/2) log 3 the atom at log 3 has zero overlap, at L <= (1/2) log 2 the atom at log 2 has none |
| Lemma 2 (parity) | proved | re-derived for complex f, including the case of an infinite integral (symmetric truncations) |
| Lemma 3 (Re psi increasing) | proved | series DLMF 5.7.6, term by term |
| (2.1) the cap | proved | discarded term (1/2pi) int over abs(r) > R of (Psi - beta_0) abs(F)^2 is >= 0 |
| (3.1)-(3.2) the matrix | proved | re-derived F_n = i^n sqrt(2L(2n+1)) j_n(rL), prefactor 2L/pi, pole sign; p_5 checked against quadrature to 20 digits |
| Lemma 4 (Bessel bounds) | proved | Poisson integral + int (1 - t^2)^n = 2^(2n+1) n!^2/(2n+1)! re-derived; grid test n <= 80, x <= 57: no violation |
| tail sums tau, pi_tail, W | proved | ratio test re-derived; values reproduced to all printed digits (`capped_check.py.txt`) |
| (4.1) INCLUDING the cross terms | proved | form = head + 2 Re(cross) + tail; cross = G-block (Hilbert-Schmidt bound N sqrt(tau)) + pole cross 4 abs(S_1) abs(S_2); the text's eps12 is exactly half the coefficient of AB, as (4.1) needs. COMPUTED for comparison (`tail_check.py.txt`): actual head-tail norm 1.0e-18 (even), 2.1e-19 (odd) against eps12 = 1.97e-13; actual tail deviation 3.5e-36 against eps22 = 1.2e-31 |
| interval LDL^T => positive definite | proved | inclusion property applied to the rational recursion: every real symmetric matrix inside the entry balls has its exact pivots inside the pivot balls, which are > 0; so no division by zero and LDL^T with D > 0. The ball matrix is symmetric by construction (one integral per pair) |
| integrand holomorphic where acb.integral assumes it | proved + COMPUTED | integrand is meromorphic: digamma poles at r = +-i(2n + 1/2) only; j_n via regularised 0F1 is entire; the power (z/2)^n is binary powering (tested on a ball straddling the negative axis: finite, equal to the product); digamma on a ball containing a pole returns a non-finite ball (tested), which forces bisection. No branch cut anywhere |
| section 5 numbers | COMPUTED, reproduced | rerun: log identical except timings. Independent matrix (my quadrature, mpmath, Bessel by besselj): lowest eigenvalues 1.60528e-8 and 5.5910963e-6 (log: 1.605280e-08, 5.591096e-06); 15 sampled integrals agree with acb.integral to 5e-29 |

### Theorem B (PROOF_forcing_prime2.md)
| item | verdict | what I did |
|---|---|---|
| Lemma 5 (x-space formula, interchange, constant) | proved | re-derived: Gauss formula with t = 2x gives k(x) = e^(x/2)/sinh x; dominated convergence with 4 + 2 log(1 + abs(r)); bracket = -Ein(4L) + E_1(4L) = -gamma - log 4L, so the constant is -(log 4 pi L + gamma). COMPUTED: my own implementation of this formula reproduces the author's no-atom values to 15 digits and the sum over zeros to 4e-13 |
| Lemma 6 (0 <= h <= 1) | proved | re-derived; grid on (0, 1.099]: h in [0.3887, 0.5) |
| Lemma 7 (rational bilinear forms) | proved | monomial formula, symmetry for equal parity, (g(0) - g)/x term re-derived; A(v) of all test vectors of the sweeps (about 600 per window) agrees with my own evaluation to 2.7e-33 |
| Lemma 8 (m' = m(2L - y), cases (a), (b)) | proved | re-derived; holds for ALL m >= 0 at once because at least one vector has q > 0 (the constant function has q = 1), so large m is covered; valid up to y -> 2L where m' can be anything >= 0 |
| Taylor enclosure of q_v | proved | exact rational shift; fmpq_poly composition and exact division tested |
| the 2^-120 cut in H_n | proved | int_0^delta h x^n lies in [0, delta^(n+1)] by Lemma 6; the constructor arb(mid, rad) used there does produce a ball containing 0 and delta^(n+1) (tested) |
| LOGIC: complement of the box fully covered | proved + COMPUTED | (1) y >= 2L, or m = 0: one vector with A(v) < 0 (certified, both parities). (2) 0 < y <= y_left and y_right <= y < 2L: Lemma 8 on closed adjacent intervals. `cover_check.py.txt` replays the sweep with exact rationals: L = 1/2: 47 intervals, union exactly [0, 70957/102400]; 19 intervals, union exactly [7139/10240, 1]; L = 27/50: 45 intervals, union [0, 35487/51200]; 25, union [71033/102400, 27/25]; no gap, no overlap. (3) y in the residual interval: 256 adjacent pieces, hull of the Lemma 8 weight bounds. So every (y, m) with y > 0, m >= 0 outside the box has a certified witness polynomial. Independent re-check of the witnesses with my own A(v) and g_v(y) at 330 + 350 sample points (ends, middle, two random points of each interval): the set of weights m >= 0 left by the author's vectors is empty every time (largest margin -5.3e-5, -3.8e-5) |
| (iii) no atom | COMPUTED, reproduced | my code: -0.0323519539485215, -0.322228344654863 (L = 1/2); -0.0650680866127705, -0.410363725855412 (L = 27/50): all printed digits |
| logs | reproduced | all numbers identical; one print line differs in wording (C2) |

Gaps found: **none** in either proof.

## 3. Corrections (none touches a theorem statement)
- **C1 (false number, found by recomputation; repaired by the author at 01:17 UTC in both proof files).** The
  "Rayleigh-Ritz bottoms at the true atom" 9.0567e-7 (L = 1/2) and 6.447e-8 (L = 27/50), quoted as "upper bounds for
  the true bottom", were computed at y = 693147/10^6, which is 1.8e-7 below log 2 (`forcing.py.txt` line 187). At
  y = log 2 the same polynomial spaces give 9.4166e-7 and 1.07699e-7 (COMPUTED, `bottoms.py.txt`; the author's two
  numbers are reproduced at y = 0.693147). At L = 27/50 the quoted "upper bound" 6.45e-8 is below every estimate of
  the true bottom (capped lower value 1.024e-7 at R = 320, float; Fourier N = 320: 1.0633e-7). Still stale: the
  author's PROGRESS.md section 7 line 131 (its section 13 records the repair).
- **C2 (cosmetic).** `forcing_half.log` and `forcing_0p54.log` print the right sweep as "[..., 1)"; the current script
  prints "[..., 2L)". In `forcing_0p54.log` the "1" is wrong (2L = 1.08). The logs predate the last edit of the script;
  the certified intervals themselves are correct. The two logs should be regenerated.
- **C3 (wording).** "certified lower bounds of the capped form (..., float)" in the old section 4 of the forcing file:
  a float value is not certified. Removed by the author's repair.

## 4. Recomputation table (predictions were written in PROGRESS.md section 2 before running)

Routes: F = the project's periodic Fourier/Arb builder `r1_A/weil.py.txt` (Arb 160 bits, float eigenvalues); P = my own
polynomial code (`vlib.py.txt`, mpmath 34 digits). A truncated basis gives an UPPER bound for the infimum over L^2:
these numbers can refute a certified lower bound, they cannot confirm one. They do not refute it.

(i) true form, lowest eigenvalue
| L | block | prediction | F, N = 160 | F, N = 320 | P | certificate (lower bound) | outcome |
|---|---|---|---|---|---|---|---|
| 0.5 | even | limit in [8.9e-7, 9.1e-7] | 9.3440e-7 | 9.3357e-7 | 9.4166e-7 (deg < 28), 9.3661e-7 (deg < 44) | none at this L (A gives 9.9998e-9) | prediction WRONG: it was built on the author's mislabelled 9.0567e-7; led to C1 |
| 0.5 | odd | limit in [1.90e-4, 1.97e-4] | 1.9971e-4 | 1.9678e-4 | 1.9573e-4, 1.9454e-4 | (A gives 3.9999e-6) | consistent (F falls like 1/N) |
| (1/2) log 3 | even | blind: [5.0e-8, 6.0e-8] | 5.5433e-8 | 5.5351e-8 | 5.6411e-8 (deg < 28), 5.5785e-8 (deg < 40) | 9.9998e-9 | inside; above the certificate by a factor 5.5 |
| (1/2) log 3 | odd | blind: [1.4e-5, 1.6e-5] | 1.5580e-5 | 1.5262e-5 | 1.5076e-5, 1.5018e-5 | 3.9999e-6 | inside; above the certificate by a factor 3.8 |
What this does and does not confirm: the true bottom at L = (1/2) log 3 is at most 5.54e-8 (even) and 1.50e-5 (odd);
the certificate's constants are below these, as they must be; the bottom of the CAPPED form (what the certificate
actually bounds) is 1.60528e-8 and 5.59110e-6 by my independent matrix, above the certified 1e-8 and 4e-6. Float capped
values at R = 320 (author's explore.py.txt, not certified): 5.405e-8 and 1.4345e-5. Zhu's uncertified reference values at
L = 0.5 (his table in section 6): 9.34e-7 and 1.94e-4, in agreement.

(ii) Theorem B at L = 1/2; value = lowest eigenvalue over both parity blocks, at the best weight (y-rows) or the best
position (m-rows). P is exactly the hypothesis class of the theorem (degree < 28).
| point | prediction | P | F, N = 160 | F, N = 320 | sign |
|---|---|---|---|---|---|
| y = y_left - 0 (edge, 0.6929395) | < 0, small | -1.108e-6 | -8.13e-7 | -1.031e-6 | negative |
| y_left - 1e-5 | < 0, about -4e-8 | -1.845e-6 | -1.549e-6 | -1.768e-6 | negative |
| y_left - 3e-5 | < 0 | -3.321e-6 | -3.022e-6 | -3.243e-6 | negative |
| y_left - 1e-4 | < 0 | -8.501e-6 | -8.190e-6 | -8.420e-6 | negative |
| y_left - 3e-4 | < 0 | -2.341e-5 | -2.307e-5 | -2.332e-5 | negative |
| y_left - 1e-3 | < 0, about -4e-6 | -7.687e-5 | -7.640e-5 | -7.674e-5 | negative |
| y = y_right + 0 (edge, 0.6971680) | < 0, small | -1.174e-5 | -4.226e-5 | -4.475e-5 | negative |
| y_right + 1e-5 | < 0 | -2.514e-5 | -5.565e-5 | -5.815e-5 | negative |
| y_right + 3e-5 | < 0 | -5.193e-5 | -8.245e-5 | -8.495e-5 | negative |
| y_right + 1e-4 | < 0 | -1.457e-4 | -1.762e-4 | -1.787e-4 | negative |
| y_right + 3e-4 | < 0 | -4.134e-4 | -4.441e-4 | -4.466e-4 | negative |
| y_right + 1e-3 | < 0 | -1.349e-3 | -1.380e-3 | -1.383e-3 | negative |
| m = 0.488558 - 0 (edge), best y | < 0 | -1.098e-6 | -7.38e-7 | -1.104e-6 | negative |
| m_low - 1e-5, -1e-4, -1e-3, -1e-2, -1e-1 | < 0 | -1.23e-6, -2.61e-6, -1.63e-5, -1.67e-4, -4.13e-3 | same signs | -1.23e-6 ... -4.13e-3 | negative |
| m = 0.510367 + 0 (edge), best y | < 0 | -7.97e-5 | -1.94e-4 | -2.03e-4 | negative |
| m_high + 1e-5, 1e-4, 1e-3, 1e-2, 1e-1 | < 0 | -8.87e-5, -1.69e-4, -9.76e-4, -9.03e-3, -8.74e-2 | same signs | -2.12e-4 ... -8.77e-2 | negative |
| inside: the true prime (log 2, log 2/sqrt 2) | > 0, 9.06e-7 | +9.4166e-7 | +9.344e-7 | +9.336e-7 | positive (and PROVED feasible: Theorem A) |
| inside: (log 2, 0.50) | < 0 (predicted: the box is not the feasible set) | -8.26e-4 | -8.33e-4 | -8.34e-4 | negative |
| inside: (0.695, 0.50) | > 0 | +1.193e-4 | +1.193e-4 | +1.193e-4 | positive in truncation only |
| inside: (0.6965, 0.49) | not predicted | -5.01e-3 | -5.00e-3 | -5.00e-3 | negative |
Outcome against the prediction: all signs as predicted. Sizes wrong: I predicted about -4e-3 d outside the left edge;
the slope is about -7e-2 d, and the value AT the edge is already -1.1e-6 (left) and -1.2e-5 (right): the certified box
is an outer bound with room, not the feasible set. L = 27/50 (`boxtest54.py.txt`, P only): the four edges give -1.54e-6,
-6.26e-6, -3.55e-7, -1.49e-5; all negative.

(iii) no atom, L = 1/2
| block | prediction | author (certified Rayleigh quotient) | P (lowest eigenvalue, deg < 28) | F, N = 320 |
|---|---|---|---|---|
| even | [-0.0325, -0.0322] | -0.0323519539485215 | -0.0323519539485215 | -0.0323536 |
| odd | [-0.3225, -0.3215] | -0.322228344654863 | -0.322228344654863 | -0.32161 (N = 160: -0.32100; falls like 1/N towards -0.3222) |

(iv) author's scripts: `cert.py.txt` 193 s, log identical except timings; `forcing.py.txt` 10 s and 16 s, all numbers
identical (C2 for one line of text).

Side check (`misc_check.py.txt`): the published numerical observation of Connes-Consani (weight tied to p,
L = (1/2) log 3) is reproduced: lowest even eigenvalue -1.38e-5 at p = 1.9999, -9.4e-6 at p = 2.0005, +5.58e-8 at p = 2.

## 5. Scope: what the statements do NOT say
- A: the constants are bounds for a capped form, about 5 times below the true bottom (5.5e-8, 1.5e-5); nothing is
  claimed or shown for any L > (1/2) log 3.
- B(ii) is an OUTER bound. It does not say that the points of the box are feasible: (log 2, 0.50) is in the box and
  is infeasible (-8.3e-4). The only point proved feasible is the true prime. No uniqueness statement follows.
- B is about ONE atom with weight m >= 0. Two atoms, an atom plus a small diffuse mass, or a general positive
  measure are not covered; with m < 0 allowed the statement is false (the author says so).
- B(ii) is proved on two windows only (L = 1/2, 27/50); it is not a statement "for all L in a range".
- The hypothesis of B(ii) is positivity on polynomials of degree < 28 (resp. 32): weaker than positivity on L^2, so
  the theorem is slightly stronger than the L^2 version; the L^2 version follows.

## 6. Literature (what I searched and what I read)
**Zhu, arXiv 2608.24827 v2.** Read: the library digest lines 1-220; the TeX `rh/data/papers/2608.24827.tex` lines
150-290 (form (1.2)-(1.3), Theorems 1.1, 1.2), 884-1082 (proof of the reduction, the certified computation),
1083-1130 and 1195-1292 (parity lemma, Theorem 6.2, Corollary 6.3, table of reference values), 2440-2475
(reproducibility): about 520 of 2597 lines. Not read: sections 7-16.
Relation, exactly:
- Same quadratic form, same normalisation (his (1.2)-(1.3) is (0.1) of Theorem A with all prime powers below e^(2L)).
- Zhu's Theorem 1.2 (real even f) and Corollary 6.3 (all complex f) claim Q(f) >= 8.9e-18 ||f||^2 on [-0.8, 0.8].
  Restricted to f supported in [-L, L], L <= (1/2) log 3, the atoms at log 3 and log 4 drop out, so his claim CONTAINS
  the qualitative content of Theorem A (positivity on every window that sees only the prime 2) and covers the larger
  range L <= 0.8.
- The constants differ and Theorem A's is not implied: on L <= (1/2) log 3 Zhu's statement gives only 8.9e-18, Theorem A
  gives 9.9998e-9 (even) and 3.9999e-6 (odd), about 1e9 and 4e11 times larger. Zhu has no certified lower bound
  at any L other than 0.8; his values at L = 0.5 (9.34e-7, 1.94e-4) are labelled reference values, not certificates.
- Same method in outline (cap above a height where the digamma term beats the prime mass, Legendre basis, j_n tail
  bound, two-block inequality identical to (4.1)); different in execution: Zhu uses the envelope
  log(t/2pi) - 1/t - A_L, multiprecision floats with a Bernstein-ellipse quadrature bound and a Cholesky residual
  lemma; FH uses monotonicity of Re psi, Arb ball integration and interval LDL^T.
- Status of the source: unrefereed, single author, v1 retracted a stronger claim, and according to the digest the
  certificate files are not in the arXiv package. Theorem A is therefore the only certificate of this kind that this
  project has been able to rerun and check line by line. As a claim it is NOT new.
**Theorem B type (certified region for position and weight of the first prime).**
- Searches (WebSearch, 2026-11-11, three queries): (1) Weil positivity explicit formula "prime 2" replaced by real
  parameter p positivity forces p=2 rigorous interval arithmetic certified bound; (2) Weil quadratic form compact
  support positivity determines primes uniqueness "Beurling" generalized primes explicit formula positivity rigidity
  theorem; (3) arXiv 2026 "Weil positivity" window "log 3" certified "prime 2" support test functions Legendre interval
  arithmetic positivity sensitivity position weight atom. Opened: abstract pages of arXiv 2607.02828 (Groskin:
  truncated form, archimedean tail; no variation of a prime) and 2607.24830 (numerical realisation of Suzuki's
  operator; primes not varied). One result (preprints.org 202610.1267) could not be opened (HTTP 403): unread.
- Read: Connes-Consani arXiv 2106.01715 TeX lines 157, 189, 232-250, 492-497, 518-552 (sections 2.2-2.3): NUMERICAL,
  weight tied to p, L = (1/2) log 3 in our units, "negative for p = 1.9999 and also for p = 2.0005", no error
  analysis, even matrix only. Reproduced above.
- Read: the library digest `johns-positive-solutions.md` lines 1-60 and 228-256 only (not the paper). According to it,
  Johns (preprint, unrefereed, October 2026) has a CERTIFIED statement of a neighbouring kind in a different
  framework (global admissible pairs of positive measures, no window): every admissible pair has prime-side mass
  <= 6.81e-19 on x in [2.05, 2.95]; and the digest states there is no two-sided pinning of the weight at 2 there.
  Neither statement implies the other (different hypotheses).
- Result: a certified two-sided region for the position AND the weight of the first prime, from positivity of the
  window form, was not found in what was searched and read. That is "not found", not "new".

## 7. In plain English
Think of a machine that takes a wave-shaped test signal living on a short stretch (the "window") and returns one
number. The Riemann Hypothesis is the statement that this number is never negative, for every signal on every
stretch. On a very short stretch only the first prime, 2, enters the machine.

What has been established, and I could not break it: (A) on every stretch up to half-width 0.549 (the largest one
on which 2 is the only prime that enters), the number is never negative; in fact it is at least one hundred-millionth
of the signal's size. Concretely, for the signal v(t) = (1/4 - t^2)^4 on the stretch [-1/2, 1/2] the machine returns
0.0000000118, and I checked separately that this equals the sum over the first 150 zeros of zeta that the theory
predicts, to 12 digits. (B) If one replaces the prime 2 inside the machine by a single adjustable "pretend prime"
with an adjustable strength, the machine goes negative unless the pretend prime sits between 1.99958 and 2.00806 and
its strength is between 0.4886 and 0.5104 (the real values are 2 and 0.4901). Example: put the pretend prime at
2.0101 with the best possible strength, and an explicit polynomial signal of degree below 28 makes the machine
return -0.0013 times the signal's size; or keep it exactly at 2 but with strength 0.50 instead of 0.4901: -0.0008.
With no prime at all: -0.032.

What has not been established: nothing about longer stretches, where more primes enter and where the real
difficulty lies (the safety margin shrinks faster than exponentially: about 1e-17 at half-width 0.8 according to
the literature). (B) does not say the prime must be exactly 2, only that it must be within 0.4 percent; it allows
only one pretend prime, not two or a smeared one; and most of the allowed box is in fact still forbidden. The
first statement was already claimed, for a larger stretch and a much smaller margin, in an unrefereed 2026
preprint whose files we could not check. Neither result is progress on the Riemann Hypothesis itself; they are two
small, fully checked facts about the first step.
