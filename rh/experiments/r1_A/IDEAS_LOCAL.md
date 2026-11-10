<!-- local-idea-log owner=R1-A -->
# Local idea log of R1-A

Private working log of agent `R1-A`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R1-A/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · A1 Prolate law
- status: open
- source: R1-A (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: mu_even(L)/(1 - chi_4(2 pi e^{2L})) and mu_odd(L)/(1 - chi_6) stay in [1, 20] for all L <= 2.5 and the j-th even rung follows 1 - chi_{4j}.
- first test: L = 2.0, 2.25, 2.5 with a Legendre basis and interval arithmetic.
- kill line: Ratio leaves [0.1, 100].
- novelty: Literature checked by web search (abstract level only): Connes-Consani arXiv 2106.01715 (tiny eigenvalues of the truncated Weil form, prolate functions), Connes-van Suijlekom 2511.23257, Connes 2602.04022, Connes-Consani-Moscovici 2310.18423. Agent did not find the quantitative law mu ~ 1 - chi_4(2 pi e^{2L}) stated; two searches only. Qualitative link is known (Connes-Consani).
- evidence: COMPUTED (PROGRESS.md, 'The law for mu(L)'): over L = 0.25..1.75 (165 orders of magnitude) mu_even(L) = kappa(L)(1 - chi_4(2 pi e^{2L})) with kappa between 2.1 and 6.8; mu_odd = kappa'(L)(1 - chi_6). At L = 1 (even block, N = 80) ln eigenvalues -67.18, -52.05, -38.66, -27.14 vs ln(1 - chi_n), n = 4, 8, 12, 16: -68.66, -52.89, -39.41, -27.63. Values are Rayleigh-Ritz upper bounds, last digits still drifting down by a few percent; mechanism HEURISTIC.
- log:

## #2 · A2 Detection height
- status: open
- source: R1-A (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: For a degree-1 function with conductor q and first off-line zero at height T, the truncated Weil form first turns negative at L* with 4 pi e^{2L*}/q in [0.6 T, 1.2 T].
- first test: The second DH-type function mod 5 and combinations mod 7, 11, 13.
- kill line: Two of four outside the band.
- evidence: COMPUTED, one data point (Davenport-Heilbronn mod 5): positivity first fails at L* in (1.70, 1.72] (upper end rigorous up to midpoint arithmetic; lower end only as good as N = 100); first off-line zero at 85.7; 4 pi e^{2L*}/5 = 75-78. Agent: 'One data point; needs more counterexample functions.'
- log:

## #3 · A3 One-gap reduction
- status: open
- source: R1-A (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: RH follows from (GAP) for a sequence L -> infinity, i.e. (R(theta_L) - mu_1)/(mu_2 - mu_1) = o(e^{-(1+2 delta)L}/L), via Davis-Kahan plus Connes-van Suijlekom (conditional lemma, sketch only, HEURISTIC until written out).
- first test: Write the lemma in full; compute R(theta_L) for the prolate trial vector and the three numbers in (GAP) for L = 0.5..1.75, for zeta and for DH.
- kill line: (GAP) fails numerically for zeta, or the lemma needs positivity of Q_L as an extra hypothesis.
- evidence: Numerically (L = 1): mu_1 = 6.3e-30, mu_2 (odd) = 1.5e-26, (even) 2.5e-23. The Davis-Kahan form violates (GAP) for L >= 1.72 for DH (mu_1 = -0.71, mu_2 = -4e-17 at L = 2). Agent's walls: W1 (lower bound on mu_2 - mu_1 without assuming RH; must use the Euler product, agent does not know where) and W2 (statements are at accuracy exp(-4 pi e^{2L}); bound must come from an identity).
- log:

## #4 · A4 Kicked Krein system
- status: open
- source: R1-A (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: Between consecutive prime powers the window form changes only through explicit smooth terms; at L = (1/2) log n it receives a rank-structured kick of strength Lambda(n)/sqrt(n). RH <=> the Krein function a(L) (continuous Verblunsky coefficient) has no pole.
- first test: Compute a(L) (or d^2/dL^2 log det) for zeta and DH across L in [0.3, 1.9]; look for a quantity that is monotone between kicks for zeta and see what it does for DH before L* = 1.71.
- kill line: No computed quantity separates zeta from DH before L*.
- log:

## #5 · A5 Windowed Pick matrix
- status: open
- source: R1-A (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: The lattice identity (Q(e_j,e_k) = (-1)^{j-k}(T(w_j)-T(w_k))/(L(w_j-w_k)), a windowed boundary Pick/Loewner matrix of the log-derivative of the truncated completed zeta) extends to all real frequencies, giving a de Branges-type kernel Im[e^{iL(w-w')}(G(w) + conj G(w'))]/(w-w').
- first test: Check off-lattice numerically.
- kill line: Fails at 1e-10.
- evidence: The lattice case is numerically validated to 1e-15 (agent: off-lattice formula is HEURISTIC, only the lattice case is checked).
- log:
