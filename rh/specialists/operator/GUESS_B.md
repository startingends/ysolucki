# Guess B under narrowing N3 (SP-operator; 2026-11-11)

Read: rh/GUESSES.md (whole), rh/MISSING_SPACE.md §8, rh/REVERSE.md, rh/specialists/reflection/ (LIBRARY L16–L20, MEMORY §1–2).
Construction only, plus one decisive check (§1). Labels: PROVED, KNOWN (from memory), HEURISTIC.

## 1. The two involutions in operator language, and where the +1 sits
Window, log variable u = log x, half-density normalisation (my machinery: f(u) ↔ x^{1/2}f(x)), F(z) = ∫ f(u) e^{izu} du,
a zero ρ ↔ γ_ρ = −i(ρ − ½). The window form is Q(f) = Σ_ρ F(γ_ρ) conj F(conj γ_ρ), and conj γ_ρ = γ_{1−ρ̄}.
- **J₀ f(u) := conj f(−u)** (time reversal + conjugation). It is the unitary involution of the translation (= scaling)
  group on L²(du): (f ∗ J₀f)^(z) = F(z)·conj F(z̄). So Q(f) = W(f ∗ J₀ f), W the Weil distribution, and on the spectral side
  J₀ is s ↦ 1 − s̄: **in the half-density normalisation the unitary conjugation of the scaling action IS the
  functional-equation reflection.** Check (COMPUTED, zeta L = 1, NB = 100): Q is exactly invariant under R: f(u) ↦ f(−u),
  ‖Q − RQR‖/‖Q‖ = 1.5e-119 (Weil's distribution is even).
- **J_σ f(u) := e^{(2σ−1)u} conj f(−u)**: the unitary involution of the weighted structure L²(e^{−(2σ−1)u} du) with spectral
  axis Re s = σ; its pairing at the zeros is F(γ_ρ) conj F(γ_{2σ−ρ̄}). **J_σ = S_σ⁻¹ J₀ S_σ, S_σ := multiplication by
  e^{−(σ−½)u}** (PROVED, one line). Since S_σ is multiplication by a CHARACTER, it is an automorphism of the convolution
  algebra: S(a ∗ b) = Sa ∗ Sb. Hence (PROVED) a distribution W is J_σ-positive on the window iff the twisted distribution
  e^{(σ−½)x}·W (x ∈ [−2L, 2L]) is J₀-positive: **the +1 of N3 (σ = 1 for ζ(w) inside Eisenstein series ζ(2s)) is the twist of
  the Weil distribution by the character e^{x/2}, i.e. a shift of every spectral point by ½.** On a fixed window the twist is a
  bounded similarity (condition number e^{2|σ−½|L}), so J_σ- and J₀-structures are SIMILAR on each window; they are not
  equivalent uniformly in L, and positivity transported from axis σ is positivity of a different distribution (it constrains
  the line Re s = σ: N3's "only proves the zero-free line").
- So N3, restated invariantly: the positive structures found have unitary AXIS ≠ ½ (Eisenstein: Re w = 1; coefficient
  positivity: σ > 1 / Landau). The functional-equation reflection is J₀ itself, and "using the reflection" means "being a
  unitary/positive structure with axis exactly ½".

## 2. Known structures with axis ½ (involution = the reflection), tested
| structure | involution | positive? | do the zeros decide its positivity? |
|---|---|---|---|
| L²(ℝ₊*, dx) with unitary dilations (half densities) | J₀ | yes, a norm | no: spectral measure is Lebesgue on the whole line |
| big Witt / Λ-structures: ℓ²(ℕ, m^{−1}) with F_n f(m) = f(nm), V_n f(m) = n f(m/n)·[n∣m] (PROVED: F_n* = V_n exactly for the weight m^{−1}; in weight m^{−2σ}, F_n* = n^{2σ−1}V_n) | the Witt adjunction F ↔ V = J₀ (axis ½) | yes, a norm | no: F_n has eigenvalue n^{−s} on every character; ζ's zeros appear only as the kernel of Σ F_n (Nyman–Beurling) |
| my D-norm (Möbius = Nyman–Beurling distance, R5) | conjugation only: D is NOT reflection-invariant (COMPUTED: ‖D − RDR‖/‖D‖ = 0.58; plank 6 (ii)), because it cuts g in time and ĝ in band asymmetrically | yes, a norm | only through pinning (K_D small at zeros, T131): zeros are where D's kernel is small, not points of its spectral measure (a.c. density ≈ |M_N|²) |
| D symmetrised, (D + RDR)/2 | J₀ | yes | same as D (foothold: κ_min 0.356 vs 0.331 at L = ½) |
| Sonin spaces (f and 𝔉f vanish on [0, a]; Connes–Consani) | the Fourier transform 𝔉 itself, which on even functions acts on Mellin transforms as s ↦ 1 − s times the local Γ-ratio: the ARCHIMEDEAN functional-equation reflection, as an operator (KNOWN: local Tate) | yes: CC prove positivity of the archimedean Weil functional on such spaces (KNOWN, from the record's digests) | no: only the archimedean place; zeros do not enter |
| prolate wave operator (commutes with time and band cutoffs) | 𝔉-symmetric | self-adjoint, not positive | its "UV" spectrum relates to squares of zeros (Connes–Moscovici 2022, KNOWN from memory, not checked); positivity not the statement |
| co-Poisson (Burnol) / my plank 5 E(g) | the global FE = Poisson, as an operator g ↦ E(g) | no positivity of its own | zeros = kernel of the Mellin side ζ·Mg |
**Answer to 2.** Yes, positive structures whose involution is the reflection exist in abundance (every half-density L² of
the scaling action, the Witt adjunction F* = V, the symmetrised D, Sonin spaces with 𝔉), and also the reflection as an
operator (𝔉, Poisson). In every case the positivity is that of a norm, and the zeros are NOT points of its spectral measure:
they appear as a kernel (Witt, co-Poisson, Nyman–Beurling), as pinning (D), or not at all (Sonin, L²). N3 is therefore not
the sharpest form: the missing structure is not "positive for the reflection" but **"positive for the reflection, with the
zeros as the support of its spectral measure"**, i.e. a Hilbert space in which Weil's form, not a norm, is the inner product.

## 3. Verdict on Guess B, and reflection positivity
**Guess B under N3 (HEURISTIC verdict, two proved ingredients).** The big Witt vectors pass N3's letter: their natural
duality F_n* = V_n is exactly the axis-½ involution in the half-density weight (PROVED above), and Connes–Consani's Fr_λ on
the arithmetic site has adjoint Fr_{1/λ} in any Haar L² (KNOWN). They fail its intent: (i) the positive structure is a norm
in which every character is spectral, the zeros enter only through the kernel of Σ F_n (the Nyman–Beurling wall of N114 /
R5); (ii) the functional-equation operator itself (the adelic Fourier transform 𝔉 with 𝔉 U_λ 𝔉⁻¹ = U_{1/λ}, KNOWN, Tate /
Connes' adele class space) is NOT part of the Witt structure: F_λ comes with V_λ / F_{1/λ}, not with F_{1/λ}∘(FE). The
archimedean place, which is where 𝔉 is not trivial (at p the unit 1_{ℤ_p} is self-dual), is exactly what char-1 Witt vectors
lack (MISSING_SPACE §8). So Guess B is not killed by N3, but it is reduced to the same problem as everything else: an axis-½
structure whose positivity is Weil's form rather than a norm. Quality of the guess after this test: 2.
**Reflection positivity (Osterwalder–Schrader) — what RH is and is not.** With the scaling group U_t (t = log λ) and the
reflection θ = R (u ↦ −u, the FE reflection in half densities, θU_tθ = U_{−t}):
- OS reflection positivity would be ⟨η, θη⟩_{L²} ≥ 0 on a half-space E₊ (functions on u > 0), i.e. positive definiteness of
  the HANKEL kernel W(x + y) on x, y > 0. By Källén–Lehmann / Widder (SP-reflection L17, L18; their B134) such W are completely
  monotone, ∫ e^{−λ|x|} dν with ν ≥ 0: no atoms. Weil's distribution has atoms −Λ(n)n^{−1/2} at ±log n, so **RH is not OS
  reflection positivity of the scaling flow** (SP-reflection, S1: the Weil form is an INVERSE propagator, pole minus a
  reflection-positive coupling).
- What RH is in this language (PROVED identity, SP-reflection B60, restated): on the half-window, with T_W the Toeplitz form
  of W and H_W its Hankel (mirror) form, Weil positivity on [−L, L] ⇔ T_W ≥ 0 on (0, L] and |H_W| ≤ T_W, i.e. **the reflection
  θ is a contraction of the W-Hilbert space on the half-window**. That is the trivial consequence |⟨η, θη⟩| ≤ ⟨η, η⟩ of OS
  (Neeb–Ólafsson, SP-reflection L16) with the roles exchanged: in OS the big form is L² and the mirror form is the new
  positive object; for RH the big form must be W itself and the mirror form is dominated by it.
- **The most precise statement of the required structure:** a Hilbert space 𝓗 with a unitary scaling group U_t, a unitary
  involution θ with θU_tθ = U_{−t} that IS the functional-equation operator (adelic 𝔉 composed with inversion), and a
  positive cone or subspace E₊ (functions supported where the primes act, e.g. |x| < 1 adelically), such that (a) the
  Toeplitz form ⟨η, U_t η⟩ restricted to E₊ is Weil's distribution, and (b) θ is a contraction for it. Under RH the natural
  𝓗 is ℓ²(zeros) with U_t = e^{itγ} and θ = identity on it (on-line zeros are fixed by ρ ↦ 1 − ρ̄); an off-line quartet makes
  θ swap ρ and 1 − ρ̄ and destroys (b). Constructing 𝓗 without the zeros (from the primes and ∞) is the Hilbert–Pólya
  problem in reflection form; the known objects build 𝓗 as a norm space (axis ½) where (a) fails: the Toeplitz form of the
  norm is not W.

## 4. Ratings
**Quality 6/10**: the involutions are written exactly (J_σ = S_σ⁻¹J₀S_σ, the +1 as a character twist), the Witt adjunction is
shown to be the axis-½ involution, D's failure of reflection symmetry is computed, and N3 is sharpened to "positivity of
Weil's form itself, with the zeros as spectral support"; not higher because the Witt and char-1 statements about Connes'
2011 construction and Connes–Moscovici are from memory and unsearched. **Toward RH 1/10**: Guess B survives N3 only by
moving the problem to the same place as every other structure (a norm where the zeros are a kernel).
