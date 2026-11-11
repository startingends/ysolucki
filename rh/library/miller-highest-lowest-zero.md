# Miller, "The highest-lowest zero and other applications of positivity"

Note by seat R-read-2, 2026-11-11. This note reports what is in the source. It recommends nothing.

## 1. Reference and how much was read

- S. D. Miller, *The highest-lowest zero and other applications of positivity*, arXiv math/0112196 (v1,
  19 Dec 2001; TeX file `highlow.tex` with 16 figure files). Published in Duke Math. J. 112 (2002), 83–116
  (publication data from Johns's bibliography, not checked independently).
- **Read in full from the TeX source** (`rh/library/src/math_0112196/highlow.tex`, 1798 lines; the macro
  preamble, lines 1–99, was not read; the abstract was read from its second sentence). The 16 figures are
  EPS plots; they were **not viewed**, and several proofs in the paper consist of those plots.

## 2. What it proves

Sections (counted from the source): 1 Introduction, 2 L-functions and positivity, 3 A library of functions,
4 The highest lowest zero for π_∞ real, 5 Low zeroes for modular form L-functions, 6 Cuspidal eigenvalue
bounds, 7 Bounds on non-cuspidal eigenvalues, 8 Cuspidal cohomology. One counter per section.

Setting (§2): π a cuspidal automorphic representation of GL_m over ℚ, L(s,π) with Gamma factors
Π Γ_ℝ(s + η_j), conductor D, functional equation, Re η_j > −1/2 (Jacquet–Shalika). Weil's formula (§2.1):
Σ_γ h(γ) = 2Re{Σ_j l(η_j) − Σ_n c_n n^{-1/2} g(log n)} + g(0) log D, with h = ĝ and l(η) = (1/2π)∫h(r)
(Γ_ℝ'/Γ_ℝ)(1/2 + η + ir)dr (entire case; "for ζ(s) and Rankin–Selberg L-functions there is a polar term").
**If g is supported in [−log 2, log 2] the prime sum is empty**: Σ h(γ) = 2Re Σ l(η_j) + g(0) log D.

Definition: an L-function has a *low zero* if it vanishes on the critical line between 1/2 ± 14.13472i,
"or violates GRH in an effectively-bounded range".

- **Theorem 1.1.** "Let π be a cuspidal automorphic representation of GL_n over ℚ with a real archimedean
  type and a trivial central character. Then L(s,π) has a low zero". Unconditional in the stated
  either/or sense. Includes Dirichlet characters and rational elliptic curves.
- **Theorem 1.2.** The same for every cuspidal π on GL_2/ℚ with trivial central character (holomorphic and
  Maass forms). Via Propositions 5.2–5.6 (§5); Prop. 5.5: a Maass form on Γ_0(2)\ℍ even under both involutions
  has Laplace eigenvalue > 1/4 + 6.14².
- **Criteria (§2.2).** For given (η_j, D), a g supported in [−log 2, log 2] with h ≥ 0 on the critical strip and
  2Re Σ l(η_j) + g(0) log D < 0 "shows the L-function does not exist"; with g_m = c²g + g'' (so
  h_m(r) = h(r)(c² − r²), positive exactly for |r| < c), 2Re Σ l_m(η_j) + g_m(0) log D > 0 shows a zero in
  the region where h_m > 0.
- **Lemma 3.1.** If g even has ĝ ≥ 0 on ℝ, then the transform of g(x)/cosh(x/2) is positive in the strip
  −1/2 < Im r < 1/2. (This is what removes the need for GRH.)
- **Theorem 1.4 / Prop. 6.1.** Every cuspidal Laplace eigenfunction on SL_n(ℤ)\SL_n(ℝ)/SO_n(ℝ) has
  λ > (n³ − 4n)/24 + 25.92(1 + 1/(n−1)). **Theorem 6.3:** λ ≥ 87.625, 108, 140.875, 167, 201.125, 232 for
  n = 3,…,8 (uses "Principle 6.2", whose footnote says "Some may not consider the justification to be a
  proof").
- **Theorem 1.5 / 7.1.** For n ≤ 67 every non-constant discrete eigenvalue is > (n³ − n)/24; for n = 68 there
  is one ≈ 12916.6 < 13098.5 (the introduction prints 12906.6, §7 prints 12916.6), built from Hejhal's
  numerically computed first Maass eigenvalue.
- **Theorem 1.6 / 8.1.** H^·_cusp(SL_n(ℤ); ℂ) = 0 for 1 < n < 27. Uses the positivity inequality of §8 for
  the Rankin–Selberg L-function L(s, π × π̃), which has a pole and non-negative coefficients of −L'/L:
  ∫g(x)(e^{x/2} + e^{−x/2})dx + 2Re Σ l(μ_jk) + g(0) log D ≥ 0, with the coefficient sum "simply dropped".
- Conjecture 6.5 and Question 6.6 (limiting distribution and boundedness of
  (λ_k^cusp(n) − (n³−n)/24)/n).

## 3. Method in ten lines

1. Stark–Odlyzko–Serre–Poitou positivity: evaluate Weil's formula on a test function whose zero-side
   weight h is ≥ 0 at every possible zero.
2. Kill the prime side by support: g supported in [−log 2, log 2], so nothing about the coefficients of
   the L-function is used; the formula becomes "sum over zeros = explicit function of (η_j, D)".
3. Make positivity unconditional: divide g by cosh(x/2), which makes h positive on the whole critical
   strip, not only on the line (Lemma 3.1).
4. Explicit library: g_{j,p} = rescaled self-convolutions of cos^j(πx/2) on [−p, p], divided by cosh(x/2),
   p = log 2; closed-form h.
5. To force a zero below height c: multiply h by (c² − r²), i.e. replace g by c²g + g''.
6. Two-sided use: if the archimedean side is negative for a positive test function, the L-function does
   not exist; if it is positive for the sign-changing one, a low zero exists.
7. The proof of Theorem 1.1 compares the two one-variable functions l_1(η) and l_{3m}(η) (or l_{2m}) on
   η > −1/2: "Figures … indicate that l_1(η) < l_{3m}(η)"; a second proof partitions the η_j into three
   ranges with numerical bounds.
8. Where the comparison fails (tempered Maass forms of level 1 and 2) extra information on the forms
   themselves is brought in (functional-equation signs; a Fourier-expansion argument at level 2).
9. For eigenvalue bounds: the same inequality read as a constraint on Langlands parameters; Lagrange
   multipliers reduce to at most three distinct values.
10. With poles and non-negative −L'/L coefficients (Rankin–Selberg), the prime side is dropped by sign
    instead of by support.

## 4. Where it stops

- "We have been unable to squeeze our technique to answer Odlyzko's question in full generality": the
  question "Does any other automorphic L-function have a larger first zero?" is settled only for real
  archimedean type and for GL_2. (Johns's paper cites Bober et al., J. Number Theory 2015, as showing the
  statement "fails beyond real archimedean type"; not read here.)
- "Our main difficulty is that it is often very difficult to construct this second test function given the
  failure of the first."
- The method never uses test functions of support larger than [−log 2, log 2] when coefficients are
  unknown, so it never sees a prime; with support up to log 2 the conductor bounds are those of the
  archimedean term alone.
- The possible exceptions for fixed degree "all lie in a bounded subset of the unitary dual and have
  bounded level"; the method succeeds because "this subset tends to be devoid of cusp forms".
- Before Prop. 5.5: "Perhaps Proposition 5.6 below can be proven without such explicit information."
- "Nothing is known about these cuspidal Betti numbers for n ≥ 27".
- The paper makes no statement about ζ beyond using 14.13472 as the benchmark height, and none about RH.

## 5. What it changes in our record

- **Idea #9 novelty field** lists this paper as "related". Precisely what it is: the positivity method with
  **window at most log 2**, where no prime enters, applied to decide existence of L-functions with given
  archimedean data and conductor, and to locate a zero. It contains no feasibility set for prime-side
  weights, no uniqueness statement, and no test function reaching the first prime. In the project's
  normalisation (test function f on [−L, L], atoms at |x − y| = log n) this is the range L ≤ (1/2) log 2
  = 0.347, i.e. the range before our e10 observation "with no atom the form turns negative at L ≈ 0.36".
  That observation (the Gamma factor and pole of ζ force a first atom just past (1/2) log 2) is not in the
  paper: the paper does not run ζ's own data with the pole through the criterion.
- **Idea #9, conductor reading ("zeta is rigid because conductor 1 is the smallest conductor at which any
  solution exists").** The Criteria of §2.2 are the classical form of the same mechanism for entire L-functions: a
  positive test function with negative archimedean value excludes the conductor D; "This immediately gives
  a lower bound on the conductor D, which is the original application of the positivity technique."
  Johns's κ*/q_min is the optimised version with a pole and with test functions allowed to see the primes
  through a sign condition. Already known (Stark, Odlyzko, Serre, Poitou, Mestre; survey [Odlyzko 1990]).
- **Dropping the prime side by sign (§8).** For an L-function whose −L'/L has
  non-negative coefficients and a pole, positivity of h on the strip gives pole term + Gamma terms +
  g(0) log D ≥ 0. This is the one-line form of our idea #10 "sign fact" being used as an inequality (the
  prime part enters with a definite sign and is discarded), here for Rankin–Selberg L-functions. Our
  theory entry T4 (the off-diagonal kernel of primes − arch is ≥ 0) is not stated in the paper.
- **Knowledge §2 / barrier B6.** The paper is an instance of "partial positivity (small support)" used for
  consequences other than RH: non-existence of forms, low zeros, eigenvalue bounds.
- **The control L(s, χ) mod 5 (odd).** Covered by Theorem 1.1 (Dirichlet characters have real archimedean
  type): it has a low zero in the paper's sense. No use of the Davenport–Heilbronn function or of any
  function without Euler product; the method uses no Euler product at all when the support is ≤ log 2, so
  its conclusions for given (η_j, D) hold for any function satisfying Weil's formula with those data.
- Ideas #4, #21, theory T1–T6, atlas: no change.

## 6. Reliability

- Human-written, published in Duke Math. J. The proofs of the main theorems rest on **numerical evaluation
  and plots** ("Picture Proof"; "From computer investigations … we can determine the following very precise
  information"), done in "Mathematica v.3 on an Intel Pentium II"; no interval arithmetic or certified
  bounds are claimed. One step is labelled a "Principle" with the footnote quoted above.
- Typos noticed: 12906.6 vs 12916.6; in the "less-pictorial" proof the bound for P is printed once as
  .0005801 and once as .005801 (the contradiction needs the former).
- The figures were not viewed by this seat, so the plotted inequalities were not inspected.
