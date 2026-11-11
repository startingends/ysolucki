# V-TZ: adversarial verification of statement (S) (TWO_ZERO.md section 5)

## 1. PREDICTION (written 2026-11-11, before any run or any evaluation of Delta by me)

Read so far: PROJECT_BRIEF.md, TWO_ZERO.md (all), foothold PROGRESS.md sections 19-25 and the existing logs' headers.
No Delta and no kappa computed by me yet.

(P1) Definition audit. The three original points were scored by the pair on which the minimiser's Q(v) sits
     (read off the zero-by-zero decomposition), not by the stated rule "argmin Delta over consecutive pairs in the band
     2 pi e^{2L}/q < gamma < T_D(L), T_D = 1.55 * 2 pi e^{2L}/q". I expect at least one of the three to violate the
     stated band: the impostor pair 40.16/40.68 at L = 1.5 has T_D = 1.55 * 2 pi e^3 / 5 = 39.1 < 40.16, i.e. it is
     OUTSIDE the band as written. So the band was (at least loosely) fitted to the data.
(P2) Zeta. At an L where 94.65/95.87 is in the band and 111.03/111.87 not (L about 1.15-1.2), I expect the band-argmin
     pair to be either 94.65/95.87 or 87.43/88.81, and kappa/Delta in [0.5, 1.2] (inside the kill box [0.3, 2]).
     At L about 1.45-1.5 (111.03 pair out of the band) I expect the band-argmin pair NOT to be 121.37/122.95 but some
     pair higher up (e.g. near 160-175), and kappa/Delta in [0.4, 1.5]; probability of a kill here ~ 0.3.
(P3) chi_5 control. Its kappa_min is flat-ish (0.40 -> 0.33) over L = 1.0-1.6; Delta of its band pairs is not
     constrained to follow this. I expect the ratio there to be the weakest point: probability ~ 0.4 that some chi_5
     window gives kappa/Delta outside [0.3, 2], or that the band is empty / contains no consecutive pair (then (S) is
     not testable as written there).
(P4) Impostor before 1.65 (L = 1.4, existing kappa = 0.1566 sits on 40.16/40.68 at 86%): the band 20.6 < gamma < 31.9
     does not contain that pair. I predict the band-argmin Delta there belongs to another pair and kappa/Delta under the
     literal definition falls outside [0.3, 2] or at least far from 0.65-0.91 (probability ~ 0.5).
(P5) Spike claim (TWO_ZERO 3.3d): I expect it to be real (not precision) but a consequence of holding D and the other
     zeros fixed while moving one pair, i.e. a statement about the model, not an artefact of whitening.
Overall prior: (S) as literally written is KILLED or rescued only by a band redefinition: 0.5; CONFIRMED: 0.35;
INCONCLUSIVE: 0.15.

## 2. Runs (2026-11-11; every job under `python3 tools/memcap.py 1 ...`; logs in `runs/`)
- Own zeros and Hardy-function derivatives, `delta.py.txt` (Z(t) = e^{i theta} L(1/2+it), sign change + findroot, mp.diff,
  30 digits): zeta 79 zeros < 200 (= foothold list), chi5 129, impostor 122 (= r1_A list to 4 decimals). `band.py.txt` scores
  Delta for every consecutive pair and the band argmin. My Delta reproduces TWO_ZERO's ratios 0.659 / 0.781 at zeta 1.0 / 1.25.
- kappa_min: foothold `pencil_dh.py.txt` (zeta, impostor) unchanged; chi5 via `pencil_ctl_vtz.py.txt` = `pencil_ctl.py.txt` +
  a zero-by-zero decomposition of the minimiser on my chi5 zeros (appended block only). Degree >= (height of pair) * L + 25.
- Spike: `spike_mp.py.txt` (all-mpmath, eigsy whitening instead of Cholesky, no float64 step) and the seat's `hybrid.py.txt`
  at NB = 84 / 100 / 116 on the dumped L = 1 matrices.

## 3. Table. "(S) pair" = argmin Delta over consecutive pairs with both zeros in 2 pi e^{2L}/q < gamma < 1.55 * 2 pi e^{2L}/q,
## as written. "actual" = the pair carrying the minimiser's Q(v) (zero-side decomposition).
| point | L (degree) | (S) pair, Delta_S | kappa_min | kappa/Delta_S | actual pair (share of Q), Delta | kappa/Delta_actual |
|---|---|---|---|---|---|---|
| zeta (orig) | 1.0 (156) | 59.35/60.83, 0.4516 | 0.29781 | 0.66 | same (80%) | 0.66 |
| zeta (orig) | 1.25 (200) | 111.03/111.87, 0.2618 | 0.20461 | 0.78 | same (97%) | 0.78 |
| impostor (orig) | 1.5 (150) | 30.16/31.96, 0.8492 | 0.13772 | **0.162** | 40.16/40.68 (99%), 0.1501 | 0.92 |
| zeta NEW | 1.1 (176) | 75.70/77.14, 0.4155 | 0.22136 | 0.53 | 111.03/111.87 (82%), 0.2618 | 0.85 |
| zeta NEW | 1.18 (150) | 94.65/95.87, 0.3390 | 0.20472 | 0.60 | 111.03/111.87 (97%), 0.2618 | 0.78 |
| chi5 NEW | 1.1 (80) | 16.03/17.57, 0.4918 | 0.39443 | 0.80 | same (96%) | 0.80 |
| chi5 NEW | 1.45 (120) | 26.78/28.46, 0.4442 | 0.33526 | 0.75 | 45.43/46.49 (94%), 0.2863 | 1.17 |
| impostor NEW | 1.45 (140) | 23.35/26.10, 0.7627 | 0.13935 | **0.183** | 40.16/40.68 (97%), 0.1501 | 0.93 |
| impostor (old log) | 1.4 (120) | 22.16/23.35, 0.4927 | 0.15659 | 0.318 | 40.16/40.68 (86%), 0.1501 | 1.04 |
Existing logs scored with the literal rule: impostor 1.3 0.88; chi5 1.0 0.52, 1.2 0.80, 1.3 0.71, 1.4 0.86, 1.5 0.86, 1.6 1.14;
zeta 0.75 0.47, 0.85 0.57. 121.37/122.95 never binds for any L (111.03 or 150.05 always has smaller Delta in the band).

## 4. Findings
(F1) The binding pair was NOT scored by the stated definition. The impostor's pair 40.16/40.68 lies above T_D(1.5) = 39.12, so
the stated rule gives Delta = 0.849 and kappa/Delta = 0.16 at an ORIGINAL point. The three points were scored by the pair the
minimiser sits on (read from the decomposition), i.e. after seeing the data.
(F2) No band factor rescues the rule: the minimiser binds pairs up to ~2.0 x 2 pi e^{2L}/q (zeta 1.1: 111.87 = 1.97x; chi5
1.45: 46.49 = 2.04x; impostor 1.4: 40.68 = 1.97x), but at zeta 1.0 it ignores 75.70/77.14 (1.66x, Delta 0.4155 < 0.4516). Any
factor f must satisfy f < 1.66 (zeta 1.0) and f > 1.97 (zeta 1.1). "argmin Delta in a band" does not pick the binding pair.
(F3) Degree: at zeta L = 1.1, degree 110 gives 0.2766 (pair not resolved), 130/150/176 give 0.2250/0.2218/0.2214. The 90L rule
is not enough when the binding pair sits at 2x the band edge; zeta 1.0 is stable to degree 156 (0.297811).
(F4) Spike (TWO_ZERO 3.3d) is not a precision or whitening artefact: all-mpmath with a different whitening reproduces the float
values (shift 1e-3: 0.26396 vs 0.263961; 1e-2: 0.027322 vs 0.027322). D is built from the Moebius inverse, Q from primes, neither
from zeros. Cause: K_D itself rises from 0.74 at the zero to 6.5 (+0.01), 655 (+0.1), 7548 (+0.3). Width shrinks slowly with the
basis (kappa at +-1e-3: 0.264 / 0.257 / 0.251 at NB 84 / 100 / 116). Real property of the forms; it means kappa depends on the
whole zero configuration at 1e-3 resolution, not on the gap alone.

## 5. VERDICT: KILLED as written (kappa/Delta = 0.18 at a new impostor window L = 1.45, and 0.16 at the original impostor point).
Surviving weaker form (S'): Delta taken at the pair the minimiser sits on gives kappa/Delta in [0.66, 1.17] on all 9 points
(3 functions) — inside [0.3, 2], but this pair is chosen from the minimiser, so (S') has no a-priori content until a selection
rule is found. Its drift by function (zeta 0.66-0.85, impostor 0.92-1.04, chi5 0.80-1.17) is a factor 1.8.
Strongest objection even to (S'): the binding pair is not determined by Delta or by any fixed band (F2), and the spike (F4) shows
kappa is a global interpolation constant of the zero set in the D-geometry; Delta is a local proxy that happens to track it
within a factor 2 on 9 points. Also the clause "kappa ≍ 1 when |Delta| > 1" makes the lower bound untestable at small L.
Prediction score (section 1): P1 HIT (impostor pair outside the band); P2 MISS on the pair identity in an unexpected way
(111.03 binds at L = 1.1 and 1.18, not 94.65 or 87.43; ratios in range); P3 MISS (chi5 inside the box at both windows);
P4 HIT (literal ratio 0.18); P5 HIT (real, not artefact).
