# Bondarenko, Radchenko, Seip, "Fourier interpolation with zeros of zeta and L-functions"

Note by seat R-read-2, 2026-11-11. This note reports what is in the source. It recommends nothing.

## 1. Reference and how much was read

- A. Bondarenko, D. Radchenko, K. Seip, *Fourier interpolation with zeros of zeta and L-functions*,
  arXiv 2005.02996, latest arXiv source (TeX file "Fourier_Bases_zeta_revision.tex", dated 3 Nov 2022, with
  the revision changes marked). Published in Constr. Approx. 57 (2023) (publication data taken from Johns's
  bibliography, not checked independently).
- **Read in full from the TeX source** (`rh/library/src/2005.02996/brs.tex`, 2711 lines): §1 introduction,
  §2 generalities, §3 modular integrals for the theta group, §4 the kernel for ζ and the proof of
  Theorem 1.1, §5 Dirichlet L-functions and other Dirichlet series, §6 estimates for the Fourier
  coefficients, §7 the √n basis revisited, bibliography. The estimates of §6 were read, not re-derived.
  Section numbers below are counted from the source (the TeX has no explicit numbers).

## 2. What it proves

All results are unconditional: no hypothesis on the location or simplicity of zeros is made anywhere.

- **Theorem 1.1 (main).** 𝓗_1 = functions analytic in |Im z| < 1/2+ε with
  sup_y ∫|f(x+iy)|(1+|x|)dx < ∞. "There exist two sequences of rapidly decaying and even entire functions
  U_n(z), n = 1, 2, …, and V_{ρ,j}(z), 0 ≤ j < m(ρ), with ρ ranging over the nontrivial zeros of ζ(s) with
  positive imaginary part, such that for every even function f in 𝓗_1 and every z = x+iy in the strip
  |y| < 1/2"
  f(z) = Σ_{n≥1} f̂(log n/4π) U_n(z) + lim_k Σ_{0<γ≤T_k} Σ_{j<m(ρ)} f^{(j)}((ρ−½)/i) V_{ρ,j}(z),
  for a fixed sequence T_k → ∞ independent of f and z. Interpolation properties:
  U_n^{(j)}((ρ−½)/i) = 0, Û_n(log n'/4π) = δ_{n,n'}, V_{ρ,j}^{(j')}((ρ'−½)/i) = δ, V̂_{ρ,j}(log n/4π) = 0.
  The zero sum is taken in the grouping T_k (conditional convergence).
- **Corollary 1.1.** (i) An even f ∈ 𝓗_1 with f̂(log n/4π) = 0 for all n ≥ 1 and f^{(j)}((ρ−½)/i) = 0 for
  all zeros (with multiplicity) vanishes identically. (ii) An even f ∈ 𝓗_1 divisible by ζ(½+is) is
  determined by the values f̂(log n/4π). Both "break down if one removes any single point" from either set.
- **Theorem 2.1 / 2.2 (general duality, motivation only; "We do not explicitly use the results of this
  section anywhere else").** If a pair of sequences Λ (sparse: an entire function of order ≤ 2 vanishing on
  it) and Λ* carries a Fourier interpolation formula f = Σ f(λ)g_λ + Σ f̂(λ*)h_{λ*} valid on Gaussian-damped
  Cauchy kernels, then the Dirichlet series E_±(x,z) = 2πi Σ' h_{λ*}(x)e^{-2πiλ*z} continue meromorphically
  with simple poles at x and at Λ and satisfy E_+ = −E_-; dually for Λ*.
- **Kulikov's density bound (quoted, §2.4; from [Ku]):** N_Λ(T) + N_{Λ*}(W) ≥ 4WT − C log^{2+η}(4WT). With
  Λ = zeros and Λ* = {±log n/4π}, W = (log T − log 2π)/4π, it reads N(T) ≥ (T/2π)log(T/2πe) − C log^{2+η}T:
  the pair (zeros, logs of √n) meets the uncertainty bound "in the same marginal way" as Riemann–von
  Mangoldt.
- **Theorem 3.1 (modular integrals).** For φ analytic of moderate growth on ℍ, k ≥ 0, ε = ±1, there is a
  unique 2-periodic analytic F of moderate growth, F = Σ_{n≥ν_ε} a_n e^{πinτ}, with
  F(τ) − ε(τ/i)^{-k}F(−1/τ) = φ(τ) − ε(τ/i)^{-k}φ(−1/τ); ν_- = ⌊(k+2)/4⌋, ν_+ = ⌊(k+4)/4⌋.
- **Proposition 3.1 (dimension).** "dim M_k(Γ_θ, ε) = ν_ε(k)", for real weight k ≥ 0 (θ^{2k} principal
  branch), citing Berndt–Knopp [BK, Thm 6.3]; any form with expansion starting at n ≥ ν_± vanishes.
- **Proposition 4.1 (kernel).** 𝒜_k^±(w,s) = π^{-w}Γ(w)Σ_{n≥1} α^±_{n,k}(s)n^{-w} (Mellin transform of
  F_k^±(it,s)) is meromorphic in w with simple poles at w = s, k−s (and possibly 0, k), bounded in lacunary
  vertical strips, and 𝒜_k^±(k−w,s) = ±𝒜_k^±(w,s), 𝒜_k^±(w,k−s) = ∓𝒜_k^±(w,s). Remark (Bochner's converse
  theorem): a Dirichlet series with this functional equation in w and finitely many poles is L_f plus a
  finite combination of s-derivatives of these kernels, f ∈ M_k(Γ_θ,±): "a considerable strengthening of
  the abundance principle of Knopp". Special values: 𝒜^+_{l/2}(w,0) = −π^{-w}Γ(w)Σ r_l(n)n^{-w}, l = 1,2,3.
- **§4.4 (relation with Riemann–Weil).** For the Weil functional W (left side of the explicit formula):
  "WU_n = π^{-1}Λ(n)/√n, n a square; 0 otherwise", "WV_{ρ,j} = 2, j = 0; 0, j > 0". (Johns's paper records
  two slips here: for a square n = k² the value is π^{-1}Λ(k)k^{-1/2}, and the second value is 2m(ρ). Both
  corrections follow from the theorem's own normalisation: even f pairs log n/2π with log(n²)/4π, and the
  explicit formula counts zeros with multiplicity. Checked by this seat by that two-line computation.)
- **Theorem 5.1 (even primitive characters mod q ≥ 2)** and **Theorem 5.2 (odd primitive characters,
  q ≥ 3):** the analogous formulas for all f in 𝓗_1 (resp. 𝓗_2: analytic in |Im z| < 3/2+ε with decay
  (1+|x|)^{-1-ε}), nodes ±(log|n| + log q)/4π, n ∈ ℤ∖{0}, plus one extra function U_0 attached to the values
  f(∓i/2) (resp. f(∓3i/2)). Theorem 5.1 is given as a "proof sketch".
- **§5.3 (sketched, "Detailed analysis of these generalizations falls outside the scope of this paper"):**
  Dedekind zeta functions of imaginary quadratic fields and products L(s,χ_1)L(s,χ_2) of opposite parity;
  Hecke L-functions of newforms (even weight k ≥ 2); **"Dirichlet series without Euler products"**: a
  continuous family of formulas with Λ = zeros of 𝒜^ε_k(w/2,s_0), which "in general can not be represented
  as an Euler product"; and "linear combinations of L-functions that satisfy the same functional equation".
- **Theorem 7.1 (√n basis).** The Radchenko–Viazovska formula f(x) = Σ f(√n)a_n(x) + Σ f̂(√n)â_n(x) holds
  for even integrable f with integrable f̂, both absolutely continuous, with
  ∫|f'|(1+|x|)^{1/2}log³(e+|x|) < ∞ and the same for (f̂)' (was: decay (1+|x|)^{-13}).
- §6 estimates: α^±_{n,k}(s) ≪ c(s)n^{k/2}(1+log^{2-k}n) for 0 < k < 2, c(s) ≤ 2^{k+1}e^{π|Im s|/2}
  (Prop. 6.3); Σ_{n≤x}|α|² ≪ x^{k+|k−1|}log²x (Prop. 6.4, "optimal up to powers of log x" for 1 ≤ k < 2);
  partial sums Σ_{n≤x}α^±_{n,k}(s) = ±α_0 (πx)^k/Γ(k+1) + (πx)^s/Γ(s+1) + O(x^{k/2}log³x) (Prop. 6.5).

## 3. Method in ten lines

1. Target: a kernel H(w,s) that is a Dirichlet series in n^{-w/2}, has poles in w at s, 1−s and at the
   zeros of ζ, and is odd/even under w ↦ 1−w and s ↦ 1−s. Integrating f against H on a vertical line
   gives Σ f̂(log n/4π)·(coefficient); shifting the contour picks up f(z) and the residues at the zeros.
2. The kernel is H_±(w,s) = (ζ*(s)/ζ*(w)) · ½𝒜_{1/2}^±(w/2,s/2): the factor 1/ζ*(w) creates the poles at the
   zeros, ζ*(s) makes the coefficients vanish at the zeros.
3. 𝒜_k^± is the Mellin transform of a "modular integral" F_k^±(τ,s) for the theta group: a 2-periodic
   function with F − ε(τ/i)^{-k}F(−1/τ) = (τ/i)^{-s} − ε(τ/i)^{s−k}.
4. F_k^± is built as a contour integral of (z/i)^{-s} against a Green's-function kernel made from θ and the
   Hauptmodul J of Γ_θ (the Radchenko–Viazovska construction); uniqueness from dim M_k(Γ_θ,ε).
5. Its Fourier coefficients α_{n,k}^±(s) are Mellin transforms of the Radchenko–Viazovska eigenfunctions
   b_n^± (Γ_ℝ(s)α_{n,1/2}^±(s/2) = 2∫b_n^±(x)x^{s−1}dx), which gives the interpolation properties.
6. Möbius inversion over square divisors turns Σα_n n^{-w/2}/ζ(w) into the coefficients h_n(s).
7. The work: bounds for α_n(s) uniformly in n (§6), by estimating F near the real line through the
   cocycle relation, the height 𝐇(τ) of τ in the fundamental domain and the number 𝐍(τ) of inversions in
   the reduction algorithm (∫𝐍(x+iy)dx = (2/π²)log²y + O(log y)).
8. Horizontal contour segments need 1/ζ small somewhere: Lemma 4.3 (Ramachandra–Sankaranarayanan),
   min_{T≤t≤T+T^{1/3}} max_{½≤σ≤2}|ζ(σ+it)|^{-1} ≤ exp(c(log log T)²). **This is the only place where the
   Euler product enters** (the paper says so in §5.3: without an Euler product "the techniques from [RS]
   must be abandoned" and a cruder Jensen/Borel–Carathéodory bound T^{c log log T} is used instead).
9. Everything else uses only the functional equation and the Dirichlet-series (additive) representation.
10. Other L-functions: replace ζ*(s)/ζ*(w) by L*(s)/L*(w) and choose k to match the Gamma factor.

## 4. Where it stops

- The theorem needs f analytic in a strip of width > 1 (> 3 for odd characters) with an integrability
  condition; the zero side converges only along the special heights T_k.
- §4.4: "It would be interesting to know whether these curious properties of the basis functions [the values
  of the Weil functional on them] could be obtained without resorting to the Riemann–Weil formula." The
  paper derives nothing about the explicit formula from the interpolation formula; the relation goes one
  way (explicit formula ⇒ values of W on the basis).
- More complicated Gamma factors (degree > 2, mixed Γ_ℝ^{r_1}Γ_ℂ^{r_2}): "the results are less satisfactory
  … in general the resulting functions U_n and V_{ρ,j} will no longer form a basis, and we will not get the
  interpolatory properties". (A sentence on the Selberg class is commented out in the source: obtaining
  the analogue of D(w,s) there "appears as a nontrivial problem".)
- Without an Euler product: functions must decay faster (bound T^{c log log T}), and for the family (5.2)
  the individual basis functions "do not belong to any nice function space".
- §2.4: whether a Riemann–von Mangoldt formula follows from Kulikov's bound plus minimality: "It would be
  interesting to see".
- §2.5: on crystalline measures, the results add "further evidence to the common belief … that a
  classification of such measures would probably be very difficult to obtain".
- Nothing in the paper is a positivity statement, and nothing constrains where the zeros are: the basis
  exists for whatever the zero multiset is.

## 5. What it changes in our record

- **Idea #9 novelty field** lists this paper as "related". Precisely: it is not about positive solutions or
  feasibility. It supplies, unconditionally, test functions that isolate one zero (V_{ρ,j}) or one node
  log m/4π (U_m); Johns's Proposition 3.5 and Theorems 3.6, 3.8 use them that way. The nodes are the logs
  of **all** √n (twice as dense as the prime-power side of the explicit formula: log n/2π = log n²/4π).
- **Barrier B10 ("both structures at once").** The paper states the split in its own terms: "the deduction
  of the Riemann-Weil formula starts from the Euler product representation of ζ(s), while formula (1.2) is
  tied to the Dirichlet series representation"; "we may think of the two formulas as expressing
  respectively a multiplicative and an additive duality relation between the zeta zeros and a distinguished
  sequence of integers". Our B10 wording ("additive side = functional equation, i.e. Poisson summation over
  ℤ") has this as a published, exact counterpart: the additive duality is a theorem (Theorem 1.1), it needs
  no Euler product except in one technical lemma, and it holds whatever the zeros do.
- **Barriers B1/B2 (controls).** §5.3 sketches interpolation formulas for "Dirichlet series without Euler
  products" and for "linear combinations of L-functions that satisfy the same functional equation", i.e.
  for the Davenport–Heilbronn and Bombieri–Hejhal type functions, with a narrower function class. So the
  existence of a zero/log-integer interpolation basis is shared by ζ and by the project's impostors; the
  statement is sketched there, not proved in detail.
- **Idea #13 (theta dial rigidity).** The dimension count that entry holds "from memory plus one search
  snippet" is stated in full text here: Proposition 3.1, dim M_k(Γ_θ,+) = ⌊(k+4)/4⌋ = 1 + ⌊k/4⌋ and
  dim M_k(Γ_θ,−) = ⌊(k+2)/4⌋ for real k ≥ 0, with reference Berndt–Knopp, *Hecke's theory of modular forms
  and Dirichlet series*, Thm 6.3. With weight k = n/2 for θ^n this is 1 + ⌊n/8⌋, one-dimensional for
  0 ≤ n < 8: our recalled count is confirmed (for the + character and moderate growth). The Bochner remark
  after Proposition 4.1 gives the precise form of "uniqueness of the solution of the functional equation":
  unique once the poles are prescribed; with extra poles allowed at s_j there is the family 𝒜_k^±(w,s_j).
  The paper also has the dial's integer members as special values: 𝒜^+_{l/2}(w,0) = −π^{-w}Γ(w)Σr_l(n)n^{-w},
  l = 1, 2, 3. Nothing in the paper concerns zeros of the dial members.
- **Idea #21 ("the primes are its mirror spectrum, the zeros its shift spectrum").** A published statement
  of the form "one functional, two sets of coordinates" is §4.4: in the basis {U_n, V_{ρ,j}} the Weil
  functional has coordinates π^{-1}Λ(√n)n^{-1/4} (non-zero only on squares of prime powers) and 2m(ρ). This
  is not the Hankel/mirror positivity of #21; it is a different, linear, statement.
- **Ideas #16/#18 (horizon).** The paper quotes Kulikov's joint density bound for the two node sets and
  observes that zeros and log-integers saturate it. Our horizon statements were not compared with it here
  (different normalisation; not worked out by this seat).
- Theory T1–T6, atlas F1–F3: no change.

## 6. Reliability

- Human-written, by established authors; arXiv revision of Nov 2022; published in a refereed journal
  (Constructive Approximation). Main theorem proved in full; Theorem 5.1 is a "proof sketch", Theorem 5.2 a
  two-line reduction, §5.3 explicitly only outlined.
- Two misprints in §4.4 as noted in part 2 (the corrections are elementary).
- Johns's Lean README records a caveat about how his paper uses this one: BRS's uniqueness corollary is for
  𝓗_1, and uniform decay of the basis on closed strips is "the paper's reading of [BRS §4.3]"; in BRS the
  basis functions are stated to be "rapidly decaying" (bounds for every fixed y), proved in the paragraph
  "Rapid decay of the basis functions".
