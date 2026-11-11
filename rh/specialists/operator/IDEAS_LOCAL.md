<!-- local-idea-log owner=SP-operator -->
# Local idea log of SP-operator

Private working log of agent `SP-operator`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `SP-operator/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Twist as conjugation: Q_{F_d} = e^{dX} Q e^{-dX} + e^{-dX} Q e^{dX} = 2cosh(d ad_X) Q on every window
- status: open
- source: SP-operator
- date: 2026-11-11
- plain english: Multiplying every integer n by n^d (the family F_d = zeta(s-d)zeta(s+d)) does one simple thing to the energy form on a window: it is the ordinary form looked at through a tilted lens e^{dx} on one side and e^{-dx} on the other. Example: for d = 0 nothing happens; for tiny d the lowest energy drops by d^2 times the energy of x times the ground state, so the true zeta is at the top of a smooth hill in d, not at a kink.
- claim: PROVED identity. Consequence: lambda_min(Q_{F_d}) <= 2 lambda_0 - 2 d^2 <x psi,(Q - lambda_0) x psi> + O(d^4); even, analytic, concave at 0, no kink. BLIND PREDICTION (written before reading S1-parity's fd logs or any post after B70): first failing half-width L*(d) solves lambda_0(L) = d^2 c(L), c = <x psi,(Q-lambda_0) x psi>; rough guess before computing c: d=0.25: L* in 0.28..0.33; d=0.1: about 0.35; d=0.05: 0.38..0.40.
- log:
