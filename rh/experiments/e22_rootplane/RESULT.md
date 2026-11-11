# e22 result (lead, 2026-11-11). Script plane.py.txt, log plane_0.75.log. COMPUTED, one implementation, not reproduced.
Window L = 0.75 (integers 2, 3, 4), zeta's pole and Gamma factor, atom at 3 exact, N = 24, 84 digits.
Atoms at 2 and 4 are log 2 (1 + d2) and log 2 (1 + d4).
- Positive region: a needle. d2 in [-6.9e-11, +3.4e-13]; d4 in [-5.6e-5, +3.2e-4]. Aspect ratio about 1.5e7.
  Along the axes: d2 in [-1.57e-11, +1.37e-13], d4 in [-6.5e-5, +1.6e-5]. Mostly the even block binds.
- As a conjugate root pair r e^(+-i theta) at the prime 2: Re(root) = 1 to eleven digits; theta up to 7.5e-3 rad,
  and then r - 1 = theta^2/2 up to 2.8e-5 follows. As two real roots with mean 1: split up to 1 +- 0.018.
- As a reciprocal pair 2^(+-d) at the prime 2 ALONE (all else zeta's): d2 = cosh(d log 2) - 1 <= 1.37e-13
  gives d <= 7.5e-7. The consistent tilt F_d (everything tilted together) is seen on this window only from
  d = 7.9e-6 (S1-mirror B90, S1-parity B112). So tilting one prime alone is caught ten times earlier than
  tilting primes, pole and Gamma factor together. Same direction as S1-parity's hybrid table (B113).
Predictions (PREDICTION.md, written first):
- P1 MISS twice: d2 is pinned to 1e-11..1e-13 (I said 1e-2..1e-6), and d4 is 10^7 times LOOSER than d2 (I said
  at least 100 times tighter). Reason: I used the sieve's digits for n = 2 on the window where 2 has just entered;
  what sets the precision is how long the atom has been inside the window, not which power it is.
- P2 HIT in number (ratio 40) but not in mechanism: the r range is theta^2/2 and the real-root side, not an
  independent constraint.
- P3 MISS: by extent only about 15% of the region is on the complex-pair side (I said 30-70%).
What it says: within zeta's own form the natural coordinates are the power sums c(p^k)/log p, one per atom, each
pinned at a rate set by the window. "Size of the root" and "phase of the root" are not two constraints the form
distinguishes; my split of the necessary items into (3) size and (4) phase (board B111) has no content there.
A rotated root at one prime is NOT excluded by this window (theta up to 7.5e-3); it would be closed as 8, 16
enter. Not checked: any window with 8 inside.
