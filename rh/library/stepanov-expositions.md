BACKGROUND ONLY: what these texts establish and where they stop. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# Two open modern expositions of the Stepanov / Bombieri method (one note, two texts)

Reader: READER-9, 2026-11-11.
- (K) S. Kopparty, "The Weil bounds", lecture notes, Topics in Finite Fields, Rutgers, Fall 2013 (last modified
  16 Feb 2017), sites.math.rutgers.edu/~sk1233/courses/finitefields-F13/weil.pdf; saved
  `rh/library/src/stepanov-expositions/kopparty.pdf` (+ `.txt`). Unrefereed course notes.
- (T) T. Tao, "The Bombieri-Stepanov proof of the Hasse-Weil bound", blog post, 2 May 2014
  (terrytao.wordpress.com/2014/05/02/...); saved `src/stepanov-expositions/tao.html`, text `tao.txt`.

## 1. What was read
- (K): **all** (45,158 / 45,158 characters of the `pdftotext -layout` output; §1 statement, §2 Stepanov's proof for
  y^e = g(x), §3 Bombieri's proof for Artin-Schreier curves). The PDF's final "generating function" part announced
  in §1 is not in this file (the notes stop after §3.3).
- (T): **all of the post body** (33,929 characters extracted; the trailing sidebar text is site navigation).
  The HTML-to-text step ate one "<" sign (the hypothesis of Lemma 3 reads "If ℓ ..."); from the proof it is ℓ < √q.
  Comments under the post not read.

## 2. What they prove
- (K) **Theorem 2 (Stepanov).** e | q−1, g ∈ F_q[X] of degree d, Y^e − g(X) absolutely irreducible ⇒
  #{x ∈ F_q : g(x) is an e-th power} ≤ q/e + O(e^3 d √q). Proved in detail for e = 2: |S| ≤ q/2 + O(d √q), S =
  {x ∈ F_q : g(x)^{(q−1)/2} = 1}. Consequence: |Σ_x χ(g(x))| ≤ O(d√q) for the quadratic character.
- (K) **Theorem 4 (Bombieri style, p = 2 written).** g p-free of degree d < p^{n/2 − 1} ⇒
  #{x ∈ F_q : Tr(g(x)) = 0} ≤ q/p + O(d √q); via V = {y^p − y = g(x)}: |V| ≤ 2^n + 2d 2^{n−r} + 2d, r = ⌊n/2⌋.
- (T) **Theorem 2 (weak Hasse-Weil, Bombieri).** q a perfect square, q ≥ (g+1)^4 ⇒ |C(F_q)| ≤ q + (2g+1)√q + 1.
  Proposition 4: for ℓ, m ≥ g − 1, ℓ < √q and (ℓ+1−g)(m+1−g) > ℓ√q + m + 1: |C(F_q)| ≤ ℓ + m√q.
  Remark 1: for q = p^{2n+1}, factoring Frob_q = Frob_{p^n} Frob_{p^{n+1}} gives q + O(√p √q).
- (T) **Theorem 5.** |C(F_q)| = q + O(√q) for q a perfect square (constant uniform as n → ∞), by the Galois/lifted
  curve trick; then the trace formula and Dirichlet approximation give |α_i| ≤ √p, i.e. Hasse-Weil.

## 3. Method in ten lines
The exact Frobenius step, in each version:
1. (K, Stepanov) Look for R(X) = A_0(X, X^q) + g(X)^{(q−1)/2} A_1(X, X^q), A_i ∈ V = {deg_X ≤ A, deg_Y ≤ B}
   (dim V² = 2AB). Nonvanishing (Lemma 3): if A < q/2 − d and (A_0, A_1) ≠ 0 then R ≠ 0 (reduce mod X^q and use
   absolute irreducibility).
2. **The step where d(x^q)/dx = 0 is used:** Hasse derivatives in X treat X^q as a constant, so
   g(X)^ℓ R^{(ℓ)}(X) = A_{0,ℓ}(X, X^q) + g^{(q−1)/2} A_{1,ℓ}(X, X^q) with X-degree ≤ A + ℓd and Y-degree ≤ B
   (NOT degree ≈ q).
3. On S, X^q = x and g(x)^{(q−1)/2} = 1, so "R^{(ℓ)} vanishes on all of S" follows from ONE polynomial identity
   A_{0,ℓ}(X,X) + A_{1,ℓ}(X,X) ≡ 0 of degree ≤ A + B + ℓd: that is at most A + B + ℓd linear conditions,
   **independent of |S|**.
4. Orders 0..M−1 cost ≤ M(A+B) + dM² conditions < 2AB unknowns ⇒ nonzero R with mult ≥ M at every x ∈ S.
5. |S| ≤ deg R / M ≤ (qB + d)/M; with A = q/2 − d − 1, B ≈ M(A + B + dM)/(2A), M ≈ √q: |S| ≤ q/2 + O(d√q).
   **What it buys:** the naive auxiliary polynomial g^{(q−1)/2} − 1 vanishes on S but has degree ≈ dq/2 (bound
   |S| ≤ dq/2); the Frobenius step brings the bound to q/2 + O(d√q), i.e. to within the square-root error.
6. (K, Bombieri) Build Q̃ = Σ a_st M_s M_t^{2^r} divisible by P = Y² − Y − g by linear algebra; then
   Q = Σ a_st^{2^{n−r}} M_s^{2^{n−r}} M_t satisfies Q ≡ Q̃^{2^{n−r}} mod (X^{2^n} − X, Y^{2^n} − Y): the p-power map is
   additive, so vanishing of Q̃ on V transfers to Q; Q ≠ 0 because its terms have distinct (2,d)-degrees
   (needs B < 2^{n−r}); Bézout bounds |V|.
7. (T) With q a square, Frob_q = Frob_√q², and C(F_q) = C_1 ∩ C_2, C_1 = graph of Frob_√q, C_2 its transpose,
   inside C × C.
8. (T) V = R_ℓ ⊗ R_m; π_1(V) ⊂ R_{ℓ + m√q}, π_2(V) ⊂ R_{ℓ√q + m}; Riemann's inequality gives dim V ≥ (ℓ+1−g)(m+1−g)
   > dim π_2(V) for m a bit larger than ℓ, so some f ≠ 0 vanishes on C_2.
9. (T) Injectivity of π_1 (Lemma 3): pole orders d_i + √q e_j are distinct when ℓ < √q — here Frobenius enters as
   "composition with Frob_√q multiplies pole orders by √q".
10. (T) "In Bombieri's original argument, one required vanishing to high order on the C_1 side, but in our
   presentation, we have factored out a Frob_√q term which removes this high order vanishing condition."

## 4. Where they stop
- Both bounds are upper bounds; (T) states: "the trace formula (1) is not enough by itself to convert upper bounds to
  lower bounds, due to the case in which all the α_i are positive" — a separate Galois-theoretic argument (twisted
  Frobenius ρ_q σ on components of a lifted curve, sum over H, subtraction) gives the lower bound.
- (K) Stepanov's version loses in e (O(e^3 d √q)); the notes say the L-function argument removes this; that part is
  not in the file read.
- (T) Non-square q only gives q + O(√p √q) in this presentation.

## 5. What it changes in our record
- `rh/NOTEBOOK.md` N68 "an auxiliary polynomial vanishing to high order ... gives a one-sided bound
  N_n ≤ qⁿ + C q^(n/2) uniformly in n; rationality of the zeta function then forces |α| ≤ √q": **wrong** — (T) says
  explicitly that the trace formula cannot convert the upper bound into the lower bound (all α_i positive); the
  lower bound is a separate Galois argument. Same as Bombieri 1973 §III (`bombieri-1973.md`).
- N68 / `rh/HUNCHES.md` G6, "the multiplicity trick from Frobenius (d(x^q)/dx = 0) makes high-order vanishing
  cheap": **correct for Stepanov's version** (step 2-3 above: Hasse derivatives treat X^q as a constant, so each
  order of vanishing costs ≈ A + B + ℓd conditions instead of |S|), **but not necessary**: in Tao's presentation of
  Bombieri's proof there is no high-order vanishing at all; what is used is that composition with Frob_√q multiplies
  pole orders by √q (injectivity) while restriction to the graph of Frob_√q costs only ℓ + m√q dimensions.
  So "the" Frobenius input has three known forms: (i) d(X^q)/dX = 0 (Stepanov, Schmidt), (ii) p-power additivity
  (Bombieri; Kopparty §3), (iii) the degree-q purely inseparable endomorphism scaling pole orders (Bombieri, Tao).
  G6's "needs ONE derivation" holds only for form (i).

## 6. Reliability
Expository, unrefereed (lecture notes; blog). Both reproduce standard published proofs (Stepanov 1969; Bombieri
1973; W. Schmidt 1976 LNM 536). Arithmetic of the parameter choices in (K) §2.2 checked by hand at the level of
orders of magnitude only.
