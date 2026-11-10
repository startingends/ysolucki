<!-- local-idea-log owner=R2-curv-ref -->
# Local idea log of R2-curv-ref

Private working log of agent `R2-curv-ref`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-curv-ref/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Sum-rule margin of Theorem A is a determinant ratio: 2c^T N_e^-1 c - 1 = det(Q_e)/|det N_e| = (mu_1/lambda_1) prod_{i>=2} mu_i/nu_i
- status: open
- source: R2-curv-ref
- date: 2026-11-10
- plain english: The seat's 'memory integral must be at most 1/2' is the smallest Weil eigenvalue in disguise. At L=1 with 40 boxes: margin 5.592e-4 = (1.991e-3 / 4.303) x 1.209, to 13 digits.
- claim: PROVED (matrix determinant lemma + Cauchy interlacing): margin = prod mu_i(Q_e)/|nu_i(-N_e)|; so the sum rule is strictly unsaturated (margin > 0) on every finite window, and equals mu_1/lambda_1 times a factor >= 1. Pure reformulation (rule 2).
- log:

## #2 · Open-path (window-edge) term RAISES the Bakry-Emery constant: S alone 0, S+H 0.240, S+O 0.200, all 0.522 (centre, L=1, M=40, units lambda_1)
- status: open
- source: R2-curv-ref
- date: 2026-11-10
- plain english: The seat said the edge term is where curvature is lost (lowest value -1.57). Measured properly (relative to Gamma), deleting the edge term drops the certified speed from 0.52 to 0.24 at the centre and from 0.50 to 0.006 at the edge box: the edge term gives curvature, it does not take it.
- claim: COMPUTED: wall W-curv-5 as worded is refuted; curvature here comes from confinement (Hessian + killing), super-additively.
- log:

## #3 · Per-site negative index dies under refinement: ==1 at 38/40, 50/80, 4/160 sites (zeta); 32/40, 24/80, 0/160 (Beurling)
- status: open
- source: R2-curv-ref
- date: 2026-11-10
- plain english: The seat's integer was 1 at 95% of boxes with 40 boxes. With 160 boxes it is 1 at only 4 boxes (2.5%), and 2 at 116 boxes; the fake system gives 0 of 160. The seat's own kill line is hit.
- claim: COMPUTED: the conjecture 'count is 1 except near L - log n and the edges' is false at M=160.
- log:

## #4 · Common reflection on the integer lattice: [w(log ab) + Lambda(ab)/sqrt(ab)] for a,b>=2 is PSD; mismatch is integers vs rationals, not two reflections
- status: open
- source: R2-curv-ref
- date: 2026-11-10
- plain english: The seat said the primes and the smooth part need different mirrors. On whole numbers one mirror (a -> 1/a) works for both at once: the 59x59 table for a,b = 2..60 has lowest eigenvalue -2e-16 (zero). It breaks only at fractions: positions 3/2 and 4/3 give -0.475.
- claim: PROVED (D1 + D3 termwise): Hankel form of K at measures on log-integers >= 2 is >= 0. COMPUTED control at 3/2, 4/3: -0.475. Also true for a Beurling semigroup (blind).
- log:

## #5 · Theorem C (factor 2 for resampling chain) is Schmuckenschlaeger 1998, section 2 (K=1 example): same Gamma_2 formula, curvature 1/2, K_n: 1/2+1/n
- status: open
- source: R2-curv-ref
- date: 2026-11-10
- log:

## #6 · Centre BE value does not tend to 1/2: 0.5513, 0.5222, 0.5061, 0.4965 (M=20..160), still falling; total rate grows by log 2 per doubling (5.17, 5.87, 6.57, 7.27): the chain is infinite-activity, not near-resampling
- status: open
- source: R2-curv-ref
- date: 2026-11-10
- log:
