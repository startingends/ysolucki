# R5: the principal divisors as dilation sums (Nyman–Beurling) on the window (SP-operator, session 9; 2026-11-11)

Read: REVERSE.md (R5), THEORY T118/T120 (as summarised by the lead), my REVERSE_R4.md, LOCAL_DISCRIMINANT §7.
Sections 1–3 and the predictions were written before any computation. Conventions of REVERSE_R1 §1.

## 1. P_NB on the window
**Exact principal divisors in a window: only 0 (PROVED).** A window function f (support [1/λ, λ] multiplicatively, [−L, L] in
log variable) has Mellin transform F in the Paley–Wiener space PW_L: entire of exponential type L, bounded on ℝ, so its
zeros satisfy n(r) ≤ (2L/π + o(1)) r. A numerically trivial class must have F vanishing at every zero of ζ, whose number up to
height T is (T/2π) log(T/2πe) ≫ T. So F ≡ 0. (The same for the impostor, whose zero count also grows like T log T.) Exact
dilation sums f_h = Σ_n h(n·) − (pole term) are never supported in a window: their Mellin transform ζ(s)ĥ(s) is not of
finite exponential type unless ĥ ≡ 0 (uncertainty principle, the reason bridge 1's E(g) always has an inner tail).
**The window version of P_NB is exactly my D-geometry (PROVED from plank 5 / plank 6).** Every window function is the window
cut of a dilation sum: f = E(g)|_window for a companion g on [−λ, λ] (Möbius on [1/λ, λ], free part on (0, 1/λ)); the part of
E(g) outside the window is the inner tail T, built from the leak k = (1 − B)ĝ only (LOCAL_DISCRIMINANT Lemma A). So
**D(f) = min over companions of ‖k‖² is the squared distance, in the leak norm, from f to the exact dilation sums whose tail
vanishes: the Möbius norm D is the Nyman–Beurling distance on the window.** Hence the natural window principal subspace is
  P_NB,ε(L) := span of the L²-eigenvectors of D with eigenvalue ≤ ε (small leak = nearly a dilation sum),
with degree conditions a = b = 0 for numerical triviality at the poles. Bridge 1 (plank 3b) found the ladders of Q and D
parallel (rung-wise ratios 0.92–1.12): **P_NB,ε is R4's ladder again, up to factors of order 1 in ε.** Dimension ≈ c/π − O(log)
≈ 2e^{2L} for ζ (prolate band c = 2πe^{2L}), ≈ 2e^{2L}/5 for the impostor (band c/5). Numerical triviality holds up to the
tail: for f = E(g)|_window, Q(f, x) = −W(T, x) (plank 5's identity, polarised), and the pole terms of f are those of E(g),
which vanish only under the codimension conditions on ĝ at the poles. D-null space: there is none (D is strictly positive,
plank 6); "principal" means D-SMALL, and in the D-normalised geometry (where the impostor's failure lives) nothing is small.

## 2. E with P_NB, and the mechanism question
**Prop. R5.1 (PROVED; R4.1 verbatim).** E_NB: "every degree-zero g with D·D(g) > 0 has g + f ≥ 0 for some degree-zero
f ∈ P_NB,ε". Since g + f ≥ 0 with a(g + f) = 0 forces g = −f, whose D·D is ≤ ε-small, E_NB ⇔ no degree-zero g with
D·D > O(ε): Weil positivity on degree zero up to ε. Pure reformulation again.
**A Riemann–Roch-type mechanism, and why it gives the wrong statement (PROVED parts).** Farkas' lemma: g + P meets the cone of
nonnegative functions iff every nonnegative measure μ annihilating P satisfies μ(g) ≥ 0. For the EXACT dilation sums
(all h, no window, no degree condition), μ annihilates them iff E*μ = 0, where E*μ(y) = Σ_n (dilate of μ by n)(y) has
coefficients 1. **For ζ, E* is injective on nonnegative measures (a sum of nonnegative dilates vanishes only if μ = 0): the
positivity of ζ's Dirichlet coefficients.** So the Farkas alternative never fires and every g is effective modulo exact
dilation sums. Concretely, with h ≥ 0 a bump on [λ/2, λ], E(h) ≥ c > 0 on all of [1/λ, λ] (the dilates [λ/2n, λ/n] cover
(0, λ]), so g + M·E(h) ≥ 0 for M large: trivially effective. **But this uses h ≥ 0, which violates the pole condition
∫h = 0, i.e. these principal divisors have positive degree**: effective + principal of positive degree. With the degree
conditions imposed, Prop. R5.1 kills it. So the one place where coefficient positivity produces effective representatives
is exactly the place where "principal" fails to mean "numerically trivial". For the impostor, E_f* has coefficients
1, κ, −κ, −1, 0 and nonnegative μ with E_f*μ = 0 may exist (mixed signs), and E_f(h) ≥ 0 with h ≥ 0 fails (the n ≡ 4 terms
enter with −1): the impostor's version of this mechanism breaks at the coefficient signs, not at multiplicativity (L(s, χ₅)
has signed coefficients too: caveat).
**Riemann–Roch would have to say:** "D·D(g) > 0 ⇒ the affine space g + P_NB contains a nonnegative function", proved
without knowing whether such g exist. Dimension count: dim P_NB,ε ≈ 2e^{2L} against infinitely many pointwise constraints
(or ~ NB grid constraints): no counting argument applies; the only existence mechanism found (above) needs positive degree.

## 3. Known?
From memory, NOT searched this session: Burnol (2002–2007) related Nyman–Beurling to the explicit formula and to "Sonine"
spaces (functions vanishing with their Fourier transforms on intervals) and co-Poisson summation; Báez-Duarte (2003) gave the
strengthened Nyman–Beurling criterion with dilation sums of 1_{[0,1]}; Connes–Consani's prolate/Sonin work identifies the
near-null ladder with Sonin spaces. The identification "D (the leak / Möbius norm of the companion) = Nyman–Beurling distance
on the window" I do not recall in print; it is a direct consequence of plank 5 here. Effectivity modulo dilation sums
(Farkas + positivity of E*) not recalled.

## 4. Computation plan and PREDICTIONS (before running)
LP (as in R4): max t with g + Σ c_j f_j ≥ t·max|g| on a 2001-point grid, f_j a basis of P_NB,ε = L²-eigenvectors of D with
eigenvalue ≤ 1e-6, with degree conditions (E_NB) or without (E′_NB).
(i) impostor L = 1.8, degree-zero negative direction g, ITS P_NB (from D_DH): E_NB infeasible (forced); E′_NB feasible
    (probability 0.7: D_DH's ladder ≈ Q_DH's ladder, which carries 97% of g).
(ii) same g with ZETA's P_NB at L = 1.8 (needs a zeta dump at L = 1.8): E′_NB infeasible (probability 0.6: zeta's ladder is
    built on the band c = 2πe^{3.6}, the impostor's on c/5; g lives on the latter).
(iii) zeta L = 1.0, 1.25 test directions (positive-degree tops): feasible as they stand (they are ≥ 0, R4).

## 5. Computation (COMPUTED; two_zero/effect3.py.txt; P_NB = L²-eigenvectors of D with eigenvalue ≤ 1e-6, from the dumps;
new dump QDmp_zeta_9_5_180.pkl (zeta at L = 1.8, 380 bits); grid 2001 points, |c_j| ≤ 1e3; not certified)
| g | P_NB from | dim (deg-0) | E_NB (degree-zero P) | E′_NB (whole P) |
|---|---|---|---|---|
| impostor 1.8, degree-zero negative direction | impostor D | 11 (9) | **+0.0000** (g + p ≡ 0: g is itself in P) | +3.33 |
| impostor 1.8, same g | **zeta D (L = 1.8)** | 50 (48) | **−0.0016** (g within 0.2% of zeta's P) | +2.30 |
| impostor 1.8, control (random deg-0 bulk) | impostor D / zeta D | | −0.575 / −0.359 infeasible | **+0.275 / +0.145 feasible** |
| zeta 1.0: L²-top of D·D (take −g) / D⁻¹(a + b) / control | zeta D | 9 (7) | −g ≥ 0 as is / +0.0003 / −0.505 | +0.43 / +0.50 / −0.27 |
| zeta 1.25: same three | zeta D | 18 (16) | +0.646 / 0.000 / −0.999 | +0.76 / +0.05 / −0.96 |
**Prediction score.** (i) E_NB infeasible: MISS in letter (the LP finds g + p = 0, the trivial solution Prop. R5.1 allows
only when g is itself near-principal; it is); E′_NB feasible: HIT. (ii) E′_NB with zeta's P infeasible: MISS (feasible, and
so is the control: E′ is trivial). (iii) zeta test directions effective: HIT.
**Reading.**
- E′_NB (principal divisors of free degree) is TRIVIAL: even random bulk functions become effective (controls feasible at
  1.8), exactly as §2 predicted (positive-degree dilation sums E(h), h ≥ 0, absorb any negative part). It carries no RH content.
- E_NB (degree zero) is decided by Prop. R5.1, and the decisive fact is: **the impostor's failing degree-zero class is itself
  near-principal, with respect to its OWN dilation sums (exactly, to the LP's precision) and to ZETA's (within 0.2%).** Its
  L² share in the D-ladder is essentially 1; its Q/‖g‖² is 5e-17; yet relative to D (the Nyman–Beurling distance) its
  self-intersection is +0.29. So in K3's language: **there are near-principal divisors with positive self-intersection.** The
  intersection form is not continuous with respect to "being principal": a principal divisor must have D·D = 0, but classes
  ε-close to principal in the dilation-sum geometry can have D·D/D of order 1 when D itself is ε-small. This is plank 5 seen
  from the other side: such a class is f = E(g)|_window with a tiny leak, and its whole Weil form is the Weil form of the tail
  (Q(f) = W(T)), negative when the tail sees the off-line zero (the quartet at 85.7 is above the impostor's band edge 46).
- Consequence for R5: "principal = dilation sums" is the right algebra (Mellin ζ·ĥ, numerically trivial in the limit) but on a
  window it cannot be used as a subspace: the only exact window principal divisor is 0 (§1), and the approximate ones carry
  arbitrary signs of D·D in the D-normalisation. Whatever K3 needs, it must make D·D vanish on principal divisors EXACTLY,
  which forces leaving the window (all of ℝ₊*), where the Nyman–Beurling theory lives and where the quantitative content is
  the classical Nyman–Beurling/Báez-Duarte distance (known to be RH-equivalent).

## 6. Ratings
**Quality 6/10**: the identification "D = Nyman–Beurling distance on the window" is proved from plank 5, exact window
principal divisors are shown to be 0, the one coefficient-positivity mechanism (Farkas + E* injective) is found and shown to
need positive degree, and the computation exhibits near-principal divisors of positive self-intersection (the impostor's
failure), for both functions' dilation sums; not higher because it is uncertified and the decisive statement (an exact,
off-window version) is not attempted. **Toward RH 1/10**: R5's principal divisors either are trivial on the window or lead back
to the Nyman–Beurling distance, an RH-equivalent quantity; nothing here proves an inequality.
