# FH seat MEMORY (rewrite at the end of every session; last update 2026-11-11, session 1, late)

## Results so far (details and commands in PROGRESS.md)
1. Literature: Zhu arXiv 2608.24827 v2 (unrefereed) CLAIMS certified window positivity for L <= 0.8. Classical: small a
   (Yoshida Lemma 2), a = (log 2)/2 with vanishing conditions (Yoshida / Connes-Consani 2006.13771). CC 2106.01715
   has the NUMERICAL "p must be within 1e-3 of 2" observation at L = (1/2) log 3.
2. Own certificate (cert.py.txt, log cert_log3_R40_n56.log): Q >= 9.9998e-9 ||f||^2 (even), 3.99999e-6 (odd) on
   L^2[-(1/2) log 3, (1/2) log 3].  Proof text: PROOF_window_prime2.md (to write / check that it exists).
3. Forcing theorem (forcing.py.txt, logs forcing_half.log, forcing_0p54.log): on L = 1/2 any atom (y, m >= 0)
   keeping the form >= 0 has e^y in (1.999585, 2.008058), m in [0.488558, 0.510367]; on L = 27/50:
   (1.999917, 2.001069), [0.489943, 0.492420]. No atom => negative in both parity sectors.
   Proof text: PROOF_forcing_prime2.md.
4. Validation: validate_x.py.txt (x-space formula vs frequency side vs Arb code).

## Still to do
PROOF files, FOOTHOLDS.md entries, idea log entries, final report. Candidates NOT attempted: function fields,
theta dial n = 2, semi-local. Spreading idea to record: use verified zeros (height 3e12) as the positive
extension at low/medium frequency instead of the pointwise comb envelope.
