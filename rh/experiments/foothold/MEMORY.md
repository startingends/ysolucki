# FH seat MEMORY (rewrite at the end of every session; last update 2026-11-11, mid-session 1)

## Where I am
- Search result that changes the brief: X. Zhu, arXiv 2608.24827 v2 (unrefereed, single author, v1 retracted a
  stronger claim) CLAIMS certified positivity of the Weil form for supp f in [-0.8, 0.8] (even and odd, hence
  complex f). Classical record before it: 2L <= log 2 (Yoshida 1992; Connes-Consani 2006.13771).
  So "window with the prime 2" is not new as a claim. PDF/text in rh/library/src/2608.24827/.
- Plan: (D1) own certificate at L = (1/2) log 3 (cap + Legendre + Arb integrals + interval LDL); (D2) certified
  "the prime is needed / forced" statements (need UPPER bounds of the exact form on test vectors);
  (D3) FOOTHOLDS.md entries; (D4) reading record in PROGRESS.md.
- Files: PROGRESS.md (running log, predictions), explore.py.txt (float exploration, not a certificate).

## Method facts (all in PROGRESS.md section 1)
P1 monotone in window; P2 form = Fourier multiplier Psi_L + rank-2 pole; P3 parity blocks; P4 cap at R.

## Rules for me
Numerics: `python3 /home/user/ysolucki/tools/memcap.py 1 python3 <script>`, one job at a time; heavy jobs under
flock <scratchpad>/heavy.lock. No commits. Only writer of rh/FOOTHOLDS.md.
