# V-CUB PROGRESS (adversarial verifier of the cubic-family candidate 0.8136), 2026-11-11
Labels: PROVED / KNOWN (what I read) / COMPUTED / CONJECTURE / HEURISTIC.

## Read so far
- docs/SUBAGENT_PREAMBLE.md; rh/NOTEBOOK.md N73, N75, N76, N77; S3_SLOPE.md (all); CUBIC_ABSORB.md (with correction); H_CUB.md.

## Checks (status)
(1) absorption identity: pending
(2) family properties step by step: pending
(3) reconstruction assumptions / rerun: pending
(4) literature: pending

## 09:xx first finding (HEURISTIC, to be made PROVED)
Length issue: absorption in the two-variable family needs Poisson in u1 AND u2 separately (modulus n1 n2, norm ~D^2),
so dual per variable is D^2/H_i and the dual character depends only on h = h1 h2: dual row range D^4/(H1 H2) = D^4/U,
U = family size. S3_SLOPE A3 / Part I 8/9 use calH = D^2/U (one-variable duality) with copy density 1/3 of U. Inconsistent?
Checking against the 7/8 paper's geometry next.

## Rerun of SP-sieve's script (COMPUTED, tools/memcap.py 1, ~4 min each; logs rerun_*.log here)
- check mode: Emax(7/8, paper geometry) = -1.913e-4 (paper certifies >= 1.11e-4); Part I geometry 0.916667 = 11/12. CONFIRMED.
- paper optimum: 0.874991 at (0.35599, 0.12119) (S3_SLOPE: 0.874996; optimiser noise). CONFIRMED to 5e-6.
- C1 (c=1/3, alpha=2/3, rho=-1/7, kappa=3/4, cubic low): 0.813619 at (0.37917, 0.05510). CONFIRMED exactly.
- C2 (rho=0): 0.778634. CONFIRMED exactly. 8/9 = 1/2 + (2/3)(7/6)/2: arithmetic CONFIRMED.

## Normalisation check of the signal for the two-variable family (derivation in VERDICT.md sec. 2)
Probe-level Poisson: sextic principal ~ X^(-1/6) N^(-1/3) A_1; one-variable cubic (the chain's c=1/3 model) X^(-1/3) N^(-1/6) A_1;
two-variable cubic (the family that actually absorbs mu) X^(-1/3) N^(-1/3) A_1  (N = column modulus norm, X = total row size).
So C_33 = C_model(c=1/3) - (1+l)/6 = C_sextic - l_x/6. The chain's model uses the one-variable signal.
PREDICTION (written before running): corrected system gives best sigma0 >= 0.875 (no gain over 7/8); guess ~0.90-0.95.
- 06:2x PREDICTION check (1): (I1),(I3),(I6) hold to <= 1e-12 at split primes and composites pi1 pi2 (written before run).

## Results (all written up in VERDICT.md)
- (1) absorption identity: PROVED + COMPUTED (absorb_check.log: 72 primes to 3e-14, 144 composites to 4e-13). Prediction HIT.
- corrected-signal runs (cs_*.log, grid_check.log): C1 -> 1.0114, C2 -> 0.9822, most generous -> 0.9002 (grid 0.9043). Prediction (>= 0.875) HIT.
- R1 read in App. A.2 ((6.5), (A.10), (A.12)): post-theta factor chi^(-j-2); family j = 2 -> chi^(-4) nontrivial cubic. Resolved in favour.
- Part I (11/12 architecture): two-variable family gives nothing (dual range D^4/U vs amplifier needs U < D^(3/2)).
- Literature (abstracts/listings): nothing below ~0.87488; no cubic-symbol variant found.
VERDICT: NOT ESTABLISHED; A1/A3 wrong (one-variable normalisation used for a two-Poisson family).
