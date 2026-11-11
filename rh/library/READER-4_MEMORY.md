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
