# Guessing the prover's object, and working backwards from it (lead, 2026-11-11)
Owner: "keep narrowing but also try to guess what the prover of RH would use and reverse engineer it from there."
Method: name a concrete guess for the missing object, assume it works, derive what must then be true, and check those
consequences against known mathematics and against the session's results. A guess dies at the first consequence that
is false. Constraints carried over: `rh/CORE.md`, `rh/REVERSE.md` (L3–L5), `rh/MISSING_SPACE.md` §§7–8 (no finite-rank
algebraic object; the three-way picture Witt / adele class space / modular Jacobians).

## Guess A (lead's main guess): the square is an ARITHMETIC (Arakelov / adelic) variety over Spec ℤ
Why this guess, working backwards from REVERSE.md:
- In Arakelov geometry the three links that are missing over "F₁" are THEOREMS: the Riemann–Roch amplifier L3 is the
  arithmetic Hilbert–Samuel theorem (Gillet–Soulé; Yuan's arithmetic bigness: ĥ⁰(nL̂) ≥ n^(d+1) L̂^(d+1)/(d+1)! + o),
  with integer-valued dimensions (log of lattice-point counts), which escapes Lemma R1.2; L4 (a small section gives an
  effective arithmetic divisor) is standard; L5 (effective · nef ≥ 0) is standard; and the arithmetic Hodge index
  theorem is PROVED (Faltings–Hriljac for surfaces; Moriwaki; Yuan–Zhang for adelic line bundles, 2017) (m).
- The intersection numbers have exactly the shape Weil's form has: Σ_p (integer)·log p + an archimedean Green term
  (MISSING_SPACE §4). ∞ is treated on the same footing as the primes, through Green functions (N89–N90).
- **A classical fact points at a concrete arithmetic variety: Φ_n(1) = e^(Λ(n)) for n ≥ 2** (checked here for
  n = 2..199). On G_m over ℤ, the divisor of primitive n-th roots of unity, Φ_n(x) = 0, meets the unit section x = 1
  only over the primes p with n = p^k, with local intersection number 1 there, so its finite intersection number with
  the unit section is log Φ_n(1) = Λ(n). The von Mangoldt function IS an arithmetic intersection number on G_m/ℤ:
  torsion against the identity. (The archimedean part Σ_ζ −log|1 − ζ| = −log Φ_n(1) cancels it for the standard
  metric: the product formula. A non-canonical metric at ∞ is needed, and its contribution must be W_∞.)
- So the prime side of the explicit formula, Σ_n Λ(n) h(log n), reads as an arithmetic intersection of a WEIGHTED SUM
  OF TORSION DIVISORS with the identity, weights h(log n): Frobenius fixed points ↔ torsion (μ_n), Frobenius ↔ power
  maps [n] on G_m (which are group endomorphisms: the group law of MISSING_SPACE §2, now as a convenience), and the
  torsion of G_m is ℚ/ℤ, the Bost–Connes data.

Consequences that must hold if Guess A is right (each is a test):
- A1. There is an arithmetic variety X/ℤ (G_m², P¹ × P¹ with some adelic metric, or a compactification of a power-map
  correspondence space) and a family of arithmetic divisors D(f) built from torsion / power-map graphs weighted by f,
  with ⟨D(f), D(g)⟩_Ar = Weil's form I(f, g) (finite part = the prime side via Φ_n(1) = e^(Λ(n)); archimedean part = W_∞).
- A2. The metric at ∞ is NOT the canonical (Zhang) metric: for canonical metrics torsion subvarieties have height 0 and
  all these intersections vanish (Bilu / Zhang equidistribution, m). The archimedean Green function must produce the
  digamma distribution ψ(¼ + it/2) − log π. Narrowing: which Green function on P¹(ℂ) or ℂ* has W_∞ as its "Fourier
  transform" along the scaling direction?
- A3. **Narrowing (lead): X cannot be toric with toric metrics.** In toric arithmetic geometry (Burgos–Philippon–Sombra
  (m)) heights are sums over places of integrals of local concave roof functions, and positivity is LOCAL (concavity at
  each place). Weil's form is a sum of local distributions W_p that are NOT positive (W_p < 0, they are subtracted),
  with positivity only global. So if A1 held on a toric X with toric metrics, Weil positivity would be a sum of local
  positivities, which it is not. X (or its metrics) must have genuinely global arithmetic.
- A4. The Hodge-index hypotheses (nef ample class, degree zero on the generic fibre) must translate into Weil's
  conditions ĝ(±i/2) = 0 (the degree conditions of N112).
- A5. The impostor must have no such X: its "Λ" is not an intersection number of anything (it takes both signs),
  consistent with S6 of MISSING_SPACE.
Status: A1 is the construction to attempt; A2–A5 are its checks. If A1 fails for a structural reason, that reason is
the next narrowing.

## Guess B: big Witt vectors in characteristic one with a continuous Frobenius F_λ and an archimedean component
- Has the group law and every character (MISSING_SPACE §8); lacks ∞. Connes studied a Witt construction in
  characteristic one (2011, m). Backward test: the polarisation must come from the archimedean component, and the zeros
  must be picked out WITHOUT the Nyman–Beurling kernel (else it is the window wall of N114 again). Secondary.

## Guess C: the modular tower with its continuous spectrum
- Modular Jacobians have group law + polarisation + Hodge index but see the Hecke spectrum. Their L² continuous spectrum
  (Eisenstein series) carries ζ through the scattering phase. Backward test: an arithmetic intersection pairing on
  Eisenstein (cuspidal-boundary) cycles, as in Kühn / Burgos–Kramer–Kühn (m), whose family is indexed by a test
  function on the spectral line, would have to equal Weil's form for ζ(2s) (or ζ(s)ζ(s−1)). Bost–Kühn's ζ′(−1)/ζ(−1)
  is ONE value of such a pairing. Secondary.

## Ratings now
Guess A: Quality 3 (concrete, with a verified anchor Φ_n(1) = e^(Λ(n)) and five checkable consequences), Toward RH 3
if A1 can be constructed with A3 respected; it would reduce RH to a known theorem (arithmetic Hodge index) applied to
a specific family of arithmetic divisors. The risk is that A1 is impossible for a reason the next round finds.
