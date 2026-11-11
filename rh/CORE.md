# Core understanding (one page; read before every new hunch)
Lead, 2026-11-11. Only the deepest facts on the record and the one open tension. Details live elsewhere
(`NOTEBOOK.md`, `BRIDGE.md`, `HUNCHES.md`, `THEORY.md`); if a fact here is overturned, change this page first.

**1. Soft positivity is everywhere and decides nothing.** Weil positivity of the window form Q on [−L, L] is RH.
On short windows it holds for ANY function with a functional equation: the near-null eigenvalues are Poisson
summation (prolate defects at the band edge c = 2πe^(2L)), and the band edge is Montgomery's line (window length =
log of the height). Above it nothing resolves individual zeros; RH is decided below it, in the bulk. (BRIDGE 1–12)

**2. The impostor marks the missing ingredient.** The Davenport–Heilbronn function has the functional equation and
every soft structure we built, and has zeros off the line. What it lacks: an Euler product (Λ ≥ 0, support on prime
powers, multiplicativity). So a proof must use the Euler product TOGETHER with the functional equation, in the bulk.
No step on the record does. (BRIDGE end; N80)

**3. Every known use of the Euler product is statistical, and meets one wall.** Mollifiers, amplifiers, sieves,
density estimates, Nyman–Beurling, parity, the October 7/8 and 11/12 proofs: all are mean squares of Möbius-type
sums, and all stop at the same wall (short families: the family is not longer than the sum; wall #34, eight
languages). Copies cap amplifiers at 3/4 (proved, formal cores). The Euler product tells HOW MANY zeros are off
the line, never WHETHER one is. Even 100% of zeros on the line would not be RH: Davenport–Heilbronn-type
functions have almost all zeros on the line and ≫ T off it (N93). Mechanism (N84): Λ ≥ 0 bites only on non-oscillating tests (a positive
trigonometric polynomial has positive mean, which pairs with the pole), and the bulk is made of oscillating ones.

**4. Zeta has no slack.** De Bruijn–Newman Λ ≥ 0 (Rodgers–Tao): zeta sits exactly on the edge. Every positivity
margin we measured is carried by the closest pair of zeros and an off-line quartet is a collided pair. Statements
with a uniform margin are false (H10, H11); a true statement must be exactly tight along colliding pairs.

**5. There is one object on the record that touches 2 and 4 at once.** The Möbius norm D = 2‖μ-inverse of f‖² is
pinned to the actual zeros (its kernel is small at the zeros, up to 1e23 between them), and the comparison
constant of (Q, D) is the bottom of a Gram matrix of D-kernels at the zeros, which vanishes exactly at a collision
(two-zero model, proved inside the model). It is global and only measured; statement (S) about it was killed. (N81, N82)

**6. In function fields the average-to-pointwise converter is amplification by products.** Deligne/Weil: on C^k
the deviations of zeros ADD while the a-priori bound (point counting, i.e. the Euler product plus positivity) stays
one unit from the centre, so a weak bound for all k is the exact bound. Langlands' symmetric-power argument does
the same for Ramanujan over ℚ. Analytically over ℚ the amplifier is the 2k-th moment of a prime polynomial
(unique factorisation gives the Gaussian diagonal); its missing fixed bound is the square-root variance of
k-almost-primes in multiplicatively short intervals, wall #34 (N101). Over ℚ the amplifier exists (the scaling flow; Sym^k of the Eisenstein
representation at a zero) but its bound moves with it: what is missing is a FIXED bound, i.e. decay at the cusp
(cuspidality). Over F_q(t) it comes from Harder's compact support, which needs a cusp with no archimedean
direction; over ℚ every cusp has the continuous height ℝ₊ (N86–N89).

**THE OPEN TENSION, located (N89): the infinite place plays both parts.** The archimedean term is the only
positive term in Weil's form, and the archimedean height is the only obstruction to a fixed bound.

Why (N90): the functional equation is Poisson summation for ℚ ⊂ 𝔸, which needs the archimedean place; at ∞
the uncertainty principle holds (no function compact on both sides), while at p the unit 1_{ℤ_p} is self-dual and
compact. The uncertainty principle gives the soft positivity (prolate ladder) and forbids exact vanishing deep
in the cusp (Harder's fixed bound). One fact, both parts.

Known framing (N92): all of this is the norm map C_ℚ → ℝ₊* having a continuous target (Connes 1999); over
F_q(t) the degree map goes to ℤ. The function-field proof's content is a Stepanov/Riemann–Roch BOUND, whose
ℚ-analogue is RH itself.

Classification of every use of the Euler product (N98): linear ones are blind, insufficient, or the full problem;
nonlinear statistical ones are twist-blind (but density COUNTS separate ζ from the impostor, via |μ| ≤ 1:
N100); pretentious ones reach only the edge; structural ones need a cusp
form at a zero. Wanted: a use that is pointwise, in the bulk, and not through automorphic Hilbert spaces; size bounds such as
|μ| ≤ 1 cannot give it (bounded coefficients can have large values; Guth–Maynard).

Reverse-engineered (N111–N113, `rh/REVERSE.md`): in Weil's architecture over ℚ the Euler-product step is PROVED
on effective classes (g ≥ 0 ⇒ the prime side is ≥ 0), and the archimedean Riemann–Roch is an exact identity;
what is missing is the step that PRODUCES effective representatives, and the right principal divisors; on finite
windows there are none (N114), so the missing link needs a global square.

Narrowing N3 (N118, corrected N119): positivity from L² of Eisenstein series is positivity of Weil's distribution
TWISTED by e^(x/2) (axis Re s = 1), which is why it stops at Re s = 1; every positive structure whose involution is
the functional-equation reflection (half-density L², Witt adjunction, Sonin, symmetrised D) is a NORM in which the
zeros appear only as a kernel. Needed: positivity of Weil's form itself with the zeros as its spectral support.

**THE OPEN TENSION, in general.** The Euler product gives only averaged information and RH is pointwise with zero slack. The
only known converter from average to pointwise is amplification, which needs an operation that makes a zero's
deviation grow while an Euler-product bound stays fixed, and over ℚ no such operation is known. A hunch worth
building either supplies that operation, or a pair-local positivity (tight at collisions) that the Euler product
proves directly.
