# r1_A critic -- PROGRESS

## 21:20 Independent implementation (cweil.py.txt)
mpmath, x-space form of the Weil functional (Gauss integral for psi, Gauss-Legendre quadrature on [0,2L]); no digamma closed
forms, no Arb. Even block, cosine basis. First run disagreed (0.0121 vs 1.0e-6 at L=0.5,N=20): MY bug (factor 2 in the pole
term F_k). After the fix: L=0.5,N=20: 1.0045963e-6 (proposer 1.0045963e-6); L=0.25,N=20: 0.033456146 (proposer 0.033456146).

## 21:25 PREDICTION registered before computing (zero-surgery control, idea critic/#1)
Model: zeta's zero set with one neighbouring pair gamma_n, gamma_{n+1} replaced by an off-line quartet at the midpoint m, +-delta
off the line. Weil matrix = zeta matrix + explicit rank<=4 perturbation. L*(m, delta) = first window with a negative eigenvalue.
Proposer's A2 law predicts 4 pi e^{2L*}/m in [0.6, 1.2] with no dependence on delta.
My prediction: L* DOES depend on delta (smaller delta -> larger L*), shift >= 0.1 in L per decade of delta, and for small delta
4 pi e^{2L*}/m drifts toward 2 (density threshold e^{2L} = m/2pi), leaving the band. If L* is delta-independent to 0.03, I am wrong.

## 21:40 Results so far
- cweil.py.txt vs proposer, same (L,N): zeta L=1,N=80: 6.6401193e-30 / 2nd even 2.4819194e-23 (proposer 6.6401193e-30, 2.5e-23).
  DH N=100: L=1.9 -0.263054 (prop -0.26305); L=1.8 -2.44622e-7 (-2.4462e-7); L=1.72 -7.91085e-30 (-7.9109e-30);
  L=1.70 none, smallest 1.1182823e-28 (1.1183e-28). All agree to every digit printed.
- DH threshold N-robust: proposer code N=160, 600 bits: L=1.70 -> +1.036e-28, 1.68 -> 9.26e-28, 1.65 -> 8.6e-26. L* in (1.70,1.72].
- Second DH quartet (T=114.163, delta=0.151): proposer's own table shows a 2nd pair of negatives at L=1.9; I bracketed: L=1.88 one
  negative per block, L=1.90 two per block -> L*_2 in (1.88,1.90], 4 pi e^{2L*}/(5T) = 0.96. Negative index = 2 per quartet (1 even + 1 odd).
- surgery.log (zero surgery, N=90, 400 bits): L* DOES depend on delta and height. 4 pi e^{2L*}/m:
  m=17.6: 1.44,1.61,1.77,1.93 (delta=.3,.1,.03,.01); m=35.3: 1.16,1.24,1.35,1.45; m=51.4: 1.07,1.17,1.25,1.31;
  m=78.2: 1.03,1.10,1.15,1.20; m=100.1: 0.99,1.05,1.10,1.15.  10 of 20 outside the proposer's band [0.6,1.2].
  My own prediction: delta-dependence yes (0.05-0.10 in L per decade; I said >= 0.1, so only half right); "drifts toward 2": NOT seen
  except at the lowest height. Honest score: direction right, size overestimated.

## 21:42 PREDICTION (garbage-above-H test, critic/#2), registered before running
L=0.58 (4 pi e^{2L} = 40.1). Replace ALL consecutive pairs of zeta zeros from index n0 up to 200 by quartets at the pair midpoint,
delta=0.4. Prediction: form stays positive for n0=21 (H=77, ratio 1.9) and is negative for n0=5 (H=33). Unsure in between.

## 21:50 Garbage-above-H test (garbage.log) -- both registered predictions confirmed
L=0.58, N=90, 400 bits, zeros n0..200 all replaced pairwise by quartets (delta 0.4 and 0.1):
n0=5 (H=32.9, 0.82 x 4pi e^{2L}): negative (-4.8e-4, 2 negatives; delta=0.1: -8.1e-6).
n0=9,13,17,21,31 (H=48..104, ratio 1.20..2.59): NO negative eigenvalue; lowest eigenvalue 4.0e-9 .. 7.3e-9, i.e. essentially the
unperturbed ground state. Up to 96 quartets of garbage above 1.2 x 4pi e^{2L} leave the window form positive.
Caveats: zeros above index 200 untouched; one L; N=90 Rayleigh-Ritz (positives are upper bounds, so "no negative" is not certified).

## 21:55 A5 off-lattice check (a5check.py.txt)
Derived the off-lattice identity by hand (3 lines, PROGRESS of the review): for ANY kernel distribution D on (-2L,2L),
Q(e_w,e_w') = Im[e^{iL(w-w')}(H(w)+conj H(w'))]/(w-w'), H(w) = int_0^{2L} D(u) e^{-iwu} du (truncated one-sided transform).
For zeta H = psi(1/4+iw/2) - log pi - 2 sum_{n<=X} Lambda(n) n^{-1/2-iw} + 2 sum_m e^{-2L(a_m+iw)}/(a_m+iw), a_m=2m+1/2, plus pole term.
Numerics (Gauss-Legendre, 30 and 50 digits): (L,w,w') = (0.8,3.3,7.1): -0.124208584902775 both sides, diff 7e-31 (3e-52 at 50 dps);
(1.3,0.37,11.913): diff 3e-31; (0.5,20.2,2.05): diff 1e-32. Dropping the tail sum gives errors 6e-3 .. 6e-2: it is NOT negligible.
(First attempt with mp.quad tanh-sinh showed 1e-4 .. 1e-6 differences: my quadrature, not the formula.)

## Verdicts
A2 wounded (numbers reproduced exactly; the law's band fails in 10/20 surgery controls; refined law given).
A1 wounded (numbers reproduced; mechanism is Connes-Consani; kappa drifts; L=1.75 not converged: 2.5e-165, 4.9e-167, 4.0e-167 at N=200,300,400).
A3 refuted as a reduction (hypothesis implies mu_2>0 on a sequence => at most one negative square => RH directly; B6). Strategy = CCM 2511.22755.
A4 wounded (not well-posed; 'no pole' = 'no eigenvalue crossing' restated; no scalar ODE).
A5 survives as an identity (off-lattice verified to 1e-30) but is generic to every truncated convolution form; no new input.
