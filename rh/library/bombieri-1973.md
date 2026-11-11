BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# E. Bombieri, "Counting points on curves over finite fields (d'après S. A. Stepanov)", Séminaire Bourbaki 25e année (1972/73), exposé no. 430 (June 1973), pp. 234-241

Reader: READER-9, 2026-11-11. Source: open Numdam scan, item SB_1972-1973__15__234_0, saved as
`rh/library/src/bombieri-1973/b.pdf` (9 pages: cover + pp. 234-241).

## 1. What was read
**All of it**: pages 234-241 (8 pages of text + reference list), read as page images
(`src/bombieri-1973/p-2.png` ... `p-9.png`), because the text layer (`b.txt`, 14,948 characters) drops every
displayed formula. Nothing skipped.

## 2. What it proves
Setting: C/k a projective non-singular curve of genus g over k = F_q, q = p^α; v_r(C) = #C(F_{q^r}).
Recalled (not proved): (1) v_r = q^r − Σ_{i=1}^{2g} ω_i^r + 1; (2) ω_i ω_{2g−i} = q (functional equation);
(3) |ω_i| = q^{1/2} (RH); Weil's inequality (4) |v_r − (q^r + 1)| ≤ 2g q^{r/2}. Bombieri says (1), (2) are easy
consequences of Riemann-Roch on C, (3) "lies deeper".

- **Theorem 1 (unconditional).** If q = p^α with α EVEN and q > (g+1)^4, then v_1 < q + (2g+1) q^{1/2} + 1.
- **Inequality (7)** (the general form inside the proof). If ℓ p^μ < q, ℓ, m ≥ g, and
  (ℓ+1−g)(m+1−g) > ℓ p^μ + m + 1 − g, then v_1 ≤ ℓ + m q/p^μ + 1. Theorem 1 follows with μ = α/2,
  m = p^μ + 2g, ℓ = [g p^μ/(g+1)] + g + 1.
- **Key Lemma (unconditional).** Let R_m = {rational functions f on C/k̄ with (f) ≥ −m x_0}, x_0 a fixed point of
  the Frobenius morphism φ, R_ℓ^{(p^μ)} = {f^{p^μ} : f ∈ R_ℓ}. If ℓ p^μ < q, the natural map
  R_ℓ^{(p^μ)} ⊗_{k̄} (R_m ∘ φ) → R_ℓ^{(p^μ)}(R_m ∘ φ) is an isomorphism. Corollary (6): the product space has
  dimension (dim R_ℓ)(dim R_m).
- **Section III (the lower bound, unconditional).** Upper bound alone does not give RH: Bombieri's explicit example
  v_r = q^r − ω_1^r − ω_2^r + 1 with ω_1 = q, ω_2 = 1 satisfies (2), has v_r = 0 for all r, and violates (3). RH is
  obtained as follows: pass to a Galois cover C' → C → P^1 (C' → P^1 Galois with group G, C' → C Galois with group
  H ≤ G); for η ∈ G, v_1(C', η) := #{points over unramified rational points of P^1 with Frobenius substitution η};
  the same argument with δ_η : R_ℓ^{(p^μ)}(R_m ∘ φ) → R_ℓ^{(p^μ)}(R_m ∘ η) gives (8) v_1(C', η) ≤ q + (2g'+1)q^{1/2} + 1;
  (9) Σ_{η∈G} v_1(C',η) = |G| v_1(P^1) + O(1) with v_1(P^1) = q + 1; subtracting gives (10) v_1(C', η) = q + O(q^{1/2})
  for every η; and Σ_{η∈H} v_1(C',η) = |H| v_1(C) + O(1) gives v_1(C) = q + O(q^{1/2}); "a well-known approximation
  argument" (after base extension making q an even power of p) then gives (3).

## 3. Method in ten lines
1. Work over k̄ with the Frobenius morphism φ: C → C of order q (Serre's suggestion); v_r = #fixed points of φ^r.
2. Facts from Riemann-Roch on C only: dim R_m ≤ m+1; ≥ m+1−g with equality for m > 2g−2; dim R_{m+1} ≤ dim R_m + 1.
3. Frobenius facts: (iv) R_m ∘ φ ⊆ R_{mq} (pole orders multiply by q); (v) every f ∘ φ is a q-th power and
   (f ∘ φ) = q φ*((f)).
4. Key Lemma by pole orders at x_0: a basis s_i of R_m with strictly increasing pole orders; ord(σ^{p^μ}) ≥ −ℓ p^μ
   while ord(s_i ∘ φ) = q ord(s_i); since ℓ p^μ < q, the leading term of Σ σ_i^{p^μ}(s_i ∘ φ) cannot cancel.
5. Define δ: Σ σ_i^{p^μ}(s_i ∘ φ) ↦ Σ σ_i^{p^μ} s_i ("restrict to the diagonal"), landing in R_{ℓp^μ+m}.
6. Dimension count: dim ker δ ≥ (ℓ+1−g)(m+1−g) − (ℓp^μ + m + 1 − g) > 0 for suitable ℓ, m.
7. For f ∈ ker δ, at a fixed point x of φ: f(x) = Σ σ_i^{p^μ}(x) s_i(φ(x)) = Σ σ_i^{p^μ}(x) s_i(x) = (δf)(x) = 0.
8. f is a p^μ-th power (every element of R_ℓ^{(p^μ)}(R_m ∘ φ) is), so each zero has multiplicity ≥ p^μ:
   at least p^μ(v_1 − 1) zeros.
9. f has at most ℓ p^μ + m q poles (all at x_0), hence (7).
10. With q a square, p^μ = √q balances ℓ + mq/p^μ; the lower bound comes from the Galois-cover trick of §III.

**Where the work is / what Frobenius buys.** The p^μ-fold multiplicity at all v_1 − 1 fixed points is FREE: it
costs no linear conditions, because the p^μ-th power map is a ring endomorphism in characteristic p (f is a p^μ-th
power by construction). The only linear conditions are those of δf = 0, i.e. dim R_{ℓp^μ+m} ≈ ℓ p^μ + m, independent
of v_1. Bombieri states explicitly (p. 235) that Stepanov and Schmidt prove high-order vanishing "by derivatives or
hyperderivatives of f, of order up to m−1", with m about q^{1/2}, while "the argument I will give here, though based
on the same idea, does not use derivations".

## 4. Where it stops
- Theorem 1 needs q an even power of p and q > (g+1)^4 (removed for RH by base extension and the approximation
  argument).
- The upper-bound argument cannot give a lower bound (§III example); a separate argument (Galois covers, twisted
  Frobenius η, the count (9) on P^1) is needed.
- Everything rests on: the Frobenius MORPHISM of the curve (an endomorphism of the function field over k̄ of degree q,
  purely inseparable), additivity of p-th powers, and Riemann-Roch on the CURVE (not on C × C).
- Nothing is said about number fields.

## 5. What it changes in our record
- `rh/NOTEBOOK.md` N68, sentence "an auxiliary polynomial vanishing to high order at all F_q-points gives a
  one-sided bound N_n ≤ qⁿ + C q^(n/2) uniformly in n; rationality of the zeta function then forces |α| ≤ √q":
  **WRONG as stated.** Bombieri §III (p. 239): the one-sided bound plus rationality plus the functional equation does
  NOT force RH (example ω_1 = q, ω_2 = 1, v_r ≡ 0). Bombieri needs a second, separate argument for the LOWER bound
  (Galois covers, Frobenius substitutions η, summing (8) over G and subtracting). (The same point: Tao 2014 and van
  Frankenhuijsen 2008, see `stepanov-expositions.md`, `vanfrankenhuijsen-0806.0044.md`.)
- N68 "What Stepanov has and ℤ lacks is the multiplicity trick from Frobenius (d(x^q)/dx = 0 in characteristic p)":
  **imprecise.** True for Stepanov's and Schmidt's proofs (hyperderivatives), but in Bombieri's general proof no
  derivation occurs: the multiplicity comes from f being a p^μ-th power, and the other Frobenius inputs are (iv)-(v)
  (pole orders scale by q; f ∘ φ is a q-th power) used in the Key Lemma and in step 7. N68's "exact missing
  ingredient: a single derivation that kills a Frobenius at every prime" names an ingredient the general proof does
  not use.
- `rh/HUNCHES.md` G6 "Stepanov's function-field proof needs ONE derivation that kills Frobenius": **imprecise** for
  the same reason (Stepanov's hyperelliptic proof: yes; Bombieri's proof for all curves: no derivation).

## 6. Reliability
Refereed-equivalent (Séminaire Bourbaki, published 1974, Springer LNM 383). Short expository proof; the
"well-known approximation argument" from v_1(C) = q + O(q^{1/2}) (for all even powers) to (3) is not written out
(it is the Dirichlet-approximation / tensor-power argument written out in van Frankenhuijsen's Lemma "L: RH" and in
Tao 2014). Displays checked on the page images.
