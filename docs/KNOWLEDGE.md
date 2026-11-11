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
- Weil positivity for test functions of small support (Yoshida 1992), i.e. on the window before the prime 2
  enters (λ² ≤ 2). Connes–Consani arXiv 2006.13771 (Thm 1 / 6.11) sharpens it on the same window with a lower
  bound by a trace on Sonin's space, using prolate functions; the proof is computer-assisted, not
  interval-certified. CORRECTED 2026-11-11 after the papers were read whole: 2106.01715 and 2310.18423 contain
  NO positivity theorem (the first has uncertified numerics up to λ² = 11). Nothing is proved for any window
  containing a prime. The "2022" citation (Connes–Moscovici, PNAS) is a spectral match and was not read.
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

- **B11 The centre must be used (seminar S1, 2026-11-11).** F_d(s) = ζ(s−d)ζ(s+d), 0 < d < 1/2, has an Euler
  product with real local roots p^(±d), non-negative log-derivative coefficients, atoms at the logs of the
  true integers, a functional equation s ↔ 1−s, and its zeros lie on Re s = 1/2 ± d. Its Weil kernel is ζ's
  multiplied by 2cosh(du). It fails only the size normalisation of the local roots (Ramanujan: modulus 1).
  → *Run the argument on F_d. Any hypothesis invariant under the twist n ↦ n^d cannot work: where does your
  argument use the size of the local roots, i.e. where does it know which line is the centre?*
  Three things had been lumped together as "the integers" and are now separated (S1-mirror): POSITIONS of the
  atoms (lost by Beurling systems, B10), COMPLETENESS of the set of primes, and the exact WEIGHTS log p.

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

## 6. Moves from solved cases (inspiration, not foundations)

Owner direction (2026-11-10): learn from solved cases but do not build on top of them; solving an analogue or
a partial version is not solving RH. So this section records the *creative move* in each case and the testing
habit it suggests, not machinery to extend. All from memory.

| solved case | the move (what was creative) | the habit it suggests for us |
|---|---|---|
| RH for curves over finite fields (Weil 1940s) | Could not prove the inequality in the existing language, so invented a new language (abstract varieties, correspondences) in which it became a statement that squares are non-negative | When an inequality resists, ask what object would make it a square. Test: can the quantity be written as a Gram matrix numerically? |
| Same theorem, elementary (Stepanov 1969) | Ignored the geometry entirely; built an auxiliary polynomial vanishing to high order at the points, a trick imported from transcendence theory | Import a tool from a field that has never touched the problem. Test on a small case by brute force first |
| Weil conjectures (Deligne 1974) | Did not prove the bound directly: proved a weak bound for all tensor powers at once, and let the powers amplify it into the sharp one | A weak statement about a *family* can force a sharp statement about one member. Look for a self-improving family |
| Prime number theorem (Hadamard, de la Vallee Poussin 1896) | One line of trigonometry, 3 + 4cos x + cos 2x >= 0, turned positivity of prime weights into a zero-free line | Tiny positivity identities carry enormous weight. Search systematically (by computer) for better ones |
| Poincare conjecture (Perelman 2002) | Found a quantity (entropy) that only moves one way along a flow, which nobody had looked for | For any flow we have (heat flow on xi, growth of the window), hunt numerically for a one-way quantity |
| Fermat (Wiles 1994) | Proved something much bigger and more rigid than asked, because the bigger statement could be attacked by counting | Sometimes the stronger statement is easier. Ask what RH is a shadow of |
| Lambda >= 0 (Rodgers-Tao 2018) | Treated zeros as particles relaxing to equilibrium, importing ideas from random-matrix dynamics | Change what the objects *are* (zeros as a gas, primes as a signal) and see what the new picture makes obvious |
| Ramanujan graphs of every degree (Marcus-Spielman-Srivastava 2013) | Proved real-rootedness of an *average* polynomial via interlacing, then showed one member of the family must do as well as the average | Real zeros can be inherited from an average over a family. Is xi an average of something? |
| Lee-Yang circle theorem (1952) | Zeros forced onto a circle by a physical property (ferromagnetism) of the system, not by computing them | Look for a qualitative property of the system that pins zeros, and test whether zeta has it |
| Sphere packing in dimension 8 (Viazovska 2016) | The proof was a single "magic function" certificate; existence was predicted numerically years earlier, then built from modular forms | Compute the certificate numerically first; if it exists to many digits, go and find its formula |
| Kepler conjecture / four colour theorem | Reduced an infinite problem to a finite, checkable computation | Ask whether any piece of our problem can be made finite and certified by interval arithmetic |
| Bounded gaps between primes (Zhang 2013, Maynard) | Outsider reread a "stuck" method and changed one ingredient others thought fixed | Revisit what everyone treats as fixed in a stuck method; change one assumption at a time and measure |

**How to use this table.** Before a round, each proposer picks one move and asks: what would this move look
like here, on an object nobody has applied it to? The idea is then tested on the control group and on zeta.

## 7. Literature checked by search (owner rule 5)

Each entry: what was searched, what was read, what it says. "Read" means fetched and quoted, not recalled.

| date | source | how much read | what it establishes (✔ = quoted from the text) |
|---|---|---|---|
| 2026-11-10 | M. Suzuki, "Weil's quadratic form via the screw function", arXiv 2606.09096 v3 | first ~40k of 164k characters verbatim, most of the rest by machine summary, last ~24k unread | ✔ The Weil form on (−a, a) is a genuine operator (Friedrichs extension), Thm 1.1. ✔ Its lowest eigenvalue λ_a is continuous in a, Thm 1.3, unconditional. ✔ For small a: λ_a > 0, simple, even ground state, λ_a = log(1/a) + const + O(a), Thm 1.4. ✔ "The failure of RH is equivalent to the existence of some a > 0 for which λ_a < 0" (attributed to Yoshida). No monotonicity in a, no derivative formula, no first-failure argument, no control without Euler product found in the part read. |
| 2026-11-10 | Kim, Hong, Kim, Choi, Jang, Kim, "A Numerical Realization of Suzuki's Weil-Quadratic-Form Operator…", arXiv 2607.24830 v3 (math.GM) | first ~40k of 80k verbatim, rest by summary | Numerical only; says of itself that it "does not prove RH nor advance toward its proof". Reports λ_1(a) > 0 with faster-than-exponential decay, measured only for a ≤ 0.6 (log-slope from about −20 to −56 on [0.2, 0.5]); values beyond are extrapolations and partly discretisation artefacts. Treat its numbers as unverified. |
| 2026-11-10 | A. Connes, W. van Suijlekom, "Quadratic Forms, Real Zeros and Echoes of the Spectral Action", arXiv 2511.23257 v1 | read whole twice (rh/library/2511.23257.md and connes-vansuijlekom-real-zeros.md); hypotheses of Thm 6.1: real distribution on [0, L], lowest spectral value a simple isolated eigenvalue IN THE WHOLE SPACE with even eigenfunction | ✔ If the form of a real even distribution on a window has a simple isolated lowest eigenvalue with even eigenfunction, the eigenfunction's Fourier transform has only real zeros. General theorem about such forms; the paper does not state what is missing for RH. No derivative in the window size, no control example found. |

| 2026-11-10 | N. Johns, "Positive solutions of Weil's explicit formula for ζ(s)", github.com/nic410/zeta-positive-solutions (preprint Oct 2026; AI-produced; README: "No human mathematician has yet checked the proofs line by line") | README and sections 1–3 read via fetch (reported in paraphrase); sections 4–6, appendices, companion notes, Part II unread | Claims (UNVERIFIED): "admissible pairs" = positive measure on the zero side + positive measure on the prime side (any positions beyond log 2) solving the explicit formula with ζ's Gamma factor and pole; existence ⟺ a prime-free, zero-free inequality κ* ≥ 0 (conic LP duality); uniqueness theorems under restrictions on the zero-side support; with conductor q as a parameter, existence unconditionally for q ≥ 1.0172 and certified κ* ≤ 1.43·10⁻¹⁰⁶⁰. Overlaps the core of idea #9. No finite-window emergence experiment, no Davenport–Heilbronn control found in what was read. |
| 2026-11-10 | M. Suzuki, "Hamiltonians arising from L-functions in the Selberg class", arXiv 1606.05726 (J. Funct. Anal. 2021); "A canonical system of differential equations arising from the Riemann zeta-function", arXiv 1204.1827 | search-result summaries only; papers not fetched | An equivalent condition for GRH in terms of canonical systems (a Hamiltonian must exist for all values of a parameter), via an inverse problem. So "RH ⟺ the window family is a Krein/canonical system with no singularity" is KNOWN in substance (notebook N19; lane A idea A4 overlaps). |

Searched and NOT found (2026-11-10, one query): Burnol's work on Sonine spaces / Painlevé for the archimedean
part; recalled from memory only, unverified.

Read whole since (digests in `rh/library/`, see its INDEX): Connes–Consani 2106.01715 and 2006.13771,
Connes–Consani–Moscovici 2310.18423, Burnol math/9809119, Suzuki 2606.09096, Perfekt–Pushnitski 1611.03772,
Johns Part I + N3, Bondarenko–Radchenko–Seip 2005.02996, Rodgers–Tao.
Not yet read (needed for idea #8): Yoshida 1992; Bombieri's "Remarks on Weil's quadratic functional";
the logarithmic-Laplacian literature (Chen–Weth and later) for
Hadamard-type domain-variation formulas.
