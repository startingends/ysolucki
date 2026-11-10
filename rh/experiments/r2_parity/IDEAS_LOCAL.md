<!-- local-idea-log owner=R2-parity -->
# Local idea log of R2-parity

Private working log of agent `R2-parity`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-parity/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Exact negative-index theorem: sup_L kappa_-(Q_L) = number of distinct zeros right of the line; per parity block = number of quartets
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: Proof by the cosine-shift multiplier M_t f = (f(.-t)+f(.+t))/2: leaves the on-line part bounded, blows up each off-line pair like e^{2tb} with rotating phase
- log:
  - 2026-11-10: PROVED in PROOF_parity_index.md (Theorem 4). First draft (bare cosine shift) fails for infinitely many off-line zeros; repaired with cos(tz)[sinc(z-a)^K+sinc(z+a)^K]. Search: count attributed to Bombieri by a 2026 preprint (not opened) - known in substance. Corollaries: one spare negative square is free (kappa<=1 for all L <=> RH); one parity block suffices; N one positive direction => at most one quartet.

## #2 · Computed feasible sets are OUTER approximations (Rayleigh-Ritz); digits of intervals are basis dependent; verify in a second lattice (half-integer)
- status: open
- source: R2-parity
- date: 2026-11-10
- log:
  - 2026-11-10: Confirmed: int40 -> half60 shrinks every interval by ~17%; all digits of #9 are outer bounds. See PROGRESS WP4.

## #3 · Position of the first prime at L=0.5 is an interval [1.9996, 2.0085], not the point 2.000; 2 sits at the LEFT edge, best position 2.007
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: COMPUTED in two lattices (v3 logs). Lead's 3 grid values reproduce; the claim 'only at 2.000' does not. Question: is the true prime always at the edge of the feasible position interval (extremality, cf. N16/Q10)?
- log:

## #4 · Joint feasible set at L=1 is a simplex along equal-sign directions (t=0.17=1/6) and bulges to 1.6x box in mixed signs; no long direction
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: COMPUTED, 26 directions, two lattices. Heuristic: one first-order constraint sum delta_n b_n <= mu_1 active per side.
- log:

## #5 · lambda(L) is non-increasing in L (min-max, one line); zero set of lambda is a closed interval
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: PROVED given nested form domains (PROOF_first_failure Lemma 1). KNOWLEDGE 7 says no monotonicity was found in Suzuki; it is trivial.
- log:

## #6 · Background (Gamma+pole, no primes) fails first in the ODD block at L in (0.37,0.38); even block stays positive to L=0.40
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: COMPUTED two lattices, N up to 120. The first prime is forced by the odd block, i.e. by N_odd <= -2<f,sinh>^2.
- log:

## #7 · Wall WP1: signature of N cannot give RH, only <= one quartet; what separates is the odd block sign
- status: open
- source: R2-parity
- date: 2026-11-10
- log:

## #8 · Theorem U (N14 step 4 rigorous): under RH no atomic l1 perturbation of the prime side keeps positivity on all of R; uses nothing arithmetic; false on every single window
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: PROVED in PROOF_uniqueness.md; UNSEARCHED, presumed folklore
- log:
