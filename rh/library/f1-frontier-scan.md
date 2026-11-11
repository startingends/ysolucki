BACKGROUND ONLY: what these texts state and where they stop. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# Scan note (PARTIAL READS ONLY): recent Connes-Consani papers, Buium-Simanca, Leichtnam on Deninger, and a search log for "Stepanov over ℤ"

Reader: READER-9, 2026-11-11. This note collects texts that were NOT read whole; each item says exactly what was
read. It exists so that the whole-paper digests (`bombieri-1973.md`, `stepanov-expositions.md`,
`vanfrankenhuijsen-0806.0044.md`, `borger-0906.3146.md`, `connes-consani-2306.00456.md`,
`connes-essay-1509.05576.md`) can point to it. All sources under `rh/library/src/ff-<arXiv id>/`.

## 1. What was read, item by item
| item | read | not read |
|---|---|---|
| Connes-Consani, "Riemann-Roch for Spec ℤ-bar", arXiv 2205.01391 v2 (Mar 2023) | abstract, §1 introduction, start of §2 | §§3-5, appendices A-B (proofs) |
| Connes-Consani, "On the metaphysics of F_1", arXiv 2307.06748 v1 (Jul 2023) | abstract, §1, §2 up to the scaling-site Riemann-Roch | §§3-7 (rings of S[μ_{n,+}]-polynomials, number systems) |
| Connes-Consani, "On the Jacobian of Spec ℤ-bar", arXiv 2602.15941 v1 (Feb 2026, 48 pp.) | §1 introduction | §§2-end |
| Connes-Consani, "On the absolute geometry of Spec ℤ", arXiv 2606.06604 v1 (Jun 2026, 30 pp.) | abstract (arXiv API), final paragraphs of the last numbered section | body |
| Connes-Consani, "The absolute twistor line and the geometry of Spec ℤ-bar", arXiv 2609.00299 v1 (31 Aug 2026, 18 pp.) | abstract, §1 introduction (first part) | rest |
| Buium-Simanca, "Arithmetic Laplacians", arXiv 0805.0256 (Adv. Math. 220 (2009) 246-277) | abstract, §1.1, start of §1.2 | §§2-end |
| E. Leichtnam, "On the analogy between L-functions and Atiyah-Bott-Lefschetz trace formulas for foliated spaces", arXiv 1307.3851 | §2 passage on Deninger's formalism (TeX lines 370-445) | rest |
| Keyword search (grep) in all the above for: Riemann hypothesis, Hodge index, Weil's proof, positivity, Stepanov, derivation, Borger, λ-ring | done | — |

## 2. What they state (only what was read)
- **2205.01391.** Riemann-Roch over S[±1] = S[μ_{2,+}]: dim H^0(D) − dim H^1(D) = ⌈deg' D + log' 2⌉' − 1_L
  (log base 3; L a union of intervals (log'(3^k/2), log'((3^k+1)/2)) of finite measure); Serre duality
  H^0(K−D) ≅ Hom(H^1(D), U(1)_{1/4}), K = −2{2}; "our construction strictly parallels Weil's adelic proof of the
  Riemann-Roch formula for function fields". Reason for 3: finite Witt vectors over F_3 form a subring of ℤ_3 ≅ ℤ
  (balanced ternary). Improved to S and genus 0 in 2306.00456 (`connes-consani-2306.00456.md`).
- **2307.06748.** Goal stated: "to provide the geometric counterpart to the construction that A. Weil used in his
  proof of the Riemann hypothesis for function fields" via "ℤ ⊗_{F_1} ℤ". S proposed as F_1. Explicit link to
  Borger: the topos N̂^× "is the geometric incarnation of the λ-operations in the theory of λ-rings [Borger]";
  "Special λ-rings R ... belong naturally to the topos N̂^× since the Adams operations ψ_n turn R into a sheaf of
  rings". Proposes replacing the structure sheaf ℤ_max by S[X] with Frobenius X ↦ X^n. Quotes Manin's question on
  "absolute Descartes powers Spec ℤ × ... × Spec ℤ" as open.
- **2602.15941.** "apparent paradox": Jacobian (class group) of Spec ℤ trivial ⇒ genus 0, while the spectral
  realization and the explicit formulas suggest "infinite genus". Defines generalized divisors (coefficients in
  ℤ ∪ {∞}, infinite support), Pic(Spec ℤ) = monoid of rank-1 torsion-free groups = ℚ^×\𝔸_f/Ẑ^×; Thm: X_ℚ =
  ℚ^×\𝔸/Ẑ^× ≅ Pic(Spec ℤ-bar) (arithmetic divisors (L, ‖·‖)); Jac = Pic/ℝ_+^×; Abel-Jacobi map to an idempotent
  semilattice ("the arithmetic curve has infinite genus (g = ∞), and the target space is not an abelian variety").
- **2606.06604.** Abstract: (Spec ℤ)_{F_1} realizes Scholze's "points of Spec ℤ over a perfectoid field = untilts";
  over ℂ, at each p the non-trivial points form torsors under W_p = ℚ_p^× and W_∞ = ℂ^×; quotient gives the Tate
  curve q = p^{−1}, whose real locus is C_p = ℝ_+^×/p^ℤ. Last section: tropicalization of A_inf-functions lands in
  the scaling-site structure sheaf; "A natural next step is to investigate the behavior of Frobenius eigenspaces,
  such as B^{φ=p} ... under descent to the periodic orbit C_p ... We leave this question for future work."
- **2609.00299.** Absolute curve Spec ℤ-bar over F_{1²} with archimedean "absolute twistor line"; Frobenius x ↦ x^n
  restricted to ODD n "forced arithmetically by the extension of scalars to F_{1²}"; on complex points the dynamics
  generates Adams operations and complex conjugation; λ-operations of the pericyclic category interpret local
  factors.
- **None of the five Connes-Consani papers above (2022-2026) contains "Hodge index", "Stepanov", or a statement
  that a Riemann-Roch theorem / intersection theory on the square has been obtained** (grep). "Riemann hypothesis"
  occurs only in 2307.06748, as motivation (Weil's proof for function fields, intro line 521) and in a bibliography
  title; the Jacobian paper mentions zeta zeros only as motivation in its introduction.
  The latest explicit frontier statement found is Connes 2015 (`connes-essay-1509.05576.md` §4).
- **Buium-Simanca 0805.0256.** One prime: δ_p a = (a − a^p)/p on ℤ ("the role of the derivative with respect to p").
  Several primes: a FINITE set P = {p_1, ..., p_d}, operators δ_P = {δ_{p_1}, ..., δ_{p_d}} "subjected to certain
  commutation relations"; arithmetic jet spaces J^r_P(X) (independently Borger's W_{r*}); "in most cases the ring A
  of global functions on a jet space J^r_P(X) does not contain 'interesting elements'"; interesting functions exist
  only in the p_k-adic completions, and families must be "glued" by "analytic continuation" along a chosen
  ℤ_(P)-point. Main results: classification of δ_P-characters on G_a, G_m, elliptic curves (orders 0, e, 2e), with a
  "Dirac decomposition" whose symbols relate to Euler factors (ζ for G_m, Hasse-Weil L for E); analogy with ∂_z∂_z̄
  log u (Laplacian).
- **Leichtnam 1307.3851 §2 (Deninger's formalism).** Assumed: leafwise cohomology H^i with a flow generated by Θ,
  Poincaré duality with e^{tΘ}α ∪ e^{tΘ}β = e^t(α ∪ β), and an anti-linear Hodge star commuting with the flow
  making α ∪ ⋆β a scalar product ⇒ Θ_1 − ½ antisymmetric ⇒ Re s = ½ for the eigenvalues (zeros): "Deninger's
  formalism should imply the Riemann hypothesis"; "This argument comes from an idea of Serre" (formalized for
  foliations by Deninger-Singhof). No auxiliary polynomial.

## 3. Search log (rule 5): has anyone attempted a Stepanov/Bombieri-type argument over ℤ?
Queries (web search, 2026-11-11): "Tao blog Stepanov method Hasse-Weil bound Bombieri proof"; "\"Stepanov\" method
analogue \"Riemann zeta function\" OR \"Spec Z\" auxiliary polynomial Frobenius integers"; "\"Stepanov\"
\"polynomial method\" analogue integers \"number field\" auxiliary polynomial \"Thue\" Bombieri analogy Riemann
hypothesis curves"; "Stepanov Bombieri method \"Chebyshev\" analogy primes auxiliary function vanishing at primes high
order Riemann hypothesis"; "Connes Consani Riemann-Roch Spec Z arXiv"; "Buium Simanca \"arithmetic Laplacians\"
p-derivations several primes"; "Deninger foliated dynamical systems Riemann hypothesis Hodge positivity ...";
arXiv API listing of all Consani papers (sorted by date). Found and read: van Frankenhuijsen 2008 (the only text
found that explicitly proposes translating the Bombieri-Stepanov step to Spec ℤ). Found, not read: Masser,
"Auxiliary Polynomials in Number Theory" (Cambridge, has a chapter on Stepanov's method for elliptic curves; finite
fields); arXiv 1008.0499 "On the instability of the Riemann hypothesis over finite fields" (its abstract says the
hoped-for imitation "encounters serious obstacles"; not read). NOT found by these searches: any text applying
Stepanov's derivative step, Bombieri's p-power step, or a λ-ring/Witt-vector auxiliary object to ζ or Spec ℤ.
"Not found" is not "does not exist" (shallow search).

## 4. Not read at all (named in the brief)
Stepanov's original papers (Izv. 1969 and later); W. M. Schmidt, "Equations over Finite Fields" (LNM 536);
Borger's "The basic geometry of Witt vectors I, II"; Buium's book "Arithmetic Differential Equations" and
"Foundations of arithmetic differential geometry"; Deninger's own papers; Haran ("Index theory, potential theory and
the Riemann hypothesis", 1989; "The mysteries of the real prime"; "New foundations for geometry", Mem. AMS);
Smirnov's "Hurwitz inequalities for number fields"; Connes-Consani "The arithmetic site", "Geometry of the arithmetic
site", "The scaling site" (only the CRAS abstract of 1507.05818 read).

## 5. What it changes in our record
See the digests listed at the top; this note supplies: (i) Buium-Simanca's multi-prime p-derivations are a FINITE
family with commutation relations and gluing problems, not one derivation (supports N68's "one per prime" as
literature fact); (ii) the recent Connes-Consani frontier statements contain no claim about the square or RH;
(iii) Connes-Consani themselves connect their N^×-topos to Borger's λ-operations (2307.06748).

## 6. Reliability
Partial reads; every claim above is limited to the passages listed in §1. Preprints 2602.15941, 2606.06604,
2609.00299 are recent and unrefereed (as far as arXiv shows).
