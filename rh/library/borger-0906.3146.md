BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# J. Borger, "Λ-rings and the field with one element", arXiv 0906.3146 v1 (17 Jun 2009; only version; self-described "preliminary version, made available in advance of the Frobenius Lifts workshop at the Lorentz Center, Leiden, 2009")

Reader: READER-9, 2026-11-11. Source: arXiv TeX `rh/library/src/borger-0906.3146/x/lrfoe13.tex` (147,316 bytes) and
`.bbl`.

## 1. What was read
**PARTLY.** Document body = 112,921 characters (lines 421-2680). Read in full: abstract, introduction, "Other work",
§1 (Λ-spaces), §2 (examples, incl. non-examples), §3 (sub-Λ-spaces, periodic primes, F_1-points), §7 (Variants:
Λ_{S,E}-spaces, function fields, "f is not an isomorphism", Analogy, Drinfeld modules, CM, local fields), and the
draft material after the first `\end{document}` (19,850 characters: relation to finite sets/monoids, list of
questions, "naive zeta functions"). Read for STATEMENTS AND REMARKS ONLY (proofs skimmed): §4 (function spaces,
GL_n over F_1), §5 (abelian motives are potentially cyclotomic), §6 (p-adic étale cohomology) — about 42,020
characters of the body. Preamble (14,545 characters) not read beyond macros.

## 2. What it proves (main statements, unconditional unless noted)
Definitions. A Λ-structure on a space X (étale sheaf on affine schemes) is an action of the big Witt monad W*. For
X flat over ℤ: equivalently a COMMUTING family of endomorphisms ψ_p: X → X, one per prime p, with ψ_p ≡ p-th power
Frobenius on X ×_ℤ F_p. A reduced Λ-space is flat over ℤ. F_1 := ℤ with its unique Λ-structure (all ψ_p = id).
- **Topos map** Λ: Space_ℤ → Space_{F_1} with Λ^* = forget Λ-structure (= "base change from F_1 to ℤ"), left adjoint
  Λ_! = big Witt space W*(X) ("base-forgetting"), right adjoint Λ_* = arithmetic jet space W_*(X) ("Weil
  restriction"), "a multi-prime, algebraic version of Buium's p-jet space". Consequence stated: "if one accepts the
  premise of this paper, the space Spec ℤ ×_{Spec F_1} Spec ℤ must be defined to be the Witt space W*(Spec ℤ)."
  Slogan: "Λ = ℤ[Gal(ℤ/F_1)]".
- **Theorem A (intro; §§5-6).** X smooth proper over ℤ[1/M] with a Λ-structure ⇒ Galois action on H^n_et(X_Q̄, Q_p)
  factors through the abelianization; restricted to Gal(Q̄/Q(ζ_N)) (N divisible only by primes dividing Mp) it is a
  sum of powers of the cyclotomic character; Hodge numbers h^{i,j} = 0 for i ≠ j. ("only abelian Artin-Tate motives
  can be defined over F_1"). Uses Kronecker-Weber, Chebotarev, Lefschetz, proper base change, p-adic Hodge theory
  (Kisin's potentially semi-stable theorem).
- **Corollary.** Then #X(F_q) = P(q) (P = Hodge polynomial) for q ≡ 1 mod N; for X smooth proper over ℤ, for all q.
- **Theorem B.** A Λ-scheme of finite type over ℤ has a point in a cyclotomic field; if proper, it has a Λ-morphism
  Spec ℤ → X (an F_1-point). (Thm "anothertry": a nonempty closed Λ-subscheme étale over ℤ exists.)
- **Prop. (periodic primes).** Separated algebraic Λ-space of finite type with infinitely many periodic primes ⇒
  affine and quasi-finite over ℤ. Finitely many F_1-points (Cor.).
- **Non-examples.** Flag varieties other than P^n (Paranjape-Srinivas); **curves of genus g ≥ 1 over ℚ have NO
  Λ-structure** on any smooth proper model over ℤ[1/M] (g ≥ 2: ψ_p would be periodic; g ≥ 1: ψ_p = translate of
  φ ∈ End with φφ̄ = p for all large p, impossible).
- **Examples.** Monoid algebras ℤ[M] with ψ_p(m) = m^p (toric), toric varieties, P^n with
  [x_i] ↦ [x_i^p]; the Chebyshev line (ℤ[t+t^{-1}], ψ_p = Chebyshev polynomials); zero-dimensional reduced finite
  Λ-rings ⊂ products of cyclotomic fields (Borger-de Smit). GL_{n/F_1} = S_n ⋉ G_m^n, GL_{n/F_1}(F_1) = S_n.
- **§7, function-field variant.** S smooth curve over k = F_q: Λ_S-structure = commuting ψ_m (one per closed point m)
  lifting q_m-Frobenius; factorization S → Spec F_1^S → Spec k. The map W_S(T) → S ×_k T (the unit of f_! ⊣ f^*):
  on the n-th ghost component it is (pr, Fr^n_T); for T = S "the image of this map is the union in S ×_k S of the
  graphs of all powers of the Frobenius map on S"; it is neither mono nor epi, but **Prop. (W dense):** it has Zariski
  dense image (proof by the Moore determinant). Cor.: f^* is faithful and fully faithful on separated reduced
  algebraic spaces over k. Rank-1 Drinfeld modules give Λ_S-structures on A^1 that do not descend to k.
- **Local absolute point (§7).** For a complete DVR A of mixed characteristic with perfect residue field k, A → k has
  a unique section over the p-typical F_1 (W(k) → W(A) of Λ_p-rings).

## 3. Method in ten lines
1. Take Grothendieck's Λ-rings (λ-operations / Adams operations ψ_n) as descent data from ℤ to F_1.
2. Work in the big étale topos; Λ-structure = W*-action; Λ-spaces form a topos.
3. The forgetful functor has both adjoints (Witt vectors, arithmetic jets): an essential topos map.
4. Flat case reduces to commuting Frobenius lifts at all primes simultaneously.
5. Finite-type rigidity: a Frobenius lift at p forces strong conditions at every p; combined over all p with
   Chebotarev/Kronecker-Weber/p-adic Hodge theory this forces abelian, cyclotomic, Tate-type cohomology.
6. Hence finite-type F_1-schemes are "combinatorial" (toric-like); interesting objects (W*(X), arithmetic jets) are
   infinite-dimensional.
7. Function fields are the test case: there F_1^S sits over Spec k and S ×_k S is approximated (densely) by W_S(S).
8. Over ℤ there is no analogue of the base point Spec k with a "uniformity property".
9. Nothing at the archimedean place.
10. No derivation, no auxiliary-polynomial or point-counting argument, no zeta-zero statement anywhere in the text.

## 4. Where it stops (the author's own words)
- On RH (intro): "As a check to see if this could lead to a proof of the Riemann hypothesis for ℤ, one might examine
  the translation of Weil's proof of the Riemann hypothesis for S from algebraic geometry over k to that over F_1^S.
  But since the current version of our theory says nothing about the archimedean place of ℚ, it is hard to imagine
  this succeeding without further ideas. Even so, it should be done." (Weil's proof, not Stepanov's, is named.)
- §7 Analogy: over function fields a descent datum to Spec k is "a descent datum to F_1^S with a similar algebraic
  uniformity property"; over ℤ "we do not know if there is a uniformity property, which is what we would need to
  create a true arithmetic analogue of the base point Spec k."
- Draft "naive zeta functions": the Hasse-Weil series Z(X,t) corresponds to the Witt vector with ghost components
  ⟨N_1, N_2, ...⟩; "I have no evidence that they reflect anything deeper ... they appear not to give any insight into
  Hasse-Weil zeta functions." Draft question: "ℤ should be non-smooth over F_1" (W(Spec ℤ) is not smooth over ℤ);
  "Is ℤ non-proper over F_1? Does this have anything to do with the place at infinity?"
- Not done in this version: the announced toric classification of finite-type Λ-schemes; Λ-modules (quasi-coherent
  sheaves) — explicitly not discussed.

## 5. What it changes in our record
- `rh/HUNCHES.md` G6 "Borger's λ-rings are exactly rings with COMMUTING Frobenius lifts at all primes at once (big
  Witt vectors; Borger's 'descent to F₁')": **correct for ℤ-flat (e.g. reduced) rings**; in general a Λ-structure is
  a W*-action. Additions from the paper: (i) on ℤ itself the only Λ-structure is ψ_p = id for all p, so the "Frobenius
  lifts at all primes" carry no information on Spec ℤ; they act on objects OVER it; (ii) the paper's candidate for
  "Spec ℤ × Spec ℤ" is the big Witt space W*(Spec ℤ), and in the function-field case W_S(S) maps densely onto S ×_k S
  with image the union of the graphs of all Frobenius powers — this is the structure in which the diagonal and the
  Frobenius graphs of Bombieri/Weil would sit; (iii) finite-type Λ-schemes are abelian Artin-Tate (no curves of
  genus ≥ 1), so "a λ-ring of finite type" in G6's plank zero is a very restricted (toric-like, cyclotomic) object.
- G6 "and whether it carries anything like a derivation": **the paper contains no derivation.** What it has is the
  right adjoint Λ_* = arithmetic jet space, which Borger identifies with a multi-prime version of Buium's p-jets
  (Buium's p-derivations; one Fermat-quotient operator per prime — see `f1-frontier-scan.md`, Buium-Simanca). A single
  derivation for all primes does not appear.
- G6 plank zero (Chebyshev's C(2n,n) as a λ-ring object): not addressed by the paper. The only point-count ↔ Witt
  vector statement is the draft "naive zeta function" remark above.

## 6. Reliability
Unrefereed preliminary version (author's words; several "\marpar{check}", "more detail?", "clean up" notes visible in
the source, e.g. in Prop. "finitely many maps from periodic spaces" and Cor. "separated univ prop"). The foundational
results are cited to Borger's "The basic geometry of Witt vectors I, II" (not read here). Theorem A relies on deep
cited theorems (Kisin), not re-checked.
