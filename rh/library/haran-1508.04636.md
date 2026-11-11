BACKGROUND ONLY: what this text establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# S. Haran, "New foundations for geometry", arXiv 1508.04636 v1 (19 Aug 2015; only arXiv version; published as Memoirs AMS 246 (2017), no. 1166)

Reader: READER-10, 2026-11-11. Source: arXiv TeX `rh/library/src/haran-1508.04636/x/Foundations_Arithmetics_17_04_15.tex`
(551,809 bytes, 12,545 lines). Chosen over Haran's other arXiv texts (0911.3522 "Non-additive prolegomena", 2209.08536,
2402.04456, 1709.05831, 2204.03107, 2006.15613) because its abstract is the only one that names both the real prime and
the zeta function ("for the p-adic integers we get the p-local factor of zeta, for the 'real integers' we get the gamma
factor"), and it contains the compactified Spec ℤ and its vector bundles, the only places where a cusp-type question can
arise. Haran's "Mysteries of the real prime" (book, 2001) and "Index theory, potential theory and the Riemann
hypothesis" (1993) are not on arXiv and were not read.

## 1. What was read
**PARTLY.** Read line by line (about 105,756 of 551,809 characters): the Introduction and chapter summary (lines
236-700), §2.1 opening on rigs incl. the "frozen" rigs [0,∞)^(σ) (1400-1440), §2.4 Real primes and §2.5 Valuation
F-rings / Ostrowski I-II (1646-1823), Ch. 5 Pro-limits incl. §5.2 compactified Spec ℤ and §5.3 compactified Spec O_K
(4730-4988), Ch. 6 Vector bundles whole (4988-5176), §8.3.3 real primes for generalized rings (7724-7810), §12.4 the
compactified spec ℤ in the generalized-ring language (10931-11155), §§13.3-13.5 products and the arithmetical plane
(11712-11809), the appendix "Beta integrals and the local factors of zeta" and the bibliography (12249-12545).
NOT read line by line (scanned only, by keyword search for cusp, Harder, Siegel, reduction, height, bound, positiv-,
compact, zeta, Riemann, Weil): the formal algebra — §§1.1-1.4, App. A, §§2.2-2.3, 2.6-2.10, Chs. 3-4, Ch. 7
(modules, derivations, Quillen model structures), Chs. 8-11, §§13.1-13.2, Ch. 14, App. B (proof of Ostrowski). The scan
found no occurrence of "cusp", "Harder", "Siegel", "reduction theory", "positivity", or any height bound in the unread
part; the only "zeta" occurrences are in the introduction and the appendix (read).

## 2. What it proves (main statements; all unconditional; it is a foundations text, no analytic theorem on ζ)
- **Language.** An "F-ring" is a symmetric monoidal category over F (finite sets with partial bijections); a ring B
  is represented by all matrices Mat_{m,n}(B) with composition and direct sum (and transposition for "F-rings with
  involution"); "generalized rings" are the self-adjoint operad {A_{1,X}} of such an object (§8).
- **The real prime as a valuation object (§2.4, Def. 2.4.2; §8.3.3).** O_{K,η} = matrices with operator ℓ²-norm ≤ 1;
  ℤ_η = [−1,1] and "GL_n(ℤ_η)" = O_n. The residue object F_{K,η} (Def. 2.4.3) = partial isometries; it is not
  "matrix" (its elements are not determined by entries). Remark 2.5.1: every ℓ^p (σ = 1/p) gives a full tame valuation
  sub-F-ring; only p = 2 has an involution ("it is the presence of the involution that singles out the L_2-metric").
- **Ostrowski I/II (§2.5, proof App. B).** Val(F(ℚ)/F{±1}) = {F(ℚ), F(ℤ_(p)), O_{ℚ,η}}; for a number field the
  valuation F-subrings are the finite primes and the real/complex primes η (embeddings mod conjugation). The value
  group of the real prime is ordered and embedded in its completion; for η it is (a subgroup of) ℝ_{>0}.
- **Compactified Spec ℤ (§5.2, §12.4).** For square-free N, A_N = F(ℤ[1/N]) ∩ O_{ℚ,η}, a local F-ring of "Krull
  dimension 2"; X_N = Spec F(ℤ) glued to Spec A_N along Spec F(ℤ[1/N]); \bar{Spec ℤ} = the pro-object {X_N}. Its
  limit space has points Spec ℤ ∪ {η}, is compact, has stalk O_{ℚ,η} at η, and global sections F{±1}. η is "very
  closed": its only open neighbourhood in X_N is the whole space; the neighbourhoods of η shrink only in the limit,
  which is why a pro-object is needed (Ch. 5 summary: "The real and complex primes of a number field are such
  points").
- **Vector bundles (Ch. 6).** At a finite layer, D_d(X_N) is represented by tuples (g_η, g_{p_1},…, g_{p_l}) in GL_d(ℚ)
  with η-component modulo O_d ∩ GL_d(ℤ[1/N]); div_N maps it to lattices at p and ellipsoids defined over ℚ at η
  (6.3.16-6.3.19); the union over N is DENSE in the adelic space. In the limit (bounded-below decreasing filters, 6.3.3),
  **Example 6.3.1 (6.3.9), (6.3.20):** \hat D_d(\bar{Spec ℤ}) ≅ GL_d(𝔸_ℚ)/(O_d × ∏_p GL_d(ℤ_p)) = lattices at p and
  arbitrary real ellipsoids at η; (6.3.23): \hat{Pic}_1(\bar{Spec O_K}) = K^* \ 𝔸_K^* / ∏_ν O_{K,ν}^*. The summary of
  Ch. 6 says: "the process of real completion creating the continuum ℝ^+ = GL_1(ℝ)/{±1} (and similarly GL_n(ℝ)/O_n)
  can naturally be embedded in the language of pro-schemes".
- **Arithmetical plane (§2.9, §13.5).** \bar{Spec ℤ} ×_{F{±1}} \bar{Spec ℤ} exists and its commutative (not totally
  commutative) version does not reduce to the diagonal. Nothing is proved on it beyond existence and a neighbourhood
  basis at (p, η).
- **Zeta (appendix).** For every place p ≥ η (finite or real), with σ_p^n the GL_n(ℤ_p)-invariant probability on the
  unit sphere S_p^n (for η: the round sphere, O(n)-invariant): Beta-integral ∫|x_1|^{α_1−1}…|x_n|^{α_n−1} dσ = B_p(α);
  contraction integrals; pushing σ_p^N forward along x ↦ x_1+…+x_N gives φ_p^N, with φ_p^∞ = 1_{ℤ_p} dx for finite p and
  the Gaussian e^{−x²/2}dx/√(2π) for η, and ζ_p(s)/ζ_p(1) = lim_N ∫|x_1+…+x_N|_p^{s−1} dσ_p^N, with
  ζ_η(s) = 2^{s/2}Γ(s/2). This is a uniform derivation of the LOCAL factors only.

## 3. Method in ten lines
Replace addition by matrix multiplication + direct sum (+ transposition). Then [−1,1] ⊂ ℝ, which is not a ring, becomes a
valid "ring of integers" at the real prime: ℓ²-contractions are closed under composition and direct sum, and
Cauchy-Schwarz gives closure under contraction. With this, Ostrowski's theorem lists η alongside the p as a valuation;
Spec of A_N = ℤ[1/N] ∩ O_η adds a point η to Spec ℤ[1/N]; gluing and passing to the pro-limit over N gives a compact
\bar{Spec ℤ}. Vector bundles are defined by Čech data with meromorphic transition functions; in the limit they
reproduce Weil's adelic description GL_d(ℚ)\GL_d(𝔸)/K for the curve-like object \bar{Spec ℤ}, the real component being
an ellipsoid (the analogue of a lattice). The analytic content is confined to the appendix: an invariant-measure
computation on spheres, the same at all places.

## 4. Where it stops
- No theorem about the global ζ, its zeros, the explicit formula, or any positivity. The only zeta statement is the
  uniform recovery of the local factors (appendix). The introduction quotes Connes-Consani on the arithmetical plane
  ("This translation would require in particular an adequate version of the Riemann-Roch theorem in characteristic 1")
  and says "see [H09] for more hints": no Riemann-Roch, intersection theory or Hodge index is proved here.
- **On the knowledge question (cusp without continuous direction / fixed bound at η): nothing is constructed.**
  (i) At each finite layer X_N the real point η has no small neighbourhood and its bundle data at η are ℚ-rational
  (countable, dense); the continuum at η is not removed but recreated in the pro-limit (Ch. 6 summary; (6.3.19)-(6.3.20)).
  (ii) The limit moduli of rank-d bundles is exactly GL_d(ℚ)\GL_d(𝔸)/(O_d × ∏GL_d(ℤ_p)) — the ordinary adelic quotient,
  with its cusps and their continuous archimedean height; for d = 1, \hat{Pic}_1(\bar{Spec ℤ}) = ℚ^*\𝔸^*/(\hat ℤ^* × {±1})
  ≅ ℝ_{>0} (my evaluation of (6.3.23); the text states only the double coset). (iii) There is no reduction theory, no
  Harder-Narasimhan filtration, no truncation, no automorphic form on these spaces, and no bound of any kind.
  (iv) The real value group is ℝ_{>0}-like (Ostrowski I, §2.5), not discrete; the "frozen" rigs [0,∞)^(0) with
  ℝ_{>0} acting by x ↦ x^σ (§2.1) are introduced only as examples.
- Durov's variant (ℓ¹ at η) would make GL_n(ℤ_η) finite; Haran rejects it (introduction) because the involution forces
  ℓ²; the compact group at η is O_n, a continuous group, in his approach.

## 5. What it changes in our record
- `rh/NOTEBOOK.md` N89, last paragraph, lists "Haran's real prime as a non-archimedean-like place" among objects that
  would give "an infinite place without a continuous direction". In this text the real prime IS treated on the same
  footing as p (valuation, local F-ring, compactification point, ellipsoid = lattice), but its vector-bundle moduli are
  proved to be the usual adelic double coset space, which contains ℝ_{>0} (d = 1) and the archimedean cusp height
  (d ≥ 2). So the text does not supply the object N89 asks for; it shows that its formalism reproduces the continuous
  direction. No cusp, window, or fixed bound is constructed.
- Consistent with READER-9's note `borger-0906.3146.md` (Borger: "current theory says nothing about archimedean
  place") and `f1-frontier-scan.md`: a second F_1-type formalism that does see η, but whose η-moduli are continuous.
- The appendix (Gaussian as the real analogue of 1_{ℤ_p}, Γ-factor from O(N)-invariant measures as N → ∞) is a
  known fact restated (Tate's thesis gives the same local factors); it is relevant to CORE 1 (the archimedean local
  term) only as a re-derivation, not as new positivity.

## 6. Reliability
Published as an AMS Memoir (refereed). The arXiv TeX is dated 17 Apr 2015 in its file name; a few results are stated
with "the proof is similar" (generalized-ring chapters: "We give more emphasis to the definitions and principal examples,
than to the proofs"). The identification (6.3.20) is stated with a short argument, not a full proof. My statements in
§4 (ii) about ℝ_{>0} and the cusp height are standard consequences of the double coset the text writes down, not
statements of the text.
