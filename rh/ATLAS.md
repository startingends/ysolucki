# Failure atlas

Separate from the idea log (owner, 2026-11-10). One entry per dead or stuck approach:
- **breaks**: the exact step that fails, stated as mathematics;
- **needs**: what would have to be true for it not to break;
- **supplies**: what the approach does deliver unconditionally.
Then the standing job, the Wiles move made deliberate: take the failures in pairs and ask
**"does what kills A supply what B was missing?"** Every pair examined is recorded at the end of this file with
a verdict (`no` / `maybe` / `yes`) and the reasoning; a `maybe` or `yes` becomes an entry in an idea log.
Written through `python3 tools/records.py atlas ...` (add / pair / todo / check).

## F1 · Look-alike approximants (wall W1)
- approach: Build functions F_N whose zeros are all real by construction (symmetrised finite Euler products, Jensen polynomials at large shift, heat-flowed H_t, minimisers of truncated Weil forms) and pass to the limit.
- breaks: No proof that F_N -> xi locally uniformly without input about the zeros; the Euler product does not converge in 1/2 < Re s < 1, and every known convergence statement is equivalent to RH or assumes it.
- needs: A mode of convergence in which real-rootedness (or positivity) is closed AND which is controlled by primes alone; e.g. pointwise convergence of quadratic forms on test functions of bounded support, which involves finitely many primes.
- supplies: Exact real-rootedness at every finite stage, for free, from a zero-free half-plane (theory T3).
- source: rh/UNDERSTANDING.md U-3, U-4; ideas #6, #7

## F2 · Local-to-global certificates for the sign form (idea #10)
- approach: Certify 'N has one positive direction' by a symmetric 3-tensor T with T.a = H and Lorentzian slices (Braenden-Huh, Oppenheim trickle-down).
- breaks: A certificate exists whenever H is Lorentzian (explicit cone tensor), so existence is equivalent to positivity; the only cubic with a formula, T_ijk = (1/2)[H_ij H_ik/s_i + H_ij H_jk/s_j + H_ik H_jk/s_k], has Lorentzian slices iff the Bakry-Emery condition CD(1, infinity) holds, and on the mean-field (resampling) model it gives the constant 1/2 + 1/m where 1 is needed.
- needs: A cubic defined by a formula valid on all windows that is sharp (constant 1) on the resampling chain q_xy = lambda pi_y, and that fails to exist for a Beurling system.
- supplies: Both block inequalities become ONE signature statement after adjoining two fibre nodes for the pole functionals; the Perron step is lossless once slices are Lorentzian; negative diagonals are harmless.
- source: seat R2-cubic (rh/experiments/r2_cubic), unverified until the verification track reports; idea #10

## F3 · Pointwise curvature of the prime jump process (idea #11)
- approach: Ground-state transform N into a reversible jump process and prove gap >= lambda_1 by Bakry-Emery Gamma_2 >= rho Gamma or Ollivier curvature.
- breaks: For the resampling chain the Bakry-Emery constant is exactly (gap/2)(1 + 2 min pi); our process is that chain up to exp(-4 pi e^(2L)), so rho/lambda_1 tends to about 1/2. The criterion is also blind: Beurling shift 0.499 against zeta 0.496. Ollivier curvature tends to minus infinity under refinement.
- needs: An integrated (not pointwise) Bochner inequality whose remainder is a manifest sum of squares; or an exhaustion without sharp edges, since the entire deficit sits in open paths at the window edge.
- supplies: An exact Bochner formula: Gamma_2 = squares over parallelograms (multiplicative ones for primes) + discrete Hessian of log u + window-edge terms; the identification of the edge as the only carrier of the deficit; the prime kernel as a Gram matrix on prime powers.
- source: seat R2-curv (rh/experiments/r2_curv), unverified until the verification track reports; idea #11



