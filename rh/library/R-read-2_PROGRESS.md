# R-read-2 progress (reader seat, 2026-11-11)

Job: read whole papers from the source, write one note per paper under `rh/library/`, no recommendations.

| # | source | how much was read | note |
|---|---|---|---|
| 1 | N. Johns, "Positive solutions of the explicit formula for ζ(s): near-criticality and uniqueness" (GitHub nic410/zeta-positive-solutions, v1.4, commit abc9202) | In full: README, main.tex, all of paper/sections (1–6, appendices A, B, C), the Lean README, the companion note "Critical conductors of small archimedean data" (other Gamma factors), the log and parameter structure of the lower-bound certificate. Tables only: Lean LEDGER/STATUS. Not read: verifier scripts, companion manuscript on Hermite interpolation, notes on extra primes and on integer weights, Part II (README only) | `johns-positive-solutions.md` |
| 2 | Bondarenko–Radchenko–Seip, arXiv 2005.02996 | In full (TeX, 2711 lines) | `brs-fourier-interpolation.md` |
| 3 | Rodgers–Tao, arXiv 1801.05914 | In full (TeX, 1695 lines) | `rodgers-tao-newman.md` |
| 4 | Brändén–Huh, arXiv 1902.03719 | In full: §1, §2 (all four subsections), §3.1, §4.1, §4.2. Statements only: §3.2, §3.3, §4.3–4.5 | `branden-huh-lorentzian.md` |
| 5 | Miller, arXiv math/0112196 | In full (TeX, 1798 lines); the 16 figure files (EPS plots, part of the proofs) not viewed | `miller-highest-lowest-zero.md` |
| 6 | Perfekt–Pushnitski, arXiv 1611.03772 (identifier found and checked by title) | In full: §1–§6 and Appendix A. Not read: §7 (proof of the finite-rank theorem) | `perfekt-pushnitski-helson.md` |

Sources are under `rh/library/src/` (johns/repo, johns-part2, 2005.02996, 1801.05914, 1902.03719,
math_0112196, 1611.03772). Nothing from them was executed; no certificate was re-run; no proof was checked
line by line. The reading-list table in `rh/library/README.md` was not edited by this seat (statuses for
these six rows are the ones in the table above).

Coordination facts:
- Another reader seat (READER-2) worked in the same folder at the same time and wrote independent digests of
  two of these sources under other file names: `johns-2026-part1.md` (whole paper + N3) and `1611.03772.md`
  (whole paper), and a partial one `2005.02996.md` (sections 1–3 of Bondarenko–Radchenko–Seip). Its memory
  file says the two Johns readings agree on every statement and number it compared. Nothing was overwritten.
- `rh/THEORY.md` and `rh/ATLAS.md` grew during the session (T7–T79, F4–F25). Part 5 of each note was first
  written against T1–T6 and F1–F3; an addendum in each note covers the later entries that bear on the
  source (T17, T18, T19, T22, T43, T44, T47, T48, T51–T53, T71, T76, T77; F2, F14, F20, F21, F22). Other new
  entries were not read.

Bibliographic facts picked up on the way (for the reading list):
- Yoshida 1992 is H. Yoshida, "On Hermitian forms attached to zeta functions", Adv. Stud. Pure Math. 21
  (Zeta Functions in Geometry), 281–325 (from Johns's bibliography; the README row has another title).
- Connes–Consani "Weil positivity and trace formula, the archimedean place" is arXiv 2006.13771 (Selecta
  2021) in Johns's bibliography; the README row gives 2106.01715 for the pair of papers.
- X. Zhu, "Weil positivity in compact windows: a finite reduction, certified two-sided bounds, and a
  Landau–Widom decay law", arXiv 2608.24827v2: cited by Johns for certified bounds on the smallest
  eigenvalue of the window form (L = 2: at most 3.2·10^{-283}, as described by Johns). Not on the list.
- Part II of Johns: github.com/nic410/zeta-sharpness-uniqueness (claims proofs of his Conjectures S and U).

## For FRONTIER.md

Facts only, from the six notes. "Unconditional" means no hypothesis on zeros.

### Positive solutions of the explicit formula; conductor threshold (Johns Part I and note N3; Miller)
- Setting: pairs (μ ≥ 0 on the zero side, ν ≥ 0 on the prime side beyond log 2/2π) solving Weil's formula
  with ζ's Gamma factor and pole, on test functions analytic in a strip. This is a linear programme with
  pointwise positivity, not the windowed Weil quadratic form.
- Classical and proved (Stark, Odlyzko, Serre, Poitou; Miller 2002): with a test function supported in
  [−log 2, log 2] and non-negative on the critical strip the explicit formula involves no primes and
  bounds the conductor from below, or excludes the L-function. Miller, unconditional in an either/or
  sense, with numerical (uncertified) proofs: every cuspidal L-function of GL_n/ℚ with real archimedean
  type has a zero on the line below height 14.13472 or a zero off the line in an effective box.
- Claimed in Johns Part I, with written proofs, AI-produced, **not checked by any human** (Lean checks only
  the assembly from 22 axioms): existence of a pair ⇔ a prime-free, zero-free inequality κ* ≥ 0 (duality,
  Thm 2.7); a pair exists at conductor q ⇔ q ≥ q_min = e^{-2πκ*} (Prop. 2.10); at criticality every
  admissible zero measure is purely atomic (Thm 2.12); if the zero measure sits on ζ's zeros, positivity
  forces the prime measure to be exactly von Mangoldt on the integers, and RH (Thm 3.6); if the zero
  measure has integer weights then q ≥ 1 and at q = 1 the pair is ζ's and RH holds (Thm 3.11).
- Claimed, computer-assisted (verifiers shipped, not re-run by us): 1 − 8.98·10^{-1060} ≤ q_min < 1.017182
  unconditionally; ∫Ξ²dμ ≤ 3.99·10^{-1060} for every admissible pair; every admissible pair has prime-side
  mass ≤ 6.81·10^{-19} on x ∈ [2.05, 2.95] and an atom at x = 6 of mass ≤ 6.37·10^{-18}; the pole weight is
  pinned to [1 − 5.6·10^{-40}, 1 + 7.9·10^{-21}] (note N3); ℚ(√5) and ℚ(√−3) data are not critical.
- How the upper end 1.017182 is obtained: one explicit pair at q = e^{0.02} (Lebesgue measure on [2,∞)
  with a piecewise-constant correction on [2,10] and 14 atoms; zero density given in closed form and
  certified ≥ 4.71949·10^{-4} on ℝ), then subtract the floor.
- Claimed in Part II (README read only; unverified; existence of its magic function is an axiom of its
  Lean spine): κ* ≤ 0 and uniqueness, hence RH ⇔ existence of a pair ⇔ κ* ≥ 0 ⇔ q_min ≤ 1.
- Where it stops: the existence statement at q = 1, "κ* ≥ 0 without assuming RH" (Johns, open problem 5).
  Unconditionally known: κ* ≥ −2.7112·10^{-3}. All certified pairs have a continuous zero density bounded
  below; at criticality the zero measure must be atomic. Not in these sources: finite windows, signed
  weights, the weight or position of each integer as it enters a window, any function without Euler
  product, the family ζ(s−d)ζ(s+d), pole-free data such as an odd character mod 5.

### Fourier interpolation with zeros (Bondarenko–Radchenko–Seip)
- Proved, unconditional, refereed: there is a basis {U_n, V_{ρ,j}} with f = Σ f̂(log n/4π)U_n + Σ f^{(j)}(zeros)
  V_{ρ,j} for even f analytic and integrable in a strip of half-width > 1/2; U_n vanishes at all zeros,
  V_{ρ,j} has transform vanishing at all nodes log n/4π; removing any one node or zero destroys uniqueness.
  The Weil functional has coordinates π^{-1}Λ(√n)n^{-1/4} and 2m(ρ) in this basis (§4.4, after correcting
  two misprints). Analogues for primitive Dirichlet characters; sketched for imaginary quadratic fields,
  Hecke newforms, Dirichlet series without Euler product and linear combinations of L-functions.
- Also there: dim M_k(Γ_θ, +) = 1 + ⌊k/4⌋ for real k ≥ 0 (Prop. 3.1, citing Berndt–Knopp).
- Where it stops: "It would be interesting to know whether these curious properties of the basis functions
  could be obtained without resorting to the Riemann–Weil formula." The theorem holds for any zero
  multiset; the Euler product is used in one lemma only (a bound for 1/ζ on horizontal segments).

### Heat flow, de Bruijn–Newman (Rodgers–Tao)
- Proved, unconditional, refereed, with an independent second proof (Dobner): Λ ≥ 0.
- Under the assumption Λ < 0 (now known false) and for Λ < t ≤ 0: zeros of H_t are real and simple and obey
  ∂_t x_k = 2Σ' 1/(x_k − x_j) (Csordas–Smith–Varga); formally ∂_tℋ = −4E and ∂_tE ≤ 0 for
  ℋ = Σ log 1/|x_j − x_k|, E = Σ |x_j − x_k|^{-2}; exact finite-window versions carry cross terms (Lemma 12).
- Where it stops: the method yields a contradiction from Λ < 0 only; it gives no information towards
  Λ ≤ 0, no statement for t > 0, none about non-real zeros. Upper bound quoted there: Λ ≤ 0.22 (Polymath).

### Lorentzian polynomials (Brändén–Huh)
- Proved, refereed: a homogeneous polynomial with nonnegative coefficients is Lorentzian iff its support is
  M-convex and all (d−2)-fold derivatives are quadratic forms with at most one positive eigenvalue
  (Thm 2.25); then its Hessian has exactly one positive eigenvalue at every point of the open positive
  orthant (Thm 2.16). The support condition is necessary (w_1³ + w_2³). The class is closed under
  nonnegative linear substitutions, nonnegative directional derivatives, products, and operators with
  Lorentzian symbol. Volume polynomials of convex bodies and of nef divisors are Lorentzian; not conversely.
- Proof mechanism: homotopy to stable polynomials plus non-degeneracy of the Hessian along the path
  (ker ℋ_f = ∩ ker ℋ_{∂_if}, Lemma 2.15); not a slice-by-slice eigenvalue argument.
- Where it stops: nonnegative coefficients (so nonnegative diagonal) are part of the definition; finite
  number of variables; the Hodge–Riemann analogy is in degree ≤ 1.

### Helson matrices / mirror positivity (Perfekt–Pushnitski)
- Proved (stated there as essentially known, from Berezanskii, Berg–Christensen–Ressel, Samoilenko): for
  α(n) = O(n^a), the matrix {α(nm)}_{n,m≥1} is non-negative iff α is a positive mixture of real completely
  multiplicative functions (moments of a unique measure on ℝ^∞); the shifted matrices are also
  non-negative iff the measure sits on [0,∞)^∞ (Thm 3.3).
- Proved there: for α(n) = ∫n^{-s}dν(s), boundedness on ℓ² ⇔ ν((1/2,s]) = O(s−1/2) ⇔ α(n) = O(1/(√n log n)),
  and unitary equivalence with the integral operator of kernel ζ(s+t) on L²(ν) (Thm 5.1); finite-rank
  Helson forms are finite sums of products of directional derivatives at points of ℂ^∞ (Thm 6.6).
- Where it stops: bounded Helson matrices are characterised only when non-negative, via Carleson measures
  on the infinite polydisc, which are not understood; nothing on translation positivity or on zeros.
