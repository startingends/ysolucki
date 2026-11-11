BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# A. Connes, C. Consani, "Riemann-Roch for the ring ℤ", arXiv 2306.00456 v1 (1 Jun 2023); published C. R. Math. Acad. Sci. Paris 362 (2024) 229-235 (per search result, DOI 10.5802/crmath.543; journal text not compared)

Reader: READER-9, 2026-11-11. Source: arXiv TeX `rh/library/src/ff-2306.00456/x/RRZ.tex` (25,275 bytes; figure
`graphrr1.pdf` not opened).

## 1. What was read
**All of it**: 22,812 / 22,812 characters from `\begin{document}` (abstract, §1-§5, acknowledgments, references);
preamble macros read for notation.

## 2. What it proves
Setting: Γ-sets (S-modules) = pointed functors Γ^op → Sets_*; the absolute base S = identity functor ("categorical
sphere spectrum"). For X ⊂ A containing 0: (HA)_X(k_+) = {a ∈ A^k : Σ_Z a_j ∈ X for all Z ⊂ k_+} (Lemma, a subfunctor
of HA). Tolerant S-modules; dim_S = minimal cardinality of a generating set F (distinct elements not related;
every x is related to some Σ_F α_j j with α_j ∈ {0,1}).
- **Lemma (sequencebleft).** For I = [−a, a] ∩ ℤ with 2^{n−1} ≤ a < 2^n, the minimal number of S-generators of
  (Hℤ)_I is n + 1 (explicit generating sets; n ≤ 4 listed by hand).
- **Theorem RRZ.** D Arakelov divisor on Spec ℤ-bar with deg D ≥ 0: dim_S H^0(D) = ⌈deg_2 D⌉ + 1,
  deg_2 = deg/log 2 (⌈x⌉ = least integer > x).
- **Proposition (caseh1).** U(1) = ℝ/ℤ with its length-1 metric, tolerance d(x,y) ≤ λ:
  dim_S U(1)_λ = m if 2^{−m−1} ≤ λ < 2^{−m}, and 0 if λ ≥ 1/2 (generating set {(−2)^{−j} : 1 ≤ j ≤ m}).
- **Theorem (main, rrspzb).** dim_S H^0(D) − dim_S H^1(D) = ⌈deg_2 D⌉' + 1, with ⌈x⌉' the right-continuous function
  equal to ceiling(x) for x > 0 non-integer and −ceiling(−x) for x < 0 non-integer. Claimed improvements over
  arXiv 2205.01391: the exceptional-set term 1_L disappears; "perfect analogy with the Riemann-Roch formula holding
  for curves of genus 0"; canonical divisor K = −2{2} with deg_2 K = −2.
- Mechanism: every integer is uniquely Σ α_j (−2)^j, α_j ∈ {0,1} ("ℤ = S[X], 1+1 = X + X²", X = −2).

## 3. Method in ten lines
1. Replace abelian groups by S-modules; an Arakelov divisor D gives (via adeles) H^0(D) = (Hℤ)_{[−e^δ, e^δ]} after
   linear equivalence reduces to D = δ{∞}.
2. Count: 2^{#G} subsets must cover 2a+1 integers, so #G ≥ log_2(2a+1).
3. Construct generating sets of that size from powers of 2 plus one correcting element and −a.
4. H^1(D) is the tolerant module (ℝ/ℤ, d ≤ e^{deg D}) (from the earlier paper's Appendices A, B).
5. Covering ℝ/ℤ by 2^k intervals of length 2λ gives the lower bound; base −2 expansions give the matching generating
   set.
6. Combine: for deg_2 D ≥ 0, H^1 = 0; for deg_2 D ∈ [−m−1, −m), H^0 = 0 and dim H^1 = m.
7-10. (The paper is seven pages; there is no further step.)

## 4. Where it stops
- The paper is a one-variable (curve) Riemann-Roch EQUALITY for Spec ℤ-bar over S. It contains **no statement about
  ζ, its zeros, the square Spec ℤ ×_S Spec ℤ, intersection theory, a Hodge-index inequality, or Frobenius.** It does
  not say what remains for RH.
- The genus comes out 0, which (as the authors' 2026 paper on the Jacobian notes, see `f1-frontier-scan.md`) is in
  tension with the infinite genus suggested by the explicit formula.

## 5. What it changes in our record
- No `rh/NOTEBOOK.md` or `rh/HUNCHES.md` entry is corrected by this paper directly. For the question "is there a
  Riemann-Roch for Spec ℤ that could feed a Weil- or Bombieri-type argument": Bombieri's proof uses only
  Riemann-Roch on the CURVE (dim R_m = m + 1 − g for m > 2g−2, `bombieri-1973.md`); this paper provides such a curve
  formula over S, with dimensions defined as minimal numbers of {0,1}-generators, but with genus 0 and no Frobenius
  endomorphism acting on the curve. Whether the Bombieri dimension count has any meaning in this framework is not
  discussed anywhere in the papers read (reported, not evaluated).

## 6. Reliability
Published (C. R. Math. 2024) per search; short note; all proofs elementary and checked here for the H^0 lower bound
and the H^1 computation (the n ≤ 4 generating sets were not all re-verified by hand).
