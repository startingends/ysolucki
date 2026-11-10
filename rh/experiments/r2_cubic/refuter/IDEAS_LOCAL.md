<!-- local-idea-log owner=R2-cubic-ref -->
# Local idea log of R2-cubic-ref

Private working log of agent `R2-cubic-ref`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-cubic-ref/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Seat's Lemma B is Braenden-Leake Lemma 2.8 at d=3; its ancestor (Cordero-Erausquin-Klartag-Merigot-Santambrogio 2019, Shenfeld-van Handel 'Bochner method') is already a Bochner argument
- status: open
- source: R2-cubic-ref
- date: 2026-11-10
- plain english: The seat's 'trickle-down with negative diagonal' is printed, with the same hypotheses and the same proof, in arXiv 2304.13203v2 (read: Section 2, pp. 6-9, from the PDF). That lemma descends from a proof of the Alexandrov-Fenchel inequality by the Bochner method, so 'this lemma is a Lichnerowicz/Bochner statement' is known in convex geometry. Not checked: whether the explicit discrete Bakry-Emery cubic (seat's Theorem F) appears there.
- log:

## #2 · Robust numerical test for a cubic certificate: every P_k kills a, so ask for P_k >= t (I - aa^T/|a|^2) and maximise t
- status: open
- source: R2-cubic-ref
- date: 2026-11-10
- plain english: The seat reported 'certificate exists' from lambda_min(P_k) = 1e-12, which cannot tell 0 from 1e-9. Because P_k a = 0 for every tensor with T.a = H, the right margin lives on the complement of a. Numbers (two solvers): degree-2 family, zeta L=0.5 n=12: t* = 1.19e-3; L=1 n=12: 4.6e-4; L=1 n=20: 2.6e-4; Beurling L=0.5 n=8: 6.7e-3. Example: at L=1, 12 boxes, the smallest eigenvalue of any P_k away from a is 0.00046, about 1e8 times the rounding error.
- log:

## #3 · Observation: the locality infeasibility margin shrinks with n (5.80, 3.19, 2.30, 1.43, 0.82 for n=2,3,4,6,8 at L=1) and is 0.069 at L=0.5 n=8
- status: open
- source: R2-cubic-ref
- date: 2026-11-10
- plain english: Forbidding the triples (first box, any box, last box) makes the SDP infeasible in every case I ran, but the amount by which it fails falls as boxes get finer and is small on the shorter window. Whether it stays infeasible as n grows is not settled by these numbers.
- log:

## #4 · rho_BE = 1/2 + 1/m on the resampling chain is a two-line proof, not only a computation
- status: open
- source: R2-cubic-ref
- date: 2026-11-10
- plain english: From the seat's own formulas the ratio is (3<f^2> + f_k^2)/(2(<f^2> + f_k^2)); for mean-zero f Cauchy-Schwarz gives f_k^2 <= (m-1)<f^2>, with equality for f = e_k - 1/m, so the minimum is (m+2)/(2m). Same argument gives the exact CD(rho,n) constant 1/2 - 2/n + (1 + 2/n)/m. Example m = 10: 0.6.
- log:
