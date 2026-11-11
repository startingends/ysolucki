# The two-zero model of kappa_min (SP-operator, session 2 of the operator seat on this question; 2026-11-11)

Question (lead, N80; rule 13): in what setting does kappa_min(L) = min Q/D_L have an exact formula, and what does that
formula do through the collision of a pair of zeros (de Bruijn–Newman picture)?

Read before starting: PROJECT_BRIEF.md (rules 11–13), NOTEBOOK N80, BRIDGE.md planks 1–13, foothold PROGRESS.md
sections 19–25 and pencil_dh.py.txt (definitions of Q, D_L, the Legendre basis, kappa_min, the zero-side
decomposition 2|F(gamma)|^2 per on-line zero, 2 Re F(z) conj F(conj z) per off-line point).

## 1. PREDICTION (written 2026-11-11, before any formula was evaluated and before any code was run)

Honest status of this section: written after about an hour of setting up the model on paper (the reduction of the
zero side to a sampling form, below), so the QUALITATIVE items (a)–(c) were already suggested by the set-up, not by a
computation. The NUMERICAL items (d)–(g) are blind: no number of the model had been computed when they were written.

(a) Shape in delta at fixed L: kappa_min is an analytic function of u = delta^2 (not of delta), so near the collision
    it is QUADRATIC in delta, not linear and not an odd power law. The apparent proportionality kappa ~ gap of N80
    (0.57, 0.53, 0.48) is a crossover between a constant and a quadratic, not a law.
(b) Through the collision: continuous and smooth in u, the off-line quartet being u = -beta^2 < 0 (the zero side is
    the same analytic expression, continued). kappa_min does NOT vanish at the collision when the pair sits strictly
    above the window's band edge; it changes sign at some beta*(L) > 0 off the line, and beta*(L) -> 0 as L grows.
(c) Only when the pair sits exactly at the band edge (local oversampling ratio r = 1, defined below) does kappa_min
    vanish at the collision, and there it vanishes linearly in u, i.e. like delta^2 on the line and -beta^2 off it.
(d) Sign change for the impostor's quartet (height 85.70, Re rho = 0.8085), with NO fitted constant (the sign of
    kappa does not depend on the D-normalisation): the model puts the first negative window in L in [1.62, 1.82].
(e) The model, scanning all consecutive pairs of zeta zeros below 200, picks 59.35/60.83 as the binding pair at
    L = 1.0 and 111.03/111.88 at L = 1.25.
(f) With one background constant per function, kappa(zeta, 1.25)/kappa(zeta, 1.0) in the model is within 25% of the
    measured 0.687.
(g) The model's minimiser puts most (> 70%) of its zero-side value on the pair itself (as measured: 80–99%).

## 2. The models, stated precisely (three levels; every simplification named)

Notation (as in `pencil_dh.py.txt`): window [−L, L] in the log variable, f real, F(z) = ∫ f(u) e^{izu} du (entire, type L);
Q = the Weil form (zero side: 2|F(γ)|² per on-line zero, 4 Re F(z)·conj F(z̄) per off-line quartet, z = γ + iβ'),
D = D_L the foothold seat's comparison form; κ_min = λ_min of the pencil (Q, D). Pair midpoint c, half-gap δ, local mean
spacing s = 2π/log(qc/2π), relative gap g = 2δ/s. **Heat-flow parameter u = δ² (on-line pair) or u = −β² (off-line
quartet c ± iβ); u = 0 is the collision.** Near a collision under the de Bruijn–Newman flow, δ² moves linearly in the
flow time, so "analytic in u" is the right notion of "smooth through the collision".

**M1, the flat two-zero model** (the model asked for, taken literally). Simplifications: (i) local in frequency near
height c; (ii) all other zeros replaced by their smooth density, realised as the picket fence c + s(ℤ + ½) (a continuous
density is wrong here: it lets F hide in the hole and gives a prolate artefact); (iii) archimedean term + primes + the
fence = the tight-frame identity s·Σ_fence |F|² = ∫|F|² dt, exact for F ∈ PW_L when r := π/(Ls) = log(qc/2π)/(2L) ≥ 1
(r = oversampling ratio; r = 1 is the band edge 2πe^{2L}/q); (iv) **D replaced by a constant times ∫|F|²** (bulk).
The pair replaces the two fence points c ± s/2. Then κ = κ_bg·ρ(r, u), ρ = min of s·Q_model/‖F‖².

**M2, the hybrid model** (exact D): the foothold seat's exact Q and D (matrices dumped by `two_zero/dumpQDmp.py.txt`,
unchanged code), all other zeros, the archimedean term and the primes exact; only ONE pair is moved:
Q_u = Q − (zero-side terms of the actual pair) + (zero-side terms of a pair at c ± √u). κ(u) = λ_min(Q_u, D).

**M3, the reduced eigenproblem (the exact-formula setting found here).** In D-whitened coordinates (D = I) the zero
side of Q is Σ_ρ m_ρ ℓ_ρ ℓ_ρᵀ, ℓ_ρ = the D-reproducing kernel of evaluation at ρ (Re and Im parts). So κ_min is the
bottom of a Gram problem on the kernels k_ρ := k^D_ρ at the zeros. **Two-zero formula**: keep only the binding pair,

  κ₂ = 2 λ_min( G ),  G = 4×4 real Gram matrix of {Re k_{γ1}, Im k_{γ1}, Re k_{γ2}, Im k_{γ2}} in the D-inner product,

(for a complex 2×2 approximation: κ₂ ≈ (K11 + K22) − √((K11 − K22)² + 4|K12|²), K_ij = K_D(γ_i, γ_j)), and for an
off-line quartet the same with the indefinite weight matrix of 4 Re F(z) conj F(z̄). Simplification: the neighbours'
kernels are dropped (they lower κ by 12–23%, see 4.3).

## 3. Formulas and behaviour

### 3.1 M1 closed form (PROVED, elementary; CHECKED by an independent brute force)
With ℓ = π/r, S(d) = sin(ℓd)/(ℓd) (d in units of s, complex allowed), for each parity σ = ±1 about c:
  A = −(1 + σS(1))/r,  B = (1 + σS(2√u))/r,  C = −(S(½ − √u) + σS(½ + √u))²/r²,
  λ_σ = [(A + B) − √((A − B)² + 4C)]/2,   **ρ(r, u) = min(1, 1 + λ₊, 1 + λ₋)** (u in units of s²).
All entries are even functions of √u, so ρ is real-analytic in u through u = 0 (the off-line quartet is the analytic
continuation √u = iβ; the even sector gets +2|F_e(iβ)|², the odd sector −2|F_o(iβ)|²). Proof: Q_model = I + rank-4
perturbation on PW_L, nonzero spectrum = spectrum of (weights × Gram of sinc kernels), split by parity.
Check (`two_zero/model.py.txt check`): Legendre basis of degree < 40 on the window, exact transforms, lattice sum to
|k| ≤ 2·10⁵, no use of the tight-frame identity: agreement to 6 digits in 5 cases (on- and off-line, r = 1, 1.2, 1.5).
Behaviour (`explore.py.txt`):
- collision: ρ(r, 0) = 1 − 1/r + sin(π/r)/π (odd sector): **0 at r = 1, positive for r > 1** (0.18 at r = 1.1, 0.33 at 1.2);
- at r = 1: ρ(1, u) = (64/π²)·u/s² + O(u²) on both sides: vanishes exactly at the collision, linearly in u, sign = sign u;
- off-line sign change at β*(r) > 0: β*/s = 0.080, 0.128, 0.187, 0.278, 0.502 at r = 1.02, 1.05, 1.1, 1.2, 1.5.
- But M1 treats a LARGE gap as a defect too (a hole between fence points), and a hole lowers ρ more than a close pair.

### 3.2 What D really is (COMPUTED, 4 digits; this is what breaks M1's simplification (iv))
On packets above the band edge, D_L(f) = 2‖M_L f‖², M_L f(v) = Σ_{n ≤ e^{2L}} μ(n) n^{−1/2} f(v + log n) on the window
(the Möbius-inverse part of the companion, both sides): ratio 1.000 for 35 ≤ t ≤ 95 at L = 1 (`dsym.py.txt`). So
D(Zψ) = 2‖ψ‖² for plank 7's change of variable, D weights |F|² by a mollifier |M_N|² ≈ 1/|ζ|², and **D is not flat:
on packets D/‖f‖² swings between 1.2 and 4.9 with the zeros** (`symbol.py.txt`).
Sharper, the D-reproducing kernel on the line, K_D(t) := sup_f |F(t)|²/D(f) (`kscan.py.txt`, logs kscan_*.log):
- zeta, L = 1: **K_D(γ) = 0.4–2.2 at every zero from 14.13 to 114**, while K_D at midpoints between consecutive zeros is
  4·10²³ (14–21), 10⁸ (48–50), 7·10³ (59–61), 48 (72), and O(1) only above ≈ 75;
- impostor, L = 1.5: the same, K_D(γ) = 0.6–2.5 at its zeros, midpoints 10¹⁵ (5–9) … 29 (37.5), O(1) from 40 on.
So below a height T_D(L) ≈ 1.55·2πe^{2L}/q the window space with the D-norm is pinned at the zeros: evaluation is
bounded exactly at the zeros of the L-function and nowhere else. Above T_D it is a bulk space. (Not arithmetic: the
impostor's D pins the impostor's zeros, as plank 9 would predict; it is the functional equation.) The binding pairs sit
just below or at T_D: zeta 59.35/60.83 (T_D ≈ 73), impostor 40.16/40.68 (T_D ≈ 39–40).

### 3.3 M2 (hybrid) through the collision (COMPUTED, multiprecision whitening, logs hyb_*.log)
Check: with the actual pair, M2 reproduces the foothold seat's κ_min to all printed digits (0.297833, 0.204610,
0.137721, 0.137594, 0.041237, −0.047964).
(a) **Removing a pair opens exactly four null directions** (two complex evaluations): lowest pencil values of
(Q − pair, D): zeta L = 1: 9e-15, 7e-14, 1e-9, 7e-9, then 0.313; impostor L = 1.5: 5e-9, 3e-8, 2.6e-4, 1.1e-3, then 0.373
(`nullfam.py.txt`). The zeros behave like a complete interpolating sequence for (window, D) below T_D: this is r = 1 of M1.
(b) **Collision**: κ(0) ≤ 1e-4 in all four on-line cases (|κ| < 5e-7 in three). Off the line κ < 0 at once, linearly:
κ ≈ −1.85|u| (zeta, L = 1), −3.8|u| (zeta 1.25), −2.4|u| (impostor 1.5), −4.5|u| (impostor 1.6).
(c) Impostor pair at L = 1.5 (at T_D): κ(u) is smooth and analytic through the collision, κ/u = 2.44, 2.43, 2.28, 2.03
at u = 0.0036, 0.005, 0.026, 0.068 (actual), and 2.35, 2.46, 2.59, 2.85 at u = −0.001, −0.005, −0.02, −0.05. **This is
the clean two-zero law: κ ≈ A·u, zero exactly at the collision, sign change continuous.** Q(v_min) sits 99% on the pair.
(d) Zeta pairs (inside the pinned range): κ(u) is a SPIKE at the true position: L = 1: 0.2978 at u₀, 0.297 at δ₀ ± 1e-4,
0.251 at ± 1e-3, 0.023 at ± 1e-2, ≤ 3e-4 elsewhere on the line; L = 1.25: 0.134 at ± 1e-3, 0.004 at ± 1e-2. The spike
sharpens with the basis (degree < 60: smooth, κ(δ₀ − 0.1) = 0.22; < 84, 100, 116: width ≈ 2.5e-3). Impostor at
L = 1.6 (pair now inside its pinned range): a broad peak (0.121/0.134 at ∓1e-2). Reason: K_D is astronomically large
off the zeros, so a pair moved to non-zeros can be cancelled at no cost (3.2). **Freezing the other zeros and the D-form
while moving one pair is not a consistent model inside the pinned range; there the window knows the positions of the
zeros to ~10⁻³.** The de Bruijn–Newman flow moves all zeros and has no D of its own, so this is not a statement about
the flow, but it says the comparison constant is not a function of the gap alone.
(e) Impostor quartet 85.70 (far above T_D): smooth in β. L = 1.70: κ = 0.0547, 0.0412, 0.0266 at β = 0.2985, 0.3085
(actual), 0.3185; L = 1.72: +0.0718, −0.0313, −0.0480, −0.0661 at β = 0.2085, 0.2985, 0.3085, 0.3185, so the quartet's
own sign change at L = 1.72 is at β* ≈ 0.27. As β → 0 κ returns to 0.1376, the value of the on-line pair at 40.4, which
then binds: far above T_D a collision does not make κ vanish (the M1 regime r > 1).

### 3.4 M3, the two-zero Gram formula (COMPUTED; `gram.py.txt`, `gram_u.py.txt`)
| case | κ_min (foothold) | κ₂ = 2λ_min(4×4 pair Gram) | with neighbours within 3 / 6 / 10 / 20 of c |
|---|---|---|---|
| zeta L = 1, 59.35/60.83 | 0.2978 | 0.3361 (+13%) | 0.3361 / 0.3262 / 0.3166 / 0.3026 |
| zeta L = 1.25, 111.03/111.87 | 0.2046 | 0.2295 (+12%) | 0.2232 / 0.2196 / 0.2123 / 0.2085 |
| impostor L = 1.5, 40.16/40.68 | 0.1377 | 0.1688 (+23%) | 0.1515 / 0.1467 / 0.1419 / 0.1397 |
The Gram eigenvalues come in near-equal pairs (0.3361/0.3399; 1.616/1.670): a complex 2×2 problem. Along u (impostor,
L = 1.5) κ₂/u → 2.99 (u → 0⁺) and 3.14 (u → 0⁻): analytic through the collision, 25% above M2's slope.
Collision expansion (PROVED, elementary; for any analytic family of kernel vectors k(t)): with k± = k(c ± √u),
λ_min Gram{k₊, k₋} = 2u·J(c) + O(u²), J(c) = ‖k′(c) − (⟨k′, k⟩/‖k‖²) k(c)‖²_D, continued to u = −β² for the quartet. So
**κ₂(u) = 4J(c)·u + O(u²)**: zero exactly at the collision, sign of u, continuous; at the impostor pair J ≈ 0.75.

## 4. Numerical check against the foothold seat's data, and the prediction scored

### 4.1 M1 (flat) against the data (`local.py.txt`, `scan.py.txt`; logs local.log, scan.log)
| point | r | g | ρ (two-zero) | measured κ | κ/ρ |
|---|---|---|---|---|---|
| zeta L = 1, 59.35/60.83 | 1.129 | 0.534 | 0.515 | 0.298 | 0.58 |
| zeta L = 1.25, 111.03/111.88 | 1.150 | 0.387 | 0.409 | 0.205 | 0.50 |
| impostor L = 1.4 / 1.5 / 1.6, 40.16/40.68 | 1.24 / 1.16 / 1.08 | 0.287 | 0.444 / 0.352 / 0.257 | 0.157 / 0.138 / 0.138 | 0.35 / 0.39 / 0.54 |
Failures: M1 lets ρ keep falling with L where the data plateau (1.5 → 1.6); its minimiser puts only 24–56% of Q on the
pair (data 80–99%); scanning all pairs it picks the large gaps 60.83/65.11 (L = 1) and 107.17/111.03 (L = 1.25), the
holes next to the true pairs, not the pairs; its off-line sign change for the quartet at 85.70 (β/s = 0.207) is at
L ≈ 1.87 (actual first failure 1.71; plank 9's records put the wave-packet regime at ≈ 1.8).

### 4.2 Prediction score (section 1)
(a) analytic in u, quadratic in δ near the collision; N80's linearity a crossover — **HIT** for M1, M2 at the impostor
    pair, M3 (local log-slope in g at the actual impostor gap 1.6, → 2 as g → 0). Inside zeta's pinned range M2 is a
    spike instead (not a smooth function of δ at all), so "the shape in δ" is only meaningful in M3 or at T_D.
(b) "κ does not vanish at the collision; sign change at β* > 0": **MISS** for every resolved pair with exact D (κ(0) ≤ 1e-4,
    negative at once off the line). It holds only far above T_D (the quartet at 85.70: κ → 0.1376 as β → 0) and in M1.
    I assumed D flat; it is not.
(c) vanishing at the collision only at r = 1: **HIT in substance, wrong in mechanism**: exact D makes every pair below T_D
    behave as r = 1 (four null directions, 3.3a); the flat oversampling ratio r is not the relevant parameter.
(d) impostor sign change in [1.62, 1.82] from M1: **MISS** (M1 gives ≈ 1.87).
(e) M1 picks the right pairs: **MISS** (it picks the adjacent holes).
(f) κ(1.25)/κ(1.0) within 25%: **HIT** marginally (M1 0.794 vs 0.687; 16%).
(g) > 70% of Q on the pair: **MISS** in M1 (24–56%); M2/M3 80–99% (by construction at the true configuration).
Net: 2 hits, 2 partial, 3 misses. The flat model is wrong where it matters; the useful object is M3.

### 4.3 Normalisations on the three on-line points (`zprime.py.txt`)
| point | g | κ/g | κ/g² | μ := min|L′(ρ)|²/log²(qγ/2π) at the pair | κ/μ | κ/κ₂ |
|---|---|---|---|---|---|---|
| zeta L = 1 | 0.534 | 0.558 | 1.05 | 0.384 | 0.78 | 0.89 |
| zeta L = 1.25 | 0.387 | 0.529 | 1.37 | 0.225 | 0.91 | 0.89 |
| impostor L = 1.5 | 0.287 | 0.480 | 1.67 | 0.148 | 0.93 | 0.82 |
κ/g and κ/μ are both flat to ±9% (two functions, three windows); κ/g² is not. μ is the Lagrange-interpolation
normalisation (|L′(ρ)| ∝ δ near a collision, so μ ∝ u, matching κ ∝ u). Three points; not a fit; L differs.

## 5. Structural conclusion

**What the model makes precise of N80.** (i) The comparison constant is a Gram eigenvalue of D-reproducing kernels at
the zeros (M3, identity in whitened coordinates: exact up to the zeros beyond the basis), dominated by the closest
pair just below the pinning height T_D(L) ≈ 1.55·2πe^{2L}/q; neighbours change it by 12–23%. (ii) For a pair, as its
kernels merge, κ₂ = 4J·u + O(u²): κ vanishes exactly at the collision and changes sign continuously, linearly in the
heat-flow parameter u = δ² (PROVED inside M3, elementary; CONFIRMED in M2 at the impostor's pair, slope 2.4 vs M3's 3.0).
(iii) So "Q ≥ c·D for all L" with c > 0 is incompatible with resolved pairs of arbitrarily small u·J: inside the model
the margin is exactly u·J, the Λ = 0 shape asked for by H11.
**What is NOT proved, and what transfer to zeta needs.** (1) That J (the D-derivative energy of the kernel at the pair)
stays bounded along Lehmer pairs: in the pinned range K_D is enormous off the zeros, so J could be large; M2's spikes
show the D-geometry is rigid at scale 10⁻³. (2) That the neighbours' correction stays a bounded factor (measured 0.82–0.89).
(3) Arbitrarily small normalised gaps (or |ζ′(ρ)|/log γ): this is open (from memory, NOT checked against sources in this
session: liminf of normalised gaps ≤ about 0.515 on RH, Feng–Wu / Preobrazhenskii; GUE predicts 0). With the measured
law κ ≈ 0.53 g and gaps ≈ 0.515 the transfer
would only give κ_min(L) ≲ 0.27 infinitely often, not κ → 0. A Rodgers–Tao-type averaged argument (uniform κ ⇒ uniform
D-separation ⇒ contradiction with pair-correlation averages) is the route that would not need individual Lehmer pairs;
not attempted. (4) Everything numeric is one implementation, floats/multiprecision, not certified.

**The normalised quantity (CANDIDATE STATEMENT, conjecture on three points + model).** κ/u does not change sign: both
κ and u do, together. The statement tight along Lehmer pairs is therefore a two-sided comparison with a signed gap:

> (S) There are absolute constants 0 < c ≤ C such that for every window L (above a fixed L₀) and every primitive L-function
> with this functional-equation structure, letting (ρ₁, ρ₂) be the binding pair, i.e. the consecutive pair in the pinned
> band 2πe^{2L}/q < γ < T_D(L) minimising Δ := −Z′(γ₁)Z′(γ₂)/log²(qγ/2π) (Z the real Hardy function; for an off-line
> quartet the pair is ρ, 1 − ρ̄ and Δ is the same analytic expression, which is then negative),
>      c·Δ(L) ≤ κ_min(L) ≤ C·Δ(L)   whenever |Δ(L)| ≤ 1   (and κ_min(L) ≍ 1 otherwise).

On the three on-line points κ/Δ = 0.65, 0.78, 0.91 (geometric-mean form of μ; with min|L′|² instead, 0.78, 0.91, 0.93).
For the impostor's quartet (S) correctly predicts κ < 0 once the quartet binds. (S) is not RH-equivalent and is no
reformulation of it: its content is the UPPER bound κ ≤ C·Δ (which kills every uniform margin as soon as Δ gets small) and
the LOWER bound κ ≥ c·Δ for on-line zeros, an interpolation inequality for the zeros in the D-normalised window space
whose constant is the local discriminant of the pair, exactly zero at a double zero. Its first test is cheap: compute
κ_min at the windows that bind the next closest zeta pairs below 200 (e.g. 94.65/95.87, 121.37/122.95) and at the χ₅
control, and check κ/Δ ∈ [0.6, 1.0]. Kill line: κ/Δ outside [0.3, 2] at any of them, or M2 at an impostor pair inside its
pinned range showing a κ that does not vanish at the collision.

## 6. Files
`rh/specialists/operator/two_zero/`: model.py.txt (M1 closed form + brute-force check), explore.py.txt, local.py.txt,
scan.py.txt (M1 tables, data comparison), symbol.py.txt, dsym.py.txt, psitest.py.txt (D on packets; D = 2‖M_L f‖²),
dumpQDmp.py.txt (foothold code up to Q, D, unchanged, dumps matrices at full precision; dumpQDmpHI = more nodes and
precision, identical results), hybrid.py.txt (M2), nullfam.py.txt, kernel.py.txt, kscan.py.txt (K_D), gram.py.txt,
gram_u.py.txt (M3), zprime.py.txt (normalisations). Logs alongside. Matrices (≈ 60 MB) in `rh/data/operator_two_zero/`
(gitignored). One trap found: zero positions rounded to 6 digits (2e-4 error) make Q − pair indefinite (−0.003): inside
T_D the forms resolve zero positions to ~1e-4; all reported runs use the 25–42 digit zeros.
