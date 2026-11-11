# The triangle in operator form (SP-operator, one-object seat, session 4; 2026-11-11)

Read: CORE.md, NOTEBOOK N83–N85, my LOCAL_DISCRIMINANT.md. Construction only (sections 1–3 written before any run; the one
check in section 4 uses an existing log). Labels: PROVED (argument here), KNOWN-IN-SUBSTANCE (classical, from memory, no
search this session), HEURISTIC.

Conventions. h even, real, compactly supported, H(z) = ∫ h(x) e^{izx} dx. Weil's explicit formula:
  Σ_ρ H(γ_ρ) = P(h) − 2 Σ_{n≥2} Λ(n) n^{−1/2} h(log n) + A(h),   P(h) = H(i/2) + H(−i/2) = 2∫ h(x) cosh(x/2) dx,
A = archimedean term, γ_ρ = −i(ρ − ½) (an off-line zero ρ = ½ + β + iγ has γ_ρ = γ − iβ).

## 1. N85's barrier as a lemma

**Class 𝒞_X ("Λ times a weight of forced sign").** Criteria built from one h with supp h ⊂ [−X, X] whose prime-side weights
w(n) = n^{−1/2} h(log n) have a fixed sign on EVERY prime power: h = h₀ + h₁ with supp h₀ ⊂ (−log 2, log 2) (no prime
power there, so h₀'s sign is irrelevant to the primes) and h₁ ≥ 0 on log 2 ≤ |x| ≤ X (h₁ ≤ 0 is the mirror case). Put
  m := H₁(0) = ∫ h₁ (the mean of the weight),  P₁ := P(h₁) (the pole term the arithmetic part carries).
**Pair-local at (γ, γ′)** (consecutive zeros, gap s = |γ − γ′|): ‖H‖_∞ ≤ 1 and |H(γ) − H(γ′)| ≥ η (the test tells γ from γ′
by a contrast η ∈ (0, 2]).

**Lemma 1 (locality versus forced sign).** For h ∈ 𝒞_X:
(a) |H₁(t)| ≤ m for all real t, and |H₀(t) − H₀(t′)| ≤ |t − t′| · log 2 · ‖H₀‖_∞ (Bernstein: H₀ has type < log 2).
(b) P₁ ≥ √2 · m, and for every zero ρ = ½ + β + iγ with 0 ≤ β < ½:  |H₁(γ_ρ)| ≤ ∫ h₁ e^{β|x|} ≤ 2^{−(½−β)} · P₁ < P₁.
(c) If h is pair-local at (γ, γ′) with contrast η, then m ≥ (η − s·log 2)/(2 + s·log 2), hence
      P₁ ≥ √2 (η − s log 2)/(2 + s log 2)  →  η/√2  as γ → ∞ (s ≍ 2π/log γ → 0).
(d) With m → 0 (no arithmetic part), locality is possible only for gaps s ≥ η/((1 + m) log 2) ≈ 1.44 η: zeros below height
    about 4π, i.e. none of the bulk.
Proof. (a) h₁ ≥ 0 ⇒ |H₁(t)| ≤ ∫h₁ = H₁(0); Bernstein's inequality for the bounded entire function H₀ of exponential type
< log 2. (b) e^{|x|/2} ≥ √2 on supp h₁ and P(h₁) = ∫h₁(e^{x/2} + e^{−x/2}) ≥ ∫h₁ e^{|x|/2}; and
∫h₁ e^{β|x|} = ∫h₁ e^{|x|/2} e^{−(½−β)|x|} ≤ e^{−(½−β) log 2} ∫h₁ e^{|x|/2}. (c) η ≤ |H₁(γ) − H₁(γ′)| + |H₀(γ) − H₀(γ′)|
≤ 2m + s log 2 (‖H‖_∞ + m) by (a); solve for m; then (b). (d) is (c) read backwards. ∎
**What it says.** In 𝒞_X, the Euler-product part h₁ weights every single zero, on or off the line, by LESS than the pole term
it carries (b), and resolving a pair at height γ costs a pole term at least ≈ η/√2 of the contrast (c). The criterion
"Σ Λ w ≥ 0" ⇔ "Σ_ρ H(γ_ρ) ≤ P + A" is therefore decided by how much of the pole the totality of the zeros uses up, never by
one zero: the Euler product counts, it does not locate (CORE 3, made quantitative). The only way an off-line zero's term
approaches the pole is β → ½ with mass of h₁ at |x| ≲ 1/(½ − β): zeros near Re s = 1, i.e. the de la Vallée Poussin zero-free
region shape and nothing more.
**Known?** KNOWN-IN-SUBSTANCE: this is the positivity mechanism behind de la Vallée Poussin's zero-free region, Landau's
theorem (a Dirichlet series with non-negative coefficients has a singularity at the real point of its abscissa), and the
record's H10 / N84. The packaging "pair-locality versus forced sign" with constants (c) was not found in what I remember; no
search was run this session (rule 5: so "not known to me", not "new"). It is a barrier, not progress.
**Why it matters for section 2.** Lemma 1 is defeated in the one known way: Deligne/Rankin. There the forced-sign positivity is
exactly Landau's (point counts ≥ 0), and it wins because an amplifier moves the off-line deviation from β to kβ while the pole
stays at a FIXED distance (½ in the normalised variable). In Lemma 1's terms: (b) becomes |zero term| ≤ e^{−(½ − kβ)X'}·P,
which exceeds the pole once kβ > ½. So the operator form of the amplifier must supply (i) forced sign (Λ_k ≥ 0), (ii)
deviation kβ, (iii) pole at fixed distance. Section 2 asks whether the D-space can.

## 2. The D-space as a Krein space, and the best amplifier candidate

**2.1 The Krein/Pontryagin structure (PROVED, elementary; standard in substance).** H_L := L²(−L, L) (real) with the
positive inner product D (bounded, closed, strictly positive: plank 6). Q is a bounded Hermitian form on it. By the explicit
formula Q = Σ_{on-line} ℓ_γ ℓ_γ* + Σ_{quartets} 2(ℓ_z ℓ_z̄* + ℓ_z̄ ℓ_z*), ℓ_w(f) = F(w); each quartet's term, as a real form of the
four real functionals Re/Im F(z), Re/Im F(z̄), has signature (2, 2). So (H_L, Q) is a Pontryagin space (after quotienting the
Q-null part) with ν_−(L) ≤ 2·N_off negative squares (N_off = number of off-line quartets, all heights), ν_−(L) non-decreasing
in L (windows nest), and RH ⇔ ν_−(L) = 0 for all L (Weil). Via the kernel formula of LOCAL_DISCRIMINANT 3.3 the D-Gram at
the zeros is G = ½∫₁^∞ r(N) r(N)* dN/N with r(N)_j = e^{−iγ_j(L + log N)} R_N(ρ_j): the scaling variable N already
parametrises the kernels. KNOWN-IN-SUBSTANCE: Weil's distribution restricted to (−2L, 2L) is a Hermitian function with
finitely many negative squares iff finitely many zeros are off the line (Krein–Langer theory of κ-positive-definite functions:
positive definite plus finitely many complex exponentials); from memory, not searched.

**2.2 Which operators commute with the Krein form, and which of them come from the Hecke structure (PROVED).**
The GL₁ Hecke structure is the action of ℚ_{>0}^× by f ↦ c_n f(· + log n), i.e. F(z) ↦ c_n n^{−iz} F(z); a general element is
convolution with Σ c_n δ_{log n}, i.e. multiplication of F by a Dirichlet polynomial P(z) = Σ c_n n^{−iz}. Then
  Q(Pf) = Σ_on |P(γ)|² |F(γ)|² + Σ_quartets 2·2Re[P(z) conj P(z̄) F(z) conj F(z̄)],
so P is a Krein isometry (Q(Pf) = Q(f) for all f) iff |P(γ)| = 1 at all on-line zeros and P(z) conj P(z̄) = 1 at all off-line
ones. Requiring this without using where the zeros are (|P| = 1 on all of ℝ and P(z)·conj P(z̄) = 1 identically), the only
Dirichlet polynomials are single terms P = c·n^{−iz}, |c| = 1 (Bohr: an almost-periodic |P|² ≡ 1 has one frequency), and more
generally the translations T_a f = f(· + a), P = e^{−iaz}, a ∈ ℝ. (A P unimodular only AT the zeros would encode the zeros:
not available a priori.) **The Krein isometries in the Hecke/scaling structure
are exactly the scaling flow** (Connes' idele class action). The impostor has the same Krein isometries: Q is translation
invariant for every function with an explicit formula (Q depends on f ∗ f̃ only). Arithmetic-blind.

**2.3 The candidate T and what it does to the off-line part (PROVED).** T_a acts on evaluations by
  ℓ_γ(T_a f) = e^{−iaγ} ℓ_γ(f) (unitary on every on-line zero),
  ℓ_z(T_a f) = e^{−iaγ} e^{−aβ} ℓ_z(f), ℓ_z̄(T_a f) = e^{−iaγ} e^{+aβ} ℓ_z̄(f)   (z = γ − iβ):
on the hyperbolic plane of each quartet T_a is a Lorentz boost of rapidity aβ. **This is an amplifier in operator form: under
T_a^k the off-line evaluation grows like e^{kaβ}, the on-line ones stay unimodular, and Q is preserved.** It is the best candidate
the D-space offers. It fails, at three exactly identifiable places:
(F1) **It leaves the window.** T_a maps H_L onto L²(−L − a, L − a). On the fixed window space the only Krein-isometric
     multipliers are trivial (PROVED: a multiplier m with m·PW_L ⊂ PW_L is entire of exponential type 0 in both half-planes by the
     Paley–Wiener/Krein theorem; |m| = 1 on ℝ and Phragmén–Lindelöf then force m ≡ const). The compression C_L T_a C_L is
     NILPOTENT ((C_L T_a C_L)^k = 0 once k|a| ≥ 2L): **the window kills the amplifier.**
(F2) **Its a-priori bound grows at the same rate.** The only positive bound for the evaluation at z of a function supported in
     the moved window [−L − ka, L − ka] is Paley–Wiener's |F(z)| ≤ e^{β(L + k|a|)}‖f‖₁: exactly e^{kaβ} again. The boost and the
     bound move together; a Krein isometry with hyperbolic part is perfectly consistent in a Pontryagin space (no contradiction
     from O(n, 1)). The contradiction mechanism would need (Lemma 2 below) a bound UNIFORM in k.
(F3) **Tensor powers do not separate deviation from pole.** On H_L^{⊗k} with Q^{⊗k} and the diagonal translation, an off-line
     k-tuple has deviation kβ, and the prime side of Q^{⊗k} has weights Π Λ(n_i) ≥ 0 (forced sign survives!), but its pole term is
     the k-fold product of poles, at distance k/2: Lemma 1(b) for the product gives the ratio e^{−(k/2 − kβ)X} = (e^{−(½−β)X})^k,
     no gain. A fixed-distance pole would require an object whose "trivial part" does not scale with k: in Langlands' argument it
     is the absolute convergence of L(s, Sym^k π) at Re s > 1 for every k, a theorem about AUTOMORPHIC (unitary) representations,
     which ζ's zeros are not parameters of. That is vertex (B) of the triangle, reached from the operator side.

**Lemma 2 (what a working amplifier would prove; PROVED, elementary).** Let T be a bounded operator on (H_L, D) with
Q(Tf, Tg) = Q(f, g), power-bounded in the POSITIVE norm (sup_k ‖T^k‖_D < ∞), and suppose a vector v₀ with Q(v₀) < 0 spans,
with its partner, a T-invariant hyperbolic plane on which T has eigenvalues λ, 1/λ̄. Then |λ| = 1, i.e. the plane is not
boosted. Proof: T^k u = λ^k u, ‖T^k u‖_D ≤ C‖u‖_D ⇒ |λ| ≤ 1; the partner eigenvalue 1/λ̄ gives |λ| ≥ 1. ∎ So the required object
is: **a Q-isometry of a FIXED window space, D-power-bounded, whose action on each quartet is the boost of 2.3.** (F1) says no
multiplier does it; a non-multiplier would have to mix zeros (send the evaluation at ρ to evaluations at other points), and the
only such operations on the record (Sym^k, Rankin–Selberg) leave GL₁, i.e. leave the D-space.

## 3. The object that would make the wall trivial, in my words; did section 2 get closer?
The wall: the Euler product gives forced-sign positivity (Λ ≥ 0), and Lemma 1 proves that such positivity weights every
individual zero below its pole term, so it counts zeros and never excludes one. The trivialising object is an operator T on a
fixed positive Hilbert space carrying the Weil form as Krein form, that (1) preserves the Krein form, (2) is power-bounded in
the positive norm for an ARITHMETIC reason (the Euler product of a whole family, absolutely convergent at a fixed abscissa), and
(3) boosts the hyperbolic plane of any off-line quartet by a rapidity proportional to β. Lemma 2 then kills every quartet, and
(2) is exactly where the Euler product would act, through a uniform-in-k absolute-convergence bound rather than through a mean
square. Section 2 got closer in one precise sense: the D-space has (1) and (3) in the scaling flow T_a (an honest boost of every
off-line quartet, unitary on the line), and it fails (2) for an identifiable reason, (F1)–(F2): the scaling flow does not preserve
any window, and its only positive bound is Paley–Wiener's, which grows with the boost. It did not get closer to an example: the
missing property (2) is vertex (B) of N83's triangle, and section 2 shows that inside GL₁ (translations, Dirichlet polynomials,
tensor powers) nothing supplies it. The weakest form of (A) that could still give (2) would have to be an action that is NOT a
multiplier on evaluations (it must move ρ to other points while keeping the Krein form): the one structural gap I can name.

## 4. Check (after 1–3): negative squares on record
From the existing whitened matrices (hyb_dh_quartet.log): impostor L = 1.70: lowest pencil values 0.0412, 0.0442 (ν_− = 0);
L = 1.72: −0.0480, +0.0108 (ν_− = 1); plank 9 records two negative eigenvalues (one per parity block) at L = 1.8. Consistent
with 2.1 (ν_− non-decreasing, ≤ 2 per quartet). No new computation was needed for 1–3.

## 5. Ratings
**Quality 5/10**: Lemma 1 and Lemma 2 are correct and short with constants, and 2.2–2.3 identify the Krein isometries and the
three failure points exactly; not higher because both lemmas are classical in substance and nothing was searched or computed.
**Toward RH 1/10**: it sharpens the requirement (a D-power-bounded Krein boost) into vertex (B) and shows GL₁ cannot supply it;
not higher because no candidate with property (2) exists, inside or outside the D-space.
