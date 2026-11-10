# PROGRESS (R2-judge, verification track: proofs and numbers only)

Start 23:51 UTC 2026-11-10. Read: preamble, brief, UNDERSTANDING, KEY_LEMMA_SHAPE, ideas #8-#11 (claims and logs),
notebook N27, all six PROOF files of the three seats line by line (23:51-23:55), lead's e10 logs.
I do not rank or assess ideas. The idea verdicts of the "curv" checker are ignored; only its proof and number findings are used.

## Predictions written BEFORE computing (written 23:56 UTC by the system clock; my first typed stamp 23:59 was an estimate and is corrected here). Each has a control.

J1 background (pole + arch, no primes), lead's Arb builder r1_A/weil.py.txt, N = 30 and 60, per parity block.
   Predict: lowest eigenvalue POSITIVE at L = 0.362 and at L = 0.370 (odd block +0.004..+0.011 at 0.370), NEGATIVE at
   0.375 (odd block -0.003..-0.010) and at 0.38 (-0.0178 at N = 30, the lead's own number); even block positive (about
   0.001) at 0.38. So the lead's "negative from about L = 0.362 on" should come out wrong by about 0.01 in L.
   Control: with the true prime 2 present the lowest eigenvalue at 0.38 is +4.10e-4 (lead's test_c.log).
J2 position of one atom, L = 0.5, N = 30 (lead's golden-section harness): x = 2.0080 feasible (+4.7e-5), x = 2.0085
   infeasible (about -2.9e-4), x = 1.9996 feasible (about +1.3e-6). At N = 60, x = 2.0080: sign uncertain, value in
   (-2e-5, +5e-5). Control: x = 1.994 gives -2.3e-4 (lead's test_d.log); x = 2.000 gives +1.578e-5.
J3 Theorem A needs lambda_1 > 0: top eigenvalue of N = primes - arch at L = 0.10 (Fourier N = 30) is NEGATIVE, in
   (-0.09, -0.04); at L = 0.12 positive (+0.05..+0.20). Lowest Weil eigenvalue at L = 0.10 positive, in (0.3, 0.5).
   Control: none possible with primes (no prime power in the window at L = 0.10); the toy 2x2 matrix [[-10,1],[1,-10]] is the control.
J4 Theta_t, zeta L = 1 n = 12, my own box matrix, grid step 0.001: best t in [0.010, 0.020], worst lambda_min(P_k) in
   (-0.020, -0.017); at t = 0.05: -0.047. Control Beurling: best about -0.024 near t = 0.014; no t gives >= 0.
J5 Bochner pieces, zeta L = 1 M = 40, centre site, Gamma-normalised constant / lambda_1: squares+Hessian 0.24 +- 0.01,
   squares+open 0.20 +- 0.01, all three 0.522. Raw smallest eigenvalues: Hessian piece -0.034, open-path piece -1.57.
   Control Beurling centre, all three: 0.50..0.54 (same as zeta; my guess, not in any report).
J6 per-site negative index of Gamma_2 - lambda_1 Gamma equal to 1: zeta 38/40, 50/80, and at M = 160 between 0 and 12
   sites (checker: 4); Beurling 32/40, 24/80, 0..4 at 160. Threshold for "negative": < -1e-9.
J7 Theorem F on random symmetric H (mixed signs), a > 0 with Ha > 0, m = 7: tensor from the definition of Theta, from
   formula F5, and from Gamma_2 by definition agree to < 1e-11; |T.a - H| < 1e-11. Control: replace the coefficient
   1/4 of [g,f,h] by 0.3: |T.a - H| becomes O(0.05..1).
J8 Lemma C: with l = Ha >= 0, 0 violations in 300 random Lorentzian H; with some l_k < 0, at least 10% of instances
   have a slice with two positive eigenvalues.
J9 CD(rho, n) on the resampling chain, m = 40: best rho = 0.13500, 0.28125, 0.42750 for n = 5, 8, 20 (formula
   1/2 - 2/n + (1 + 2/n)/m, which I rederived by hand before computing). Control m = 1000, n = 5: 0.1014.
J10 determinant identity: 2 c^T N_e^-1 c - 1 = det(Q_e)/|det N_e| in my box basis, L = 1, M = 40: both 5.59e-4, equal to
   1e-9 relative. Control Beurling: ratio negative.
J11 my box matrix (third implementation: diagonal from Theorem E with a closed form for the tail integral) against the
   seats: zeta L = 1 M = 40: lambda_1 = 4.303094, gap/lambda_1 - 1 = 3.36e-3, BE worst 0.4963, centre 0.5222;
   Ntilde n = 12: 5.305946, -1.8115e-3. Beurling L = 1 M = 40: 5 positive eigenvalues, gap/lambda_1 = 0.9141, BE 0.4989.
