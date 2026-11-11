# FH seat MEMORY (rewritten at the end of session 6, 2026-11-11)

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

## Session 2 (bridge, plank 8)
- VERDICT: verifier/VERDICT.md says Theorem A and Theorem B "VERIFIED AS STATED", no gap. Corrections C1 (my
  Rayleigh-Ritz numbers were at y = 0.693147, not log 2: at log 2 they are 9.4166e-7 and 1.07699e-7), C2 (logs
  regenerated), C3 (wording) are repaired. FOOTHOLDS.md FH-1, FH-2 now `checked`. LESSON: the form moves by 0.2 per
  unit of y; always give log 2 to full precision.
- pencil.py.txt <NB> <nh> <L>: float pencil (Q, D_L) on polynomials (Q = exact matrix of forcing.py.txt, D_L by Schur
  complement over the free part h on (0, 1/lambda)). Results: kappa_min = 0.3317 / 0.3307 / 0.3281 at
  L = 17/50, 1/2, 27/50 on the full space of degree < 28; kappa_max 2.3-2.5 (log growth). Needs BOTH pole conditions
  as continuous functionals (int g = 0, int_band ghat = 0), else kappa_max = 1e7..1e10. D_L is not parity-diagonal.
  FOOTHOLDS.md entry FH-3 (candidate, float). PROGRESS.md sections 14-17.
- SESSION 3: pencil_mp.py.txt <L> <NB> <nh> <prec> <K1,K2> (Arb + mpmath; own Q builder by Gauss-Legendre of the
  x-space formula, all prime powers; Moebius companion). kappa_min = 0.3279 (L 0.65), 0.3265 (0.75), 0.3018 (0.85),
  0.2978 (1.0); stable in degree to 3 digits; NOT e^(-2L). Ladders of Q and D parallel within 0.92-1.12 over 24
  orders at L = 1. Minimiser = ladder/bulk mixture, half of D(v) is a cross term (measured at 0.85 only).
  kappa_max unbounded in the degree. My session-2 statement "minimiser is a small-leak combination" was an
  artefact of L^2 normalisation: corrected in PROGRESS 20. Logs pencil_mp_*.log.
- SESSION 4: pencil_eps.py.txt <L> <NB> <nh> <prec> <eps list>: damped form Q_eps (kernel x e^(-eps|x|), pole damped
  exactly) against the same D_L. d mu/d eps at 0 = 0.10 at L = 0.5 and 0.75 (c_1/mu(0) = 1.1e5, 2.7e13); mu(eps) about
  0.095-0.099 eps up to eps = 1/2; kappa_min not monotone (0.331 -> 0.3325 -> 0.314 at L = 0.5; 0.3265 -> 0.3279 ->
  0.2835 at L = 0.75); ladder dissolves rung by rung at eps about q_r/c_r. PROGRESS 21-22, logs pencil_eps_*.log.
- SESSION 5: pencil_dh.py.txt <zeta|dh> ... (impostor Q in x-space; odd companion with the Dirichlet inverse of a_n; band
  lam/5; zero-by-zero decomposition of Q(v) on the zero side; zeta zeros cached in zeta_zeros_200.json);
  pencil_ctl.py.txt (adds kind chi5 = L(s, chi_5) control). Impostor kappa_min: 0.549 (1.0), 0.466, 0.433, 0.431 (1.3),
  0.157 (1.4), 0.1377 (1.5), 0.1376 (1.6), <=0.1205 (1.65), 0.0513 (1.68), 0.0412 (1.70), -0.048 (1.72). The minimiser
  sits on the closest resolved PAIR of zeros (impostor 22.16/23.35, then 40.16/40.68; zeta 59.35/60.83 at L = 1), and from
  1.65 on the impostor's off-line quartet at 85.70 (needs Legendre degree >= about 90 L to be seen). chi5 control flat-ish (0.399 -> 0.325). Zeta 1.25: 0.2046 on the pair 111.03/111.88 (predicted). So kappa_min of zeta is
  expected -> 0 along Lehmer pairs (HEURISTIC). Summary table: PROGRESS 25.
  LESSON: memcap 1 GB: assemble D in chunks (done). Logs pencil_dh_*_N*.log, pencil_ctl_chi5_*.log.
- SESSION 6 (REVERSE plank R2): REVERSE_R2.md. PROVED (elementary, O(1/c)): h0_inf - S(c) = deg + p - N(c) with
  c = 2 pi e^(2L)/q, h0_inf = (1/2) parity trace of P_1 Phat_c = c/2pi +- Si(2c)/4pi, deg = cL/pi, p = pole; 7/8 = 1 - 1/8.
  COMPUTED: residuals < 0.0022 at 9 windows (zeta, chi5, impostor); near-null counts of the window form = prolate class
  counts exactly (zeta even n>=4, chi5 even n>=0, impostor odd n>=1). h1 := S has no sign => RR inequality fails.
  Script reverse_r2.py.txt (A: identity; B <kind> <L> <NB> <prec>: counts), logs reverse_r2_A.log, reverse_r2_B.log.
- Answers given to the coordinator: (1) Connes-Consani Thm 1 does not give plank 8 on the no-prime window as it
  stands (different comparison form, codimension-2 subspace, non-certified numerics); certificate recipe in
  PROGRESS 16 A. (3) The FH-1 certificate run on Q - kappa D does NOT escape the cost explosion (PROGRESS 17).
- NOT done: certified enclosures of the lead's kappa_K on explicit prolate vectors; certified pencil; bulk
  constant (lowest eigenvalue of Q on the D-complement of the ladder); the paper 2006.13771 sections 4-6 unread by
  me (digest read).

## Next steps, in order of value
1. Certify FH-3 at L = 1/2 or 17/50: Q_R - 0.3 D_up >= 0 with an explicit linear companion (PROGRESS 16 A): needs
   rigorous entries of the D_up kernel in the Legendre basis (about 1000 two-dimensional integrals) + Lemma-4 type tail.
2. DONE in session 3 up to L = 1.0. Open: rerun 0.65, 0.75, 1.0 with the off-ladder decomposition (script already
   prints it); L = 1.25 (needs NB about 190, prec about 900); the step 0.3265 -> 0.3018 between 0.75 and 0.85: is it the
   integer 5 entering (L = 0.805)? scan L = 0.78, 0.80, 0.81, 0.83.
3. Test numerically "Sonin trace >= kappa D_L" on the no-prime window (Connes-Consani Thm 4.7 gives the Sonin trace
   as W_infty + an explicit prolate series).
4. Inner bound for FH-2; second atom; T47 at L = 1 (as before).
5. "Zeros as the cap" lemma (FH/#2). Function fields, theta dial, semi-local: never started.

## Rules for me
Numerics: `python3 /home/user/ysolucki/tools/memcap.py 1 python3 <script>`, one job at a time; heavy jobs under
`flock /tmp/claude-0/-home-user-ysolucki/9039aa06-6540-523a-ba98-9efe520848c8/scratchpad/heavy.lock`.
No commits. Only writer of rh/FOOTHOLDS.md. Do not read other seats' IDEAS_LOCAL.md.
