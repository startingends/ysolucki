# Johns, "Positive solutions of the explicit formula for ζ(s): near-criticality and uniqueness" (Part I)

Note by seat R-read-2, 2026-11-11. This note reports what is in the source. It recommends nothing.

## 1. Reference and how much was read

- N. Johns, *Positive solutions of the explicit formula for ζ(s): near-criticality and uniqueness*, preprint,
  **version 1.4, October 2026**, github.com/nic410/zeta-positive-solutions (commit abc9202, 2026-10-08),
  concept DOI 10.5281/zenodo.23197915. 51 pages. Not on arXiv, not peer-reviewed. (The reading list calls it
  "Positive solutions of Weil's explicit formula for ζ(s)"; the title on the paper is the one above.)
- Source used: a shallow git clone into `rh/library/src/johns/repo/` (TeX, read as text; nothing run).
- **Read in full, from the TeX:** `README.md`; `paper/main.tex` (abstract, AI-use statement); all of
  `paper/sections/`: 01-intro, 02-setting, 03-uniqueness, 04-family, 05-certified, 06-conjectures,
  A-certification, B-proofs (all 663 lines), C-anc. Also in full: the Lean spine's `README.md`; the companion
  note on other Gamma factors, `supplementary/notes/critical-conductors/main.tex` ("Critical conductors of
  small archimedean data", 9 pp, cited as [N3]); `supplementary/README.md`; the log and the structure of the
  parameter file of the certificate behind the unconditional lower bound
  (`paper/anc/general/logs/pair_zeta_logq002_X10.log`, `params/pair_zeta_logq002_X10.json`).
- **Read in part:** the Lean `LEDGER.md` and `STATUS.md` (tables only).
- **Not read:** the verifier scripts (Python), the other logs, the Lean sources, `paper/anc/README.md`; the
  companion manuscript `supplementary/hermite-interpolation/` (about 60 pp, [N1]); the notes
  `notes/extra-primes/` ([N2]) and `notes/integer-beurling/` ([N4]); **Part II**
  (github.com/nic410/zeta-sharpness-uniqueness), of which only the README was read.
- No certificate was re-run and no proof was checked line by line by this seat. Everything below is "the
  paper states/claims", with the kind of support named.

## 2. What it claims, statement by statement

**Setting (Def. 2.1, 2.4).** Fourier convention F̂(ξ) = ∫F(t)e^{-2πiξt}dt; ξ_n = log n/2π. Test class 𝒯: even
F, real on ℝ, analytic near a closed strip |Im z| ≤ 1/2+δ, with sup (1+|z|)²|F(z)| < ∞. Archimedean
functional 𝒜(F) = F(i/2)+F(−i/2) + ∫F·Ω_∞, Ω_∞(t) = (1/2π)(Re ψ(1/4+it/2) − log π). An **admissible pair** is
(μ, ν): μ an even positive Radon measure on ℝ, ν a positive Radon measure on [ξ_2, ∞), with
𝒜(F) = ∫F dμ + (1/π)∫F̂ dν for all F ∈ 𝒯. Cone 𝒞 = {F ∈ 𝒯: F ≥ 0 on ℝ, F̂ ≥ 0 on [ξ_2,∞)}; classical cone
𝒞_OPS = {F ≥ 0 and F̂ ≥ 0 on ℝ}. Slack κ* = inf{𝒜(F): F ∈ 𝒞, ∫F = 1}. ζ's pair p_ζ = (real zero ordinates
with multiplicity, Σ Λ(n)n^{-1/2} δ_{ξ_n}). Statements (E): 𝒦 ≠ ∅; (U): 𝒦 ⊆ {p_ζ}; (S): κ* ≤ 0.
𝒜_q = 𝒜 + (log q/2π)∫ is the functional with "conductor q". Note what this is **not**: it is not Weil's
quadratic form on f*f̃ and there is no window; positivity is pointwise on both sides and the problem is a
linear programme (the paper says so itself, §1.5).

Unconditional, with written proofs in the text (support: proof in the paper; Lean status in brackets):

- **Lemma 2.5 (weak duality).** For (μ,ν) ∈ 𝒦 and F ∈ 𝒞: (inf_I F)μ(I) + (1/π)(inf_J F̂)ν(J) ≤ 𝒜(F).
  One-line proof. [Lean: proved from Mathlib only.]
- **Lemma 2.6 (a priori bounds).** μ([T−1,T+1]) ≤ C log(3+|T|), ν([X−1,X+1]) ≤ Ce^{πX}. [Not formalised.]
- **Theorem 2.7 (duality) = Theorem A(a).** "𝒦 ≠ ∅ if and only if 𝒜(F) ≥ 0 for every F ∈ 𝒞, if and only if
  κ* ≥ 0"; also enough to test Gaussian wave packets; 𝒦 is convex and vaguely compact. Proof: Carathéodory
  in finite-dimensional subspaces + a priori bounds + Helly (App. B.1.1). [Lean: the direction "(ii) ⇒ (i)"
  is a ledger **axiom** `duality_no_gap`, i.e. taken from the paper's proof, not machine-checked.]
- **Proposition 2.8 (floors).** κ* is finite, κ* ≥ −1.3231 by an elementary bound; κ* is the largest λ for
  which a pair with μ − λ dt ≥ 0 exists, and the maximum is attained.
- **Theorem 2.9 (logic).** (a) RH ⇒ p_ζ ∈ 𝒦. (b) If (μ, ν_ζ) ∈ 𝒦 then RH and μ = μ_ζ. (c) (U) ⇔
  [(E) ⇒ RH] ∧ [RH ⇒ 𝒦 = {p_ζ}]. (d) (U) ⇒ (S). "It does *not* imply RH: it is consistent with
  ¬RH ∧ ¬(E)". [(b) is a Lean ledger axiom.]
- **Proposition 2.10 (conductor form).** κ*(𝒜_q) = κ* + log q/2π; "𝒦(𝒜_q) ≠ ∅ if and only if
  q ≥ q_min := e^{-2πκ*}"; (S) ⇔ q_min ≥ 1; RH ⇒ q_min ≤ 1.
- **Theorem 2.12 (criticality and atomicity) = Theorem A(b).** Assume (E). Then κ* = 0 ⇔ every admissible μ
  is purely atomic ⇔ one discrete set carries every admissible μ ⇔ no admissible μ ≥ λ dt, λ > 0. The
  discrete set is the real zero set of a "weak magic function" (limit of near-optimal test functions).
  [(a) is a Lean ledger axiom.]
- **Lemma 2.13 (complementary slackness).** If F ∈ 𝒞 and 𝒜(F) = 0, every admissible μ sits on the real zeros
  of F and every admissible ν on the zeros of F̂ in [ξ_2,∞).
- **Lemma 3.1 / Prop. 3.2 / Prop. 3.3 (§3.1 "Why arithmetic is needed").** Differences of admissible pairs
  are pairs in Fourier duality with spectral gap (−ξ_2, ξ_2). Soft rigidity: a difference with Δμ ≥ 0 off a
  countable set not containing 0 with summable negative atoms and Δν ≥ 0 a.e. vanishes; likewise if (Δμ)_-
  is finitely supported. Poisson-summation examples show the sign and gap conditions alone do not force
  rigidity ("they show that such a proof needs more than these conditions"). [Not formalised.]
- **Proposition 3.5.** If μ is carried by Z_ζ (real zero ordinates) and ν by ℳ = {log m/4π: m ≥ 1}, then RH
  and (μ,ν) = p_ζ; no positivity used. The paper says this "is essentially the observation made in
  [BRS §4.4]" + [BRS Cor. 1.1]. It also records two slips in BRS §4.4 (see the BRS note).
- **Theorem 3.6 (zero-side support) = Theorem B(a).** "Let (μ,ν) ∈ 𝒦, and assume that μ is carried by
  Z_ζ ∪ {0}. Then RH holds and (μ,ν) = p_ζ." No hypothesis on ν. Credited to OpenAI's "Astra". Proof
  (App. B.1.4): push ν to x = e^{2πξ}; the lattice functional L(f) = ∫√x Σ_k f(kx) dν♯(x); test on the BRS
  functions U_m; Radchenko–Viazovska interpolation gives L(f) = Σ_{n≥2}(log n)f(n) − ½μ({0})ζ(½)∫f x^{-1/2}
  for self-dual Schwartz f with f(0)=0; the function g(t) = sin²(πt)/(π²(t²−1)), which vanishes at the
  integers and is positive elsewhere beyond 1, forces ν♯ onto the integers ≥ 2; Möbius inversion gives the
  weights Λ(m)m^{-1/2}. [Lean ledger axiom `zero_support_rigidity`.]
- **Theorem 3.8 (countably many extra zeros) = Theorem B(b).** μ real, carried by Z_ζ ∪ E (E countable,
  symmetric, off Z_ζ), ν real, carried by ℳ, identity on the BRS functions; ν ≥ 0 only at nodes with
  m ≡ 2 (mod 3), μ({0}) ≥ 0, and Σ_{e>0}|a_e||ζ(½+ie)|(1+e)^{-1/2} < ∞ (or A(T) = o(T^{1/2})). Then RH,
  μ = μ_ζ, ν = ν_ζ. Proof: theta-group cusp expansions at 0, 2/3, 4/3 of the BRS modular integrals + a
  mean-value argument for an almost periodic function (App. B.1.6, Lemmas B.1–B.4). [Ledger axiom.]
- **Corollary 3.9 (magic-function principle).** If F ∈ 𝒞, 𝒜(F) = 0, and every real zero of F lies in
  Z_ζ ∪ {0}, then (U). Variant (b) with extra zeros and Ẑ(F) ⊆ ℳ.
- **Theorem 3.11 (integer weights).** "Let q > 0 and (μ,ν) ∈ 𝒦(𝒜_q), and assume that μ is purely atomic with
  μ({γ}) ∈ ℤ for every γ ∈ ℝ. Then q ≥ 1. If q = 1, then RH holds and (μ,ν) = p_ζ." Any positive prime
  measure on [ξ_2,∞) is allowed. Proof (App. B.3): Π = y^{1/2}(log y)^{-1}ν̃, N = exp_*(Π) (multiplicative
  convolution exponential), 𝒵(s) = ∫y^{-s}dN is a generalised Dirichlet series with positive coefficients,
  −𝒵'/𝒵 = prime integral; integrality of the zero weights makes q^{s/2}Γ_ℝ(s)𝒵(s) meromorphic with the
  functional equation, sign C = (−1)^{μ({0})}; the measure N placed at ±y/√q plus a mass at 0 is its own
  Fourier transform up to C; Fejér's kernel gives q ≥ 1, and at q = 1 puts N on the integers, where
  Hamburger's theorem gives 𝒵 = ζ; for C = −1 a self-dual function gives q ≥ 2π/3. **[Not formalised in
  Lean at all: STATUS rows 24, 25.]** The paper says of the Dirichlet-series form: "We have not found this
  in print and expect it to be known to experts."
- **Corollary 3.12.** (S) ⇔ every admissible μ is purely atomic; (U) ⇔ every admissible μ is purely atomic
  with integer weights. [Not formalised.]
- **Prop. 4.2 (Bessel form).** Ψ = (Ξ²)^ = 2π√x Σ_N d(N) W_0(2πNx), W_0(z) = z²[(z²+9)K_0 − 6zK_1]; a
  differentiated Koshliakov formula (attributed to Koshliakov, Ramanujan, A. Dixit). Lemma 4.1: Ψ > 0.
- **Cor. 4.4 (zero-killing).** For F = Ξ²H ∈ 𝒯, 𝒜(F) = (1/π)Σ_{prime powers n} Λ(n)n^{-1/2}F̂(ξ_n); "No
  hypothesis on the zeros of ζ is used."
- **Theorem 4.8 (Theorem D), conditional.** If the Hermite family F_J = Ξ²P_J(t²) (P_J(0)=1, deg ≤ 2J, F̂_J
  with double zeros at the first J prime powers) satisfies (N) infinitely many non-singular J, (G_a) a
  uniform bound |H_J| ≤ Ce^{a|Re t|}, a < π/2, (Z∞) no real limit zeros, (Mg) liminf F̂_J ≥ 0 beyond the
  gap, then (S) and (U) hold and RH ⇔ (E). **The hypotheses are open** (the paper says so).
- **Cor. 4.11 (certificate route), conditional.** If F_J ∈ 𝒞 with F_J ≥ c_JΞ² and 𝒜(F_J)/c_J → 0 then (U), (S).

Computer-assisted, unconditional (support: a shipped verifier in Arb ball arithmetic / exact Sturm sequences,
a parameter file pinned by SHA-256, and the log of a run; in Lean these enter as **axioms**):

- **Theorem 5.1 = Theorem C(a).** "κ* ≤ κ*_OPS ≤ 1.4291572·10^{-1060}", from the exact member J = 111;
  table for J = 10, 60, 61, 110, 111 (1.5·10^{-19}, 1.06·10^{-417}, 2.3·10^{-442}, 2.0·10^{-1042}, 1.4·10^{-1060}).
- **Cor. 5.2.** No admissible pair for q ≤ 1 − 8.98·10^{-1060}; q_min ≥ 1 − 8.98·10^{-1060}.
- **Cor. 5.3 (near-rigidity).** "Every admissible pair (μ,ν) satisfies ∫Ξ² dμ ≤ 3.99·10^{-1060}."
- **Prop. 5.4.** A Gaussian–Laguerre function (K = 128, no arithmetic input) gives κ*_OPS ≤ 9.9462·10^{-41}.
- **Prop. 5.5 (low-height rigidity), Table 2.** For **every** admissible pair, RH or not: μ of each gap
  between the first six zero ordinates (shrunk by 0.1) ≤ 2.75·10^{-17} … 2.39·10^{-13}; ν of the window
  x ∈ [2.05, 2.95] ≤ 6.81·10^{-19}; [5.05, 6.95] ≤ 6.94·10^{-14}; [7.05, 7.95] ≤ 2.72·10^{-12};
  [10.05, 10.95] ≤ 5.95·10^{-10}; [12.05, 12.95] ≤ 3.80·10^{-8}; [14, 15] ≤ 1.82·10^{-8}; an atom at
  x = 2.5 ≤ 1.53·10^{-21}; **an atom at x = 6 ≤ 6.37·10^{-18}**.
- **Prop. 5.6, 5.7.** For J ∈ {10, 60, 61, 110, 111}: M_J non-singular, all coefficients of P_J positive,
  0 < p_k ≤ 0.71636^{2k}/(2k)!, F_J ≥ Ξ², F̂_J > 0 on [0,∞) off the nodes with exact double zeros there.
- **Prop. 5.10 = Theorem C(b).** "For ζ's data with conductor q = e^{0.02} there is an admissible pair of the
  form of Lemma 5.9 with μ ≥ 4.71949·10^{-4} on ℝ. Hence q_min ≤ e^{0.02} and κ* ≥ −2.7112·10^{-3}."
  Together: 1 − 8.98·10^{-1060} ≤ q_min < 1.017182, unconditionally.
- **Prop. 5.11 (ℚ(√5), ℚ(√−3)).** Data Γ_ℝ², q = 5, one pole: 1.64·10^{-5} ≤ κ*_g ≤ 4.83·10^{-4} for every
  gap g ≤ ξ_{4.04915}; data Γ_ℂ, q = 3: 1.50·10^{-4} ≤ κ*_g ≤ 9.99·10^{-4} for g ≤ ξ_{3.011664}. So these data
  have positive slack and more than one admissible pair. "These are two examples; we make no claim about
  L-functions in general."

Computed, not certified (labelled "Numerical observation", never used in a proof): Obs. 5.8 (the family for
J ≤ 110: non-singular; all coefficients positive for J ∈ {1,2} and 10 ≤ J ≤ 110, not for 3 ≤ J ≤ 9).

Conjectures: **U** and **S** (above); **Conjecture 6.1** (the family converges to a magic function).
The paper's v1.4 note says U and S "are proved in Part II", which "has not yet been checked by a human
expert". Part II's README (the only part of it read here) claims an explicit F = Ξ²H with F ≥ 0, F̂ ≥ 0,
F̂ vanishing at log n/2π for every integer n ≥ 2 and 𝒜(F) = 0, built from an eigenfunction of the hyperbolic
Laplacian (Niebur–Poincaré series, Kloosterman sums), and deduces: κ* ≤ 0; every admissible pair is ζ's;
"RH is equivalent to 𝒜(F) ≥ 0 for every such F [F ≥ 0, F̂ ≥ 0], a condition with no gap on the prime side
and no arithmetic input"; and "we do not claim that either reformulation makes it easier". Its Lean spine
takes "the existence of the object with its properties" as an axiom ("The existence of the object itself is
**not** formalised").

**Companion note N3 ("Critical conductors of small archimedean data"), all computer-assisted or computed.**
Covers only Gamma types Γ_ℝ^aΓ_ℂ^b **with one simple pole** (Dedekind-zeta type), gap ξ_2.
- Thm 3.1: Γ_ℝ² critical conductor in [4.98485094226764, 4.9994844]. Prop. 3.2: Γ_ℂ in [2.981236704765,
  2.997174]. Cor. 3.3: both brackets hold at the natural gaps of ℚ(√5), ℚ(√−3). Prop. 3.7: an admissible
  pair for ℚ(i) (Γ_ℂ, q = 4) with μ ≥ 0.0217 dt.
- Thm 4.1 (pole weight pinned): with ζ's Gamma factor and the pole term multiplied by r, "there is no
  admissible pair if r < 1 − 5.5794·10^{-40} or r > 1 + 7.8550942·10^{-21}".
- Numerical observations (not certified): critical conductor / minimal discriminant for seven types
  (2.981/3, 4.985/5, 22.6/23, 48.2/49, 114.7/117, 267.8/275, 694.6/725): the genuine field lies strictly
  above the critical conductor in each; the near-critical objects for Γ_ℝ² have prime atoms at non-integers
  (4.3201, 9.215, 14.41) and "appear to be non-arithmetic; this reading is heuristic". Obs. 3.4: for ζ's
  data the slack as a function of the gap g is constant for g ≤ ξ_2 and negative beyond ("−0.0470 at ξ_{2.5}
  and −0.0793 at ξ_3"), i.e. computed: no admissible pair if the prime measure is required to start at 2.5.
- Question 6.1 (open "even numerically"): is the set of admissible pairs at the critical conductor a single
  pair, for other Gamma factors?

## 3. Method in ten lines

1. Replace Weil's quadratic positivity by a conic linear programme: unknowns are two positive measures,
   the dual variables are test functions F ≥ 0 with F̂ ≥ 0 beyond the gap.
2. Duality without gap (Carathéodory + Helly) turns existence of a pair into "𝒜 ≥ 0 on the cone"; the
   conductor enters as a multiple of Lebesgue measure, so the optimum is a critical conductor q_min.
3. Upper bounds for κ* are single test functions in the cone (weak duality). The sharp ones are
   "zero-killing": F = Ξ²·P(t²) vanishes at every zero of ζ on or off the line, so 𝒜(F) is a sum over prime
   powers only; Hermite interpolation makes F̂ vanish doubly at the first J prime powers, so the sum starts
   at the (J+1)-st prime power and is of size e^{-2π n_{J+1}} (Bessel form of (Ξ²)^).
4. Positivity of F̂_J is certified in ball arithmetic: jet-subtracted Taylor pieces at the nodes, Taylor
   models between, a positive-coefficient far field.
5. Lower bounds for κ* are explicit feasible pairs (Lemma 5.9, Herglotz form): choose a positive measure ν̃
   on [2,∞) equal to dx plus corrections; then the zero density is forced to be
   μ(t) = Ω(t) + log q/2π − (1/π)Re ℒ(½+it), and the pair is admissible iff μ ≥ 0.
6. Uniqueness near ζ's support uses the Bondarenko–Radchenko–Seip interpolation basis as test functions:
   each basis function isolates one zero or one node log m/4π.
7. Positivity of ν plus one function vanishing exactly on the integers pins ν to the integers (Thm 3.6).
8. Extra zeros are detected through the Fourier coefficients of BRS's modular integrals in the class
   N ≡ 2 mod 3 (no squares there), expanded at three cusps of the theta group; almost-periodic mean values.
9. Integer zero weights: exponentiate the prime measure to a positive Dirichlet integral with Riemann's
   functional equation; Fejér kernel (the one-dimensional Cohn–Elkies bound) + Hamburger's theorem.
10. Where the work is: the cusp expansions (App. B.1.6), the Bessel certificates (§5, App. A), Theorem 3.6.

**How the unconditional bound "admissible pairs exist for conductor ≥ 1.0172" is proved (Prop. 5.10 with
Lemma 5.9 and Prop. 2.10).** Lemma 5.9: for ν̃ ≥ 0 on [2,∞) with ∫x^{-1/2}d|ν̃ − 1_{[2,∞)}dx| < ∞ and
ℒ(s) = ∫x^{-s}dν̃, a contour shift past the pole of ℒ at s = 1 gives, for every F ∈ 𝒯,
𝒜_q(F) = ∫Fμ dt + (1/π)∫F̂ dν with μ(t) := Ω_∞(t) + log q/2π − (1/π)Re ℒ(½+it) and ν the image of
x^{-1/2}ν̃; so (μ dt, ν) is admissible for 𝒜_q iff μ ≥ 0. The certified pair (parameter file
`pair_zeta_logq002_X10.json`) is: Lebesgue measure on [2,∞), reduced by a piecewise-constant density
(300 cells in log x between x = 2 and x = 10, heights in [0,1], mean about 0.50), plus 14 atoms at
x = 2 exactly (weight 0.6607; ζ has log 2 = 0.6931 there in this normalisation), 2.865, 2.880, 3.402,
4.496, 4.520, 5.169, 5.197, 6.237, 6.270, 7.326, 8.333, 9.529, 9.580; unmodified Lebesgue measure beyond
x = 10. The verifier checks ν̃ ≥ 0 and proves μ > 0 on [0, 2000] by 8437 mean-value steps
μ(t) ≥ μ(t_0) − h·sup|μ'| with μ' enclosed in 128-bit Arb balls, and on [2000,∞) by monotone majorants
(Ω increasing; the cell terms bounded by (¼+t²)^{-1/2}). Log lines: "MU FLOOR : mu(t) >= 0.000471949 for
all real t", "tail t >= 2000 : mu(t) >= 0.364522", run time 12 s. Then q_min ≤ e^{0.02} = 1.0202; and
since μ ≥ 4.71949·10^{-4} dt, weak duality gives κ*(𝒜_q) ≥ 4.71949·10^{-4}, hence
κ* ≥ 4.71949·10^{-4} − 0.02/2π ≥ −2.7112·10^{-3}, i.e. q_min ≤ e^{2π·2.7112·10^{-3}} < 1.017182; by
Prop. 2.10 admissible pairs exist for every q ≥ q_min. The certified object is not arithmetic: its zero
measure is a continuous density bounded below, its prime measure is mostly continuous with atoms at
non-integers. A consistency check of Lemma 5.9 in mpmath (residual ≤ 3.2·10^{-30}) is shipped and "not used
in any proof". In Lean the whole of Prop. 5.10's certificate (Lemma 5.9 included) is the axiom
`cert_lowerbound`.

## 4. Where it stops

In the paper's own words (§1.4, "the single place where the limits of the results are stated"):
- "Nothing here proves RH, (E), (S) or (U), and Conjecture U itself does not imply RH."
- "Only one side of criticality is certified. The inequality κ* ≥ 0, equivalently q_min ≤ 1, is (E); we know
  it only under RH, and unconditionally we know only κ* ≥ −2.7112·10^{-3}, that is, q_min < 1.017182. We
  never claim κ* = 0."
- The hypotheses of Theorem D "concern infinitely many J, or a limit in J, and are open."
- Uniqueness is proved only (a) μ on Z_ζ ∪ {0}, any ν; (b) μ on Z_ζ plus countably many summable extra
  points and ν on the BRS nodes; (c) μ purely atomic with integer weights, any ν. "Extra zeros, when some
  zero weight is not an integer, together with prime mass off ℳ or without summability, are open, and so is
  non-atomic extra zero mass."
- Remark 3.10: with extra zeros the method needs ν on the BRS nodes, "and this is where the method stops":
  an extra prime atom at η with e^{4πη} irrational "is invisible to the leading-order argument".
- §6.2: "no finite collection of [certificates] proves (S)"; "The exponent 1060 is a computational budget".
- Open problem 5: "The existence statement (E), that is κ* ≥ 0, without assuming RH: Odlyzko's question
  whether explicit-formula bounds proved under GRH hold unconditionally, specialised to ℚ."
- The exact end point, in the paper's logic: with Part I alone, RH ⇒ (E), and (E) ⇒ RH would need (U);
  with Part II's claims (unverified), RH ⇔ (E) ⇔ κ* ≥ 0 ⇔ q_min ≤ 1, and the unconditional knowledge about
  (E) is q_min < 1.017182. Part II's README: "we do not claim that either reformulation makes it easier."
- There is no mechanism in the paper for lowering 1.017182: Prop. 5.10 is one hand-optimised feasible point.
  Any admissible pair at q = 1 must have purely atomic μ if κ* = 0 (Thm 2.12), whereas every certified pair
  has μ ≥ c dt with c > 0; a pair of that kind exists at q exactly when q > q_min (Prop. 2.8, 2.10).

## 5. What it changes in our record

Idea #9 (bootstrap), claim by claim.
- **The framework is not the project's.** Idea #9 works with Weil's quadratic form on a window [-L, L], real
  (signed) weights m_n at the integers 2 ≤ n ≤ e^{2L}, and no zero-side unknown. Johns works with a linear
  programme on test functions analytic in a strip (no compact support, no window), positive measures on
  **both** sides, prime-side positions free in [log 2/2π, ∞). The KNOWLEDGE §7 entry "Overlaps the core of
  idea #9" is right for the question (which positive data solve the explicit formula with ζ's archimedean
  term) and imprecise for the object: nothing in the paper is a statement about the windowed Weil form.
- **Finite-window statements (weights and positions forced as each integer enters): not in the paper**
  (confirmed on the whole text, appendices and N3 included). No "positivity sieve", no interval for the
  weight at n given the earlier ones, no law in √n. The nearest statements:
  (i) Prop. 5.5: every admissible pair has ν-mass ≤ 6.81·10^{-19} on x ∈ [2.05, 2.95], an atom at x = 6 of
  mass ≤ 6.37·10^{-18}, at x = 2.5 of mass ≤ 1.53·10^{-21} (certified, unconditional, global pairs). Our
  e9 observation "zero at the composite 6 to 13 digits (L = 1 window, one-coordinate, uncertified)" has
  this as a certified global counterpart in a different setting; ours is weaker in rigour and in digits,
  theirs says nothing about a finite window or about signed weights.
  (ii) There is **no** two-sided pinning of the weights at the prime powers themselves in the paper (no
  statement "ν({ξ_2}) is within ε of log 2/√2"); only the pole weight is pinned two-sidedly (N3 Thm 4.1,
  r ∈ [1 − 5.6·10^{-40}, 1 + 7.9·10^{-21}]). Our intervals for n = 2..7 are not in the paper.
  (iii) Theorem 3.6: if the zero side sits on ζ's zeros, positivity forces the prime measure onto the
  integers with weights Λ(n)/√n exactly. Our e10 test (d) "positions are forced too: an atom is admissible
  only at x = 2.000" has this as its exact, global, conditional-on-the-zero-side form; the unconditional
  quantitative form is Prop. 5.5's window [2.05, 2.95].
  (iv) N3 Obs. 3.4 (computed, not certified): slack −0.0470 if the prime measure must start at x = 2.5.
  Our e10 statement "the Gamma factor and the pole alone require a first prime, and require it at 2" is
  the window form of that observation; neither is certified.
- **Idea #9's "new input", the prime-free dual inequality** ("if g is positive-definite and g(log n) ≥ 0 at
  every integer then A(g) ≥ 0"): the paper's Theorem 2.7 is the corresponding claimed theorem for
  the cone "F ≥ 0 on ℝ, F̂ ≥ 0 on all of [ξ_2, ∞)", F analytic in a strip, and its equivalence is with the
  existence of an admissible pair, not with RH. Our form (theory T48) differs twice: it tests only
  F = |f̂|² with f compactly supported (a smaller class), and asks g = F̂ ≥ 0 only at the logarithms of
  integers (a weaker hypothesis, hence more test functions of that shape). Neither statement formally
  contains the other; under RH both hold. T48 as worded is not in the paper. Part II's README claims the equivalence of RH with
  the inequality on the classical cone 𝒞_OPS (unverified).
- **"Existence of a feasible point is itself equivalent to RH once uniqueness is known"** (idea #9, wall
  field): this is Theorem 2.9(c) exactly: (U) ⇒ [RH ⇔ (E)].
- **The idea-#9 log line "The Johns preprint reports an unconditional proof of existence for conductor
  ≥ 1.0172; pushing that number toward 1 is a ladder of unconditional theorems ending at RH" is imprecise in
  two places.** (1) What is certified is one pair at q = e^{0.02} = 1.0202 with floor 4.7·10^{-4}; the number
  1.017182 follows by subtracting the floor (Prop. 2.10). (2) Reaching q_min ≤ 1 is (E); in Part I (E) ⇒ RH
  is **not** proved (it needs Conjecture U, claimed only in Part II, unverified). Also, a pair at q > q_min
  can always be taken with μ ≥ c dt, while at criticality μ must be purely atomic: the pairs along the
  "ladder" are of a different kind from ζ's.
- **"zeta is rigid because conductor 1 is the smallest conductor at which any solution exists" (log,
  HEURISTIC).** In the paper's setting this is: (S) ∧ (E) ⇔ q_min = 1, with Theorem 2.12 (criticality ⇔
  atomicity) as the paper's link between "edge of feasibility" and rigidity; unconditional part:
  1 − 8.98·10^{-1060} ≤ q_min < 1.017182. So what the log calls our reading is, in the
  paper's linear setting, its Theorem A(b) together with Theorem C (both claimed, unverified).
- **The conductor-5 case: not in the paper.** Our control is the conductor-5 **odd** archimedean term
  (Γ_ℝ(s+1), no pole; L(χ_5) and the Davenport–Heilbronn function). The paper and N3 treat only data with
  one simple pole: ζ with a conductor parameter, ℚ(√5) (Γ_ℝ², q = 5), ℚ(√−3), ℚ(i), and five further types
  numerically. Their verifier accepts Gamma shifts k_j ∈ {0,1}, but no pole-free datum is run. What does
  match: "the data of ℚ(√5) and ℚ(√−3) have strictly positive slack" and their admissible pairs are not
  unique: the same phenomenon as our "conductor 5 is in the interior, so there is room" (measured: feasible
  points 2.18 apart), for a different L-function and in the linear, not the quadratic, setting. Our
  statement about the convex hull of Re(χ)Λ and the impostor's coefficients is not in the paper.
- **Any control without an Euler product: none in the paper.** No Davenport–Heilbronn function, no Epstein
  zeta, no linear combination. Barrier B1/B2 tests are not run there. What the paper does contain on the
  Euler product: Theorem 3.11 never assumes one; it *constructs* a positive generalised Dirichlet series
  𝒵 = exp of the prime integral from positivity of ν, and uses integrality of the zero weights to make it
  meromorphic. And the unconditional pairs of Prop. 5.10/5.11 show that positive solutions without any
  arithmetic exist as soon as q > q_min.
- **The family F_d(s) = ζ(s−d)ζ(s+d) (barrier B11): not in the paper.** No shifted products, no data with
  two poles, no non-integer Gamma shifts.
- **Barrier B10 (Beurling systems).** Theorem 3.11 is a statement of exactly that type: among all positive
  prime measures on [log 2/2π, ∞) (no positions assumed), with ζ's Gamma factor, one pole, conductor 1 and
  integer-weight real zeros, only ζ's occurs. It supersedes N4's "characterisation of ζ among uniformly
  discrete Beurling systems". This does not contradict Diamond–Montgomery–Vorhauer (their systems do not
  have ζ's functional equation). Unverified by us; not in Lean.
- **Knowledge §7 row for Johns:** to be replaced. Corrections: title; version 1.4; κ* ≤ 1.4291572·10^{-1060}
  (the row says 1.43·10^{-1060}, fine); "existence unconditionally for q ≥ 1.0172" is right as a consequence
  (q_min < 1.017182); add Theorem 3.11, Prop. 5.5, the Part II claim, and "no window, no signed weights, no
  Euler-product-free control, no F_d, no pole-free conductor-5 datum".
- **Theory T1 (Weil criterion), T2.** Unchanged. The paper cites, for the windowed quadratic form, X. Zhu,
  "Weil positivity in compact windows: a finite reduction, certified two-sided bounds, and a Landau–Widom
  decay law", arXiv 2608.24827v2: "from the prime side of the explicit formula alone he shows that the
  normalised smallest eigenvalue for L = 2 is at most 3.2·10^{-283}" (as described by Johns; not read here).
  That is the certified literature counterpart of lane A's lowest-eigenvalue numerics and of e9's
  "+8.2·10^{-30} at L = 1". Also cited: Yoshida 1992 is "On Hermitian forms attached to zeta functions",
  Adv. Stud. Pure Math. 21, 281–325 (the reading list has a wrong title for it), with the statement
  "positive on test functions supported in [2^{-1/2}, 2^{1/2}] whose Fourier transform vanishes at ±i/2".
- **Ideas #10, #21, atlas F1–F3, r2_cubic:** nothing in the paper bears on Lorentzian certificates, the sign
  of the off-diagonal kernel, mirror (Hankel) positivity, or curvature. The zero-killing functions Ξ²H are
  an instance of atlas F1's "approximants with a property by construction" only in the loose sense that
  the limit J → ∞ is where the paper's Theorem D is open.

Addendum to part 5 (the theory and atlas files grew during this session; entries T7–T79 and F4–F25 were
read only at the end, and only those named here):
- **T17** (status open, "statement as paraphrased … not exact"). The exact statements are in part 2:
  (a) is Theorem 2.7 with Prop. 2.10; (b) is Theorems 3.6, 3.8, 3.11 and Prop. 3.5; (c) is Prop. 5.10 +
  Prop. 2.10: one certified pair at q = e^{0.02}, hence q_min < 1.017182 and pairs for all q ≥ q_min.
- **T43 / atlas F21 (Theorem U: under RH no summable atomic perturbation of the prime side keeps the form
  non-negative on ℝ)**, recorded as "presumed folklore; overlaps claims of the Johns preprint". The
  overlapping statement is Johns's **Proposition 3.2(b)**: for a difference Δ = (Δμ, Δν) of solutions with
  the paper's growth bounds and Δν carried by [ξ_2, ∞): "If 0 ∉ Z, Δμ ≥ 0 off Z and (Δν)_- is a finite
  measure, then Δ = 0", applied "under RH, with Z = Z_ζ". Differences: Johns needs the gap (Δν beyond
  log 2) and only the negative part of Δν finite (its positive part may be any measure, diffuse included);
  T43 needs no gap and atoms anywhere, but the whole of D summable and atomic. So, for atoms at positions
  ≥ log 2, T43 is a special case of Prop. 3.2(b), once positivity of the quadratic form on C_c^∞ is
  translated into "the zero side is a positive measure" (that translation is this seat's, by Bochner's
  theorem; it is not in the paper and was not written out); for atoms below log 2, T43 is not covered.
  T43's remark that "atomic", "no atom at 0" and "summable" are each essential has its counterpart in
  Johns's Proposition 3.3 (Poisson-summation examples with infinite mass, one of them with 0 in the
  exceptional set). Like T43, Prop. 3.2 uses RH and nothing arithmetic.
- **T44** (on one window the feasible set has interior), **T47** (the L = 1 intervals): no counterpart in
  the paper, which has no window. **T48**: see the corrected item above.
- **F21 "needs"** quotes "kappa* >= 0 in Johns's preprint (claims, UNVERIFIED: existence for conductor
  q >= 1.0172)": exact form as under T17; and κ* ≥ 0 gives existence of a pair, from which RH follows only
  with uniqueness (Conjecture U; Part II's claim).

## 6. Reliability

- Unreviewed; machine-written by its own statement. README: "The mathematics, the proofs, the numerical
  certificate scripts and the text were produced by AI agents"; "**No human mathematician has yet checked
  the proofs line by line.**" The author "did not independently check every step of the written proofs".
- What the README says has been done: AI "hostile referee" rounds; a re-run of every certificate by a second
  AI system; a Lean 4 "logical spine" with no `sorry`, **22 axioms**: 3 classical (the explicit formula on
  𝒯, ζ < 0 on (0,1), decay of Ξ), 10 "analytic steps proved in the paper, not yet formalised" (among them
  duality (ii)⇒(i), Theorem 2.9(b), Theorem 2.12(a), Theorem 3.6, Lemma 3.7 with Lemmas B.3–B.4, Lemma 4.7),
  and 9 certificate outputs. So Lean checks the *assembly* of the headline theorems from those steps; none
  of the hard analysis and none of the numerics is machine-checked by Lean. 37 of 57 numbered statements are
  formalised, 29 proved; Theorem 3.11 and Corollary 3.12 are not formalised at all.
- Certificates: each has a verifier, pinned input and log; a second evaluation path exists for the exact
  members. This seat did not run or read the verifiers. The Lean README notes a caveat it found itself:
  uniqueness of the BRS basis "[BRS, Corollary 1.1] needs H_1, which 𝒯-decay does not give", and that
  uniform decay of the basis on closed strips is "the paper's reading of [BRS §4.3]".
- The paper cites other AI-generated, non-peer-reviewed preprints (a claimed zero-free half-plane Re s > 7/8;
  a planar Cohn–Elkies certificate) and says it uses neither for its results.
- Part II (claimed proofs of U and S) is in the same state: AI-produced, not human-checked, existence of
  its magic function an axiom in its Lean spine.
- Status of everything taken from this paper: claimed, unverified (no human check, no independent
  reproduction by us).
