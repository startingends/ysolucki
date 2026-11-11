BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# C. Deninger, "Analogies between analysis on foliated spaces and arithmetic geometry", arXiv 0709.2801 v1 (18 Sep 2007; in: Groups and Analysis, the legacy of Hermann Weyl, LMS Lecture Note Ser. 354, Cambridge UP 2008)

Reader: READER-10, 2026-11-11. Source: arXiv TeX `rh/library/src/deninger-0709.2801/text.tex` (53,550 bytes; body
after `\begin{document}` with comment lines removed: `body.txt`, 40,884 characters). Read for the brief's narrow
question: what plays the role of the cusp / of compactness at infinity, and whether a positivity or a fixed bound is
constructed.

## 1. What was read
**YES, whole**: 40,884 / 40,884 characters of the body (§1 Introduction, §2 Gradient flows with Dictionary parts 1-2,
Remark 2 and Construction 3, §3 Explicit formulas and transversal index theory, §4 Lichtenbaum's conjecture and its
dynamical analogue incl. the proof sketch of Theorem t41, §5 Cramér's function and the transversal wave equation,
bibliography). Preamble (macros only) not counted.

## 2. What it proves (or states with references)
- **Dictionary (§2).** Regular scheme 𝒳/ℤ of dimension d ↔ triple (X, ℱ, φ^t): a (2d+1)-manifold, a codimension-one
  foliation ℱ, a flow φ^t mapping leaves to leaves and transversal to them. Closed points ↔ closed orbits γ, Nx ↔
  e^{l(γ)}; 𝒳 over F_p ↔ ℱ given by fibres of an equivariant fibration X → ℝ_+^*/p^ℤ. Part 2: rank of the period group
  Λ ↔ number of residue characteristics; **Arakelov compactification \bar𝒳 = 𝒳 ∪ 𝒳_∞ ↔ a compactification \bar X on
  which "φ may have fixed points"; 𝒳(ℂ)/F_∞ ↔ the set of fixed points of φ^t.** After Construction 3: "If one wants
  an infinitely generated Λ, one must allow the flow to have fixed points (↔ infinite places)" (Kopei's product formula).
- **Theorem 5 (§3, transversal index theorem; the number is inferred from the shared counter and from §5's "This proves a part of theorem 5"; cited from Álvarez López-Kordyukov [AK2] and Deninger-Singhof [DS]).**
  X compact of dimension 3, ℱ with a dense leaf, φ^t with NO fixed points, a leafwise metric on which φ^t acts with
  conformal factor e^{αt}. Then the spectrum of θ on \bar H^1_{ℱ,(2)}(X) is discrete and, if all periodic orbits are
  non-degenerate, 1 − Σ_ρ e^{tρ} + e^{αt} = Σ_γ l(γ) Σ_k ±δ_{k l(γ)} in 𝒟'(ℝ^{>0}), **with Re ρ = α/2 for all ρ**.
- **Theorem t41 (source label; §4; proved in [D4] = math.NT/0605724).** X closed, φ^t everywhere transversal and isometric for g_ℱ:
  (a) (H^•(X,ℝ), ψ ∪ ·) is acyclic, (b) ord_{s=0} ζ_R = Σ(−1)^i i rk H^i(X,ℤ), (c) ζ_R^*(0) = Π|H^i_tors|^{(−1)^i} / det(...),
  assuming the zeta-regularized determinants exist (b, c). Proof sketch via ζ_R^*(0) = T(X,g)^{−1} (Fried) and
  Cheeger-Müller. Example: X = ℝ/(log q)ℤ gives ζ_R = (1 − q^{−s})^{−1}.
- **§5.** For compact X with isometric fixed-point-free flow, −θ² = Δ_0 on leafwise forms, so the spectrum of θ on
  Ker \bar Δ^1_ℱ is purely imaginary ("This proves a part of theorem 5"); the trace of e^{it|θ|} there is the analogue of
  Cramér's W; analogue of the Chazarain/Duistermaat-Guillemin singularity results is asked, not proved.

## 3. Method in ten lines
Arithmetic schemes have no Frobenius over ℤ, so the analogy is with continuous-time dynamics: a flow whose closed orbits
have lengths log p. Leafwise (reduced) cohomology carries the infinitesimal generator θ of the flow, the analogue of
Frobenius. Positivity in the theorem is a Hodge-type argument: a leafwise metric on which the flow acts conformally makes
θ − α/2 skew-adjoint on L²-harmonic leafwise forms, so Re ρ = α/2 (see also Leichtnam's summary in
`f1-frontier-scan.md`). The explicit formula is then the transversal index (Guillemin-type trace) formula of the flow.
Compactness of X is what gives discrete spectrum and the trace formula; there is no cusp in the setting at all — X is
compact, and the infinite place is not a cusp but a FIXED POINT of the flow.

## 4. Where it stops
- **The infinite place is outside every proved statement.** §3: "Since we assumed that the flow φ^t has no fixed points
  there is no contribution in (eq:2n) corresponding to the term (1 − e^{−2t})^{−1} in (eq:1n)" (the archimedean term of
  the explicit formula). "Ongoing work of Álvarez López and Kordyukov leads to optimism that there is an extension of the
  formula ... to the case where φ^t may have fixed points ...; however reduced leafwise L²-cohomology may have to be
  replaced by 'adiabatic cohomology'." §5: the logarithmic terms of Cramér's theory "coming from the infinite place ...
  should also appear ... if one allows the flow to have fixed points".
- **The positivity holds only in a degenerate case.** §3: "The conditions in the theorem actually force α = 0 so that φ^t
  is isometric." The α = 1 examples (solenoids from elliptic curves over finite fields, [D3]) are not manifolds and are
  function-field objects. No (X, ℱ, φ) for Spec ℤ is constructed: Introduction, "until now the conjectured cohomology
  has not been constructed".
- **On the knowledge question.** What plays "compactness at infinity": the compactification \bar X of the Arakelov line,
  in which the archimedean place becomes fixed points of the flow (Dictionary part 2). No cusp is involved, no cusp
  without continuous direction is constructed, and no bound is produced at the fixed points; the fixed bound /
  positivity (Re ρ = α/2) is proved only for compact X WITHOUT fixed points, i.e. in the setting with no infinite place.

## 5. What it changes in our record
- `rh/NOTEBOOK.md` N89 lists "Deninger's foliation" as a programme for an "infinite place without a continuous
  direction". In this survey the infinite place is the opposite of that: it is where the flow (the continuous ℝ-direction
  itself) has fixed points, and all proved positivity excludes it. The ℝ-flow is the whole continuous direction of the
  picture (θ generates it), so the continuous direction is built into the formalism rather than removed.
- It matches N89's synthesis that ∞ is both the positive term and the obstruction, in Deninger's language: the
  archimedean term (1 − e^{−2t})^{−1} is exactly the term the proved theorem cannot produce.
- Consistent with READER-9's notes `vanfrankenhuijsen-0806.0044.md` (Frobenius-flow analogue = shift on ℝ,
  generator d/dx) and `f1-frontier-scan.md` (Leichtnam: Hodge-star argument).

## 6. Reliability
Survey in a refereed LMS proceedings volume; author says "Since the entire approach is not yet in a definitive state our
style is deliberately a bit brief in places." The transversal index theorem and Theorem t41 are cited from other papers
(not proved here, except the sketch for t41(c), which assumes existence of zeta-regularized determinants). Status after 2007
(Álvarez López-Kordyukov-Leichtnam work on flows with fixed points) not checked here.
