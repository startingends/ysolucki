# READER-4 memory (kept current)

Task: digest the OpenAI "quasi-Riemann hypothesis" papers (Oct 2026), short route first, then main paper,
exposition, follow-ups, press (verification status only). Digest rules: rh/library/README.md + INDEX.md.

## Sources obtained (all under rh/library/src/, untrusted, read as text only)
- qrh-short/6.pdf  (49 pages; pdftotext -layout -> 6.txt, 190,998 chars, 3074 lines). Title "The Quasi-Riemann
  Hypothesis", author "OpenAI", dated October 5, 2026 (PDF built 6 Oct 2026). Theorem 1.1: Re s > 11/12.
- qrh-main/5.pdf   (199 pages; 5.txt layout 816,646 chars / 5raw.txt 625,637 chars). Title "The Quasi-Riemann
  Hypothesis: A Zero-Free Half-Plane Re(s)>7/8".

## Status
- [x] paper 1 (6.pdf) READ WHOLE: lines 1-3074 of 6.txt (all sections 1-7, appendices A, B, references).
- [ ] digest qrh-short-11-12.md  (to write next)
- [ ] paper 2 (5.pdf)
- [ ] exposition (judegomila), follow-ups (Liu arXiv; Cureton-Thorner), Quanta (status only)
- [ ] INDEX.md rows

## Paper 1 mechanism in brief (for recovery after context loss)
1/L = sum mu*nu*N^-s  -> need A_1(D)=sum mu(n)nu(n)W(N n/D) << D^{11/12+eps}.
Family A_u(D)=sum mu(n)nu(n)(u/n)_6 W; (p^6/n)_6 = 1_{p∤n} so A_{p^6}=A_1+O(D/Y).
Prop 3.1: sum_{N(u)<=D^{1+th}} |A_u|^2 << D^{2+th+eps}  (optimal large-sieve size for THESE coefficients).
Positivity: drop all rows except u=p^6, N(p)~H^{1/6}: |A_1|^2 << D^{1+eps}H^{5/6}+D^2H^{-1/3} -> 11/12.
Proof of 3.1: Poisson in u -> sextic Gauss sums; Gauss-Jacobi: mu(n)*conj(g_6) -> cubic Gauss sum gamma_2(n)
(gamma_2^3 = mu*alpha); cubic Gauss sums = Fourier coeffs of Kubota cubic theta (Patterson); complete with
cubes nb^3; theta automorphy (Voronoi-type, Gamma(s+1/3)Gamma(s+2/3)) turns sextic twist chi_k into
QUADRATIC chi_k^3; quadratic large sieve (Heath-Brown / Goldmakher-Louvel) gives H+H^2 N(f)/X (Prop 5.2);
remove cubes by Moebius inversion: short part by 5.2, long part = same mean square at column scale X/N(b)^3;
transfer (Prop 5.4): two Poisson summations (Gauss -> Moebius -> Gauss) with enlargement by positivity,
return to same family with H'/Sigma' <= H/Sigma, H' <= D^{-2kappa}H; finite induction (Prop 5.1).
My re-derivation flags: Appendix A.1 writes gamma1*gamma2 = chi_p(4)*gamma3*gamma2^3; rearranging their own
Gauss-Jacobi line gives conj(chi_p(4)) instead (harmless: G only needs to be a unit-modulus ray-class function).

## Update 2 (after digest 1)
- [x] digest written: rh/library/openai-qrh-11-12.md (sections 1-13, incl. "Design choices" section 12 requested
      mid-task by the coordinator for the owner: BOTH digests need a section "Design choices of the proof"
      (published text only; per choice: needed / chosen / buys / alternatives said to fail / classical idea+citation;
      plus exactly what the text says about the limit of the method, papers vs commentary) and the FINAL MESSAGE
      must contain a ten-line ordered list of design choices.
- COMPUTED check (scratchpad gauss_check.py.txt): gamma2^3=-alpha OK; gamma1*gamma2 = mu*alpha*chi(4)*gamma3 as
  printed is FALSE (needs conj(chi(4))); harmless.
- Web pages fetched to rh/library/src/qrh-web/: result003.html, gomila.html, quanta.html, hexagon.html, explorer.html
  (all HTTP 200; not yet read).
- Paper 2 grep hints: "beta* = supremum of 1/2 and real parts" (extremal/continuation principle, line ~293 of
  5raw.txt); "Lemma 17.6 (Sixth-power amplification)"; "Let 3/4 <= kappa <= 1 ... beta* <= (1+kappa)/2" (sec 18);
  kappa = 3/4 + 2Delta in (3/4, 5/6].
- NEXT: read 5raw.txt (16,454 lines) in order; then digest openai-qrh-7-8.md; then web pages; INDEX rows.

## Update 3 (paper 2, reading log; file 5raw.txt = 16,454 lines / 625,637 chars)
Read so far: lines 1-2700 (abstract, intro + proof overview, sec 2 Prop 2.1, sec 3 statement, sec 4 all, sec 5.1
most of Prop 5.1 proof).
KEY STRUCTURE of paper 2 (differs from paper 1!): contradiction on beta* = sup{1/2, Re rho over ALL primitive
finite-order Hecke chars of F=Q(sqrt-3)} (eq 2.1). Prop 2.1 "Continuation from a common signal": if for each target
eta there is J_eta(Z) with |J| << Z^{C(sigma0)+omega} (LOW estimate, direct) and |J - f_eta| << Z^{C(beta*)-sigma}
(HIGH estimate), f_eta(Z) = (1/2pi i) int_{Re s=2} Z^{C(s)} e^{(s-5/6)^2} H_eta(s)/L^S(s,eta) ds, omega<Delta0,
margins uniform in eta => contradiction with beta*>sigma0. Part I: sigma0=11/12, C(s)=s-2/3; Part II: sigma0=7/8,
C(s)=s-11/16. J = "completed base sum/probe": average of smoothed cubic-theta coefficients against sextic chars and
target eta, with TWO exact representations: (a) cubic theta reflection (Prop 5.1 = paper 1's Prop 6.2) + quadratic
large sieve + planar additive large sieve + Cauchy-Schwarz -> low estimate (Prop 6.3); (b) Poisson in the averaging
variable: nonzero frequencies u*a^6 (u sixth-power-free), each row = quotient of Hecke L-functions x Euler product
(Lemma 7.1 local identity); u=1 row contains 1/L(s,eta) = the signal. Other rows: "zero detector" (sec 8) -> if a
row has a zero above the floor, it yields two large Dirichlet polys (inverse one with mu, plain one) -> sextic large
sieve (Lemma 9.1, with (MN)^{2/3}-type term) counts such rows (Prop 9.2). Uses Hecke functional equation (Lemma 4.8
convexity) + Borel-Caratheodory log control on zero-free disks (Lemma 4.9). Part II: prime compensation, asymmetric
scales, two moment estimates: Lemma 17.1 marked inverse moment (second moment of inverse polys x prime sums; two
Poisson transforms recursion; = ancestor of paper 1's Prop 3.1/5.1), Lemma 18.1 fourth-moment type for products of
two plain polys (kappa in [3/4,1]); Lemma 17.6 sixth-power amplification; Prop 19.2 row counts; Lemma 20.2 endpoint
certificate; Prop 20.3 order of choices.
Statement line offsets in 5raw.txt: Prop 5.1 @1780, Lemma 5.8 @3475, Lemma 6.1 @3811, Prop 6.3 @4051, Lemma 7.1
@4430, Lemma 8.1 @4715, Lemma 9.1 @5033, Prop 9.2 @5556, Lemma 10.5 @6482, Prop 11.2 @6807, Prop 11.3 @6908,
Part II starts ~7020; Lemma 14.3 @8074; Prop 15.3 @8858; Prop 16.1 @9147; Lemma 17.1 @9553; Lemma 17.6 @12594;
Lemma 18.1 @12736; Prop 19.2 @15071; Remark 19.3 @15322; Lemma 20.1 @15614; Lemma 20.2 @15929; Prop 20.3 @16142.

## Update 4 (paper 2 read PARTLY: 269,743 / 605,202 chars = 44.6% of 5raw.txt)
Line ranges READ: 1-3900; 3950-4210; 4235-5085; 5530-5660; 5760-5960; 6236-6295; 6690-7260; 9500-9660;
12556-12855; 14868-15170; 15300-15430; 15606-15665; 15820-16454 (incl. all 28 references).
NOT read: 3900-3950, 4210-4235, 5085-5530 (proof of sextic sieve), 5660-5760, 5960-6690 (sec 10.2-10.8 contour
moves, except 6236-6295), 7260-9500 (sec 13.2-16), 9660-12556 (sec 17.3-17.6 proofs), 12855-14868 (sec 18 proof),
15170-15300, 15430-15606, 15665-15820.
Extra facts gathered:
- Part I: low estimate Prop 6.3 I_eta(Z^1/2,Z^1/2,Z) << Z^{1/4+eps} = (reflected energy Z^{1+eps} by Lemma 5.8
  [theta reflection + quadratic large sieve]) x (planar additive large sieve Lemma 6.1/6.2 for Gauss-sum fractions
  d/s), Cauchy-Schwarz. High side: Poisson in m; frequencies H=u a^6; Lemma 7.1: F_{eta,u}(x,w,z) =
  zeta_F^S(6z) L^S(w,chi.(u)) / L^S(x, eta chi.(u)) * H_{eta,u}; u=1: residues at w=1, z=1/6 give c_S f_eta with
  Z^{C_I(s)}, C_I(s)=s-2/3 (X^{1/2-z} Z^{s+z-1} at z=1/6, X=Z^{1/2}); 11/12 = 2/3 + 1/4.
  Other rows: bins (i,a) from zero-free buffered rectangles for the finite family X_u (Lemma 8.1; uses Hecke FE on
  reflected line, Lemma 4.8 convexity Q^{3/5}, Borel-Caratheodory+three circles Lemma 4.9); zero detector
  (Prop 8.3: inverse witness |M_r|^2 >= U^{delta r}, plain witness |S_m|^2 >= U^{delta m}, m<=1/2, delta=2a-1);
  sextic large sieve Lemma 9.1 (K+D+(KD)^{2/3}) -> row envelope R(delta)=min{1,max(1-delta/2,4/3-delta)}
  (Prop 9.2); central exponent E_I(d); margins: intermediate rows 1021/25000, smallest 1/1200 (principal z
  remainder); Prop 11.2 saving 1/4800.
- Part II: assume 7/8 < beta* <= 11/12, Delta=beta*-7/8 <= 1/24, kappa=2beta*-1=3/4+2Delta<=5/6. Geometry
  b=1/8, h=13/16, l=1/6, lx=17/48, ly=23/48; C_II(s)=s-11/16, C(7/8)=3/16. Modified probe (12.5): K prime slots,
  marked term eta(p) I_{eta;p}(X,Y,Zq_p) minus rescaled q_p^{-3/2} I_eta(X/q_p,Y/q_p,Z) ("local compensation
  cancels the scalar prime contribution, leaving the sextic-character prime factor"). Lemma 17.1 marked inverse
  moment: sum_{u<<Z^m} |M_u(Z^r) Q_u|^2 << Z^{m+eps} if r+2z<=m-c1, 2r+8z<=3m-c2 (proved via canonical family
  Lemma 17.2 = Gauss coefficients, two masked Poisson transforms, terminal = reflected energy Lemma 14.3).
  (17.87): sum_{u<=H}|D^{-1/2} sum mu nu chi_n(u) W|^2 << H(HD)^eps for H>=D^{1+c}  [= paper 1's Prop 3.1].
  Lemma 17.6 sixth-power amplification: sum over sixth-power-free u~U: |M_u(D)|^2 << max{U, U^{1/6}D^{5(1+c)/6}};
  e(r)=max{1,(1+5r)/6}. Lemma 18.1 fourth moment: sum_k |S(n1)S(n2)Q|^2 << Z^{M+eps}, kappa in [3/4,1], case z>0
  needs n1+n2+6kappa z <= M and (if kappa<1) beta* <= (1+kappa)/2. Applied with kappa=2beta*-1 "by equality".
  Prop 19.2 row counts Rshort(t), L(t)=1-delta+(alpha-delta)(t-1), alpha=5/6. Lemma 20.2 endpoint certificate:
  -E* >= 49/440640 (explicit polynomial identity (20.9)). Final margins m_lo=Delta, m_hi=(51/64)Delta.
- Paper 2 states NO barrier / limit of the method, no open questions; only "does not establish RH ... RH remains
  open [5]". Only one Remark (19.3).
- Paper 2 cites an independent OpenAI manuscript [23] "An unconditional first moment for cubic Gauss sums"
  (Sept 25 2026), not used.
NEXT: read web pages (rh/library/src/qrh-web/*.html) -> digest openai-qrh-7-8.md (with Design choices + status)
-> INDEX rows -> final handback with ten-line list of design choices.
