# r1_B critic PROGRESS

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.

## Plan (written before computing)
- Independent Gram matrix in the y = 1/x variable by exact piecewise integration on [0,Y) + mean-value tail
  (no Vasyunin formula), compare with proposer's G2000 block and d_N^2 at N = 50, 100, 200.
- Independent LOWER bound for D_S: y-space reformulation (see below), truncated to [0,Y) with lambda free.
  Proposer's numbers are upper bounds (finite N), so this gives a sandwich.
- B-2: cubic-fit coefficient stability across N (the proposer's own kill line, not run by them).
- B-4: check the dissipation identity on a random polynomial; recheck dz_1/dt and min gap from Arb zeros.

## Prediction stated before computing (rule 4), 2026-11-10
Critic's elementary lower bound (derived on paper, below) predicts D_P^2 >= about (1/2) * sum_{n>1, gcd(n,P#)=1} 1/n^2:
P=2: 0.095, P=3: 0.044, P=5: 0.025, P=7: 0.0152 (paper approximations), against proposer 0.1247, 0.04996, 0.0289, 0.0183.
If my truncated lower bounds come out ABOVE the proposer's upper bounds, one of us is wrong.
