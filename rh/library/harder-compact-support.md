BACKGROUND ONLY: what these texts establish and where they stop. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# Harder's compact support of cusp forms over function fields: the statement, checked through three open expositions (the 1974 original was NOT reachable)

Reader: READER-10, 2026-11-11. Purpose (brief): check the statement used in `rh/NOTEBOOK.md` N89 — what exactly is
compact, and why it fails over number fields.

## 1. Reference and what was read
- **Original: G. Harder, "Chevalley groups over function fields and automorphic forms", Ann. of Math. 100 (1974)
  249-306 (JSTOR 1971073), Theorem 1.2.1 and Lemma 1.6.7 as cited by others. NOT READ: no open full text found
  (web search; JSTOR only).** Godement-Jacquet, LNM 260, Lemma 10.9 (the GL_n case, per Buzzard) also not open.
- **K. Buzzard, "Automorphic forms over function fields"** (informal note, Imperial College web page, last modified
  19/11/2007, 5 pp.; `src/harder-expo-buzzard/notes.txt`, pdftotext 18,223 characters): **read whole**.
- **Ye Tian, "Automorphic forms over function fields"** (seminar notes hosted on T. Feng's Berkeley page, file
  5AutomorpicForms.pdf, 4 pp.; `src/harder-expo-feng/notes.txt`, 8,895 characters): **read whole**; the file ENDS at
  the statement of Theorem 2.7, before its proof.
- **C. Xue, "Cuspidal cohomology of stacks of shtukas", arXiv 1802.01362 (TeX of 3 Dec 2019, final version; Compositio
  Math. 156 (2020)); `src/harder-xue-1802.01362/x/main.tex`, 401,981 bytes): PARTLY** — Introduction (lines 211-272),
  §4 opening, §4.2 "Geometric statements" (the two theorems as stated, lines 3308-3411), §4.5 "Cohomological
  statements" (3892-3960), §5 opening and strategy (4037-4125). Proofs of §§1-3, 4.3-4.4, 5.2-5.4, 6, appendices
  not read.

## 2. What is stated (the exact compactness)
- **Tian, Theorem 1.2 (Harder).** G = GL_d over F = k(X), X a curve over a finite field. "For any compact open
  K ⊂ G(𝔸), all cuspidal functions φ on G(F)\G(𝔸)/K → ℂ have support uniformly finite modulo Z(𝔸)."
  **Theorem 2.7:** for K ⊂ G(O) compact open there is an open C_K ⊂ G(𝔸) with (1) Z(𝔸)G(F)C_K = C_K, (2)
  Z(𝔸)G(F)\C_K/K FINITE, and supp φ ⊂ C_K for ALL cuspidal φ. Cuspidal = all constant terms
  φ_P(g) = ∫_{N(F)\N(𝔸)} φ(ng) dn vanish (Def. 1.1); no admissibility, growth or Hecke condition is assumed.
  Consequence (Remark 1.5): A_cusp(G(F)\G(𝔸)/K a^ℤ) is finite-dimensional, where a ∈ Z(𝔸) has degree 1.
- **Buzzard §2:** "Harder proved that there was a compact subgroup C of G(𝔸) such that f ∈ ⁰V(χ, K) has support on a
  set of the form Z(𝔸)G(F)·C. In particular ⁰V(χ, K) is finite-dimensional." Also: no boundedness condition is needed
  in the function-field case (Godement-Jacquet's boundedness conditions "are actually implied by f(zx) = χ(z)f(x) and a
  compactness result").
- **Xue, Introduction:** "A theorem of Harder ([Har74] Theorem 1.2.1) says that the space of cuspidal automorphic forms
  has finite dimension. The proof uses the Harder-Narasimhan truncations and the contractibility of deep enough strata."
  And (V. Lafforgue, Prop. 8.23): cuspidal = Hecke-finite, because "any non zero image of the constant term morphism along
  a proper parabolic subgroup P ... is supported on the components indexed by a cone in the lattice of the cocharacters
  of the center of M. Hence it generates an infinite-dimensional vector space under the action of the Hecke algebra of M."
  Xue's Proposition `prop-H-cusp-inclus-dans-H-leq-mu` (§5; TeX label, number not checked) (generalization to shtuka cohomology): there is μ_0 with H^{j,cusp} ⊂ Im(H^{j, ≤ μ_0} → H^j),
  i.e. cuspidal classes live on one fixed Harder-Narasimhan truncation.

So "what is compact": the SUPPORT of every cuspidal function of level K, modulo Z(𝔸)G(F), lies in ONE fixed set,
finite modulo K (Tian 2.7), equivalently in one quasi-compact HN-truncation Bun_G^{≤ μ_0} (Xue). The set depends only on
(G, X, K) (Tian), resp. (G, X, N, W, j) (Xue), not on the form; since the cuspidal space is Hecke-stable, a Hecke
operator maps it to functions with the same support bound. (The last sentence is my combination of the statements, not
a quoted claim.)

## 3. Mechanism in ten lines
(i) Reduction theory: every bundle E has a flag with bounded slope gaps (Tian Thm 2.6, Siegel domain
G(𝔸) = G(F)U(𝔸)T(𝔸)^Δ_{c_2}G(O), c_2 ≥ 2g); the far region of Bun_G is the union of deep HN strata, indexed by a
DISCRETE cone of degrees. (ii) On a deep enough stratum (⟨μ, α⟩ > C for α ∈ Γ_G − Γ_M) the parabolic reduction is
unique (Bun_P → Bun_G an isomorphism there, Xue, Theorem `thm-i-contract-pour-mu-grand`, citing Drinfeld-Gaitsgory Prop. 9.2.2) and Bun_P → Bun_M is
"unipotent" (Xue, Theorem `thm-pi-contract-pour-mu-grand`: fibres are quotients of unipotent group schemes). (iii) Hence on deep strata the constant term
morphism is an isomorphism (Xue, Proposition `prop-TC-isom-mu-grand`): the function there EQUALS its constant term. Cuspidal ⇒ zero on all deep
strata ⇒ support in a fixed quasi-compact truncation. Buzzard's elementary form for PGL_2 over k(T): the double coset space
is ℤ_{≥0} (vertices of GL_2(k[T])\tree), and n(t)·diag(ϖ^a,1) = diag(ϖ^a,1)·n(ϖ^{−a}t); for a large and K = K_0 the
conjugated unipotent lies in K, so the constant-term integral at height a is the value itself ("this would have proved
that the integral vanishes for a sufficiently large"); he notes it fails for general K as he wrote it ("you can't do
this. Doh. You can if K = K_0 though").

## 4. Where it stops / why it fails over number fields
- None of the three texts discusses number fields. What they show is the exact point used: the step "deep enough ⇒
  constant term = value" needs the far region to be discrete (HN degrees in a lattice cone) and the unipotent fibre to be
  absorbed into the open compact K after conjugation by a deep enough torus element — possible because K_v is OPEN in a
  totally disconnected G(F_v) and contains a neighbourhood of 1 in N(F_v).
- Over ℚ (from general knowledge, not from these texts): K_∞ = O(n) or SO(2) meets N(ℝ) only in {1}, and the cusp height
  y ∈ ℝ_+ is continuous, so the conjugated unipotent n(t/y) tends to 1 only as y → ∞ and never lies in K_∞; smoothness at
  ∞ gives rapid DECAY of cusp forms (Gelfand-Piatetski-Shapiro / Harish-Chandra), not vanishing beyond a fixed height, and
  the cuspidal spectrum at fixed K-type is infinite (Weyl's law). This agrees with N89's statement that the fixed bound
  "needs a cusp with NO archimedean direction" and that over ℚ the height group always contains ℝ_+.
- Lafforgue's "cuspidal = Hecke-finite" (quoted by Xue) is also stated only over function fields; its mechanism (constant
  terms supported on a cone of a LATTICE) is the same discreteness.

## 5. What it changes in our record
- **Confirms N89's statement**, now with sources: the fixed bound over function fields is support in one fixed finite
  set mod Z(𝔸)G(F)K for all cuspidal functions of level K (Tian Thm 2.7; Buzzard; Xue, prop-H-cusp-inclus-dans-H-leq-mu). N89 says "from
  memory"; the statement as used there is correct. Precision to add: compactness is MODULO the centre Z(𝔸) (or a
  lattice Ξ ⊂ Z(𝔸) of degree-one elements), and the bound depends on the level K.
- N89 also says "Over F_q(t) the truncation is not Hecke-invariant either"; none of these texts states that. What they
  show is that the cuspidal SPACE is supported in a fixed truncation; the truncation operator itself is not discussed.
- The original paper (Harder 1974) remains unread: statements above are second-hand via expositions.

## 6. Reliability
Buzzard: informal personal note, self-described as partly conjectural ("Conjecture-Lemma", "I think"); the Harder
statement in it is quoted, the PGL_2 sketch is incomplete by the author's own account. Tian: seminar notes, unrefereed,
truncated file (proof of Thm 2.7 absent). Xue: refereed (Compositio), but only statements were read; it generalizes
Harder and reduces to it for I = ∅, W = 1 (Xue's Introduction). The number-field paragraph in §4 is from the reader's
memory and is marked as such.
