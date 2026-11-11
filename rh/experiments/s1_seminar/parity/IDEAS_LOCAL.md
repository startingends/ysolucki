<!-- local-idea-log owner=S1-parity -->
# Local idea log of S1-parity

Private working log of agent `S1-parity`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `S1-parity/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Mirror (Hankel) form of the FULL Weil kernel is Lorentzian: one positive square (pole at 1) minus trivial zeros m>=1 minus prime powers; the m=0 Gamma square cancels the e^{-x/2} half of the pole
- status: open
- source: S1-parity
- date: 2026-11-10
- claim: PROVED identity Q(f_e)-Q(f_o) = 4[E_+^2 - sum_{m>=1}E_m^2 - sum Lambda(n)n^{-1/2}(phi*phi)(log n)]; it is the classical explicit formula for d psi read as a kernel; checked to 1e-30 (hank.log). Question: is 'exactly one positive mirror square' the mirror-side shadow of 'N has one positive direction' (idea 10)? F_d = zeta(s-d)zeta(s+d) has two.
- log:

## #2 · Dial n=4: exactly one negative mirror square for every size, caused by the Euler factor (1+2^(1-s)) whose zeros are ON the centre line; the off-centre zeros come from the mirror-positive factor zeta(s)zeta(s-1)
- status: open
- source: S1-parity
- date: 2026-11-10
- claim: PROVED (NOTES.md C); COMPUTED a,b=2..12 and 2..24. So mirror failure and off-line zeros are carried by different factors at n=4.
- log:

## #3 · Right signature object: Ntilde (cubic seat Lemma A) + Theorem 4: sup_L kappa_+(Ntilde_L) = 1 + nu; odd block of Ntilde <= 0 on every window <=> RH
- status: open
- source: S1-parity
- date: 2026-11-10
- claim: PROVED by combination (NOTES.md E). Removes WP1 as bookkeeping: N's signature is the wrong invariant, Ntilde's is exact, per parity block.
- log:

## #4 · Gamma form alone: even block eigenvalues lie below odd block eigenvalues (D3+D5+min-max); the odd block of the Gamma form alone loses positivity between L=0.37 and 0.38
- status: open
- source: S1-parity
- date: 2026-11-10
- claim: PROVED for forms on smooth phi supported in (0,L) (eigenvalue statement needs these to be a form core, unchecked); COMPUTED lowest eigenvalues in hank.log. The even/odd asymmetry of the background comes from the pole, not from the Hankel sign.
- log:

## #5 · Gap in PROOF_first_failure Lemma 2: Selberg's count must be of DISTINCT on-line ordinates
- status: open
- source: S1-parity
- date: 2026-11-10
- claim: Repair by citation (sign changes of Z(t); or positive proportion of simple zeros on the line, Heath-Brown 1979 / Conrey 1989, from memory).
- log:

## #6 · Positivity of the folded ground states of both parity blocks explains every sign and every digit of the feasible intervals of idea 9
- status: open
- source: S1-parity
- date: 2026-11-11
- claim: COMPUTED: folded ground states of Q_even and Q_odd have one sign on (0,L] (L=0.75, 1). PROVED: tau_n = 0 for log n >= L (atoms in [e^L, e^2L) are mirror-only on parity eigenfunctions); first-order caps mu sqrt(n)/(2|g|) are rigorous outer bounds and reproduce the exact end points to 0.1-18%. OPEN: prove the positivity (Perron for Ntilde?).
- log:

## #7 · Exact inertia: kappa_+(N_e) = kappa_-(Q_e) + [t_e>1], kappa_+(N_o) = kappa_-(Q_o) - [t_o<-1]
- status: open
- source: S1-parity
- date: 2026-11-11
- claim: PROVED (Schur complement). Turns Prop 3(b) into equalities; WP1 becomes the computable condition t_e<1 and t_o<-1.
- log:
