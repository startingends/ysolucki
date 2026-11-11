# READER-8 memory (reader seat, kept current)

Seat: READER-8. Writes only: `rh/library/<id>.md` digests, its rows appended to `rh/library/INDEX.md`, sources under
`rh/library/src/<id>/` (untrusted text, never executed), and this file. No commits, no pushes. Digests report; they
never recommend.

## Brief (lead, 2026-11-11)
Subject: mean values of |zeta M|^2 with Dirichlet polynomials of length T^theta; how far past theta = 1/2 and by
what input. Order: (1) Bettin-Chandee-Radziwill (theta < 1/2+1/66); (2) Conrey 1989 Crelle (4/7) or modern account;
(3) Farmer "Long mollifiers"; (4) Nyman-Beurling: Baez-Duarte-Balazard-Landreau-Saias (d_N^2 ~ C/log N), Burnol
lower bound. Answer (a) largest theta general/Moebius + input; (b) theta = infinity consequences and non-consequences;
(c) mollifier length vs NB distance; (d) stated barriers. Compare with NOTEBOOK N53, N57, IDEAS #34.

## Checked before starting
INDEX.md: no digest on mollifiers, twisted second moments, Nyman-Beurling, Farmer, Conrey. (Burnol math/9809119
is read but is a different paper.)

## Log
- 2026-11-11: seat started; memory file created.
- Sources fetched to src/: mollif_1411.7764/BCR.tex (BCR, only v1 exists, 84,747 ch), mollif_math_0103058/burnol.tex
  (Burnol lower bound, Adv. Math. 170 (2002), 34,308 ch), mollif_math_0306251/x/sos.tex (BDBLS "autocorrelation
  multiplicative partie fractionnaire" 92,063 ch; a .ps also in tar, not extracted), mollif_1211.5191/bcf.tex
  (Bettin-Conrey-Farmer "optimal choice of Dirichlet polynomials for NB", 18,458 ch).
- Farmer 1993 Mathematika 40, 71-87: Cambridge paywall, no open copy found in first search. BDBLS "Notes III"
  Adv. Math. 149 (2000): not found open yet.
- READ WHOLE: BCR 1411.7764 (1319/1319 lines). Key: Thm 1 theta<17/33 general a_n<<n^eps, error
  T^{3/20}N^{33/20}+T^{1/3}; input = Bettin-Chandee trilinear Kloosterman-fraction bound (Prop 2 = sum_a sum_{m,n}
  nu_a alpha_m beta_n e(a mbar/n)); DFI 1997 bilinear alone gives delta=1/190. Thm 2 conditional general trilinear
  (r,t): theta<1/2+(0.5-r)/(1+2(r+2t)); Conj 1 (r=t=0) => theta<1 => Lindelof (Cor 1). Appendix: Conj 1 best possible.
  Thm 3 (A=BC product, DI 1984 Acta Arith) => theta<1/2+1/10 (=3/5, "suitable lengths"). Thm 4 (Watt) smooth N=T^{1/2}
  times arbitrary K=T^{1/4} -> 3/4. Intro: BCH 1985 mollifier theta<1/2+1/34=9/17. Conrey 1989 cited, 4/7 not restated.
  Off-diagonal mechanism: m1 n2 - m2 n1 = Delta, Poisson in m2 mod n2 -> e(-h Delta nbar1/n2), h=0 gives main term
  (functional equation), h!=0 is the trilinear form with a=h Delta, A = N1N2/(d^2 T); theta>1/2 iff A>1.
- Next: Radziwill 1207.6583 "Limitations to mollifying" (barrier, d); Bettin-Gonek theta=infinity=>RH; Conrey 1989
  (GDZ?); then Burnol, BDBLS, BCF.
- Conrey 1989 found OPEN on GDZ: src/mollif_conrey1989/L0004.pdf (27 pp = GDZ cover + pp.1-26), no text layer, no OCR tool; reading as images pg-02..pg-27.
- READ WHOLE (as images): Conrey 1989, pp.1-26 all. Thm 1 kappa>=0.4077, kappa*>=0.401 (note in proof: 0.4088 with
  R=1.28, degree-7 Q). Thm 2: int_2^T |V B(sigma0+it)|^2 ~ c(P,Q,R) T for theta<4/7, B = sum mu(n)P(log(y/n)/log y)
  n^{-s+sigma0-1/2}, V=Q(-d/(L ds))zeta. Prop (sec 5), Lemmas 1-9. Error terms sec 8: M(N,U,V) sums of
  delta(n) n^{-s} b(ug)b(vg) e(n ubar/v); Lemma 8 hyp y<=T^{8/13}, bound (TN)^eps y^{2eta} T^c N^{-eta}
  (T^{-1/2}y^{7/8}+T^{-1}y^{7/4}); text says "since theta<7/4" = misprint for 4/7. Lemma 9 = case of DI 1984 Acta
  Arith Lemma 1 (bilinear incomplete Kloosterman: sum_v sum_b |sum_n sum_a c(a,n) e(n abar bbar/v)|), needs mu(u)
  split by VAUGHAN's identity (W=U^{1/4}) into c1 (bilinear, a,b>=W), c2 (u<=W trivial), c3 (mu*mu, Type I, Weil
  bound for Kloosterman when A<<U^{1/4}). Constraints y<<T^{4/3}, T^{2/3}, T^{8/13}; binding T^{-1/2} y^{7/8} -> 4/7.
- READ WHOLE: Bettin-Gonek 1604.02740 (14,698 ch; Mathematika 63 (2017) 29-33). Thm 1: I_N(0,T)<<T^{1+eps} for 2<=N<=T^theta => no zeros Re s>1/2+1/(2theta). Thm 2: same with [T,2T] => Re s>1/2+2/theta (best possible: one off-line zero consistent with theta<4). Proof: Mellin of M_x log x = 1/((w-1)^2 zeta(w-1/2+it)); test G_t with pole at rho0; weight x^{2beta0}/(1+t)^4 lives at BOUNDED t. Farmer: theta=inf => kappa=1, stronger form => pair correlation (via BG intro).
- READ WHOLE: Radziwill 1207.6583 v? (molliff43.tex 65,866 ch; graph.eps not opened). Thm 1 (uncond.): for every
  theta>0, all M of length T^theta with a(1)=1, a(n)<<n^eps: (1/T)int_T^{2T}|1-zeta M|^2 >= c/theta, c absolute.
  Prop A: >= (1+O(eps))/(1+theta+1/A) * Card(S)/((T/2pi)log T) for S a 2piA/logT-spaced set of zeros (on line).
  Prop B (Soundararajan): theta<1/2 => I(M)>=1/theta+o(1), minimiser Levinson-type L_theta (Selberg quadratic form).
  Thm 3 (RH): I >= (1/2 + int_1^{1+theta+eps} F(alpha,T))^{-1}; Thm 2 (RH+PCC): I >= 1/(0.5+theta). Corollary
  in intro: Conrey 4/7 + Thm 3 => int_1^{1+theta}F >= theta-1/2+o(1) for 1/2<theta<4/7. Re-proves BDBLS
  int|(1-zeta M)/(1/2+it)|^2 >= C/log N "elementarily" (stated, not proved in this text). Method: Sobolev-type
  identity for Dirichlet polynomials + Beurling-Selberg majorant; 1-zeta M = 1 at zeros on the line.
- READ WHOLE: Burnol math/0103058 (762/762 lines). Thm (BDBLS, quoted): liminf_{lam->0} D(lam) sqrt(log 1/lam) >= sqrt(sum_rho 1/|rho|^2) (zeros counted once). Burnol main thm: >= sqrt(sum_rho m_rho^2/|rho|^2). D(lam)=dist of chi_{(0,1]} to span{rho(theta/t): lam<=theta<=1} in L^2(0,inf) (CONTINUOUS dilations, Balazard variant). Toy model: N E(N) -> sum m_alpha^2 |P(alpha)|^2 for MA(q) on circle (Grenander-Rosenblatt). Vectors X^lam_{rho,k} orthogonal to C_lam built from Baez-Duarte phase operator V=(1-M)^2 U, uses BDBLS Lemme 6. Speculation (not proved): bound is exact order; numerics of BDBLS support.
- BDBLS math/0306251 (sos.tex 3338 lines, 'document de travail' for Ramanujan J paper on A(lam)=int {t}{lam t}dt/t^2): PARTLY: lines 1-97 (intro), 2573-2780 (Hilbert space, A defined; MA(s)=-zeta(-s)zeta(s+1)/(s(s+1)); A(1)=log 2pi - gamma), all statements 2780-3338 (A(p/q) via Vasyunin sums V(p,q)+V(q,p): Prop t125; local expansion at p/q: |t|log|t|/(2p)+...: Prop t128). Sections 1-6 prerequisites (Mellin, Gamma, Vasyunin sums, Estermann) NOT read. Does NOT contain the d_N conjecture. Notes III (Adv Math 149, 2000): ScienceDirect 403 (bot wall) -> not obtained; not circumvented.
- READ WHOLE: BCF 1211.5191 (bcf.tex 18,458 ch). Thm 1: RH + sum_{|gamma|<=T} 1/|zeta'(rho)|^2 << T^{3/2-delta} => (1/2pi)int|1-zeta V_N|^2 dt/(1/4+t^2) ~ (2+gamma-log 4pi)/log N, V_N = sum mu(n)(1-log n/log N) n^{-s}. Proof = contour shift, Lemma 2 (unconditional) V_N = (1/zeta)(1 - zeta'/zeta /log N) + (1/log N) sum_rho Res N^{z-s}/(zeta(z)(z-s)^2) + F_s(1/N)/log N; main term from double poles at zeros: log N/|rho|^2 each. Uses Lindelof (from RH). Intro: Balazard-de Roton under RH d_N^2 << (loglogN)^{5/2+eps}/sqrt(log N); BDBLS 2000/2005: liminf d_N^2 log N >= sum 1/|rho|^2 (unconditional); Burnol m^2. Thm 2 polynomial analogue (Grenander-Rosenblatt). Landreau-Richard numerics suggested V_N not optimal; BCF contrary.
- Balazard-de Roton 0812.1689 (bdr8.tex 1236 lines): PARTLY: intro + sec 2 (Prop t24, t27, t57 statements) + sec 'Majoration de I_{N,eps}' whole (lines 198-410, 1064-1236). Thm (RH): d_N^2 << (loglogN)^{5/2+delta}(log N)^{-1/2}; approximant -sum mu(n) n^{-eps} e_n (NOT Levinson weights); Baez-Duarte 2003: RH => d_N^2 << (loglogN)^{-2/3}. KEY: heights |tau|>=N^{3/4} bounded via |zeta|<<tau^{1/4} + Montgomery-Vaughan: int_T^{2T}|zeta|^2|M_N(s+eps)|^2 <= T^{1/2}(T+O(N))log N (unconditional piece). Small heights |tau|<=N^{3/4}: pointwise RH bound zeta^{-1}-M_N << N^{-eps/4}(1+|tau|)^{1/2-beta(tau)} (Soundararajan-type). Reader's arithmetic: trivial tail bound makes T>=N^{2/3+eps} harmless for ANY |a_n|<=1 (vs N53's N^{7/4}).
- PRZZ 1802.10521 (RMS_PRZZ.tex 247,248 ch, RMS 2020): PARTLY: abstract, sec 1 whole (lines 105-375), sec 4 whole (Thm 4.1 'meanvalueintegral' + proof, 762-912), sec 9 whole. Thm meanvalueintegral: error E = T^{3/20}N^{33/20}+N^{1/2}T^{1/2+eps} (general, BCR); T^eps(N^{11/6}+N^{11/12}T^{1/2}) (mu^2 * (mu*Lambda^k...), Pratt-Robles 6/11); T^eps(N^{7/4}+N^{7/8}T^{1/2}) (mu*Lambda_1^{k1}*...*Lambda_D^{kD}, => 4/7). Proof: separate d,n1; Heath-Brown identity -> Type I (Weil bound incomplete Kloosterman) + Type II (DI Acta Arith Lemma 1), W=U^{1/4}. History in intro: BCH 9/17 (Vaughan+Weil); Conrey 4/7 (DI); Robles-Roy-Zaharescu 48/95 via DFI bilinear (unpublished 2016); BCR 17/33. Imprecision: PRZZ sec 9(3) says BCR 17/33 is 'the best size one can take' for unknown a_n - BCR prove no such optimality. Thm 1.? kappa>0.417293, kappa*>=0.407511.
- DIGESTS WRITTEN: bcr-1411.7764.md, conrey-1989.md, bettin-gonek-1604.02740.md (incl. Farmer secondary sec 8), radziwill-1207.6583.md, burnol-lower-bound-0103058.md, bcf-1211.5191.md. TODO: balazard-deroton-0812.1689.md, przz-1802.10521.md, bdbls-0306251.md (short), INDEX rows, final report.
- INDEX rows appended (9 rows). Remaining: final report via SubagentHandback.
- 2026-11-11: all digests + INDEX rows done; final report sent to lead via SubagentHandback. Seat finished.
