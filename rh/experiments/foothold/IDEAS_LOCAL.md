<!-- local-idea-log owner=FH -->
# Local idea log of FH

Private working log of agent `FH`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `FH/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Certified forcing of the first prime: on a window with one atom, positivity pins position and weight
- status: open
- source: FH
- date: 2026-11-11
- tags: foothold,forcing
- plain english: Take the Weil form on the window of half-width 1/2. Its Gamma part and pole are fixed. Pretend we do not know the first prime: put one spike at position y with weight m >= 0 and ask for which (y, m) the form stays non-negative. Proved by exact computation: only spikes with e^y between 1.999585 and 2.008058 and weight between 0.4886 and 0.5104 can survive (the truth is 2 and 0.4901); on the slightly larger window 0.54 the allowed position shrinks to (1.999917, 2.001069). With no spike at all the form is negative. Example: a spike at 2.02 is refuted by one explicit polynomial of degree below 28.
- claim: Theorem B of PROOF_forcing_prime2.md (proved, unchecked).
- first test: forcing.py.txt; logs forcing_half.log, forcing_0p54.log
- kill line: an independent verifier finds a gap in Lemma 5 or Lemma 8, or a recomputation of one refuted interval fails
- evidence: 66 and 70 certified intervals; validate_x.py.txt agrees to 20 digits
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #2 · Zeros as the cap: use the verified zeros (height 3e12) as a positive measure in the medium band instead of bounding the prime comb pointwise
- status: open
- source: FH
- date: 2026-11-11
- tags: foothold,spreading
- plain english: Every certificate so far handles high frequencies by a crude bound: the prime waves are assumed to all line up against us, which forces the computation to resolve frequencies up to exp(4 e^L) times a constant. But below height 3e12 we know the zeros are on the line, so there the form is a sum of squares for free. Example: at half-width 1.2 the crude bound needs frequencies up to about 2 pi e^(A_L) = 1e5 with 950 x 950 matrices at 70 digits; the zeros up to that height are known, so only the band below 2 pi e^(2L) = 70 would need a matrix.
- claim: HEURISTIC: Q(f) = sum_rho w(gamma)|F(gamma)|^2 + (1/2pi) int (1-w) Psi |F|^2 + small, for a band-limited bump w equal to 1 below H/2 and tiny above H; the first sum is >= 0 by the numerical verification of RH up to H, the second needs Psi >= 0 only above H/2 > 2 pi e^(A_L). Needs: window enlarged by the bandwidth of w with no new prime power, and a sampling lower bound in the critical band.
- first test: write the splitting lemma in full with an explicit w (power of sinc) and compute the three error terms at L = 1.0
- kill line: the error term from zeros above H cannot be made smaller than the window margin exp(-c e^(2L)) with H = 3e12
- log:
  - 2026-11-11: audit: not promoted: merged into main #2

## #3 · One-step extension with a sign: is the new prime-side mass forced to be non-negative?
- status: open
- source: FH
- date: 2026-11-11
- tags: foothold,spreading
- plain english: Krein's theorem says a positive form on a window can always be continued to a larger window by SOME extra term outside. The true continuation adds the next prime with a positive weight. Theorem B shows that at the first step the positive weight is forced and nearly unique. Question: is there a structural reason (the off-diagonal kernel of primes minus Gamma is pointwise non-negative, theory T4) why the continuation can be taken with non-negative new mass at every step? Existence of a non-negative continuation at every step plus uniqueness would give RH; each half separately is weaker. Example: on the window 1/2 a negative spike near y = 0 is also feasible, so sign is not automatic inside the window.
- claim: CONJECTURE (not precise yet): for every L there is a positive measure nu on [2L, 2L + d) such that the form with primes below e^(2L) and nu is >= 0 on the window L + d/2.
- first test: at L = (1/2) log 3: compute the set of (y, m) for a second atom near log 3 that keeps the form >= 0 on L = 0.56..0.6; check m >= 0 is forced and the set is non-empty before using the true value
- kill line: the feasible set for the second atom is empty at the true first atom (would contradict RH numerics) or contains negative weights
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #4 · The leak form D_L needs both pole conditions as continuous functionals, is not parity-diagonal, and then Q/D stays in [0.33, 2.5] on all polynomials at three windows
- status: open
- source: FH
- date: 2026-11-11
- tags: bridge,plank8,plank6
- plain english: The bridge compares the Weil energy of a window function with the least amount by which a companion signal must leak out of a frequency band. I computed that least leak from its definition on all polynomials of degree below 28, not only on four special vectors. Two corrections to the definition came out: the two side conditions that remove the pole must be imposed as honest linear conditions (signal has zero mean; its band-limited part vanishes at 0), otherwise the comparison fails upward by a factor 10^10; and the leak form mixes even and odd functions. With that, example at window 0.5: the three smallest leaks are 1.27e-6, 2.58e-4, 2.15e-2 and the three smallest Weil energies 9.42e-7, 1.96e-4, 1.81e-2, and over the whole 28-dimensional space the ratio Weil/leak never drops below 0.33 or rises above 2.3. The same 0.33 appears at window 0.34 (no prime) and 0.54.
- claim: COMPUTED (float, one implementation): kappa_min = 0.3317, 0.3307, 0.3281 at L = 17/50, 1/2, 27/50 on polynomials of degree < 28; stable in the degree.
- first test: pencil.py.txt; second implementation by another seat; then the certificate described in PROGRESS.md section 16 (A)
- kill line: kappa_min on degree < 60 at L = 1/2 below 0.2, or a second implementation disagreeing in the second digit
- log:
  - 2026-11-11: Session 3: multiprecision pencil at L = 0.65, 0.75, 0.85, 1.0: kappa_min = 0.3279, 0.3265, 0.3018, 0.2978 (degree < 68, 80, 96, 116; stable to 3 digits). Not e^(-2L). Minimiser is a ladder/bulk mixture; half of its leak is a cross term (measured at L = 0.85). kappa_max unbounded in the degree. PROGRESS.md section 20.
  - 2026-11-11: audit: not promoted: merged into main #27

## #5 · The comparison constant of Q against the leak D_L is a close-pair detector: kappa_min sits on the closest resolved pair of zeros
- status: open
- source: FH
- date: 2026-11-11
- tags: bridge,plank8,B3
- plain english: The pencil constant (how small the Weil energy can be relative to the band-limiting leak) is not a property of the bulk or the ladder: on the zero side of the explicit formula, the worst direction puts almost all of its Weil energy on two neighbouring zeros that are unusually close. Example: for zeta at window 1.25 the worst direction has 97% of its energy on the zeros at 111.03 and 111.88 (gap 0.85, a typical gap there is 2.2), and the constant is 0.205; at window 1.0 it sits on 59.35/60.83 and the constant is 0.30. For the impostor it detects its close pair at 40.16/40.68 and later its off-line zero. Since zeta has ever closer pairs (Lehmer pairs), the constant should drift to zero.
- claim: COMPUTED (one implementation): zeta 0.33 / 0.30 / 0.205 at L = 0.75 / 1.0 / 1.25 with minimisers on the closest resolved pair; impostor and an L(s, chi_5) control in PROGRESS.md 25. HEURISTIC: kappa_min(L) -> 0 for zeta.
- first test: zeta at L = 1.5 (resolution 252; closest pair below 252?) and a fitted law kappa(normalised gap)
- kill line: zeta's kappa_min at a window that resolves a pair of normalised gap < 0.3 stays above 0.2
- log:
