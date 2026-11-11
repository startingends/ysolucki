# V-COPY progress (verifier of rh/specialists/sieve/COPY_BARRIER.md)
Verification track. Labels: PROVED / KNOWN (with what I read) / COMPUTED / HEURISTIC / CONJECTURE. Default when unsure: gap.

## 2026-11-11 04:44 UTC  Read
docs/SUBAGENT_PREAMBLE.md; COPY_BARRIER.md (whole); rh/library/openai-qrh-11-12.md (whole); rh/NOTEBOOK.md N49, N53(c) lines 790-810, N67-N69.

## 2026-11-11 04:45 UTC  PREDICTIONS (written before any computation)
P1 (quadratic family, Kronecker symbols (d/n), 1 <= d <= H, functions on n <= D; a member is a "copy on [1,D]" if (d/n) = 1 for every
   n <= D with gcd(n,d) = 1, i.e. it equals 1_{(n,d)=1} on [1,D]).
   - Global copies (principal as characters) = perfect squares d: C_glob(H) = floor(sqrt H). H = 1e4: 100; H = 1e5: 316; H = 1e6: 1000.
   - Copies on [1,D] exceed the squares when D is small: roughly H * 2^(-pi(D)) extra (heuristic). D = 3: thousands at H = 1e5;
     the excess vanishes for D >= D*(H) := max over non-square d <= H of the least n coprime to d with (d/n) = -1.
     Guess D*(1e4) in [15, 40], D*(1e5) in [20, 60], D*(1e6) in [25, 80] (least-non-split-prime records grow like log H * loglog H).
   - Theorem 2's bound (S = {2}, P_0 empty): C <= sum_{2^k <= H} #{odd squarefull <= H/2^k}; ratio of true C to this bound well below 1.
P2 (all Dirichlet characters mod q, 1 <= q <= Q, functions on n <= D). Number of characters mod q trivial on all n <= D coprime to q
   equals [(Z/q)^* : <n <= D, (n,q)=1>]. Predict: for D >= D**(Q) the count is exactly Q (principal characters); D**(200) in [8, 30];
   |F| = sum phi(q) = 3Q^2/pi^2 (1 + O(log Q/Q)); C/|F|^(1/2) -> pi/sqrt 3 = 1.8138; at Q = 200: ratio within 3% of 1.81.
   D = 1: every character is a copy, C = |F|.
P3 (Theorem 1 over number fields). The parenthetical "#{n : N(n) <= D, p | n} <= D'/N(p)" is false in general. Prediction: in
   Z[i] at D = 10, p = (1+i): I(5) = 5 > I(10)/2 = 4.5; and in Q(sqrt -163), D = 41, a single copy chi = 1_{(n,p)=1} with N(p) = 41
   has Delta = I(41) - 1 = 7 < (1 - 2/41)^2 I(41) = 7.24 (I(41) = 8 predicted), refuting the number-field form with D' in place of D.
P4 Squarefull counts (independent method: smallest-prime-factor sieve, direct exponent test): 185 at 1e4, 2027 at 1e6, 21044 at 1e8
   (to match SP-sieve's log exactly); also count <= (zeta(3/2)/zeta(3)) sqrt X for every X (sharper than the file's zeta(3/2)).

## 2026-11-11 ~05:00 UTC  Results (command: flock <scratch>/heavy.lock python3 tools/memcap.py 1 python3 rh/specialists/sieve/verifier/copy_tests.py.txt; 8.6 s; log copy_tests.log)
P1 confirmed: global copies = squares (100, 316, 1000); D*(H) = 37, 53, 79 (inside predicted ranges); small-D excess 2-3x the H 2^-pi(D) heuristic.
P2 confirmed: C = Q for D >= 19 (Q = 100, 200, 400); C/|F|^(1/2) = 1.8125, 1.8083, 1.8130; D = 1 gives C = |F|.
P3 confirmed: Z[i] I(5) = 5 > 4.5; Q(sqrt-163), D = 41: I = 8, Delta = 7 < 7.2385 -> Theorem 1 over number fields refuted as written.
P4 confirmed: 185, 619, 2027, 6553 at 1e4..1e7; max count/sqrt X = 2.0731 < zeta(3/2)/zeta(3).
Line-by-line reading done; literature search done (5 queries, 7 sources). Verdict written to VERDICT.md.
