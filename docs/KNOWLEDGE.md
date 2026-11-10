# Knowledge base

Reference facts for the RH project. Refreshed at checkpoints by the lead.
Everything in this first version was written **from memory (unverified against the sources)**;
an entry gets a ✔ only after someone has checked it against the paper or reproduced it numerically
(record who/when in the entry). Corrections are welcome and expected.

## 1. The statement and its equivalents

- **RH.** Every nontrivial zero of ζ(s) has real part 1/2. Equivalently ξ(1/2 + it) has only real zeros,
  where ξ(s) = ½ s(s−1) π^(−s/2) Γ(s/2) ζ(s) is entire, order 1, ξ(s) = ξ(1−s).
- **E1 Prime counting.** π(x) = li(x) + O(√x log x).
- **E2 Mertens function.** M(x) = Σ_{n≤x} μ(n) = O(x^(1/2+ε)) for every ε > 0.
- **E3 Li (1997), Bombieri–Lagarias (1999).** λ_n = Σ_ρ [1 − (1 − 1/ρ)^n] ≥ 0 for all n ≥ 1.
  λ_1 = 1 + γ/2 − log 2 − ½ log π = 0.0230957… ✔ (tests/test_rhlib.py, three independent routes)
- **E4 Weil positivity (1952).** The Weil distribution W (sum over zeros of the explicit formula) satisfies
  W(f ⋆ f*) ≥ 0 for all test functions f.
- **E5 Nyman–Beurling (1950/55), Báez-Duarte (2003).** χ_(0,1) lies in the L²(0,∞) closure of
  span{ρ(1/(kx)) : k ∈ ℕ}, ρ = fractional part. Distance d_N from span{k ≤ N}; RH ⟺ d_N → 0.
  Conjecture (Báez-Duarte–Balazard–Landreau–Saias): d_N² ~ (2 + γ − log 4π)/log N = 2λ_1/log N.
  Burnol (2002): lower bound liminf d_N² log N ≥ Σ_ρ m(ρ)²/|ρ|² unconditionally.
- **E6 de Bruijn–Newman.** H_t(z) = ∫_0^∞ e^(tu²) Φ(u) cos(zu) du has only real zeros iff t ≥ Λ. RH ⟺ Λ ≤ 0.
  Known: Λ ≥ 0 (Rodgers–Tao 2018), Λ ≤ 0.2 (Polymath15 2019; Platt–Trudgian 2021).
- **E7 Jensen polynomials (Pólya 1927).** RH ⟺ all Jensen polynomials J^(d,n) of the Taylor coefficients of
  ξ are hyperbolic. Griffin–Ono–Rolen–Zagier (2019): true for each degree d once the shift n is large enough.
- **E8 Speiser (1934).** RH ⟺ ζ′(s) has no zeros in 0 < Re s < 1/2.
- **E9 Robin (1984) / Lagarias (2002).** σ(n) < e^γ n log log n for n > 5040; σ(n) ≤ H_n + e^(H_n) log H_n.
- **E10 Hilbert–Pólya (folklore).** There is a self-adjoint operator whose spectrum is {γ}.

## 2. What is actually proved (unconditional)

- Zeros verified on the line up to height 3·10¹² (Platt–Trudgian 2021).
- Zero-free region σ > 1 − c (log t)^(−2/3) (log log t)^(−1/3) (Vinogradov–Korobov 1958).
- Positive proportion on the line (Selberg 1942); ≥ 1/3 (Levinson 1974); ≥ 2/5 (Conrey 1989);
  ≥ 5/12 (Pratt–Robles–Zaharescu–Zeindler 2020).
- Zero density N(σ,T) ≪ T^(A(1−σ)+ε): A = 12/5 (Huxley 1972), A = 30/13 (Guth–Maynard 2024).
  Density hypothesis is A = 2; RH is "N(σ,T) = 0 for σ > 1/2".
- Almost all zeros within any fixed distance of the line (Bohr–Landau 1914); Selberg's central limit theorem.
- Function fields: RH for curves (Weil 1948), varieties (Deligne 1974); elementary proof (Stepanov 1969,
  Bombieri 1973). Weil's proof = Frobenius correspondence + Castelnuovo/Hodge-index positivity on C × C.
- Weil positivity for test functions of small support (Yoshida 1992), and at the archimedean place via the
  prolate operator (Connes–Consani 2021; Connes–Consani–Moscovici 2022).
- Local statistics agree with GUE (Montgomery 1973 pair correlation for restricted test functions;
  Rudnick–Sarnak 1996 n-level; Odlyzko numerics).

## 3. Barriers: tests every proof idea must face

Each new idea is run against this list. "Cannot answer yet" is allowed, but the gap must be named.

- **B1 Euler product is essential.** The Davenport–Heilbronn function (1936) is a Dirichlet series with a
  functional equation of the same shape as an L-function and no Euler product; it has zeros off the line.
  → *Where exactly does your argument use the Euler product (or multiplicativity of the coefficients)?*
- **B2 Must not prove too much.** Epstein zeta functions of class number > 1, and linear combinations of
  L-functions sharing a functional equation, violate RH while keeping analytic continuation, functional
  equation, order 1, and even a positive proportion of zeros on the line (Bombieri–Hejhal 1995).
  → *Run the argument on a counterexample and show the step that fails.*
- **B3 No slack.** Λ ≥ 0: RH, if true, is true with nothing to spare; under the heat flow zeros leave the
  line immediately for t < 0. → *An argument with room for an ε of deformation of ξ is wrong.*
- **B4 Local methods cannot see it.** Voronin universality (1975): shifts ζ(s + iτ) approximate any
  non-vanishing holomorphic function on compact subsets of 1/2 < σ < 1. No local analytic property in the
  strip excludes "almost zeros". → *The argument must be global or arithmetic.*
- **B5 Truncations misbehave.** Partial sums of ζ have zeros with σ > 1 (Montgomery 1983, killing Turán's
  route); finite Euler products have no zeros but no functional equation.
  → *What survives the limit, and why?*
- **B6 Equivalences are not reductions.** Li, Weil, Nyman–Beurling, Jensen, Robin, … are each equivalent to RH.
  Rephrasing is free; the positivity itself is the whole problem. Known partial positivity (small support,
  one place, large n) degenerates in the limit: the lowest eigenvalue tends to 0.
  → *What new input does the reformulation make available that the original did not?*
- **B7 Spectral circularity.** Operators whose spectrum "is" the zeros are easy to write down *given* the
  zeros; proving self-adjointness with the right spectrum is RH again (cf. critiques of
  Bender–Brody–Müller 2017). → *Which property of the operator is proved without knowing the zeros?*
- **B8 Elementary/sieve routes.** Mertens' conjecture |M(x)| < √x is false (Odlyzko–te Riele 1985);
  random-sign heuristics (Denjoy) are not proofs; the parity problem blocks sieve-only arguments.
- **B9 Missing geometry.** The function-field proof needs a surface C × C with an intersection pairing and
  Frobenius. No accepted analogue "Spec ℤ × Spec ℤ over F₁" with a Hodge index theorem exists yet
  (Deninger's programme, Connes–Consani's arithmetic site and scaling site are candidates).

- **B10 Both structures at once.** Beurling generalized primes: there are multiplicative systems with an
  Euler product and very regular "integer" counting whose zeta function has zeros off the line
  (Diamond–Montgomery–Vorhauer 2006). So the Euler product alone is not enough either. Davenport–Heilbronn
  has the additive side (functional equation, i.e. Poisson summation over ℤ) without the multiplicative
  side; Beurling systems have the multiplicative side without the additive one. RH lives only where both
  hold. → *Where does your argument use the additive structure of ℤ and the primes together?*

## 4. Numbers worth having at hand

- γ₁ = 14.134725141734693…, γ₂ = 21.022039638771555…, γ₃ = 25.010857580145688… ✔ (tests)
- ξ(1/2) = 0.4971207781883141… ✔ (tests)
- λ_1 = 0.0230957089661…, λ_2 = 0.0923457352280…, λ_3 = 0.2076389205543… ✔ (tests; three routes agree.
  The from-memory value 0.2076389248 first written here was wrong in the 9th digit: the reason for the ✔ rule.)
- λ_n ≈ (n/2)(log n − 1 + γ − log 2π) + oscillating arithmetic part (RH ⟺ the oscillating part stays small
  enough; Maślanka, Coffey, Voros).
- N(T) = (T/2π) log(T/2πe) + 7/8 + S(T) + O(1/T).

## 5. Tools

- `tools/rhlib.py`: zeros (Arb, cached), ξ, Li coefficients two ways, Hardy Z, N(T).
- `tools/ideas.py`: the numbered idea log. `tools/hubcheck.py`: hub consistency.
- python-flint (Arb) is the fast, rigorous engine; mpmath is the independent cross-check.
