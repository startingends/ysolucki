# R2 (rh/REVERSE.md): "the archimedean local Riemann-Roch is a prolate count", made precise

Seat FH, 2026-11-11. Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Script `reverse_r2.py.txt`, logs `reverse_r2_*.log`.

## 0. Predictions (written before any computation of this file)
- P1 (identity, asymptotic): with c = 2 pi e^(2L)/q, deg := cL/pi, h0 := (1/2) Tr_par(P_1 Phat_c) (time-band limiting on
  [-1, 1] at band c, restricted to the parity of the Gamma factor), the quantity h0 - (deg + pole - N(c) + S(c)) is O(1/c):
  below 0.01 in absolute value at all nine (family, window) pairs, and it oscillates like -+cos(2c)/(8 pi c).
- P2 (constant): the Riemann-von Mangoldt constant 7/8 splits as +1 (the two conditions g(0) = ghat(0) = 0, i.e. the pole)
  minus 1/8 (half the parity part Si(2c)/(2 pi) -> 1/4 of the prolate trace); for an odd Gamma factor the sign of the 1/8
  flips (Stirling: arg Gamma(3/4 + it/2) has +pi/8) and the odd prolate trace gives +1/8: the parity of the prolates is the
  parity of the Gamma factor.
- P3 (non-tautological): the number of eigenvalues of the actual window Weil form Q_L below eps equals the number of prolate
  indices of the matching class with 1 - chi_n(c) < eps, within +-1, for eps = 1e-6 and 1e-3, at two windows each for zeta
  (class: even n >= 4), chi_5 (even n >= 0) and the impostor (odd n >= 1).
- P4 (locality): the window's own prime terms (n <= e^(2L)) do NOT reproduce S(c): |S_L(c) - S(c)| > 0.2 at one window
  at least.

## 1. Definitions (construction)
Window [-L, L] in the log variable; an L-function with conductor q, Gamma factor Gamma((s + eps)/2) (parity eps = 0 even,
1 odd), pole indicator p (p = 1 for zeta, 0 for entire L). Matching rule (bridge 1, S1-mirror): prolate parameter
c := 2 pi e^(2L)/q, i.e. T = c. P_1 = restriction to [-1, 1], Phat_c = band limitation to [-c, c] (kernel sin(c(x-y))/(pi(x-y))),
chi_n(c) its eigenvalues, Pi_eps the projection on functions of parity eps.
- infinity-local h0:  h0_inf(L) := (1/2) Tr(Pi_eps P_1 Phat_c P_1) = (1/2) sum_{n = eps mod 2} chi_n(c).
  (Exact trace, PROVED: Tr P_1 Phat_c P_1 = 2c/pi and Tr(P_1 Phat_c P_1 R) = int_{-1}^{1} sin(2cx)/(2 pi x) dx = Si(2c)/pi, R = reflection;
  so h0_inf = c/(2 pi) +- Si(2c)/(4 pi).) The factor 1/2: positive frequencies only. The near-null ladder of bridge 1 is the
  transition region 0 < chi_n < 1 of this sum.
- degree:  deg(L) := c L/pi = number of eigenvalues pi k/L (k >= 1) of the window circle's Dirac operator -i d/du (circle of
  length 2L) in (0, c], smoothed. Equals (c/2 pi) log(qc/2 pi).
- genus:  g(L) := N(c) = number of zeros in the critical strip with 0 < gamma <= c (argument principle: off-line zeros count).
- the "+1": the pole p. In the window form it is the two conditions g(0) = ghat(0) = 0 on the companion, which remove the
  two even prolates n = 0, 2 (P3 below confirms: zeta's ladder starts at n = 4; chi_5's at n = 0; the impostor's at n = 1).
- prime-local term:  h1 := S(c) = (1/pi) arg L(1/2 + ic) = -(1/pi) sum_n c_n n^(-1/2) sin(c log n)/log n (formally), c_n the
  coefficients of -L'/L; its window-local part S_L(c) = the same sum over n <= e^(2L), the prime atoms of the window form.
- canonical class: deg K = 2g - 2 = 2N(c) - 2 = (zeros of the completed function with |gamma| <= c) - (its two poles), as for a
  curve (2g zeros of the numerator minus the 2 poles of Z_C).

## 2. The identity (PROVED, elementary)
   h0_inf(L) - S(c) = deg(L) + p - g(L) + O(1/c),   i.e.   h0 - h1 = deg + 1 - g  (zeta),   h0 - h1 = deg - g  (entire L).
Proof. (i) N(c) = theta(c)/pi + p + S(c) for c not an ordinate, theta(t) = (t/2) log(q/pi) + Im log Gamma((1/2 + eps)/2 + it/2)
(argument principle: Titchmarsh 9.3 for zeta, Davenport ch. 16 for L(s, chi), both from memory; for the impostor the
same proof applies to its completed function, entire of order 1 with Lambda(s) = Lambda(1 - s)). (ii) Stirling (DLMF 5.11.1,
from memory): Im log Gamma(sigma + i tau) = tau log tau - tau + (sigma - 1/2) pi/2 + O(1/tau), so
theta(c)/pi = (c/2 pi) log(qc/2 pi e) -+ 1/8 + O(1/c) (- for even, + for odd). (iii) Si(x) = pi/2 - cos x/x + O(x^-2), so
h0_inf = c/(2 pi) +- 1/8 -+ cos(2c)/(8 pi c) + O(c^-2). (iv) Subtract: h0 - S - deg - p + N = theta/pi - deg + h0 = O(1/c). []
So the constant 7/8 of Riemann-von Mangoldt = +1 (the pole = the two removed prolates) - 1/8 (half the reflection trace
Si(2c)/(2 pi) -> 1/4), and an odd Gamma factor flips both 1/8's together (P2). The main terms are Connes-Consani arXiv
2106.01715 Prop. 4.2 ("N'(E) ~ <N(E)>", stated with "~" and "up to a log mu term", read in the TeX lines 845-860); what is
added here: the exact parity trace instead of "k ~ 2 mu", the constants, the O(1/c) error, the parity and conductor rule.

## 3. Numbers (COMPUTED; `python3 tools/memcap.py 1 python3 reverse_r2.py.txt A` -> reverse_r2_A.log; `... B <kind> <L> <NB> <prec>`
-> reverse_r2_B.log; part B reuses the window form of pencil_ctl.py.txt, Arb + mpmath)
Part A (zeros: zeta 42-digit list; impostor r1_A list, off-line quartets counted twice; chi_5 by sign changes of its Hardy
function on a grid of step 1/40):
| family | L | c | deg | h0_inf | N(c) | S(c) | residual h0-(deg+p-N+S) | predicted -+cos(2c)/(8 pi c) | S_L(c), n <= e^2L |
|---|---|---|---|---|---|---|---|---|---|
| zeta | 0.75 | 28.16 | 6.7225 | 4.6053 | 3 | -0.1161 | -0.00113 | -0.00138 | -0.1322 |
| zeta | 1.00 | 46.43 | 14.7781 | 7.5139 | 8 | -0.2642 | +0.00000 | -0.00015 | -0.3532 |
| zeta | 1.25 | 76.55 | 30.4562 | 12.3078 | 19 | -0.1488 | +0.00043 | +0.00034 | -0.0172 |
| chi_5 | 1.25 | 15.31 | 6.0912 | 2.5597 | 3 | -0.5302 | -0.00132 | -0.00181 | -0.4955 |
| chi_5 | 1.50 | 25.24 | 12.0513 | 4.1406 | 8 | +0.0905 | -0.00128 | -0.00154 | +0.1319 |
| chi_5 | 1.75 | 41.61 | 23.1808 | 6.7481 | 16 | -0.4329 | +0.00012 | -0.00002 | -0.2295 |
| impostor | 1.25 | 15.31 | 6.0912 | 2.3132 | 4 | +0.2198 | +0.00218 | +0.00181 | +0.2339 |
| impostor | 1.50 | 25.24 | 12.0513 | 3.8937 | 8 | -0.1595 | +0.00181 | +0.00154 | -0.2381 |
| impostor | 1.75 | 41.61 | 23.1808 | 6.4981 | 17 | +0.3171 | +0.00019 | +0.00002 | +0.4360 |
(h0 checked against a parity-split Nystrom computation of the chi_n: equal to 4 digits.) P1 HIT (all residuals < 0.0022, signs
and sizes of the leading oscillation as predicted; the rest is Stirling's 1/(48 pi c)-type term). P2 HIT. P4 borderline: the
window's own prime atoms give S(c) to 0.014-0.13 (zeta) and 0.014-0.20 (chi_5, impostor); the largest gap is 0.203 (chi_5,
L = 1.75). So the count is nearly local to the window, more than I expected.
Part B (non-tautological: the actual window Weil form, primes included, against the prolate class):
| family | L | #eig(Q_L) < 1e-6 / prolates | < 1e-3 | < 1e-1 |
|---|---|---|---|---|
| zeta (even n >= 4) | 0.75 | 4 / 4 | 5 / 5 | 7 / 6 |
| zeta | 1.00 | 9 / 9 | 11 / 11 | 12 / 12 |
| chi_5 (even n >= 0) | 1.25 | 2 / 2 | 3 / 3 | 4 / 4 |
| chi_5 | 1.50 | 5 / 5 | 6 / 6 | 8 / 8 |
| impostor (odd n >= 1) | 1.25 | 2 / 2 | 3 / 3 | 4 / 4 |
| impostor | 1.50 | 4 / 4 | 6 / 6 | 7 / 7 |
P3 HIT (exact at 1e-6 and 1e-3 in all six; one off by one at 0.1). Rung values agree to a factor < 3 throughout (e.g. zeta
L = 1: 4.25e-6, 2.08e-4, 8.38e-3 against defects 2.99e-6, 2.06e-4, 9.03e-3).
The impostor: it shares the archimedean data of an odd conductor-5 L-function, so h0, deg and the counts of Part B are those
of any such function, and the identity holds for it too (its S and N count the off-line zeros). The local Riemann-Roch
is BLIND to its failure; it differs only in the prime-local term S, which has no sign for anyone.

## 4. What it says about the square (HEURISTIC)
If this is the right local Riemann-Roch, the archimedean place sits in the EXACT and manifestly non-negative part of the
formula: the Euler characteristic deg + 1 - g is produced by the Weyl count of the window minus a positive trace (prolate
sections), with the constant fixed by the parity of the Gamma factor and the pole. All the primes do is supply h1 := S(c),
which is sign-indefinite (negative at all three zeta windows: -0.12, -0.26, -0.15). Hence with these definitions the
Riemann-Roch EQUALITY holds and the INEQUALITY h0 >= deg + 1 - g, which L3 needs on the square, is false as soon as S < 0.
So on the square the archimedean place would sit in chi(O) and the K-term (the main term, the uncertainty principle), and
the inequality would have to come from splitting the prime-local term into a part with a sign (orbit counts, L4-L5) and a
part absorbed into an infinity-local positive quantity; bridge 1 showed that the natural absorber (the prolate leak) loses
its constant along close pairs of zeros. Prediction for R1: any candidate H0 built from P_1 Phat_c alone will satisfy C1
universally (impostor included) and cannot be the source of C2.

## 5. Ratings
Quality 3/5: the identity is proved and checked at nine windows, the count match P3 is a clean non-tautological check; not
higher because its content is Stirling's formula plus Connes-Consani's count, refined.
Toward RH 1/5: it places the archimedean place exactly and shows that the prime-local term has no sign; not higher because
it gives no inequality and touches neither L4-L5 nor the square.
