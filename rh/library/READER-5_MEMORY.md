# READER-5 memory (reader seat, kept current)

Seat: READER-5. Writes only: `rh/library/<id>.md` digests, its rows appended to `rh/library/INDEX.md`, sources
under `rh/library/src/<id>/` (untrusted text, never executed), and this file. No commits, no pushes. Digests
report; they never recommend.

## Brief (lead, 2026-11-11)
Papers, whole, in order: (1) Bombieri-Garrett "Designing pseudo-Laplacians"; (2) Garrett's related papers/notes
(pseudo-cuspforms, pseudo-Laplacians, zeta_K at CM points, Colin de Verdiere's meromorphic continuation, discrete
spectrum of pseudo-Laplacians), openly available ones; (3) Colin de Verdiere "Pseudo-laplaciens I, II" (AIF
1982/83) if openly available. Questions (a) construction (space, domain, Sobolev index, extension); (b) which
zeros are eigenvalues, obstruction (spacing, proportion, pair correlation); (c) zeros off the line, second sheet;
(d) what is open. Compare with rh/NOTEBOOK.md N43, rh/HUNCHES.md F, docs/KNOWLEDGE.md barriers; also
rh/specialists/operator/OBJECT_PHI.md section 3 makes claims about Colin de Verdiere (capacity zero).

## Checked before starting
INDEX.md, README.md, READER-1..4 memory files: nobody has read Bombieri-Garrett, Garrett, or Colin de Verdiere.

## Log
- 2026-11-11: seat started.
- 2026-11-11: paper 1 = arXiv 2002.07929 v1 (18 Feb 2020), title "Designed pseudo-Laplacians" (80 pp., only
  version). TeX via `curl -sSL https://arxiv.org/e-print/2002.07929` (gzip of one .tex) -> src/2002.07929/x/;
  clean copy clean.tex (4987 lines, 199,602 ch); PDF + paper.txt for numbering (statements numbered 1..78 with one
  global counter). READ WHOLE (all of clean.tex + all 356 comment lines checked; substantive comments: line 3108
  "%% not 1/a, I think... and need a>1...?!?" on Thm 29's functional equation; 4273-4277 commented-out remark that
  the flawed argument would give 100% for Epstein zetas too).
  KEY: Thm 4 (domain of Friedrichs ext. of restriction); Thm 10/Cor 11 (discrete spectrum > 1/4 of S~_theta, IF ANY,
  only at zeros of E theta on the line); Thm 16 (Lax-Phillips discreteness on E^0); Thm 18 (exotic eigenfunctions
  = truncated Eisenstein, zeros of a^w + c_w a^{1-w}); Thm 23 (two constraints theta, eta_a); Cor 28 (determinant
  non-vanishing); Thm 29 + Cor 30 (G(w,a) symmetric, zeros only on line and [0,1]); Thm 43 + Cor 46 (u_{theta,w}
  continues; u_w = u_{1-w} + theta E_w E_{1-w}/(1-2w)); Cor 47, 48, 49, 52; Cor 53 (zeros of a^w+c_w a^{1-w});
  sec 6.7 (the appealing but incorrect argument); Cor 59-62 interleaving; Prop 63, Thm 65, Thm 67, Cor 68 (spacing
  >= (1-eps)pi/log T); Cor 69 (94%, under RH + pair correlation); Rem 70-71; Thm 72-73, Prop 74, Cor 75-77.
  Space E^0 = L^2 closure of pseudo-Eisenstein series (cusp forms removed, constants kept); theta_d in
  E^{-1/2-eps} (sec 3.6; intro says E^{-3/4-eps}); delta^nc generic in E^{-1-eps} only.
  NEXT: write digest rh/library/2002.07929.md, then Garrett's notes.
- 2026-11-11: paper 1 DONE: digest 2002.07929.md, INDEX row appended. Starting paper 2 (Garrett notes, UMN pages).
