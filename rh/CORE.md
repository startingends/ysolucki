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
the line, never WHETHER one is. Mechanism (N84): Λ ≥ 0 bites only on non-oscillating tests (a positive
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
the same for Ramanujan over ℚ. Over ℚ the amplifier exists (the scaling flow; Sym^k of the Eisenstein
representation at a zero) but its bound moves with it: what is missing is a FIXED bound, i.e. decay at the cusp /
a Hecke-invariant fixed window. Over ℚ the log p generate a dense subgroup of ℝ, so no window is Hecke-invariant;
over F_q(t) they lie in the lattice (log q)ℤ (N86–N87).

**THE OPEN TENSION.** The Euler product gives only averaged information and RH is pointwise with zero slack. The
only known converter from average to pointwise is amplification, which needs an operation that makes a zero's
deviation grow while an Euler-product bound stays fixed, and over ℚ no such operation is known. A hunch worth
building either supplies that operation, or a pair-local positivity (tight at collisions) that the Euler product
proves directly.
