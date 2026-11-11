<!-- local-idea-log owner=S1-mirror -->
# Local idea log of S1-mirror

Private working log of agent `S1-mirror`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `S1-mirror/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Real-tilt dial zeta(s-d)zeta(s+d): a control that passes every positivity hypothesis and violates RH
- status: open
- source: S1-mirror, turn 1; grows from idea 21's criterion and the theta dial (ideas 12, 13)
- date: 2026-11-11
- tags: control,B2,rule9
- plain english: Take the zeta kernel and multiply every coupling at distance u by 2cosh(d u). Every sign and every sum-of-squares property survives: the couplings stay positive, the mirror matrix stays a sum of squares, the smooth background stays a mixture of decaying exponentials, the symmetry s -> 1-s stays. But the zeros move off the line by exactly d. Example: d = 0.3 moves the first zero 0.5 + 14.13i to 0.2 + 14.13i and 0.8 + 14.13i. So any argument that uses only signs and sums of squares proves a false statement for d = 0.3.
- claim: PROVED: F_d = zeta(s-d)zeta(s+d), 0<d<1/2, has Weil kernel = 2cosh(du) x zeta's; integers, Euler product (real positive roots p^(+-d)), FE, positive couplings, mirror positive, completely monotone Gamma kernel; zeros rho+-d off the line unconditionally. The only hypothesis found so far that it violates: 'one square of the wrong sign in the mirror form' (S1-parity B34).
- first test: S1-parity is computing the first failing window for d = 0, 0.05, 0.1, 0.25 (board B59).
- kill line: not an approach; a control. Useless if every proposed bridge already uses the pole count.
- evidence: mirror2.log: min eig -5e-16 on a,b=2..12 for d=0.3
- log:

## #2 · Doubling: the primes between e^L and e^(2L) enter the window-L form only through the mirror form; RH on the window = |mirror form| <= shift form of the half window
- status: open
- source: S1-mirror, turn 1; grows from R2-curv D5, S1-parity B25, S1-curv F4
- date: 2026-11-11
- tags: W-curv-3,rule9
- plain english: Cut a test function on the window into its right half phi and the mirror image of that half. The energy of the whole is twice (energy of the half) plus or minus twice (the interaction between the half and its mirror image). The half only feels primes up to e^L; every prime between e^L and e^(2L) acts only through the interaction with the mirror image. Example: on the window L = 1 the half sees only the prime 2 (log 2 < 1), while 3, 4, 5, 7 act only between a point x and a mirror point -y with x + y = log 3, log 4, log 5, log 7. RH on the window says the interaction is never larger in size than the energy of the half.
- wall: W-curv-3 (two test spaces). FAILS RULE 2 as it stands: a reformulation; the new input would have to be a proof of the doubling step, i.e. an equality-strength control of the mirror form on near-null vectors.
- claim: PROVED (reformulation): for real phi in L^2(0,L]: Q(phi +- phi^v) = 2[T_W +- H_W](phi), T_W = sum_zeros phihat(g)phihat(-g) = Weil form on a half-size window, H_W = sum_zeros phihat(g)^2 = E_+^2 + E_0^2 - H_Gamma - H_primes; positivity on [-L,L] <=> |H_W| <= T_W on (0,L]. H_primes contains all n <= e^(2L), T_W only n <= e^L.
- smallest: An unconditional doubling step on one small window: from positivity on [-L/2, L/2] for L/2 < (log 2)/2 (no primes at all in the half) to the window L, where the prime 2 enters only through H_primes.
- first test: On L = 0.5..0.69 the half window has no primes; check numerically how tight |H_W| <= T_W is and which phi saturate it.
- kill line: If the saturating phi are the half-window near-null vectors with no further structure, the doubling step is the whole problem again.
- log:

## #3 · Mirror positivity of the primes in L^2 lives only above the horizon 4 pi e^(2L)
- status: open
- source: S1-mirror, turn 1; grows from idea 18 (horizon lemma) and S1-curv's 'two test spaces'
- date: 2026-11-11
- tags: W-curv-3
- plain english: The mirror sum-of-squares needs test functions that tell neighbouring whole numbers apart. On a window reaching up to e^(2L) = 7.4 (L = 1) the products go up to 7.4 and neighbours like 7 and 8 are 0.13 apart in log scale, so the bumps must be narrower than about 0.07. Functions that fine oscillate faster than the 'horizon' frequency above which the window form is positive anyway. The dangerous, nearly-zero-energy functions are smooth and cannot tell 7 from 8.
- claim: HEURISTIC: the L^2 class on which D1 gives H_primes >= 0 is spanned by bumps at log a of width ~ e^(-2L); its frequency content starts at ~ 2 pi e^(2L). PROVED smallest case: two bumps at log 2, log 4 of half-width < log(17/16)/2.
- first test: S1-curv computed the comb (B39): margin grows with A for zeta and Beurling alike.
- log:
