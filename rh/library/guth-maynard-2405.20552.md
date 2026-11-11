BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/README.md`, `rh/library/INDEX.md`).

# L. Guth, J. Maynard, "New large value estimates for Dirichlet polynomials", arXiv 2405.20552 v2

## 1. Reference and extent of reading
- Authors: Larry Guth, James Maynard. Title as above. arXiv 2405.20552; v1 31 May 2024 (34 KB), **v2 7 Apr 2026**
  (39 KB, "48 pages"), from the arXiv abstract page. The source read is the current e-print (v2): one file
  `LargevaluesDirichlet17.tex`, saved under `rh/library/src/guth-maynard-2405.20552/x/` (never compiled or run).
- **Read whole: 140,000 / 140,000 characters, 2,554 / 2,554 lines**: abstract, §§1–13, bibliography, and the
  commented-out alternative proof at the end of §13.1 (lines 2366–2395). No figures in the source.
- The arXiv page lists no journal reference. The acknowledgments thank "the anonymous referees", so v2 contains
  referee changes. Theorem numbers below are the ones LaTeX would print (one counter per section shared by
  theorem/lemma/proposition/corollary/conjecture), worked out from the TeX; the starred restatements have none.

Notation: D(t) = Σ_{N<n≤2N} b_n n^{it}; W ⊂ [0,T] a set of 1-separated (later T^ε-separated) points with
|D(t)| ≥ V = N^σ on W; A ⪅ B means |A| ≤ C(ε)T^ε B for every ε > 0; E(W) = #{w₁+w₂−w₃−w₄ ∈ [−1,1]} (additive
energy); R(v) = Σ_{t∈W} |v|^{it} (the Fourier transform of the point set W, read at frequency log v / (−2π)).

## 2. What it proves (all unconditional)
- **Theorem 1.1 (large values).** If |b_n| ≤ 1 and (t_r)_{r≤R} are 1-separated in [0,T] with
  |Σ_{n=N}^{2N} b_n n^{it_r}| ≥ V for all r, then
  **R ≤ T^{o(1)} (N²V⁻² + N^{18/5}V⁻⁴ + T N^{12/5}V⁻⁴).**
  Compared (stated in the text) with the classical bound (1.2), R ≤ T^{o(1)}(N²V⁻² + T min(NV⁻², N⁴V⁻⁶)) (mean
  value theorem + Montgomery–Halász–Huxley): equal or worse for V < N^{7/10} or V > N^{8/10}, strictly better for
  N^{7/10+ε} < V < N^{8/10−ε} and N ≤ T^{5/6−ε}. At V ≈ N^{3/4} the old bound is ≈ N^{1/2} + T N^{−1/2}, the new one
  ≈ N^{3/5} + T N^{−3/5}, a gain for N < T^{10/11}. At the critical configuration of Ingham/Huxley
  (σ = 3/4, N = T^{4/5}) the old bound is T^{3/5}, the new one T^{13/25}.
- **Theorem 1.2 (zero density).** N(σ,T) ≤ T^{15(1−σ)/(3+5σ)+o(1)}. With Ingham (1.3), N(σ,T) ≤ T^{3(1−σ)/(2−σ)+o(1)},
  for σ ≤ 7/10 this gives **(1.5) N(σ,T) ≤ T^{30(1−σ)/13+o(1)}**: exponent 30/13 ≈ 2.308 against Huxley's 12/5 = 2.4
  (Huxley 1972 (1.4): T^{3(1−σ)/(3σ−1)}). The worst σ is 7/10, where 15/(3+5σ) = 30/13 meets Ingham.
- **Corollary 1.3.** For y ∈ [x^{17/30+ε}, x^{0.99}]: π(x+y) − π(x) = y/log x + O_ε(y exp(−(log x)^{1/4}))
  (Huxley: 7/12).
- **Corollary 1.4.** For y ∈ [X^{2/15+ε}, X^{0.99}], the same asymptotic holds for all but O(X exp(−(log X)^{1/4}))
  integers x ∈ [X, 2X] (Huxley: 1/6).
- **Conjecture 1.5 (Montgomery, quoted).** σ > ½, |b_n| ≤ 1, W 1-separated in [0,T] with |D| > N^σ on W ⇒
  |W| ≤ C(σ) T^{o(1)} N^{2−2σ}. The footnote to §1.1 constructs, for every σ ∈ (½,1) and N ≤ T, bounded coefficients
  with ≫ N^{2−2σ} 1-separated large values (sums of short smooth pieces Σ_h w(h/N^σ)(M+h)^{i(t_j−t)}), so the
  conjecture is sharp. Bourgain refuted an earlier ℓ²-normalised version (cited, not given).
- **Theorem 1.6 (Heath-Brown 1979, quoted).** For 1-separated 𝒯 in an interval of length T and |a_n| ≤ T^{o(1)}:
  Σ_{t₁,t₂∈𝒯} |Σ_{n=N}^{2N} a_n n^{i(t₁−t₂)}|² ≤ T^{o(1)}(|𝒯|²N + |𝒯|N² + |𝒯|^{5/4}T^{1/2}N). Essentially sharp for
  N ∈ [T^{2/3}, T].
- **Lemma 1.7 (basic energy bound).** N ∈ [T^{2/3},T], σ > ½, |b_n| ≤ 1, |D| > N^σ on W ⇒
  E(W) ≤ |W|³N^{1−2σ+o(1)} + |W|²N^{2−2σ+o(1)}. Hence Conjecture 1.5 holds for sets with E(W) ≥ |W|³T^{−o(1)}.
- **Proposition 3.1 (key case).** σ ∈ [7/10, 8/10], |b_n| ≤ 1, W T^ε-separated in an interval of length T = N^{6/5},
  |Σ w(n/N) b_n n^{it}| ≥ N^σ on W ⇒ |W| ≤ T N^{(12−20σ)/5+o_ε(1)}. Theorem 1.1 follows by subdivision.
- Intermediate statements (all for T^ε-separated W in an interval of length T):
  Lemma 4.1 |W| ≪ N^{1−2σ}s₁(M_W)²; Lemma 4.2 s₁(A) ≤ 2(tr((AA*)³) − tr(AA*)³/m²)^{1/6} + 2(tr(AA*)/m)^{1/2};
  Proposition 4.6 |W| ≪ N^{2−2σ} + N^{1−2σ}(Σ_{m∈ℤ³∖0} I_m)^{1/3}; Proposition 5.1 S₁ = O(T⁻¹⁰);
  Proposition 6.1 S₂ ⪅_k N²|W|² + TN|W|^{2−1/k} + N²|W|²(T^{1/2}/|W|^{3/4})^{1/k};
  Proposition 8.1 S₃ ⪅ T²|W|^{1/2}E(W)^{1/2}; Proposition 9.1 (below); Proposition 10.1
  S₃ ⪅ T²|W|^{3/2} + TN|W|^{1/2}E(W)^{1/2}; Proposition 11.1 (N ∈ [T^{3/4},T]) E(W) ⪅ |W|N^{4−4σ} +
  |W|^{21/8}T^{1/4}N^{1−2σ} + |W|³N^{1−2σ}; Proposition 11.2 S₃ ⪅ T²|W|^{3/2} + T|W|N^{3−2σ} + T|W|²N^{3/2−σ} +
  T^{9/8}|W|^{29/16}N^{3/2−σ}.
- **Proposition 9.1 (equidistribution over affine maps).** For f ≥ 0 supported on u ≍ 1 with
  |f̂(ξ)| ⪅_j (T/|ξ|)^j sup f, and J(f) = sup_{M_i<M} ∫ (Σ_{|m₁|~M₁, m₂~M₂, |m₃|≪M₃} f((m₁u+m₃)/m₂))² du:
  **J(f) ⪅ M⁶(∫f)² + M⁴∫f².** The trivial bound is M⁶∫f². The two terms are attained by a random sparse set and
  by the 1/T-neighbourhood of rationals r/s with r, s ~ B (remark after 9.1).
- **Proposition 12.1 (N ≥ T^{5/6}, σ ≥ 7/10).** R ⪅ N^{2−2σ} + T^{1/2}N^{3−4σ} + T^{(30σ−21)/5}N^{(46−60σ)/5}; at σ = ¾
  this beats (1.2) by (T/N)^{1/2}. It uses Jutila's large values estimate (k = 3) for σ ≥ 39/50.

## 3. Method in ten lines
1. Duality: |W|N^{2σ} ≤ Σ_W |D|² = ‖M_W b‖² ≤ s₁(M_W)²‖b‖², with (M_W)_{t,n} = w(n/N) n^{it}, so |W| ≪ N^{1−2σ}s₁². From here
   on the coefficients are gone: the problem is the top singular value of a matrix fixed by the point set W.
2. Bound s₁ by the CUBIC trace minus its "flat" part tr(MM*)³/|W|² (Lemma 4.2): if all singular values were equal,
   the sixth moment would equal the cube of the second, and the difference controls s₁ well.
3. Poisson summation in n₁, n₂, n₃ (Lemma 4.5): tr((M M*)³) = main term + Σ_{m∈ℤ³∖0} I_m, which splits into S₁ (one
   m_i ≠ 0, negligible), S₂ (two, reduced to Heath-Brown's Theorem 1.6 by Hölder with a k-th power) and S₃ (all three).
4. KEY STEP (Proposition 7.1): stationary phase is NOT applied. Write I_m as ∫ e(−N m·u) R(u₁/u₃)R(u₂/u₁)R(u₃/u₂) du.
   The three R-arguments lie on the surface z₁z₂z₃ = 1; with v₁ = u₁/u₃, v₂ = u₂/u₃ the phase is linear in u₃, so the
   u₃-integral is negligible unless |m₁v₁ + m₂v₂ + m₃| ⪅ 1/N. This wins a factor T and keeps the t-variables separated.
5. What remains is a sum over m of ∫ |R(v₁) R̃((m₁v₁+m₃)/(m₂v₁)) R̃((m₁v₁+m₃)/m₂)| dv₁: a trilinear form in the Fourier
   transform R of W, evaluated along a family of affine (Möbius) maps indexed by m.
6. Low energy: Hölder with ∫|R|² ⪅ |W| and ∫|R|⁴ ⪅ E(W) gives S₃ ⪅ T²|W|^{1/2}E(W)^{1/2} (Proposition 8.1).
7. Middle energy: a small set where |R| is large cannot be nearly invariant under many maps u ↦ (m₁u+m₃)/m₂.
   Proposition 9.1, proved by Fourier analysis, Poisson summation in m₃ and an iteration (Lemma 9.2) with induction on
   the T^ε loss, improves the T² to TN (Proposition 10.1).
8. High energy: Proposition 11.1. A large D on W makes E(W) ⪅ N^{−2σ}Σ_{n₁,n₂}|R(n₁/n₂)|³ (Lemma 11.4, the one use of
   |b_n| ≤ 1). That sum is split by gcd(n₁,n₂): small gcd ↔ continuous moments of R, large gcd ↔ Heath-Brown applied
   to the second and fourth discrete moments.
9. Assembly (§12): the bounds for S₂ and S₃ plus the energy bound, with T = N^{6/5}, k = 4.
10. Zeta (§13): classical zero detection (mollifier coefficients Σ_{d|n, d≤2T^{1/100}} μ(d) e^{−n/T^{1/2}}, Type I/II
   zeros after Maynard–Pratt), then Theorem 1.1 applied to the k-th power D̃^k with T^{10/(6+10σ)} ≤ N^k ≤ T^{15/(6+10σ)},
   or the mean value theorem when N^k > T^α.
Where the work is: §§7–11 (the S₃ term), especially Proposition 9.1 and the gcd split of §11.

## 4. Where it stops (the authors' statements and the exact end points)
- Only third traces: "we do not know how to obtain good bounds when r ≥ 4, so we work with r = 3". A sharp bound
  tr((M_W M_W*)^r) ⪅ |W| N^r for large r "would give Conjecture 1.5". With r = 3 even a sharp trace bound alone gives
  only |W| ⪅ N^{3−3σ}; the gain comes from subtracting the flat part.
- The ℓ^∞ hypothesis is essential: "we do not know how to obtain Theorem 1.1 if we only have ℓ² bounds on the
  coefficients". It is used only in Lemma 11.4. Classical mean value and Halász–Montgomery estimates need only ℓ².
- Theorem 1.1 adds nothing for V ≤ N^{7/10} or V ≥ N^{8/10}. For V a bit above N^{3/4}, other refinements (Ivić ch. 11,
  cited) beat it. Its natural range is N < T^{5/6}; Proposition 12.1 is the partial version for N ≥ T^{5/6}.
- The critical case, in the authors' words (remark at the end of §13.1). For the constant A in N(σ,T) ⪅ T^{A(1−σ)}
  it is σ = 7/10, N = T^{5/13} (polynomial length N² = T^{10/13}), sub-intervals of length T₁ = T^{12/13},
  |W| ≈ T₁^{2/3}, E(W) ≈ |W|^{5/2} ≈ |W|⁴/T₁. There "our bounds for S₁ and S₂ are both best possible", so "any further
  improvement would have to come from the S₃ term"; the E(W) bound "is also likely to be difficult to improve" (a
  random set has E ≈ |W|⁴/T₁); and the affine argument of §9 "is also essentially tight" if R takes T₁^{2/3} values
  of size ≈ T₁^{1/2} concentrated on rationals of height T₁^{1/3}.
- Primes in short intervals: the critical case is a product of six Dirichlet polynomials of length x^{1/6} each, as for
  Huxley. A sieve treatment of six near-equal primes would give 17/30 − ε, with a weaker error term (remark at the end
  of §13).
- The output is always a COUNT: a number of 1-separated points with a large value, hence a zero-density estimate.
  Nothing in the paper concerns a single t, a zero-free region, or the line Re s = ½. The zero-free region used in the
  corollaries is Vinogradov–Korobov's, imported (Montgomery, Cor. 11.4).

## 5. What it changes in our record
- **CORE 3 ("density estimates" among the statistical uses of the Euler product; "all are mean squares of Möbius-type
  sums").** In the current record holder for N(σ,T), the step that is new uses NO Euler product. Theorem 1.1 holds
  for every coefficient sequence with |b_n| ≤ 1 and is not a mean square: it is a sixth moment (cubic trace) of a
  matrix fixed by the point set. The Euler product enters only through classical zero detection (a μ-mollifier,
  linear in μ; Maynard–Pratt for the Type II count, cited, unread). So "mean squares of Möbius-type sums" is too narrow
  for the large-value step. The Euler-product part is still linear (N98 classification unchanged).
- **N98 ("nonlinear statistical: twist-blind") and N93 (Davenport–Heilbronn has ≫ T zeros off the line, from
  memory).** Reader's deduction, not in the paper: zero-density bounds with exponent < 1 are NOT twist-blind.
  Ingham's exponent 3(1−σ)/(2−σ) is < 1 for every σ > ½, and 30(1−σ)/13 < 1 for σ > 17/30. So ζ has o(T) zeros in
  every strip ½ < σ₁ ≤ Re s, whereas Davenport–Heilbronn-type functions have ≍ T zeros in strips σ₁ < Re s < σ₂
  (Voronin/Bohr–Jessen type results, recalled, not read). Theorem 1.1 cannot be what separates them, since it holds
  for every bounded b_n. The separation therefore sits in the zero-detection step. One coefficient-level difference
  there: the Dirichlet inverse of ζ has coefficients μ(n) ∈ {−1,0,1}, while the Dirichlet inverse of a DH function has
  unbounded coefficients (DH has zeros in Re s > 1; S2_B10d §5b, HYBRID_FE §4). This matches N99's
  "twist-blind except for |Λ| ≤ log": the size line is the twist-sensitive line here as well. It also shows N98's
  twist-blindness claim is about pair-correlation-type statistics (as written there), not about density counts.
- **HYBRID_FE.md (2f) and S2_B10d.md (3c), "FROM MEMORY: large-value estimates bound the NUMBER of t".** Confirmed from
  source. The exact classical bound is now on record: (1.2) R ⪅ N²V⁻² + T min(NV⁻², N⁴V⁻⁶) (mean value; Montgomery–
  Halász–Huxley), with Ingham 3(1−σ)/(2−σ), Huxley 3(1−σ)/(3σ−1), Guth–Maynard 15(1−σ)/(3+5σ), A = 30/13 (was 12/5),
  and Montgomery's conjecture N^{2−2σ} sharp for the bounded class (footnote construction).
- **N99 ("a pointwise square-root bound for one short prime polynomial at one height").** After dyadic splitting and
  normalising |Λ(n)| ≤ log n, the prime polynomial S_X belongs to the class of Theorem 1.1, which counts its large
  values. At one point the method reduces to the trivial bound. With |W| = 1, Lemma 4.1 reads N^{2σ} ≪ ‖b‖²·s₁² with
  s₁² = Σ w(n/N)² ≍ N, i.e. Cauchy–Schwarz |D(t₀)| ≪ N. Within the bounded class, no count below N^{2−2σ} ≥ 1 is
  possible (footnote construction), so no estimate of this type, uniform over |b_n| ≤ 1, can say that a given height
  carries no large value. This confirms the CORE 3 sentence "HOW MANY, never WHETHER" for the strongest current
  estimate.
- **CORE 6 / N86–N89 (amplification by products).** The paper does use powers: Theorem 1.1 is applied to D̃^k,
  and S₂ uses a k-th power inside Hölder. But the bound for a power is again a count over the same class, and the
  power is used to move the length N^k into the best range, not to make a deviation grow against a fixed bound.
- Nothing in the record is superseded. The paper is new to the record: no previous entry cites Guth–Maynard except
  the OpenAI 7/8 note's citation list (`openai-qrh-7-8.md`, "[14, Section 13.1]").

## 6. Reliability
- Peer review: v2 is post-referee (the acknowledgments thank referees); the arXiv page gives no journal. The result
  has been widely cited since 2024 (general knowledge, not checked here). This reader did not verify the proofs line
  by line. The arithmetic checks made: the critical-case numbers of §1 (T^{3/5} → T^{13/25}); 15/(3+5σ) = 30/13 at
  σ = 7/10, where it meets Ingham's 3/(2−σ); the identity in §13.1,
  1 + (1−2σ)α = (129−195σ+50σ²)/(2(3+5σ)(9−10σ)) = 15(1−σ)/(3+5σ) − (250(σ−¾)² + 3/8)/(2(3+5σ)(9−10σ)), checked
  numerically at σ = 0.62, 0.7, 0.75, 0.8 (all three expressions agree to 1e−15; reader's own one-line script).
- Typos noticed in the TeX (harmless): §3's opening says "specialize to the case N = T^{4/5}" but Proposition 3.1 uses
  T = N^{6/5} (N = T^{5/6}, where the last two terms of Theorem 1.1 coincide; §11 says "N = T^{5/6} as in
  Proposition 3.1"); in the proof of Theorem 1.1, "since M ≪ T" should read N ≪ T; before Proposition 4.6,
  "N³|W|‖w‖³_{L²}" should be ‖w‖⁶; in Lemma 6.2's proof the exponent is written v^{−1+i(t−v)} for v^{−1+i(t−r)}.
- External inputs taken on citation: Heath-Brown's Theorem 1.6 (1979); Maynard–Pratt Lemma 24 (Type II zero count);
  Jutila's large values estimate (for Proposition 12.1); Vinogradov–Korobov; the explicit formula.

## 7. How they found it (facts from the text; owner's request to dissect how breakthroughs find their island)
- **The key new idea, in their words.** "We introduce a new method that gives good bounds for Dirichlet polynomials on
  sets of small energy." Ingredients, each quoted: (a) "A key observation is that it can be beneficial to avoid the use
  of stationary phase." Poisson summation is applied, but the Fourier integrals are kept whole, giving up T^{3/2} so
  that "the variables t₁, t₂, t₃ are nicely separated from one another". (b) "The next important observation is that
  the arguments of the R functions only lie in a two dimensional subvariety z₁z₂z₃ = 1." There the phase is linear in
  the remaining variable, which wins back a factor T. (c) "We show that there cannot be a small set U which has this
  property of being approximately closed under many affine transformations u ↦ (m₁u+m₂)/m₃." The object analysed is
  never D. It is the point set W through its Fourier transform R(v) = Σ_{t∈W} v^{it}.
- **The structure they exploit in the set of large values: additive energy E(W), as a three-way dichotomy.**
  High energy (W close to an arithmetic progression): Heath-Brown's difference-set theorem, refined in §11, makes it
  incompatible with D being large on W. Low energy (W random-like): R has L²/L⁴ square-root behaviour on average,
  and the cubic trace is small (Proposition 8.1). Middle energy: |R| would have to be large on a sparse set nearly
  invariant under the affine family. Proposition 9.1 forbids this; its extremal examples are random sets and
  neighbourhoods of rationals of bounded height.
- **The barrier beaten, and why earlier methods could not.** σ = ¾ is where the mean value theorem (Ingham) and the
  Montgomery–Halász large values estimate (Huxley) both give |W| ⪅ T N^{−1/2}. For σ ≤ ¾ and N ∈ [T^{2/3},T] the plain
  orthogonality bound |W| = O(TN^{1−2σ}) "represented the best known bound". The large value method "gives no
  information if σ ≤ 3/4", per the paper, citing Montgomery's book p. 141; the reason is not reproduced in the paper.
  The paper's own diagnosis of the natural attempt (cubic trace + stationary phase / approximate functional
  equation): the coefficients c_{t₁−t₂}c_{t₂−t₃}c_{t₃−t₁} "link the variables t₁, t₂ and t₃, and this makes it difficult
  to show any cancellation". Even square-root cancellation in the dual m-sums then leaves |W|³N^{3/2} ≈ T³, exactly
  no gain at σ = ¾. Traces of order r ≥ 4 would suffice but "it appears to be very difficult to estimate these traces
  accurately for large r". Heath-Brown's theorem alone covers only structured (high-energy) W.
- **Which properties of the coefficients it uses: size only.** |b_n| ≤ 1 (ℓ^∞), and only in Lemma 11.4. Everywhere
  else b enters only through ‖b‖₂ (Lemma 4.1); after that the argument concerns M_W, i.e. W and N. No arithmetic of
  Λ or μ appears in Theorem 1.1. The arithmetic that does appear is that of the FREQUENCIES: n runs over all integers
  of [N,2N] (Poisson summation in n) with phase log n. The authors stress that the key cancellation "is specific to
  Dirichlet polynomials as opposed to more general trigonometric polynomials" e^{itφ(n)}: for φ ≠ log the u₃-phase
  is not linear and stationary points return. Also used: integer structure of n₁/n₂ in §11 (gcd split, separation
  d²/N² of reduced fractions) and divisor bounds for the coefficients of D^k. In the zeta application μ appears only
  inside the standard mollifier, linearly.
- **Exactly where it stops.**
  (i) It gives a density estimate, not a pointwise bound, because the conclusion bounds s₁(M_W), a property of how
  many points W has and how they are arranged, uniformly over all bounded b. For |W| = 1 this is the trivial
  bound |D(t₀)| ≪ N.
  (ii) For the class it works in, a count of zero is false: the footnote gives bounded b with ≫ N^{2−2σ} ≥ 1
  1-separated large values. The best possible statement of this kind, Montgomery's conjecture, is still a count
  ≥ 1 (and N(σ,T) ⪅ T^{A(1−σ)} is ≥ 1 for every σ < 1).
  (iii) For ζ, the zero-detection step maps every zero with β ≥ σ in [T,2T] to a height where a mollified polynomial
  D̃ (coefficients built from μ and 1) satisfies |D̃| ⪆ N^σ. Getting a count of zero this way would need |D̃(t)| < N^σ
  at every t ∈ [T,2T]: a sup-norm bound for one polynomial with specific arithmetic coefficients. Inferred: that
  statement is not of Theorem 1.1's type, and point (ii) shows that no argument blind to the coefficients beyond
  |b_n| ≤ 1 can give it.
  (iv) Within its own type, the authors place the next gain in S₃ only, at the configuration of §4 above. At that
  configuration S₁, S₂ are optimal, the energy bound matches random sets, and Proposition 9.1 is tight on rational
  concentrations.
