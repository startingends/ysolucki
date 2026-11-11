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
- 2026-11-11: paper 2 (Garrett). UMN host's TLS chain ends at "emSign Root CA - G1", absent from the system
  store; fixed by using Mozilla's bundle from curl.se (curl --cacert <scratchpad>/ca/combined.pem = proxy CA +
  Mozilla roots). Not a bot check / access control. Files in src/garrett/: v_index.html (vignettes page),
  concise_statement_Poland.pdf (23 Aug 2026, 1 p.), exercises_for_Poland.pdf (2 pp.), Poland_biblio.pdf (13 pp.,
  keyword-scanned only), bristol_2018.pdf (19 pp.), pseudo-cuspforms.pdf (12 Aug 2011, 10 pp.), cdv_eis.pdf
  (1 Nov 2025, 28 pp.), iconic_error.pdf (2 pp.), simplest_afc_schrodinger.pdf (5 Aug 2026, 6 pp.),
  Bombieri-Garrett_current_version.pdf (= arXiv v1 word for word, typography only). ALL READ WHOLE except the
  bibliography. KEY: 2011 notes report CdV 1983's realness criterion (integral = 0) and "Bombieri notes (email
  02 Aug 2011) that the numerical conjecture made (in effect) by Colin de Verdiere does not hold"; Bristol sec. 4
  Corollary: resolvent E0->E0 does NOT continue past Re w = 1/2, does as E0 -> C^0; 2026 concise statement adds
  D > 0 (Maass cycles / closed geodesics). NEXT: Colin de Verdiere AIF on Numdam.
- 2026-11-11: paper 3 (CdV) obtained OPENLY from Numdam (numdam.org/item/10.5802/aif.890.pdf and aif.917.pdf; no
  login, no bot check) -> src/cdv/I/aif890.pdf (13 pp., pdftotext 23,663 ch) and src/cdv/II/aif917.pdf (28 pp.,
  52,162 ch). BOTH READ WHOLE (OCR text; pages 276, 284 of I and 108, 109 of II also viewed as images).
  KEY I: Thm 1 (d=2,3: deficiency index 1, extensions Delta_{alpha,x0}, f ~ lambda(sin a G(r) + cos a)); Lemma 2,
  Thm 2 (spectrum: F(lambda;x0) = cot a); Thm 3 + Corollary (Gamma = PSL2(Z), z0 = j: eigenvalues of Delta_{a,j}
  = s(1-s) with zeta_K(s) = 0 and F(s,j) = cot a, or Delta_inf-eigenvalue with eigenfunction vanishing at j);
  "alpha depends probably on the zero"; Thm 4 (a.e. (z0,a): no eigenvalues except multiple ones of Delta_inf).
  KEY II: Thm 1 (domain of Delta_a), Thm 2, 3, 4 (mero continuation of E), Thm 5 (spectrum of Delta_a, type I/II,
  Lax-Phillips zeros for a >= b = 1), Thm 6 (Weyl law), Thm 7 (generic metric: no cusp forms), Thm 8 (Poisson
  relation), sec. 7 CONJECTURE: type II eigenvalues of Delta_{sqrt3/2} are s_j(1-s_j) for ALL zeros s_j of
  zeta_{Q(sqrt-3)} ("plus forte que RH"); evidence: f_j = pi_c R(s_j, rho, .) in H_{sqrt3/2} (Motohashi);
  sufficient: int |E(rho,1/2+ir)|^2 dr/(s_j(1-s_j) - 1/4 - r^2) = 0; minimax table r_j(1) <= r'_j; counting.
  NEXT: write garrett-notes.md, cdv-pseudo-laplaciens-1982.md, cdv-pseudo-laplaciens-1983.md; INDEX rows; handback.
- 2026-11-11: container restart (coordinator notice). Checked: all sources under src/2002.07929, src/garrett, src/cdv, the digest 2002.07929.md and its INDEX row survived; nothing re-fetched. Continuing with the three remaining digests.
