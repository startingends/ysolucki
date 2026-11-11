BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project (owner rule 10).

# N. Johns, "Positive solutions of the explicit formula for ζ(s): near-criticality and uniqueness" (Part I, v1.4, October 2026)

Digest by READER-2, 2026-11-11. **Unreviewed, AI-produced preprint.** Its README: "No human mathematician has
yet checked the proofs line by line." Therefore EVERY statement below is **claimed, unverified**; where a claim
ships with a certificate one could re-run, that is said. This seat re-ran nothing and checked no proof.
A second, independent note on the same paper exists: `rh/library/johns-positive-solutions.md` (seat R-read-2);
the two readings were made separately and agree on every statement and number I compared (theorem numbers,
the table of κ_J, Prop. 5.5's windows, the N3 brackets). Where this digest adds something it says so.

## 1. What was read (characters read / total)
- Source: TeX fetched with curl from `raw.githubusercontent.com/nic410/zeta-positive-solutions/main/`, kept
  in `rh/data/papers/johns/` (byte-identical to the clone under `rh/library/src/johns/repo/`).
- `paper/sections/` 01-intro, 02-setting, 03-uniqueness, 04-family, 05-certified, 06-conjectures,
  A-certification, B-proofs, C-anc: **213 667 / 213 667 characters**. `paper/main.tex` (abstract, v1.4 note,
  AI-use statement) 7 149 / 7 149; `macros.tex` 3 038 / 3 038; repository `README.md` 19 998 / 19 998.
- Companion note on other Gamma factors, cited as [N3]: `supplementary/notes/critical-conductors/main.tex`,
  "Critical conductors of small archimedean data", **39 795 / 39 795**. `supplementary/README.md` 7 083 / 7 083.
- NOT read: companion manuscript [N1] (Hermite interpolation, about 60 pp), notes [N2] (extra prime atoms) and
  [N4] (integer weights; the paper says Theorem 3.11 supersedes it), `paper/anc/` (scripts, logs, Lean files),
  `refs.bib`. **Part II** ("Sharpness and uniqueness…", github nic410/zeta-sharpness-uniqueness): only its
  README (11 282 characters) was read; the paper itself is unread.
- Title on the paper differs from the one in our record ("Positive solutions of Weil's explicit formula").
- Theorem numbers are computed from the TeX (one counter per section) and agree with the README's citations.

## 2. Main statements (all "claimed, unverified")
Conventions: F̂(ξ) = ∫F(t)e^{−2πiξt}dt, ξ_n = log n/2π, x = e^{2πξ}. Test class 𝒯: even F, real on ℝ, analytic
near |Im z| ≤ 1/2+δ, (1+|z|)²|F| bounded. 𝒜(F) = F(i/2)+F(−i/2)+∫F·Ω_∞, Ω_∞(t) = (1/2π)(Re ψ(1/4+it/2) − log π)
(Gamma factor and pole only). **Admissible pair**: positive measures μ (even, on ℝ) and ν (on [ξ_2,∞)) with
𝒜(F) = ∫F dμ + (1/π)∫F̂ dν for all F ∈ 𝒯. 𝒦 = set of admissible pairs; p_ζ = (real zero ordinates with
multiplicity, Σ Λ(n)n^{−1/2}δ_{ξ_n}). Cone 𝒞 = {F ≥ 0 on ℝ, F̂ ≥ 0 on [ξ_2,∞)}; classical cone 𝒞_OPS = {F ≥ 0,
F̂ ≥ 0 on ℝ}. Slack κ* = inf{𝒜(F): F ∈ 𝒞, ∫F = 1}; q_min = e^{−2πκ*}. (E): 𝒦 ≠ ∅. (U): 𝒦 ⊆ {p_ζ}. (S): κ* ≤ 0.
𝒜_q = 𝒜 + (log q/2π)∫F ("conductor q").

Written proofs in the paper (no certificate; the Lean files take most of these as axioms, per the README):
- **Thm 2.7 (duality).** (i) 𝒦 ≠ ∅ ⇔ (ii) 𝒜 ≥ 0 on 𝒞 ⇔ (iii) 𝒜 ≥ 0 on 𝒞 ∩ Gaussian wave packets ⇔ (iv) κ* ≥ 0;
  𝒦 is convex and vaguely compact. "a positivity statement that mentions no primes and no zeros."
- **Lemma 2.6.** Every admissible pair has μ([T−1,T+1]) ≤ C log(3+|T|), ν([X−1,X+1]) ≤ Ce^{πX}.
- **Prop. 2.8.** κ* ≥ −1.3231 elementarily; κ* is the largest λ with a pair having μ ≥ λ dt.
- **Thm 2.9 (logic).** (a) RH ⇒ p_ζ ∈ 𝒦. (b) "(μ, ν_ζ) ∈ 𝒦 for some μ" ⇒ RH and μ = μ_ζ. (c) (U) ⇔ [(E) ⇒ RH] ∧
  [RH ⇒ 𝒦 = {p_ζ}]. (d) (U) ⇒ (S). (U) alone does not imply RH.
- **Prop. 2.10.** κ*(𝒜_q) = κ* + log q/2π; 𝒦(𝒜_q) ≠ ∅ ⇔ q ≥ q_min.
- **Thm 2.12 (criticality = atomicity).** Under (E): κ* = 0 ⇔ every admissible μ is purely atomic ⇔ one
  discrete set (the real zero set of a "weak magic function") carries every admissible μ.
- **Lemma 2.13 (complementary slackness).** F ∈ 𝒞 with 𝒜(F) = 0 ⇒ every admissible μ sits on the real zeros
  of F and every admissible ν on the zeros of F̂ in [ξ_2,∞).
- **Lemma 3.1, Prop. 3.2, Prop. 3.3 ("Why arithmetic is needed").** Two admissible pairs have μ̂_1 = μ̂_2 on
  (−ξ_2, ξ_2). Soft rigidity under one-sided sign conditions; Poisson-summation examples show that "the sign
  and gap conditions … taken alone, do not force homogeneous rigidity" (the examples are not shown to be
  differences of admissible pairs for ζ's data).
- **Prop. 3.5.** μ on Z_ζ and ν on ℳ = {log m/4π} ⇒ RH and (μ,ν) = p_ζ; "essentially the observation made
  in [BRS §4.4]". Records two claimed slips in BRS §4.4 (value at squares; 2 versus 2m(ρ)).
- **Thm 3.6 (zero-side support).** "Let (μ,ν) ∈ 𝒦, and assume that μ is carried by Z_ζ ∪ {0}. Then RH holds
  and (μ,ν) = p_ζ." No hypothesis on ν. Credited to OpenAI's "Astra".
- **Thm 3.8 (countably many extra zeros).** μ on Z_ζ ∪ E (E countable, symmetric), ν on ℳ, ν ≥ 0 only needed
  at nodes m ≡ 2 (mod 3), μ({0}) ≥ 0, and Σ_{e>0}|μ({e})||ζ(1/2+ie)|(1+e)^{−1/2} < ∞ ⇒ RH and the pair is p_ζ.
- **Cor. 3.9 (magic-function principle).** F ∈ 𝒞, 𝒜(F) = 0, real zeros of F inside Z_ζ ∪ {0} ⇒ (U).
- **Thm 3.11 (integer weights).** "Let q > 0 and (μ,ν) ∈ 𝒦(𝒜_q), and assume that μ is purely atomic with
  μ({γ}) ∈ ℤ … Then q ≥ 1. If q = 1, then RH holds and (μ,ν) = p_ζ." Any positive ν allowed.
  **Cor. 3.12:** (S) ⇔ every admissible μ purely atomic; (U) ⇔ purely atomic with integer weights.
- **Prop. 4.2, Cor. 4.4.** (Ξ²)^(ξ) = 2π√x Σ_N d(N)W_0(2πNx), W_0(z) = z²[(z²+9)K_0(z) − 6zK_1(z)] (a
  differentiated Koshliakov formula); it is positive. For F = Ξ²H: 𝒜(F) = (1/π)Σ_{prime powers}Λ(n)n^{−1/2}F̂(ξ_n),
  "No hypothesis on the zeros of ζ is used" (Ξ vanishes at every zero, on or off the line).
- **Thm 4.8 (Theorem D), conditional.** If the Hermite family F_J = Ξ²P_J(t²) (F̂_J with double zeros at the
  first J prime powers) satisfies (N), (G_a), (Z_∞), (Mg) then (S), (U) hold and RH ⇔ (E). Hypotheses open.

Computer-assisted (**certificate shipped and re-runnable**: Python ≥ 3.10, python-flint 0.9.0; inputs pinned
by SHA-256; logs of runs; stated CPU time 41.6 + 52.0 + 29.1 + 205.6 minutes for the four batches):
- **Thm 5.1.** "κ* ≤ κ*_OPS ≤ 1.4291572·10^{−1060}" (member J = 111; ladder J = 10, 60, 61, 110, 111:
  1.51·10^{−19}, 1.06·10^{−417}, 2.33·10^{−442}, 2.00·10^{−1042}, 1.43·10^{−1060}). **Cor. 5.2:** no admissible pair
  for q ≤ 1 − 8.98·10^{−1060}. **Cor. 5.3:** every admissible pair has ∫Ξ²dμ ≤ 3.99·10^{−1060}.
- **Prop. 5.4.** With no arithmetic input (Gaussian–Laguerre, K = 128): κ*_OPS ≤ 9.9462·10^{−41}.
- **Prop. 5.5 (low-height rigidity of every admissible pair, RH or not).** μ of the gaps between the first
  six zero ordinates (shrunk by 0.1): ≤ 2.75·10^{−17}, 1.91·10^{−16}, 4.81·10^{−15}, 2.28·10^{−14}, 2.39·10^{−13};
  ν of x ∈ [2.05,2.95] ≤ 6.81·10^{−19}; [5.05,6.95] ≤ 6.94·10^{−14}; [7.05,7.95] ≤ 2.72·10^{−12}; [10.05,10.95]
  ≤ 5.95·10^{−10}; [12.05,12.95] ≤ 3.80·10^{−8}; [14,15] ≤ 1.82·10^{−8}; atom at x = 2.5 ≤ 1.53·10^{−21}; atom at
  x = 6 ≤ 6.37·10^{−18}.
- **Prop. 5.6, 5.7.** For J ∈ {10,60,61,110,111}: Hermite system non-singular, all coefficients of P_J
  positive, F_J ∈ 𝒞_OPS with exact double zeros of F̂_J at the nodes.
- **Prop. 5.10.** At q = e^{0.02} an explicit admissible pair with μ ≥ 4.71949·10^{−4} dt; hence
  κ* ≥ −2.7112·10^{−3}, i.e. q_min < 1.017182. (Lemma 5.9: a positive ν̃ on [2,∞) gives the zero density
  μ(t) = Ω(t) + log q/2π − (1/π)Re ℒ(1/2+it), ℒ(s) = ∫x^{−s}dν̃; admissible ⇔ μ ≥ 0.)
- **Prop. 5.11.** Data of ℚ(√5) (Γ_ℝ², q = 5): 1.64·10^{−5} ≤ κ*_g ≤ 4.83·10^{−4} for every gap g ≤ ξ_{4.04915};
  ℚ(√−3) (Γ_ℂ, q = 3): 1.50·10^{−4} ≤ κ*_g ≤ 9.99·10^{−4} for g ≤ ξ_{3.011664}. So more than one admissible pair.
- **Note N3.** Thm 3.1: critical conductor of Γ_ℝ² in [4.98485094226764, 4.9994844]; Prop. 3.2: of Γ_ℂ in
  [2.981236704765, 2.997174]; Prop. 3.7: a pair for ℚ(i) with μ ≥ 0.0217 dt; **Thm 4.1 (pole weight pinned):**
  with the pole term multiplied by r, no admissible pair if r < 1 − 5.5794·10^{−40} or r > 1 + 7.8550942·10^{−21}.

Computed, NOT certified (the papers label them "Numerical observation"): Obs. 5.8 (family for J ≤ 110);
N3 Obs. 3.4 (for ζ's data the slack is constant for gaps ≤ ξ_2 and is −0.0470 if the prime measure must start
at x = 2.5, −0.0793 at x = 3); N3 Obs. 5.1 (critical conductor / minimal discriminant: 2.981/3, 4.985/5,
22.6/23, 48.2/49, 114.7/117, 267.8/275, 694.6/725); N3 Obs. 5.2 (near-critical objects for Γ_ℝ² have prime
atoms at non-integers 4.3201, 9.215, 14.41: "this reading is heuristic").

## 3. The method in ten lines
1. Pointwise positivity on both sides (F ≥ 0, F̂ ≥ 0 beyond the gap) replaces Weil's quadratic positivity: a
   conic linear programme whose primal unknowns are the two measures.
2. No duality gap: Carathéodory in finite-dimensional slices, a priori mass bounds, Helly selection.
3. The conductor is a multiple of Lebesgue measure on the zero side, so the optimum is a critical conductor.
4. Upper bounds for κ*: one test function in the cone (weak duality). The sharp ones are Ξ²·P_J(t²): the zero
   side vanishes identically, Hermite interpolation kills the first J prime powers, the rest is ≈ e^{−2πn_{J+1}}.
5. Cone membership is certified in Arb ball arithmetic through a Bessel-series form of (Ξ²)^.
6. Lower bounds for κ*: explicit feasible pairs in Herglotz form (prime measure chosen, zero density forced).
7. Uniqueness near ζ's support: the Bondarenko–Radchenko–Seip interpolation basis as test functions.
8. Thm 3.6: Radchenko–Viazovska interpolation + positivity of ν + sin²(πt)/(π²(t²−1)), which vanishes exactly
   at the integers, forces ν onto the integers; Möbius inversion gives Λ(m)m^{−1/2}.
9. Thm 3.8: Fourier coefficients of BRS's modular integrals in the class N ≡ 2 (mod 3), three cusps of the
   theta group, mean values of an almost periodic function.
10. Thm 3.11: exponentiate ν to a positive generalised Dirichlet series; integrality makes it meromorphic
    with Riemann's functional equation; Fejér kernel gives q ≥ 1; at q = 1 Hamburger's theorem gives ζ.

## 4. What is assumed
- No hypothesis on the zeros anywhere in the unconditional statements. Arithmetic input: the explicit formula
  on 𝒯, N(T) = O(T log T), the BRS theorem (arXiv 2005.02996, Thm 1.1) and Radchenko–Viazovska interpolation,
  Hamburger's theorem, Pólya's positivity of Φ.
- Structural assumptions that matter when comparing with other settings: both measures are **positive**; the
  prime measure has a gap below log 2/2π; test functions are analytic in a strip (no compact support, so no
  window); the archimedean data are ζ's (Γ_ℝ, one simple pole, with q as a parameter).
- The certificates assume the correctness of FLINT/Arb and of the shipped scripts (unaudited by us).

## 5. Where its frontier is
- **Last thing it claims to prove:** unconditionally 1 − 8.98·10^{−1060} ≤ q_min < 1.017182; uniqueness of the
  admissible pair when the zero side is on Z_ζ ∪ {0} (Thm 3.6), or atomic with integer weights (Thm 3.11), or on
  Z_ζ plus summable extra points with primes on the BRS nodes (Thm 3.8).
- **First thing it cannot:** (E), i.e. κ* ≥ 0, i.e. q_min ≤ 1: "we know it only under RH". Also (S) and (U):
  "Nothing here proves RH, (E), (S) or (U)"; "no finite collection of [certificates] proves (S)"; "The exponent
  1060 is a computational budget". Theorem D's hypotheses "concern infinitely many J, or a limit in J, and
  are open".
- Remark 3.10: with extra zeros the method needs ν on the BRS nodes "and this is where the method stops"; an
  extra prime atom at x with x² irrational "is invisible to the leading-order argument".
- **Part II (README only read, unverified, AI-produced):** claims (S) and (U) through an explicit F = Ξ²H with
  F ≥ 0, F̂ ≥ 0, F̂ vanishing at log n/2π for all n ≥ 2, 𝒜(F) = 0; then RH ⇔ (E) ⇔ κ*_OPS = 0, and states "we do
  not claim that either reformulation makes it easier". Its Lean spine takes the existence of that F as an axiom.
  If Part II holds, the whole remaining content is (E).

## 6. What it explicitly does not do
- Does not prove RH, (E), (S), (U), or κ* = 0 (§1.4). Certifies only one side of criticality.
- No statement about Weil's quadratic form, a finite window, or signed weights (§1.5: "our cone 𝒞 is defined
  instead by pointwise positivity of F and F̂, and the problem is a linear programme").
- No L-function without Euler product, no Davenport–Heilbronn or Epstein control, no shifted product
  ζ(s−d)ζ(s+d), no pole-free (Dirichlet-character) archimedean data. N3 treats only types Γ_ℝ^aΓ_ℂ^b with one
  simple pole; the comparison with ℚ(√5), ℚ(√−3) "is not a statement about L-functions in general".
- Convergence of the family F_J is "neither assumed nor proved".

## 7. Facts in our record that this paper corrects or shows to be already known
(Reader's remark, used below, one line of algebra, not checked by a second seat: for F = |f̂|² with f supported
in a window, an admissible pair gives 𝒜(F) − (1/π)∫F̂dν = ∫F dμ ≥ 0. So the prime side of every admissible pair
is a feasible point of idea #9's windowed problem on EVERY window; Johns's set 𝒦 is what the nested
window-feasible sets, restricted to non-negative weights, shrink to. The paper does not say this.)
- **docs/KNOWLEDGE.md §7, Johns row.** Title is wrong there; sections 4–6, appendices and N3 are now read.
  "existence unconditionally for q ≥ 1.0172": the certified object is ONE pair at q = e^{0.02} = 1.0202 with
  μ ≥ 4.7·10^{−4}dt; 1.017182 follows by Prop. 2.10. Missing from the row: Thm 3.11, Prop. 5.5, N3 Thm 4.1,
  and the v1.4 note that U and S are claimed in Part II.
- **docs/IDEAS.md #9, novelty field** ("Unread: sections 4–6, appendices, companion notes"): after the whole
  text, still NOT in the paper: any finite-window statement, any interval for a weight at n given the earlier
  ones, the exp(−8√n) law, signed weights, a Davenport–Heilbronn control, the conductor-5 odd datum.
- **#9 log, "positivity pins … ZERO at the composite 6 to 13 digits" (e9, L = 1, one coordinate, uncertified):**
  the global counterpart exists with a certificate: Prop. 5.5, every admissible pair has an atom at x = 6 of
  ν-mass ≤ 6.37·10^{−18} and ν([2.05,2.95]) ≤ 6.81·10^{−19}. Different setting (all windows at once, ν ≥ 0, joint
  not one-coordinate). No two-sided pin of the weights AT the prime powers is in the paper; the only two-sided
  pin is the pole weight (N3 Thm 4.1).
- **#9 log, "POSITIONS are forced too" (e10 test d) and KNOWLEDGE B11's split positions / completeness /
  weights:** Thm 3.6 claims all three are forced at once, exactly, once the zero side sits on ζ's zeros:
  ν must live on the integers with weights Λ(m)/√m. Unconditional quantitative form: Prop. 5.5's windows.
- **#9 log, "with no atom at all the form is negative from about L = 0.362 … require a first prime … at 2":**
  N3 Obs. 3.4 (computed, not certified) is the linear-programme form: slack −0.0470 when the prime measure
  must start at 2.5. Neither side is certified.
- **#9 wall field, "existence of a feasible point is itself equivalent to RH once uniqueness is known":** this
  is Thm 2.9(c). **#9 "new input", the prime-free dual inequality:** Thm 2.7 is that statement for the cone
  F̂ ≥ 0 on all of [ξ_2,∞) (the record's version asks F̂ ≥ 0 only at the integers; that version is not in the paper).
- **#9 log, "zeta is rigid because conductor 1 is the smallest conductor at which any solution exists"
  (HEURISTIC) and "pushing that number toward 1 is a ladder of unconditional theorems ending at RH":** the
  first is Thm 2.12 + Thm 5.1 in the paper's setting (edge of feasibility ⇔ atomic zero measures). On the
  second: q_min ≤ 1 is (E); (E) ⇒ RH is not in Part I (it needs (U), claimed only in Part II). And Thm 2.12 says
  the pairs at q > q_min can have μ ≥ c dt while at criticality μ must be purely atomic.
- **#9 log, "for conductor 5 the feasible set … is not thin" / "Conductor 5 is in the interior":** the paper's
  conductor-5 datum is a different one (ℚ(√5): Γ_ℝ², one pole), not the record's odd character mod 5. For it
  the claim is quantitative: 5 exceeds the critical conductor by a factor between 1 + 1.0·10^{−4} and
  1 + 3.1·10^{−3} (Remark 5.12); admissible pairs are not unique there.
- **KNOWLEDGE B10 (Beurling systems):** Thm 3.11 is a claimed characterisation of ζ among ALL positive prime
  measures beyond log 2 (no positions assumed) given Γ_ℝ, one pole, q = 1 and integer zero multiplicities.
  Not in conflict with Diamond–Montgomery–Vorhauer (their systems lack this functional equation).
- **KNOWLEDGE B11 (F_d = ζ(s−d)ζ(s+d)):** not a competitor inside this framework: its archimedean functional
  (shifted Gamma factors, poles at 1 ± d) is not 𝒜. The paper has nothing on it.
- **IDEAS #2 / #8 / #16 (lowest eigenvalue on a window):** the paper cites X. Zhu, arXiv 2608.24827: "from the
  prime side of the explicit formula alone he shows that the normalised smallest eigenvalue for L = 2 is at
  most 3.2·10^{−283}" (Johns's description; a PDF is at `rh/library/src/2608.24827/`, not read by this seat).
- **IDEAS #10, #11, #21:** nothing in the paper on Lorentzian signature, the sign of the off-diagonal kernel,
  Dirichlet forms, or mirror (Hankel) positivity.

## 8. Open questions the paper itself states
- Conjectures U and S (v1.4 footnotes: "Proved in Part II"); Conjecture 6.1 (the family F_J has all
  coefficients positive for J ≥ 10, a uniform type a* < π/2, and a limit with F̂_∞ ≥ 0 beyond the gap).
- §6.3: (1) (U) for zero measures with a non-integer atom or a non-atomic part; (2) extra prime mass off the
  BRS nodes together with extra zeros; (3) infinitely many extra zeros without summability; (4) strict
  complementarity: "Does (U) imply the existence of an exact magic function without spurious zeros?";
  (5) "The existence statement (E), that is κ* ≥ 0, without assuming RH: Odlyzko's question whether
  explicit-formula bounds proved under GRH hold unconditionally, specialised to ℚ."
- N3 Question 6.1: is the set of admissible pairs at the critical conductor a single pair, for other Gamma
  factors? ("open even numerically").
