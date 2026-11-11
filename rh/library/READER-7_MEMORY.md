# READER-7 memory (reader seat, kept current)

Seat: READER-7. Writes only: `rh/library/<id>.md` digests, its rows appended to `rh/library/INDEX.md`, sources
under `rh/library/src/<id>/` (untrusted text, never executed), and this file. No commits, no pushes. Digests
report; they never recommend.

## Brief (lead, 2026-11-11)
Subject: exact spectral formulas (Kuznetsov / Bruggeman-Kuznetsov / pre-trace) on the cubic metaplectic cover of
SL_2 over Q(sqrt(-3)); spectral large sieve there. Order: (1) Livne, Patterson; (2) Kodama et al. Kuznetsov for
metaplectic over Q(omega); (3) Dunn-Radziwill 2109.07463 spectral input; (4) Heath-Brown-Patterson 1979 as far as
open; (5) spectral large sieve on the cubic cover. Answer (a)-(d); compare with rh/NOTEBOOK.md N53, N55 and
rh/specialists/modular/SHORT_FAMILY.md (exact formula for S(H,D) when H < D?).

## Checked before starting
INDEX.md (55 lines): no digest on cubic Gauss sums, metaplectic forms, Kuznetsov.

## Log
- 2026-11-11: seat started.
- Sources fetched (src/): cubic_2109.07463 (Dunn-Radziwill TeX), cubic_2403.13151 (Dunn TeX), cubic_1107.0197 (Louvel TeX),
  cubic_2502.18366 (Kaneko; only for the Kodama citation), kodama2004/kodama.pdf (70 pp., Japanese, Koyama's site),
  hbp1979/hbp.pdf (GDZ open, 21 pp.). Livne-Patterson Invent. 148 (2002): Springer paywall, no open copy found.
- FINDING: Kodama 2004 = "The Kuznetsov formula for 3-dimensional arithmetic manifolds" (Japanese thesis): Thm 1.8 is
  the NON-metaplectic Kuznetsov formula for SL(2,Z[omega]) (plain Kloosterman sums, no cubic character).
- READ WHOLE: Louvel 1107.0197 (104,943 / 104,943 ch TeX). Key: Thm 4.1-4.3 = Bruggeman-Kuznetsov (spectral sum formula +
  Kloosterman sum formula) on Gamma_d subset Gamma_1^- with Kubota character kappa, from Lokvenec-Guleska thesis 2004;
  geometric side = cubic Kloosterman sums K_3(m,n,c) (Kloost. twisted by (x/c)_3); S(a,c)=K_3(a,a,c) (Patterson 1997 Thm 3.1);
  theta residual at s=1/3 (eigenvalue 8/9) gives X^{5/6} main term in sum S(1,c)/sqrt N(c), c=0 mod d. Thm 1.3, Cor 1.4, 1.5.
  Next: write louvel digest, then Dunn-Radziwill.
- Dunn-Radziwill 2109.07463 (263,959 ch TeX): READ sec 1-5 (intro, Poisson Cor 4.4, theta/Voronoi Prop 5.x statements and
  Cor 5.5/Prop 5.7 proofs partly), sec 8 whole (Thm 8.1 HB cubic sieve, proof of Thm 1.4 optimality, Prop 8.2, 8.3 with proof).
  Spectral input = ONLY Kubota-Patterson cubic theta (residual spectrum) automorphy -> level-aspect Voronoi; NO Kuznetsov,
  no cusp forms, no spectral large sieve. Prop 8.3: Poisson in family var a -> dual k-sum length B^2/A; off-diagonal
  bounded via GRH axiom -> error B^{2+2eta}: no gain when A<B. Sections 6,7,9-12, appendix: NOT read.
- Dunn 2403.13151 (218,440 ch TeX v5): READ sec 1 (intro, Thm 1.1, Cor 1.2, Lemma 1.3, Thm 1.4, Prop 1.5, sketch), sec 2.3,
  sec 3 (Kubota char, cubic Shimura lift: on Gamma_2 theta at tau=4/3 is the only non-cuspidal eigenform, all cusp
  forms tempered-in-parameter Re tau=1; cubic Kloosterman sums Lemmas 3.1-3.3), sec 4 (HB cubic sieve variant).
  NOT read: sec 5-12 (circle method, Voronoi for cusp forms, Type I/II proofs). No Kuznetsov, no spectral large sieve.
- Next: search Lokvenec-Guleska thesis (Utrecht 2004) = likely the actual source of "Kuznetsov with multiplier over Q(omega)";
  search spectral large sieve on metaplectic cover; try Livne-Patterson open copy once more.
