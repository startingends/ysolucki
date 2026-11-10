# The shape of the key lemma (working backwards from the barriers)

Owner rule 3 (2026-11-10): ask what the key lemma of *any* proof must look like, given barriers B1–B10, and
design to that shape instead of from what is familiar. This file is that derivation. Each step says what it
rests on. It is reasoning about the form of a proof, not a proof of anything. Lead's draft; unreviewed.

## Constraints → shape

**S1. The lemma must be non-linear in the function.** (PROVED, one line.)
The two Dirichlet L-functions mod 5 (RH expected) and the Davenport–Heilbronn impostor (RH false, verified in
`tests/test_controls.py`) lie in the same 2-dimensional real vector space of functions sharing one functional
equation. So no property preserved by real linear combinations can imply RH. The lemma must pass through a
non-linear operation: a logarithm, a quotient, a product, or the Euler factors themselves.
*From B1, B2.*

**S2. The same test object must be seen by the primes and by the symmetry at once.** (HEURISTIC.)
Beurling systems have primes with positive weights and no symmetry, and fail. The impostor has the symmetry
and no primes, and fails. So the lemma has to be an inequality in which one function ψ is paired with the
prime shifts *and* with the archimedean (Gamma-factor) kernel, and neither pairing alone is constrained.
In practice this forces the Weil explicit formula's two-sided form; the freedom left is what ψ ranges over
and how the inequality is proved. *From B10.*

**S3. Zero margin allows exactly three kinds of proof.** (HEURISTIC, from Λ ≥ 0.)
An estimate with room to spare cannot exist. What can:
- (i) an exact identity: the quantity *is* a sum of squares;
- (ii) a limit of exactly-positive objects in a sense in which positivity survives. Note that positivity of
  a quadratic form survives *pointwise* convergence on test functions. That is far weaker than the uniform
  convergence asked for in wall W1, and for a test function of bounded support only finitely many primes
  are involved;
- (iii) analysis of the equality case: assume the margin is exactly zero somewhere and derive a contradiction
  from the equation that the extremal object must satisfy.
*From B3, B6.*

**S4. The right finite stage is a window of test functions, not a partial sum.** (PROVED in substance.)
Cutting the sum over n is an approximation and misbehaves (B5; our own table in UNDERSTANDING U-3).
Restricting the *support of the test function* to a window of half-width a is exact: the explicit formula
then contains finitely many prime powers and nothing is approximated. So stages are indexed by a.
Verified by literature search: on each window the form is a genuine operator with discrete lowest eigenvalue
λ_a, continuous in a, positive for small a (Suzuki, arXiv 2606.09096, Thm 1.1, 1.3, 1.4), and RH fails
exactly if λ_a < 0 for some a (Yoshida 1992, as quoted there). *From B5.*

**S5. Global in height.** No argument confined to a bounded range of t (B4, universality).

**S6. Falsifiable on the impostor at a finite, computable stage.** (Owner rule 4.)
The lemma's hypothesis must fail for Davenport–Heilbronn at a window size we can compute, and we must be able
to say in advance roughly where.

## The shape these force

Combining S3(iii), S4 and continuity of λ_a:

> **Template (first-failure window).** Suppose RH is false. Then there is a smallest a₀ with λ_{a₀} = 0, the
> form is non-negative on that window, and there is ψ ≠ 0 supported in [−a₀, a₀] with
> (W ⋆ ψ)(x) = 0 for |x| < a₀, i.e.
>
>   (archimedean kernel ⋆ ψ)(x) + (pole terms) = Σ_{p^k} (log p) p^(−k/2) [ψ(x − k log p) + ψ(x + k log p)]
>
> on the window, with only finitely many prime powers present. **Key lemma to find:** no such ψ exists.

Check against the constraints: non-linear in ζ (the weights log p come from ζ′/ζ) ✔ S1; ψ meets primes and
Gamma kernel together ✔ S2; equality case, no margin needed ✔ S3; finite stage, exact ✔ S4; ψ is not
localised in height ✔ S5; the impostor has a genuine a₀ and ψ, computable ✔ S6.

An equivalent differential form (S3(ii) flavour): λ_a can never reach 0 if it obeys
λ′(a) ≥ −c(a) λ(a) with c locally integrable (Grönwall). So the quantity to study is
**R(a) = −λ′(a)/λ(a)**, the rate at which the lowest energy is lost per unit of window. RH ⟺ R is locally
integrable on (0, ∞). For the impostor R must blow up like 1/(a₀ − a).

## What the key lemma is allowed to use (and must use)

A null vector exists for the impostor, so the lemma must use something the impostor lacks. Candidates, in
the form they appear in the equation above:
- P1 the weights are ≥ 0;
- P2 they sit only on prime powers;
- P3 they are exactly log p (not merely bounded by it);
- P4 the shifts are by logarithms of *integers* (this is what a Beurling system lacks).
A lemma using only P1–P3 would also apply to Beurling systems unless the archimedean kernel fails to match
them; so P4, or the exact match between the Gamma kernel and the integers, has to enter.

## Honest status
- Nothing here is proved beyond S1 and the cited theorems.
- A first attempt at "no such ψ exists" by a uniqueness argument fails, and the reason is instructive: the
  zero-side expression Σ_ρ ψ̂(ρ) e^(−(ρ−1/2)x) vanishing on an interval does not force its coefficients to
  vanish, because the zeros are too dense (the exponentials are over-complete on every finite interval).
  Recorded as **wall W2** in the hub.
- Literature check (2026-11-10, three papers, partly read): no first-failure / null-vector argument, no
  formula for dλ_a/da, no control without Euler product was found in Suzuki 2026, Kim et al. 2026 or
  Connes–van Suijlekom 2025. This is "not found in what was read", not "new".
