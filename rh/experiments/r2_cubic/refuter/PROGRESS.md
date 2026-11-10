# r2_cubic/refuter  (agent R2-cubic-ref)  VERIFIER of seat "cubic": proofs and numbers only

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.  I do not judge ideas (owner, 2026-11-10).
Own implementation: scripts ref_*.py.txt in this folder; none imports the seat's scripts.
I read the seat's box.py.txt / sdp.py.txt only to learn DEFINITIONS (Beurling weights, what "margin" means).

## 1. Proofs, line by line (started 23:29 UTC by `date`)
(see section at the end, filled as I go)

## 2. Numbers

CLOCK NOTE (honesty): the times 23:33 / 23:36 / 23:38 / 23:45 / 23:47 typed below were my ESTIMATES, not read from the clock.
`date -u` read 23:29 when this file was created and 23:34 after the last SDP run, so all of those entries were in fact written
between 23:29 and 23:34. The ORDER is as stated: each expectation was appended to this file in the same shell command that
then started the run (heredoc first, python after), so each was on disk before its computation began.
Expectation written 23:33 UTC before my first run (ref_p1): if the seat's box builder is right, my own builder
(scipy quad; arch entries cross-checked against the digamma frequency-side formula, which the seat never did)
gives for zeta L=1 n=12: eigenvalues of Ntilde 5.306, -0.0018, -0.035; Beurling (2 -> 2.1): 5.287, +0.020.
Control: #pos(Ntilde) = 1 + #neg(Q) in every case (Lemma A), zeta 1, Beurling 2 at L = 1 and at L = 0.5 n = 14.
Result ref_p1 (23:36 UTC), COMPUTED, `python3 tools/memcap.py 3 python3 ref_p1.py.txt`, double precision:
- arch box entries, my kernel form vs the digamma frequency-side form (different formula, same box functions), L=1 n=12:
  |i-j| = 0, 1, 2, 5, 11: 0.3352170104, -0.7340679170, -0.3015429935, -0.1361215850, -0.0684553171 on BOTH routes (10 digits).
  This is the exact same-function check of the arch part of the box assembly that the seat lists as not done.
- zeta L=1 n=12: Ntilde eigs 5.305946, -1.811519e-3, -3.467240e-2 (seat: 5.306, -0.0018, -0.035). AGREE.
- Beurling L=1 n=12: 5.286899, +1.995303e-2 (seat 5.287, +0.020). AGREE. min eig Q -2.48e-2.
- Beurling L=0.5: min eig Q = -2.98e-3 (n=12), -1.366e-2 (n=14) (seat -3.0e-3, -1.4e-2). AGREE. L=0.4 n=12: not detected. AGREE.
- #pos(Ntilde) = 1 + #neg(Q) in all 12 cases (Lemma A numerically).

Expectation written 23:38 UTC before ref_be: seat's numbers should reproduce: T^BE built from Gamma_2 by definition is
symmetric (< 1e-12) and equals formula F5; rho_BE zeta L=1: 0.5902, 0.5280, 0.4816 (n=12,24,48); Beurling 0.5863, 0.5230,
0.4825; gap 1.00034/1.00015/1.00005 vs 0.99623/0.95387/0.92808; resampling 1/2+1/m; cone rho 1.0005 (n=12), 0.45 (n=24, L=1);
Theta_t best t=0.05 worst -0.047 (zeta L=1 n=12), BE worst -4.138. Control: Beurling Theta_t -0.048.
Result ref_be / ref_fam2 (23:45 UTC), COMPUTED: see section 4 table. All seat numbers reproduced to the digits printed, EXCEPT
"Theta_t best t = 0.05, worst -0.047": the seat scanned t in steps of 0.05; on a 0.001 grid the optimum is t = 0.014, -0.0184
(zeta L=1 n=12); t = 0.034, -0.0379 (n=24); t = 0.057, -0.0217 (L=0.5 n=12); Beurling L=1 n=12: t = 0.014, -0.0239.
At the seat's own grid points (t = 0, 0.05, 1/2) my values agree to 4 digits. "No t works" stands.

Expectation written 23:47 UTC before ref_sdp (my SDP uses PSD variables P_k, not tensor entries; own formulation):
sign-constrained margin t*: zeta L=0.5 n=8 0.785, Beurling L=0.5 n=8 0.776, Beurling L=0.3 n=8 1.300 (a = Perron);
Beurling L=1 n=8 infeasible. Locality (zeta L=1, forbid box triples with index spread > n-2): max slack t = -5.80, -3.19,
-2.30, -1.43, -0.82 for n = 2,3,4,6,8; full support t = 0. Degree family: tau*(1) = 1.442e-2 (L=1 n=12), 3.573e-2 (L=0.5 n=12);
degree 2: certificate exists. My sharper test for existence: since P_k a = 0 always, ask for P_k >= t (I - a a^T/|a|^2) and
maximise t; "exists robustly" iff t* > 0 by a clear margin. I do not know what t* will be; if t* <= 1e-9 the seat's
"exists" (lambda_min = 1e-12 with status optimal_inaccurate) is not established in floating point.
