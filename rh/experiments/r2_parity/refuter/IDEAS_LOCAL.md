<!-- local-idea-log owner=R2-parity-ref -->
# Local idea log of R2-parity-ref

Private working log of agent `R2-parity-ref`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-parity-ref/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Position scan at L=0.5: at the best weight the even and odd lowest eigenvalues are EQUAL at every x tried (the optimum is an even/odd crossing), and there is a kink near x=2.0076 where the value falls 15x faster; right end of the feasible set is basis-sensitive (int30 2.0081, half30 about 2.0087, int120 below 2.0080)
- status: open
- source: R2-parity-ref
- date: 2026-11-10
- claim: COMPUTED (c3_*.log). Which third constraint becomes active at the kink is not identified.
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #2 · Exact feasible end points without bisection: Q - tB >= 0 iff t in [1/mu_min, 1/mu_max], mu = eigenvalues of B relative to Q; the extreme eigenvector is a one-vector certificate of infeasibility just outside
- status: open
- source: R2-parity-ref
- date: 2026-11-10
- claim: COMPUTED (c2_iv_*.log); linear algebra, PROVED trivially for Q positive definite on the subspace.
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #3 · Theorem U scope item 'false on every single window' has a one-line proof under RH (given attained lambda(L)>0): |D(f*f~)| <= 2 sum|d_j| ||f||^2, so any D with 2 sum|d_j| <= lambda(L) keeps Q_L >= 0; the seat backed it only by a discretised example
- status: open
- source: R2-parity-ref
- date: 2026-11-10
- claim: PROVED given S1 (CCM Thm 3.6) and the zero-side formula on the form domain.
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #4 · Monotonicity of lambda(L) needs no domain assumption: Suzuki Cor. 1.2 says lambda_a is the infimum of the Rayleigh quotient over C_c^infty(-a,a), and those spaces are nested
- status: open
- source: R2-parity-ref
- date: 2026-11-10
- claim: PROVED given Suzuki Cor. 1.2 (read in the PDF, p.5).
- log:
  - 2026-11-11: audit: not promoted: merged into main #8

## #5 · Known: 'one parity block suffices' is Yoshida 1992 Prop. 1 as described by Suzuki p.2 (odd block => RH; even block => RH except possible real zeros)
- status: open
- source: R2-parity-ref
- date: 2026-11-10
- claim: Source: Suzuki arXiv 2606.09096 p.2 (read); Yoshida's paper itself not opened (fetch returned empty).
- log:
  - 2026-11-11: audit: not promoted: merged into main #22
