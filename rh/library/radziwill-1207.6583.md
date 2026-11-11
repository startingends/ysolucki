BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# M. Radziwiłł, "Limitations to mollifying ζ(s)", arXiv 1207.6583 (source file dated 11 Oct 2012)

Reader: READER-8, 2026-11-11. Source: arXiv source tarball (`molliff43.tex`, `molliff41.bbl`, `graph.eps`), saved
under `rh/library/src/mollif_1207.6583/x/`. Read because Bettin–Gonek cite it for "M_{T^θ} is essentially the best
mollifier as θ → ∞" and because it re-proves the Báez-Duarte–Balazard–Landreau–Saias lower bound (brief items (c), (d)).

## 1. What was read
**65,866 / 65,866 characters of `molliff43.tex`** (all sections, including the journal-template comment block after
the last proof). The figure `graph.eps` (a picture of the cut-off function f) was not opened. The `.bbl` was only
grepped.

## 2. What it proves
𝓘(M) := (1/T)∫_T^{2T} |1 − ζ(½+it)M(½+it)|² dt; M_θ(s) = Σ_{n ≤ T^θ} a(n)n^{−s} with a(n) ≪ n^ε and a(1) = 1 (1.1).
𝓛_θ = Σ_{n ≤ T^θ} μ(n)(1 − log n/log T^θ) n^{−s}.
- **Quoted:** 𝓘(𝓛_θ) ~ 1/θ for θ < 4/7 (Conrey 1989, BCH); Farmer conjectures 𝓘(𝓛_θ) ~ 1/θ for all θ > 0.
- **Theorem 1 (unconditional).** There is an absolute c > 0 such that for every θ > 0, all large T, and all M_θ as in
  (1.1): 𝓘(M_θ) ≥ c/θ. c depends on the proportion of zeros on the line and cannot exceed 1 (else Farmer's
  conjecture would be false).
- **Proposition B (Soundararajan).** For θ < ½: 𝓘(M_θ) ~ Σ_{m,n ≤ T^θ} a(m)ā(n)/[m,n] · (log(T(m,n)²/(2πmn)) + 2 log 2
  + 2γ − 1) − 1 ≥ 1/θ + o(1). So for θ < ½ Levinson's 𝓛_θ is optimal (Selberg-type quadratic form, diagonalised by
  y(ℓ) = Σ_d a(dℓ)/d; minimum 1/G, G = Σ_{n ≤ N} μ²(n)/φ(n) ~ log N).
- **Proposition A (unconditional).** For S any 2πA/log T-well-spaced set of zeros on the line with ordinates in
  [T, 2T]: 𝓘(M_θ) ≥ (1 + O(ε))/(1 + θ + 1/A) · Card(S)/((T/2π) log T) + O(T^ε).
- **Theorem 3 (RH).** If a(p^k) ≪ 1: 𝓘(M_θ) ≥ (½ + ∫_1^{1+θ+ε} F(α,T) dα)^{−1}, F = Montgomery's pair correlation function.
  With Conrey's 4/7 this gives, for ½ < θ < 4/7, ∫_1^{1+θ} F(α,T) dα > θ − ½ + o(1).
- **Theorem 2 (RH + pair correlation).** 𝓘(M_θ) ≥ (1 + o_θ(1))/(0.5 + θ). "One naively expects the problem to become
  more difficult for large θ."
- Stated (no proof in this text): an elementary proof, by the same Sobolev idea, of the BDBLS bound
  ∫_R |(1 − ζM)/(½+it)|² dt ≥ C/log N for a mollifier of length N. "Re-proving (1.2) was the starting point for this
  paper." Analogues for double mollifiers and for M = ∫ λ^{−s} dμ(λ) are asserted.

## 3. Method in ten lines
1. Lemma 1 (a Sobolev identity without derivative): for a Dirichlet polynomial A supported on [M, N] and f = 1 on
   [log M/2π, log N/2π], A(iu) = ∫ A(it) f̂(t − u) dt.
2. ζM is (up to T^{−v}) a Dirichlet polynomial B of length T^{1+η+θ} (Bombieri–Friedlander smoothing, Lemma 2).
3. At a zero γ on the line, 1 − ζM = 1. Apply Lemma 1 to 1 − B at u = γ and sum over S:
   Card(S) = ∫_T^{2T} (1 − ζM) Σ_{γ∈S} f̂(t − γ) dt + tiny.
4. Cauchy–Schwarz; the second factor ∫|Σ_γ f̂(t−γ)|² ≤ Σ_{γ,γ′} K̂(γ − γ′) for any K ≥ f² (Plancherel, Lemma 3).
5. Choose K a Beurling–Selberg majorant of the interval (Lemma 4) with K̂ supported in |x| < δ = 2πA/log T; for a
   δ-spaced S only the diagonal survives: K̂(0) Card(S) = (log T/2π)(1 + θ + 1/A) Card(S).
6. Selberg's positive proportion gives a well-spaced S with ≫ T log T zeros on the line (Lemma 5): Theorem 1.
7. Under RH, Gonek's lemma Σ_γ n^{−½−iγ} = −(T/2π)Λ(n)/n + O(n log² T) removes the short part n ≤ T^{2η}, and the
   double sum over zeros is Montgomery's F(α,T) (Lemma 7): Theorems 2, 3.
8. The length of the mollifier enters only through the support of f, i.e. through log(T^{1+θ}): the uncertainty
   principle on the t-side gives the 1/(1+θ).
9. Proposition B is linear algebra on the BCH quadratic form (Lemmas 9-13).
10. Nothing uses an off-diagonal (Kloosterman) estimate: these are LOWER bounds, valid for every length.

## 4. What is assumed
Theorem 1, Props A, B: unconditional (Prop B uses the BCH asymptotic, θ < ½). Theorem 3: RH. Theorem 2: RH and
pair correlation. a(1) = 1, a(n) ≪ n^ε (Theorem 1 relaxable to a(n) ≪ n^A for θ > 1/100).

## 5. Where it stops
- A proved LIMITATION (the brief's item (d)): no Dirichlet polynomial of any fixed length T^θ makes
  (1/T)∫_T^{2T}|1 − ζM|² smaller than c/θ. The reason given: ζ has ≫ T log T zeros on the line in [T, 2T], at each
  of them 1 − ζM = 1, and a polynomial of length T^{1+θ} cannot drop from 1 to near 0 faster than on a scale
  ≈ 2π/((1+θ) log T). So "100% mollification" needs θ → ∞ (Bettin–Gonek's paraphrase).
- This is not a barrier for the LENGTH θ of an asymptotic formula; it is a lower bound for what any length achieves.
- Open (stated): improving Theorem 3 under GRH; limitations inside Levinson's method ("subsequent paper").

## 6. What it changes in our record
- N53 (a)/(b) and IDEAS #34 form (4): the NB distance at bounded height and the mollified mean square at height T are
  limited by the SAME mechanism in print: each zero on the line costs a fixed amount ≍ 1/log(length). At height T it
  is c/θ (here); in the NB weight it is ≍ Σ_ρ m(ρ)²/|ρ|² / log N (Burnol; BCF). The record treats "Burnol's lower
  bound" (KNOWLEDGE E5) and "the mollifier wall" (N53) separately; this paper shows they are one lower-bound
  mechanism (zeros on the line, uncertainty principle), unconditional, and it predates the record.
- N57: unrelated (lower bounds, no involution).
- KNOWLEDGE E5 / IDEAS #5: the "1/log N rate explains why brute force cannot see convergence" is, in this paper's
  terms, the statement that each on-line zero contributes ≍ 1/log N; the paper is a citation for it.

## 7. Reliability
arXiv preprint version (a published version exists per later citations, not checked). Theorems 2-3 rely on a pair
correlation lemma whose weight-removal step is "standard … omitted". Typo-level slips: in the proof of Prop A,
"2T^η" for "2T"; Lemma 7 sums "n ≤ M" for n ≤ N. The elementary re-proof of the BDBLS bound is announced but not
written out in this text.
