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
  - 2026-11-11: COMPUTED turn 2 (fd.py.txt, L = 0.75): lambda_even(d) = 9.1965e-15 - 1.46289e-4 d^2, lambda_odd = 7.4532e-12 - 2.45385e-3 d^2; sign change at d = 7.9e-6 / 5.5e-5. Reproduced by S1-parity (B91). The lead recorded the control as barrier B11.

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
  - 2026-11-11: COMPUTED turn 2 (doubling.py.txt), L = 0.5/0.6/0.68: spectrum of R = T^-1 H in [-1,1] with 1+lam_min = 3.1e-6/5.9e-9/1.0e-11, 1-lam_max = 3.2e-3/1.3e-5/3.8e-8; without primes top eigenvalue 9.1/61/353. Shares at the odd saturator, L = 0.6: Q 0.10, Gamma squares 0.50, prime 2 mirror 0.40. Saturators of one sign. The kill line is met in the sense written: the saturators are the folded ground states; the doubling step is the whole problem. What is kept: the odd block as 'one square <= three forms'.

## #3 · Mirror positivity of the primes in L^2 lives only above the horizon 4 pi e^(2L)
- status: open
- source: S1-mirror, turn 1; grows from idea 18 (horizon lemma) and S1-curv's 'two test spaces'
- date: 2026-11-11
- tags: W-curv-3
- plain english: The mirror sum-of-squares needs test functions that tell neighbouring whole numbers apart. On a window reaching up to e^(2L) = 7.4 (L = 1) the products go up to 7.4 and neighbours like 7 and 8 are 0.13 apart in log scale, so the bumps must be narrower than about 0.07. Functions that fine oscillate faster than the 'horizon' frequency above which the window form is positive anyway. The dangerous, nearly-zero-energy functions are smooth and cannot tell 7 from 8.
- claim: HEURISTIC: the L^2 class on which D1 gives H_primes >= 0 is spanned by bumps at log a of width ~ e^(-2L); its frequency content starts at ~ 2 pi e^(2L). PROVED smallest case: two bumps at log 2, log 4 of half-width < log(17/16)/2.
- first test: S1-curv computed the comb (B39): margin grows with A for zeta and Beurling alike.
- log:

## #4 · Mirror positivity and Ramanujan are complementary: they meet only at local roots +-1
- status: open
- source: S1-mirror turn 2; grows from the lead's B70, barrier B11, Corollary 3
- date: 2026-11-11
- tags: B11,control
- plain english: At each prime a degree-2 symmetric factor is governed by one number a. If a is larger than 2 in size the two roots are real (2 and 1/2, say) and the mirror matrix is a sum of squares; if a is smaller than 2 the roots sit on the unit circle, which is what every L-function believed to satisfy RH does. The two regimes touch only at a = 2 or -2, where both roots are 1 or both are -1. Example at the prime 2: zeta(s-d)zeta(s+d) has a = 2^d + 2^(-d), which is 2.005 for d = 0.1 (mirror positive, RH false) and exactly 2 for d = 0; zeta(s-0.1i)zeta(s+0.1i) has a = 2cos(0.1 log 2) = 1.998 (not mirror positive, RH as true as for zeta).
- claim: PROVED: for 1 - a p^-s + p^-2s, [c(p^(i+j))] >= 0 iff |a| >= 2; roots of modulus 1 iff |a| <= 2. The tilt family is analytic in t = d^2 and the lowest window eigenvalue is linear in t through 0 with negative slope (COMPUTED, two implementations).
- kill line: a control and a classification, not a route
- log:

## #5 · First-prime lemma: the odd background is a Perron operator on every window, so the first atom has a forced sign and a minimum weight
- status: open
- source: S1-mirror turn 3, answer to the moderator's B153; grows from the lead's B140, S1-parity B58/B119/B169, S1-cubic B52, K-atlas B168
- date: 2026-11-11
- tags: rule6,B10
- plain english: Without any primes the 'odd half' of the energy goes negative once the window is wider than about 0.75 in total, and the function on which it is most negative is positive on the right half. A prime sitting between L and 2L acts on such a function only through its mirror image, with a definite sign. So whatever repairs the odd half must carry positive weight, at least a computable amount. Example: on the window L = 0.40 a single prime at 2 needs weight at least 0.407 (its true weight is 0.693); a prime at 2.1 would need at least 1.10 but a 'prime' at 2.1 only has weight log 2.1 = 0.742, so the system with 2 moved to 2.1 fails there.
- wall: Not an attack on a wall: a necessary condition on one block. It is a proved statement on windows that contain a prime (journal J4: none recorded).
- new input: The Perron ground state of the odd background as a universal positive test function for every mirror atom.
- claim: PROVED (PROOF_first_prime.md): for every L the odd block of pole + Gamma has a simple lowest eigenvalue -eps(L) with positive folded eigenfunction psi; if eps > 0, atoms in (0, 2L) making the odd block >= 0 satisfy sum m_i x_i^(-1/2) 2(h_i - tau_i) >= eps. COMPUTED: bounds 0.407 / 0.552 for the atom at 2 at L = 0.40 / 0.50; atom at 2.1 needs 1.71 / 1.10 / 0.877 at L = 0.38 / 0.40 / 0.42.
- prediction: R1-R4 in NOTES.md 00:48 UTC: R2, R3 hit; R1 half; R4 miss.
- smallest: The lemma itself. Next: an upper bound on the weight from the even block, to trap position and weight of the first atom by two test functions.
- first test: firstprime.py.txt; certify.py.txt
- kill line: If an independent recomputation gives a bound below 0.742 for the atom at 2.1 at L = 0.40, the Beurling exclusion is wrong.
- novelty: Checked rh/library digests 2106.01715, connes-consani-weil-positivity-archimedean, suzuki-2606.09096, yoshida-1992 (grep): numerics only there. No web search. Overlaps on the board with B168 and B169.
- log:
