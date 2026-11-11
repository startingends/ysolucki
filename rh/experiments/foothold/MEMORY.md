# FH seat MEMORY (rewritten at the end of session 1, 2026-11-11)

## What exists (all in rh/experiments/foothold/ unless said)
- PROGRESS.md: running log with predictions, commands, reading record, walls W-FH1, W-FH2.
- rh/FOOTHOLDS.md: entries FH-1, FH-2 (both "proved, not yet checked") + table of candidates without result.
- PROOF_window_prime2.md  (Theorem A): Q >= 9.9998e-9 ||f||^2 even, 3.9999e-6 odd, on L^2[-L, L], L <= (1/2) log 3.
  Certificate: cert.py.txt (cap at R = 40, beta0 = 87/100, 28 + 28 Legendre modes, acb.integral, interval LDL^T),
  log cert_log3_R40_n56.log (191 s). Float twin: explore.py.txt (log explore_a.log).
- PROOF_forcing_prime2.md (Theorem B): one free atom (y, m >= 0); L = 1/2: e^y in (1.999585, 2.008058),
  m in [0.488558, 0.510367]; L = 27/50: (1.999917, 2.001069), [0.489943, 0.492420]; no atom => negative, both
  parities. Script forcing.py.txt <NB> <prec> <L=p/q> (exact x-space form on polynomials: ball matrix AA +
  rational polynomial matrix Gam; refutation rule = Lemma 8). Logs forcing_half.log, forcing_0p54.log.
  Check: validate_x.py.txt (mpmath; 20 digits agreement).
- IDEAS_LOCAL.md: FH/#1 forcing theorem, FH/#2 zeros as the cap, FH/#3 one-step extension with a sign.

## Facts to remember
- NOT NEW: window positivity for L <= 0.8 is claimed by X. Zhu, arXiv 2608.24827 v2 (unrefereed; v1 retracted a
  claim at support 2.38). Text in rh/library/src/2608.24827/zhu.txt; I read section 1 only (17%). Its barrier:
  cap needs R > 2 pi exp(A_L). If FH-1 is to be called new anywhere, READ ZHU SECTIONS 2-7 AND 15 FIRST.
- Connes-Consani 2106.01715 sec. 2.3 has the numerical "p within 1e-3 of 2" at mu = 3. Their 2006.13771 theorem
  is on a subspace (transform vanishing at +-i/2, 0). Yoshida: "small a" (Lemma 2) per Suzuki; not read myself.
- m >= 0 is essential in Theorem B (negative atom near y = 0 is feasible; float).
- The forcing machinery is cheap (seconds). Precision needed ~ margin: at L = 1 (theory T47) about 1e-30 margins,
  so ~2000-bit balls, degree ~100+, irrational atom positions (Taylor-shift around rational approximations).
- The cap certificate cost: integrals 0.25 s each at 128 bits; at L = 0.8 Zhu used R = 200, 200 even modes.

## Next steps, in order of value
1. Get FH-1 and FH-2 checked line by line (verifier); answer the verifier.
2. Inner bound for FH-2: cert.py.txt with ball-valued (y, m) (a certified feasible neighbourhood).
3. Second atom: windows (1/2) log 3 < L <= log 2 with atom 2 fixed and a free atom near log 3; then T47 at L = 1.
4. Write the "zeros as the cap" splitting lemma in full (FH/#2) and see whether L = 0.8 -> 1.2 becomes cheap.
5. Candidates never started: function fields F_q(t), theta dial n = 2, semi-local.
6. A Lean check is plausible only for the rational part of forcing.py.txt (given enclosures of H_n, mu_i,
   log(4 pi L) + gamma as hypotheses); not started. Seat FORMAL: rh/formal.

## Rules for me
Numerics: `python3 /home/user/ysolucki/tools/memcap.py 1 python3 <script>`, one job at a time; heavy jobs under
`flock /tmp/claude-0/-home-user-ysolucki/9039aa06-6540-523a-ba98-9efe520848c8/scratchpad/heavy.lock`.
No commits. Only writer of rh/FOOTHOLDS.md. Do not read other seats' IDEAS_LOCAL.md.
