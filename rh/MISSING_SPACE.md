# The missing space: a specification derived from what the session proved (lead, 2026-11-11)
Owner: "What's needed is a new kind of mathematical space ... now you need to fill it, which requires an idea that
doesn't exist yet." This file does not claim to fill the hole. It turns the hole into a SPECIFICATION precise
enough that a candidate can be checked against it, and records the one design principle the session's proved
results point to. Ratings at the end. Facts recalled from memory are marked (m).

## 1. What the space must contain (each line is a proved or checked fact of this session, or Weil's)
- (S1) Divisors D(f), f a test function on ℝ₊*, with D(f)·D(g) = Weil's form (Connes' normalisation; N112).
- (S2) Degree: D·ξ₀ = ĝ(i/2), D·ξ₁ = ĝ(−i/2) (the two poles; N112).
- (S3) An archimedean Riemann–Roch that is an exact identity, the prolate count (N111).
- (S4) Positivity on EFFECTIVE classes, already proved: for f ≥ 0, D·D(f) ≥ −W_∞(f∗f̃), because Λ ≥ 0 (N113).
- (S5) Exact principal divisors and an intersection form continuous with respect to them; impossible on finite
  windows (N114), so the space is global.
- (S6) The impostor must fail inside the space exactly where its coefficients change sign (N113, N114).

## 2. The design principle: the gap between (S4) and Weil positivity is a GROUP LAW
(S4) is positivity for POSITIVE combinations of Frobenius graphs, D(f) = ∫ Ψ(λ) f(λ) d*λ with f ≥ 0. Weil positivity
needs it for SIGNED combinations. Over a finite field the same gap exists and is closed in Weil's second proof, by
the Jacobian (m):
- On C × C, a positive combination Σ a_k Γ_{π^k} (a_k ≥ 0) is an effective correspondence, so its positivity is
  "points are counted positively", which is (S4).
- A signed combination φ = Σ a_k π^k is not effective on C × C, but it is still a MORPHISM of the Jacobian J,
  because J is a group ([−1] is a morphism). Pull-back by a morphism preserves effectivity, so φ*Θ is effective, and
  Tr(φφ′) = c·(φ*Θ·Θ^(g−1)) ≥ 0 for the Rosati involution φ ↦ φ′ (positivity of the Rosati trace). With φ′ the
  dual of φ under the polarisation, this is |α| = √q for every eigenvalue α of π.
- So: **the group law is what converts signed combinations of Frobenius into geometric maps, and that is exactly
  what extends (S4) from f ≥ 0 to all f.** Read against this session: every positivity we proved is for positive
  combinations (S4); every obstruction we hit is a signed combination (oscillation, N84; fake weights, N95;
  near-principal classes of the wrong sign, N114).
- The Rosati involution is the functional equation: φ = U_f ↦ φ′ = U_{f̌} with f̌(λ) = f(1/λ)/λ (duality on H¹ is
  Poincaré duality, i.e. ρ ↦ 1 − ρ). Weil positivity is "Tr(φφ′) ≥ 0", the Rosati positivity.

**Specification of the missing object (call it the arithmetic Jacobian J):**
- (J1) a commutative group object, with a theory of effective divisors and pull-back;
- (J2) a ring map ℤ[ℝ₊*] (signed combinations of scalings) → End(J), whose kernel is the ideal of principal classes
  (f with f̂(ρ) = 0 at every zero and pole), so that End(J) ⊗ ℂ "is" the ring of functions on the zeros;
- (J3) a polarisation Θ whose Rosati involution is f ↦ f̌ (the functional equation);
- (J4) pull-back by endomorphisms preserves effectivity (automatic for morphisms of a group object);
- (J5) ampleness: effective · Θ ≥ 0, the analogue of (S4).
Then Tr(φφ′) ≥ 0 for every φ, which is Weil positivity, which is RH. The impostor has no (J2): its coefficients do
not come from a ring of scalings (no multiplicativity), so End is not available.

## 3. What a naive candidate does, and why it collapses
- Any group on which scaling acts LINEARLY (ℝ₊*, the adeles, the idele class group with the power maps
  x ↦ x^λ of Connes–Consani's Fr_λ) gives End ⊇ ℝ with Σ a_i[λ_i] ↦ Σ a_i λ_i: the ring map of (J2) collapses to
  evaluation at ONE point (the pole s = 1, the degree). An abelian variety has End ⊗ ℚ ⊇ ℚ(π) of degree 2g because
  π satisfies a polynomial of degree 2g; the arithmetic J would need End to see every zero, i.e. an
  infinite-dimensional group whose endomorphisms realise every character λ ↦ λ^(ρ−½). No known group does.

## 4. Where the intersection numbers must live: the Arakelov shape
- Over a finite field, intersection numbers are integers (times log q). Over ℚ, Weil's form produces values
  Σ (integers)·log p + (archimedean real part). The log p are ℚ-linearly independent, so the natural integral
  structure is the free group ⊕_p ℤ·log p ≅ ℚ₊*: one INTEGER intersection number per prime, plus a real number at ∞.
  That is exactly the shape of Arakelov intersection theory (local intersection i_p ∈ ℤ at each p, times log p, plus
  a Green-function term at ∞), where the arithmetic Hodge index theorem IS PROVED (Faltings, Hriljac (m)). So the
  missing space should be "Arakelov-like": ∞ enters through Green functions, on the same footing as the primes,
  which is the requirement of N89–N90 in a form that already exists in mathematics.
- The obvious candidate, and why it is not enough: modular curves over ℤ with Hecke correspondences T_n as the
  "Frobenius graphs". Arithmetic Hodge index gives positivity of Néron–Tate pairings ⟨φ(T)x, φ(T)x⟩ for signed Hecke
  combinations φ (the group law of the Jacobian J₀(N) makes them morphisms, exactly as in §2), and Gross–Kohnen–Zagier
  (m) packages ⟨T_n x, x⟩ as Fourier coefficients of a modular form. But the positivity is indexed by the HECKE
  SPECTRUM (the eigenforms f; it yields statements like L′(f, 1)·L(f, χ, 1) ≥ 0 at the centre (m)), not by the ZEROS of
  any one L-function; and ζ enters only through the Eisenstein / cuspidal part, which is torsion and has height 0.
  This is the triangle of N83 again: positivity attaches to spectral parameters, and zeros are not spectral
  parameters of anything known.

## 5. The specification in one sentence
**An Arakelov-type space (integer intersection numbers per prime, a Green-function term at ∞) carrying a GROUP law,
on which signed combinations of the scaling flow act as endomorphisms whose joint eigenvalues are the zeros of ζ,
with the functional equation as Rosati involution.** Every ingredient but one exists separately: Arakelov
intersection with Hodge index (Faltings–Hriljac), group laws with Rosati positivity (abelian varieties), the scaling
flow with the zeros as spectrum (Connes), the effective-class positivity (S4, proved here), the archimedean
Riemann–Roch (S3, proved here). The missing ingredient is an object having the group law AND the zeros of ζ as
eigenvalues of its endomorphisms at once.

## 6. Honest status and ratings
- This is a specification, not a construction. Its new content (to be checked against the literature): (i) the
  identification of the session's proved positivity (S4) with "positive combinations of Frobenius graphs" and of
  every obstruction met with "signed combinations", so that the missing structure is precisely a group law (Weil's
  Jacobian proof, read backwards); (ii) the Rosati involution as the functional equation and Rosati positivity as
  Weil positivity, stated for ℚ; (iii) the ⊕_p ℤ log p integrality pointing to Arakelov theory; (iv) why the modular-
  curve candidate gives spectral, not zero, positivity.
- Quality 4 (clean and consistent with every result of the session; several links from memory). Toward RH 2 (it
  names the object more sharply; it does not build it).
