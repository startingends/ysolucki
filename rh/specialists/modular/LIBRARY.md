# LIBRARY of seat SP-modular (grows; first version 2026-11-11, session 1)

Each entry: exact statement with hypotheses, source, READ STATUS. "Read" means the text was on my screen this session
(TeX source, or text extracted from a PDF), not a search snippet. Statements marked "from memory" must be re-checked
before use. Downloads are under rh/library/src/sp_modular_* (untrusted text; nothing executed from them).

## Sources and how much of each was read (session 1)
| source | where | how much read |
|---|---|---|
| D. Zagier, "Eisenstein series and the Riemann zeta-function", in Automorphic Forms, Representation Theory and Arithmetic (Bombay 1979), Springer 1981, 275-301 | `sp_modular_zagier1981/z1.txt` (pdftotext of the scan on the author's page; 62k characters; formulas badly garbled, reconstructed from context) | ALL 27 pages: sec. 1-5 and bibliography |
| J. Lagarias, M. Suzuki, "The Riemann hypothesis for certain integrals of Eisenstein series", arXiv math/0412039 (J. Number Theory 2006) | `sp_modular_lagarias_suzuki/paper.tex` (70k) | abstract, all of sec. 1, statement and first lines of proof of Thm 2.1, sec. 3 up to eq. (405) (Hejhal's lemma with the Maass-Selberg relation), sec. 5 (concluding remarks): about 35%. Proofs of Thms 1.2, 1.3, sec. 4 and the appendix NOT read |
| J. B. Conrey, A. Ghosh, "On the Selberg class of Dirichlet series: small degrees", arXiv math/9204217 | `sp_modular_conrey_ghosh/cg.txt` (pdftotext; some symbols lost) | sec. 1, sec. 2, start of sec. 3 (lines 1-330 of 857): about 38%. Sec. 4 (consequences of Selberg's conjectures) NOT read |
| V. Blomer, F. Brumley, "On the Ramanujan conjecture over number fields", arXiv 1003.0559 (Annals 2011) | `sp_modular_misc/1003.0559/paper.tex` | introduction 1.1-1.2 only (about 6%) |
| J. S. Milne, "The Riemann Hypothesis over finite fields: from Weil to the present day", arXiv 1509.00797 | `sp_modular_misc/1509.00797/pRH.tex` | the subsection "Landau, Rankin, and the Ramanujan conjecture" and the Deligne interview paragraph before it (lines 3670-3850): about 3% |
| arXiv 1809.07605, "Renormalization of integrals of products of Eisenstein series and analytic continuation of representations" | `sp_modular_misc/1809.07605/paper.tex` | the Maass-Selberg lemma and its proof (lines 620-660); passages of the introduction met by grep |
| L. Long, "Finite index subgroups of the modular group and their modular forms", arXiv 0707.3315 | `sp_modular_misc/0707.3315/` | two passages on Hecke operators (lines 212-226, 836-856) |
| arXiv 2011.07796, "Maass lifts of half-integral weight Eisenstein series and theta powers" | `sp_modular_misc/2011.07796/paper.tex` | abstract lines, the lemma "thetaeigenform" with proof, the decomposition of Theta^3,5,7 into Eisenstein series |
| A. Bondarenko, D. Radchenko, K. Seip, arXiv 2005.02996 | `rh/library/src/2005.02996/brs.tex` and the digest `rh/library/brs-fourier-interpolation.md` | digest in full; in the source: definition of moderate growth, of M_k(Gamma_theta, eps), Prop. 3.1 and the lines around it |
| G. Cornelissen, O. Lorscheid, "Toroidal automorphic forms for some function fields", arXiv 0710.2994 (J. Number Theory 2009) | `sp_modular_misc/0710.2994/toroidalAMS.tex` (24k) | ALL |
| O. Lorscheid, "Toroidal automorphic forms for function fields", arXiv 1012.3223 | `sp_modular_misc/1012.3223/paper.tex` (122k) | abstract, introduction, Corollary (label cor_zagier) and its remark, Theorem (label thm_tempered) with proof: about 10% |
| G. Cornelissen, O. Lorscheid, "Toroidal automorphic forms, Waldspurger periods and double Dirichlet series", arXiv 0906.5284 | `sp_modular_misc/0906.5284/paper.tex` | abstract and first 5k characters of the introduction |
| E. Lapid, S. Rallis, "On the nonnegativity of L(1/2, pi) for SO(2n+1)", Annals 157 (2003), arXiv math/0402371 | `sp_modular_misc/math_0402371/LapidArchive.tex` | abstract and the first two thirds of the introduction (lines 200-330 of the file) |
| arXiv 2609.28514, "Noncongruence cusp forms, Veech groups and enumeration" | `sp_modular_misc/2609.28514/main.tex` | one paragraph of the introduction (Serre-Berger, bounded denominators, Calegari-Dimitrov-Tang) |
| SP-operator's digest of Suzuki 1606.05726 | `rh/library/suzuki-1606.05726.md` | digest in full; the paper itself NOT read by me |
| K. Groechenig, arXiv 2007.12889 (Schoenberg's totally positive functions and zeta) | `sp_modular_misc/2007.12889/zeta.tex` | abstract, introduction, statements of the theorems (Schoenberg's PF <-> 1/Laguerre-Polya; RH equivalents). Proofs NOT read |
| C. Newman, W. Wu, arXiv 1901.06596 (constants of de Bruijn-Newman type) | `rh/library/src/1901.06596/x/Bulletin.tex` (already downloaded by another seat) | sections on Polya's universal factors and de Bruijn's results (source lines 332-600) |
| A. Dunn, M. Radziwill, "Bias in cubic Gauss sums: Patterson's conjecture", arXiv 2109.07463 (Ann. Math. 2024) | `sp_modular_misc/2109.07463/output.tex` | section 5.1 only (lines 796-980): Gamma_2, Kubota's character, the Fourier expansion of theta and Patterson's coefficient formula (5.7). Rest NOT read |
| E. Bombieri, P. Garrett, "Designed pseudo-Laplacians", arXiv 2002.07929 | `sp_modular_misc/2002.07929/paper.tex` (206k) | abstract, table of contents, introduction up to the interleaving property: about 10%. Sections 2-8 NOT read |
| rh/HUNCHES.md; digests `rh/library/openai-qrh-11-12.md`, `openai-qrh-7-8.md` (READER-4) | in the repository | HUNCHES whole; first digest whole; second digest sections 1-3 (to line 120). The two papers themselves NOT read |
| F. Stromberg, arXiv math/0611148 (Hecke operators, eta multiplier) | `sp_modular_misc/math_0611148/` | grep lines only: NOT read |

NOT READ, and used only "from memory" below: Lax-Phillips (the AMS site answers automated requests with a bot-check
page; not circumvented); Pavlov-Faddeev 1972; Zagier, "The Rankin-Selberg method for automorphic functions which are not
of rapid decay" (1981; no copy found); Hejhal 1990; Jacquet-Shalika; Rudnick-Sarnak; Luo-Rudnick-Sarnak; Kim-Sarnak;
Wohlfahrt 1957; Berndt-Knopp; Iwaniec's books; Hamburger 1921, Hecke 1936, Weil 1967, Bochner (converse theorems, primary
sources); Langlands 1971 "Euler products"; Gindikin-Karpelevich; Moeglin-Waldspurger; Selberg 1992; Kaczorowski-Perelli;
Waldspurger; Shimura 1973; Lehmer 1948; Lagarias math/0601653.

Web searches run (2026-11-11, summaries only): (1) Zagier Eisenstein series Riemann zeta 1981 pdf [found the scan];
(2) Maass-Selberg truncation T<1 overlapping cuspidal neighborhoods norm zeta zeros [found Lagarias-Suzuki; nothing on
T < 1 as a norm identity]; (3) Blomer Brumley role of the Ramanujan conjecture Rankin-Selberg Landau; (4) Wohlfahrt 1957
Hecke operators real weight [citation confirmed, statement not found]; (5) Sarnak notes generalized Ramanujan Landau
[found Milne's survey passage]; (6) Hecke operators rational weight noncongruence Berger Serre [found Berger's theorem
in Long's survey]; (7) rational weight Hecke operators universal cover metaplectic kernel [nothing found]; (8) Zagier
Rankin-Selberg not of rapid decay four zeta functions [formula not found]; (9) Cornelissen Lorscheid toroidal [found];
(10) Lapid Rallis nonnegativity [found]; (11), (12) r_s(n)/2s multiplicative iff 1, 2, 4, 8 / Lehmer 1948 [not found].

---
## A. Eisenstein series, scattering, Maass-Selberg

**M1. Eisenstein series for PSL2(Z).** E(z,s) = sum over Gamma_inf\Gamma of Im(gamma z)^s (Re s > 1); E*(z,s) =
pi^(-s) Gamma(s) zeta(2s) E(z,s) is regular except simple poles at s = 0, 1 and E*(z,s) = E*(z,1-s). Fourier expansion:
E*(z,s) = zeta*(2s) y^s + zeta*(2s-1) y^(1-s) + 2 sqrt(y) sum_{n>=1} n^(s-1/2) sigma_(1-2s)(n) K_(s-1/2)(2 pi n y) cos(2 pi n x),
zeta*(s) = pi^(-s/2) Gamma(s/2) zeta(s). Delta E = s(s-1) E; T(n) E(z,s) = n^s sigma_(1-2s)(n) E(z,s). Residue of E at s = 1
is 3/pi. Source: Zagier 1981, eqs. (1)-(5), (14)-(18). READ.

**M2. Rankin-Selberg unfolding.** For Gamma-invariant F of rapid decay, C(F;y) = int_0^1 F(x+iy) dx,
I(F;s) = int_0^inf C(F;y) y^(s-2) dy = int over Gamma\H of F(z) E(z,s) dmu (Re s > 1); I has a simple pole at s = 1 with residue
(3/pi) int F dmu; I*(F;s) = pi^(-s) Gamma(s) zeta(2s) I(F;s) is regular for s != 0, 1 and I*(F;s) = I*(F;1-s).
Source: Zagier 1981, (8)-(13). READ.

**M3. Two applications at the edge (Zagier sec. 1).** (a) zeta(1+it) != 0: otherwise F = E(z, 1/2 + it/2) is of rapid decay,
not identically zero, with constant term 0, so I(F;s) = 0 for all s and int |F|^2 = 0. (b) Horocycles: for the closed
horocycle at height y and an open set U, length(horocycle in U)/length = vol(U)/vol + O(y^(1/2 - eps)); if the error is
O(y^(3/4 - eps)) for all U then RH; in general C(F;y) = kappa + O(y^(1 - Theta/2 - eps)) for smooth F, Theta = sup Re rho,
and conversely an error O(y^alpha) for all F = characteristic functions gives Theta <= 2(1 - alpha). READ.

**M4. Maass-Selberg relation (one cusp).** For B >= B_0 (cusp neighbourhood embedded; B_0 = 1 for PSL2(Z)), E^B the
truncated Eisenstein series (constant term removed above height B in the fundamental domain), s1, s2 not poles,
conj(s2) != s1, 1 - s1:
  int E^B(z,s1) conj(E^B(z,s2)) dmu = [B^(s1+conj s2-1) - phi(s1) conj(phi(s2)) B^(1-s1-conj s2)]/(s1 + conj s2 - 1)
                                    + [conj(phi(s2)) B^(s1-conj s2) - phi(s1) B^(conj s2-s1)]/(s1 - conj s2).
Source: arXiv 1809.07605, eq. (label MaasSelexp), citing Kubota Ch. 2.3; the same relation for E* in Lagarias-Suzuki
eq. (402), citing Hejhal 1983 pp. 154-155, stated for T >= 1. READ (statement; proof not read).
My evaluation on the unitary axis: NOTES D3 (PROVED from M4).

**M5. Zeros of the constant term and of truncation integrals (Hejhal; Lagarias-Suzuki).**
(a) Thm 1.3: for y >= 1, a_0(y,s) = zeta*(2s) y^s + zeta*(2-2s) y^(1-s) has all zeros on Re s = 1/2 except real ones; none
real for 1 <= y <= y* = 4 pi e^(-gamma) = 7.0555; exactly two real simple zeros rho_y, 1 - rho_y for y > y*. Proof of the
first part: Hejhal's use of M4 (if a_0(T,s) = 0 the right side of M4 vanishes, the left does not unless Re s = 1/2 or s real).
(b) Thm 1.2: for T >= 1, I(T,s) = int_T^inf a_0(y,s) dy/y^2 = -zeta*(2s) T^(s-1)/(s-1) + zeta*(2-2s) T^(-s)/s has all zeros
on Re s = 1/2. "The hypothesis T >= 1 cannot be relaxed. It can be shown that the Riemann hypothesis fails to hold for
all values 0 < T < 1 by an argument principle method as in Hejhal [p. 89]." "Hejhal noted that for 0 < y < 1 the function
a_0(y,s) has complex zeros off the critical line, with arbitrarily large real part."
(c) Thm 2.1 (Polya type): F entire of genus 0 or 1, real on the real axis, F(s) = +-F(1-s), all zeros in
|Re s - 1/2| < a. Then for real c >= a: |F(s+c)/F(s-c)| > 1 for Re s > 1/2, < 1 for Re s < 1/2, and
F(s+c) + e^(i theta) F(s-c) has all zeros on Re s = 1/2.
(d) Their sec. 5: the proof for the constant term is "a direct verification without providing a mechanism"; "why must
the extra condition y >= 1 be imposed" is posed as open. Vinogradov-Takhtajan 1980 used I(T,s) "in an interesting
heuristic argument in support of the Riemann hypothesis" (not read).
Source: Lagarias-Suzuki. READ (statements; proof of (a) first part; (c) statement). COMPUTED check of (b)/(a) for y < 1: NOTES D5 (b).

**M6. Selberg's spectral decomposition for pseudo-Eisenstein series; scattering.** (from memory: Selberg; Iwaniec,
Spectral Methods, Ch. 7; Lax-Phillips 1976; Pavlov-Faddeev 1972.) The span of E_psi is the orthogonal complement of the
cusp forms; E_psi = <E_psi,u_0>u_0 + (1/4pi) int <E_psi, E(.,1/2+it)> E(.,1/2+it) dt; the scattering matrix of the
automorphic wave equation is phi(1/2 + it) up to elementary factors; its poles are at s = rho/2; RH <=> the
Lax-Phillips semigroup decays like e^(-t/4 + eps). NOT READ. What I use is PROVED or COMPUTED independently in NOTES D4.

**M7. Shift 1 in every constant term.** (from memory: Langlands 1971; Gindikin-Karpelevich.) For Eisenstein series
induced from the Borel subgroup of a split group the intertwining operators are products over positive roots of
xi(<lambda, alpha^vee>)/xi(<lambda, alpha^vee> + 1); for cuspidal data ratios L(s, .)/L(s+1, .). One instance READ in
Lapid-Rallis: M(s) v_0 = L(s,pi)/L(s+1,pi) * L(2s,pi,wedge^2)/L(2s+1,pi,wedge^2) v_0 (Siegel parabolic of Sp_n, unramified pi).

## B. Zagier's representation and toroidal forms

**M8. Zagier 1981, the theorem.** For D in Z, D = 0, 1 mod 4, Phi: R -> C even with Phi(X) = O(|X|^(-1-eps)) (and smooth
with integral 0 if D is a square): L_D Phi(z) = (1/2) sum over (a,b,c) in Z^3 with b^2 - 4ac = D of
Phi((a|z|^2 + bx + c)/y) is Gamma-invariant and O(y^(-eps)). Let calE = { F : Gamma\H -> C, F = O(y^(1-eps)),
int L_D Phi(z) F(z) dmu = 0 for all D, Phi }. Then (i) calE contains d^m/ds^m E*(z,s) at s = rho, 0 <= m <= n_rho - 1, rho
a non-trivial zero of zeta of order n_rho; (ii) calE is stable under Delta and the Hecke operators
(T(p) L_D = L_{Dp^2} alpha_p + (D/p) L_D + p L_{D/p^2} beta_p, alpha_p, beta_p rescalings of Phi); (iii) every F in calE has
sum over Heegner points of discriminant D of F = 0 (D < 0), sum over closed geodesics of discriminant D of the integral of
F = 0 (D > 0 non-square), and int y^k |f|^2 F dmu = 0 for every Hecke eigen cusp form f of level 1. The key identities:
int L_D Phi E*(z,s) dmu = zeta(s,D) x (explicit transform of Phi), zeta(s,D) = zeta(s) L(s,D) with L(s,D) entire; for D = 0:
zeta(s) zeta*(2-2s) int Phi-hat(X) X^(s-1) dX + zeta(1-s) zeta*(2s) int Phi-hat(X) X^(-s) dX (his (33)).
Sec. 4: calV = (functions on Gamma\G orthogonal to all sum over M in X_Z(D) of Phi(g^t M g)) is G-stable, calV^K = calE,
and calV contains the principal series P_rho for every non-trivial zero. "P_s is unitarizable if and only if s(1-s) > 0
[sic], i.e. s in (0,1) or Re(s) = 1/2. Thus the existence of a unitary structure on V would imply the Riemann
hypothesis." It would also imply simple zeros; "there cannot be any generally applicable way of putting a unitary
structure on V" since other global fields have multiple zeros; if the zeros are simple and on the line and calE is
spanned by the v_rho, V is unitarizable "in infinitely many ways ... a natural choice seems to be ||v_rho|| = |zeta*(2 rho)|".
"The construction of V is closely related to the Weil representation ... the space V can be interpreted as the kernel
of the lifting [to the metaplectic group]". Sec. 5: adelic form: F is toroidal for E if the integral of F(tg) over
T(Q)Z(A)\T(A) vanishes for all g; the integral of an Eisenstein series over the torus is the Tate integral for zeta_E(s).
For function fields the K-finite part should have dimension at least the first Betti number. READ (whole paper).

**M9. Toroidal forms after Zagier.** (a) Cornelissen-Lorscheid 2009: for F = F_q(X), X of genus <= 1, class number one,
with a rational place: the space of unramified toroidal forms has dimension g, spanned by the Eisenstein series of
weight a zero of zeta_F; "We deduce an 'automorphic' proof for the Riemann hypothesis for the zeta function of those
curves" (the three elliptic curves over F_2, F_3, F_4 with one point): toroidal forms for the constant quadratic
extension lie in a (q+2)-dimensional Phi_inf-stable space with eigenvalues 0 (multiplicity q), q, -q; the eigenvalue of a
toroidal Eisenstein series is q^s + q^(1-s). READ (whole).
(b) Lorscheid: Cor. (cor_zagier): "If there is a place x such that the eigenvalue of every Phi_x-eigenfunction in
A_tor^K lies in the interval [-2 q_x^(1/2), 2 q_x^(1/2)], then all zeros of zeta_F have real part 1/2." Thm (thm_tempered):
every irreducible subquotient of A_tor is tempered; the proof USES Hasse-Weil (Eisenstein part) and Drinfeld (cuspidal
part); no toroidal residues. Also: dimension of unramified toroidal derivatives of Eisenstein series = h(g-1) + 1 (odd
characteristic); A_tor is admissible. READ (abstract, introduction, the two statements and the proof of the second).
(c) Cornelissen-Lorscheid (number fields): toroidal = derivatives of Eisenstein series of weight s_0 and class group
character omega up to the order of vanishing of L_F(omega, s) at s_0, plus cusp forms with L(pi, 1/2) = 0; no toroidal
residues; "if the irreducible subrepresentations ... are tempered, the Riemann hypothesis follows. This seems for now an
elusive programme". READ (abstract, introduction).

## C. Rankin-Selberg, Landau, Ramanujan, the Selberg class

**M10. Landau's theorem and the bound on local roots.** D(s) = sum c_n n^(-s) with c_n >= 0 has a singularity at
s = sigma_0, the abscissa of absolute convergence. If D = prod_p prod_j (1 - a_{p,j} p^(-s))^(-1) has c_n >= 0 and converges
absolutely for Re s > sigma_0 then |a_{p,j}| <= p^(sigma_0). Source: Milne 1509.00797. READ.
**M11. Rankin 1939.** For a cusp form of weight 2k, sum |c(n)|^2 n^(-s) continues meromorphically with singularities only
at s = k and k-1; with Landau, |c(n)| = O(n^(k - 1/5)). Source: Milne. READ. (Rankin's paper not read.)
**M12. Langlands' remark (1970).** If L(s, sigma, pi) is analytic in Re s > 1 for all representations sigma of the
L-group, then with sigma = rho (x) rho-bar the logarithm has coefficients |trace rho^n(t_p)|^2 >= 0, Landau bounds the
eigenvalues, and taking rho containing m lambda gives |lambda(t_p)| <= p^(1/2m) for all m, hence |lambda(t_p)| = 1.
Source: Milne. READ. Deligne (interview quoted there): "when you had a product defining a zeta function you could get
information on the local factors out of information on the pole of the zeta function itself".
**M13. Bounds towards Ramanujan for GL_n.** Hypothesis H_n(delta): for every cuspidal automorphic pi of GL_n(A_K) with
unitary central character and every place v, the exponents of pi_v satisfy |sigma| <= delta. Jacquet-Shalika: H_n(1/2);
Luo-Rudnick-Sarnak: delta = 1/2 - 1/(n^2+1); Kim-Sarnak: 7/64 for n = 2, K = Q; Blomer-Brumley: 7/64, 5/14, 9/22 for
n = 2, 3, 4 over any number field. "The Rankin-Selberg L-function is known to converge absolutely on Re s > 1 for cusp
forms on GL_n." Ramanujan = pi_v tempered. Source: Blomer-Brumley 1003.0559 introduction. READ. Proofs not read.
**M14. The Selberg class S.** F(s) = sum a_n n^(-s) is in S if: (1) (s-1)^m F(s) is entire of finite order for some m >= 0;
(2) a_n << n^eps; (3) Phi(s) = Q^s prod_{i<=k} Gamma(w_i s + mu_i) F(s), Q > 0, w_i > 0, Re mu_i >= 0, satisfies
Phi(s) = eps conj(Phi(1 - conj s)), |eps| = 1; (4) a_1 = 1, log F(s) = sum b_n n^(-s), b_n = 0 unless n is a prime power,
b_n << n^theta for some theta < 1/2. Degree d_F = 2 sum w_i. Remarks there: (3) "Re mu_i >= 0": a Maass cusp form with an
exceptional eigenvalue (assuming Ramanujan-Petersson) would have Re mu_i < 0 and violate the Riemann hypothesis; (5)
theta < 1/2 "turns out to be surprisingly important". Theorems: F in S, d_F < 1 => F = 1 (Thm 3.1); F_p has no zeros in
Re s > 1/2 and F none in Re s > 1 (Lemma 2.1). Selberg's conjectures: sum_{p<=x} |a_p|^2/p = n_F log log x + O(1);
orthonormality for distinct primitive F, F'; "Selberg also conjectures that the Riemann hypothesis holds for this class".
Source: Conrey-Ghosh. READ (sec. 1-2).
**M15. Positivity at the centre from a norm.** For pi symplectic cuspidal on GL_n(A): L(1/2, pi) >= 0; for sigma cuspidal
generic on SO(2n+1, A): L^S(1/2, sigma) >= 0. Mechanism (their introduction): the residue at s = 1/2 of the Siegel
Eisenstein series on Sp_n induced from pi is square-integrable; "the inner product of two such residues is given by the
residue of the intertwining operator at s = 1/2. Thus [it] is a positive semi-definite operator". "Assuming GRH we have
L(s, pi) > 0 for 1/2 < s <= 1 ... It would follow that L(1/2, pi) >= 0. However, the latter is not known even in the case
of quadratic Dirichlet characters ... our method is not applicable to that case." Source: Lapid-Rallis. READ (introduction).

## D. Hecke operators, theta, converse theorems

**M16. Dimension of M_k(Gamma_theta, eps) for real weight.** A 2-periodic holomorphic F on H has moderate growth iff
F = sum_{n>=0} a_n e^(pi i n tau) with (a_n) of polynomial growth. M_k(Gamma_theta, eps) = holomorphic f of moderate growth
with f|_k^eps gamma = f for gamma in Gamma_theta (slash action defined through theta^(2k), principal branch).
dim M_k(Gamma_theta, +) = floor((k+4)/4), dim M_k(Gamma_theta, -) = floor((k+2)/4), real k >= 0, citing Berndt-Knopp Thm 6.3.
Source: BRS Prop. 3.1 and the lines before it. READ.
**M17. Odd theta powers.** For odd p and kappa in {3,5,7}, Theta^kappa is an eigenform of T(p^2) with eigenvalue
1 + p^(kappa-2) (M_{3/2}(Gamma_0(4)) is one-dimensional; Theta^5, Theta^7 by their Shimura lifts E_4 and E_6(z) + 8E_6(2z));
"these are the odd powers of Theta which can be written as a linear combination of half-integral weight Eisenstein
series". Source: arXiv 2011.07796. READ (the lemma's statement prints 1 + p^kappa; its proof gives 1 + p, 1 + p^3, 1 + p^5).
**M18. Hecke operators on non-congruence subgroups.** For Gamma of finite index in SL2(Z), Gamma^0 its congruence closure,
p not dividing the level, f in S_k(Gamma): T_{p,Gamma} f = T_{p,Gamma^0} (Tr f) (Atkin's conjecture; Serre, Scholl, Berger
1994). Source: Long 0707.3315. READ (statement). Bounded denominators characterise congruence forms
(Calegari-Dimitrov-Tang): one sentence read in arXiv 2609.28514.
**M19. Converse theorems.** (from memory, primary sources unread.) Hamburger 1921: zeta is characterised by its
functional equation among Dirichlet series with suitable growth. Hecke 1936: Dirichlet series with functional equation
of signature (lambda, k, gamma) <-> automorphic forms for the Hecke group G(lambda); one functional equation suffices for
level 1. Weil 1967: functional equations for twists by characters <-> forms on Gamma_0(N). Bochner: with finitely many
poles allowed, solutions = L_f + finite combinations of derivatives of kernels (as quoted in the BRS digest, Remark
after their Prop. 4.1: READ in the digest only). None of them has a positivity hypothesis; none says anything about
zeros (idea 13: dimension one and still a zero off the line at n = 1.4).
**M20. Local unitarity and temperedness.** (from memory.) For an unramified principal series of PGL2(Q_p) with Satake
parameter alpha: hermitian iff lambda = alpha + 1/alpha real; unitary iff |alpha| = 1 or alpha real with
p^(-1/2) <= |alpha| <= p^(1/2); tempered iff |alpha| = 1, i.e. lambda in [-2, 2], the L^2-spectrum of the normalised
adjacency operator of the (p+1)-regular tree (Kesten); tempered <=> matrix coefficients in L^(2+eps)
(Cowling-Haagerup-Howe). Residual spectrum of GL_n: Speh representations, shifts in (1/2)Z (Moeglin-Waldspurger). NOT READ.

**M21. Pseudo-Laplacian with a Heegner constraint (Colin de Verdiere; Bombieri-Garrett).** Eis^r := completion of
pseudo-Eisenstein series in the Sobolev norm H^r (spectral definition). For a complex quadratic field k and theta = the
restriction to Eis of the sum of automorphic Dirac deltas at the Heegner points of k: theta E_s = (sqrt(d_k)/2)^s zeta_k(s)/zeta(2s);
theta lies in Eis^(-3/4-eps), inside Eis^(-1) (second moment of zeta_k, Landau's bound for zeta(1+it)). S~_theta := Friedrichs extension of
-Delta restricted to ker(theta). Then (S~_theta - lambda)u = 0 iff (-Delta - lambda)u = c theta and theta(u) = 0. "The discrete spectrum lambda_s > 1/4 of
S~_theta, if any, is s(1-s) with s a zero of zeta(s) L(s,chi_-3) [for k = Q(sqrt(-3))]. There is no assurance of existence of any
discrete spectrum." Under Montgomery's pair correlation at most 94% of the zeros of zeta can occur; numerical tests
"suggest that there is no discrete spectrum". With two functionals (theta and the constant term eta_a at height a >= a_k):
a_k^(1-2w)(a^(2w-1) + c_w)(h_k^2/a_k/(lambda_1 - lambda_w) + (1/4 pi i) int |zeta_k(s)/zeta(2s)|^2 ds/(lambda_s - lambda_w)) - zeta_k(w)^2/((2w-1) zeta(2w)^2)
has zeros only on Re w = 1/2 and [0,1]; <eta_a, u_theta,w> = theta E_w/(2w-1). Interleaving: at most one eigenvalue parameter of
S~_theta between adjacent zeros of a^s + c_s a^(1-s). History: Haas's numerical eigenvalues at zeros of zeta and L(chi_-3) were
solutions of (-Delta - lambda)u = delta_omega (Hejhal). Source: Bombieri-Garrett 2020. READ (abstract, introduction; no proofs).
**M23. Kubota's cubic theta function (Patterson's Theorem 8.1 as stated by Dunn-Radziwill (5.6)-(5.8)).** Gamma_2 =
SL_2(Z) Gamma_1(3) in SL_2(Z[omega]), index 27; Kubota's character chi(gamma) = (c/a)_3 on Gamma_1(3), extended by 1 on SL_2(Z).
theta(z,v) = (3^(5/2)/2) v^(2/3) + sum_{0 != mu in lambda^-3 Z[omega]} tau(mu) v K_{1/3}(4 pi |mu| v) e(mu z), with tau(mu) = conj g(omega^j lambda^2, c)
|d/c| 3^(n/2+2) (times e^(-+2 pi i/9) for j = 1, 2) at mu = +- omega^j lambda^(3n-4) c d^3 (n >= 1), conj g(1,c) |d/c| 3^(n/2+5/2) at
mu = +- lambda^(3n-3) c d^3 (n >= 0), 0 otherwise; c, d = 1 mod 3, c squarefree. READ (statement). Consequence used: OBJECT_PHI R1.
**M22. The cubic theta function and the quasi-RH identities.** (digest only.) gamma_2(n)^3 = mu(n) alpha(n) for the normalised
cubic Gauss sum over Z[omega], alpha(n) = n/|n| (Lemma 4.1 of the 11/12 paper; checked numerically by READER-4); coefficient of
Kubota's theta at lambda^(-3) n b^3: 3^(5/2) |b| chi_n(lambda)^2 gamma_2(n) (Patterson 1977 Thm 8.1 as quoted). Papers and Patterson NOT read.

## E. Statements proved or computed in this seat (where the proof is)
- **P1** (PROOF_dial.md Thm A): 2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8).
- **P2** (PROOF_dial.md Thm B, C): coefficient signs on (0,1), (1,2), (2,3); positive solutions of the theta functional
  equation for 0 < n <= 3 exist iff n in {1,2,3}.
- **P3** (NOTES D4): the norm of a pseudo-Eisenstein series, geometric (totients) and spectral; two routes agree to 7 digits.
- **P4** (NOTES D5): Suzuki's Theta at (w, nu) = (1/2, 1) equals ((s-1)/s) phi(s); Lagarias-Suzuki's Thm 1.2 from |Theta| < 1.
- **P5** (NOTES D7): zero-side identity between the Weil form of constant-term profiles and Zagier's natural norm; no
  compactly supported constant-term profile; Z(E_psi) = 2[T_W + Re H_W^phi].
- **P6** (NOTES D8): F_d x F_d and G_d x G_d have their rightmost pole at 1 + 2d; Selberg-class bookkeeping of F_d, G_d.
- **P7** (NOTES D9): Hecke-Gram matrix: positive semidefinite always, rank one iff eigenform.
- **P8** (NOTES D2): xi(S+d) xi(S-d) = 2 int_0^inf E~*(iy, 1/2+d) y^(S-1/2) dy/y.
- **P12** (OBJECT_PHI R1-R3): exact Rankin-Selberg identity of the cubic theta function with Gamma factors and the factor at 3;
  the cusp part of the resolvent drops out of every sheet difference.
- **P10** (NOTES D12): the project's parity blocks are the w-derivative at 0 of Suzuki's 1 -+ K_w[L]; checked on e_0 at
  L = 0.5, 0.75, 1.0 against lane A's builder.
- **P11** (OBJECT_PHI.md): Phi(s) = 3 (sqrt3/2pi)^s Gamma(s) zeta_K(s); the class-number-two twin of the impostor at discriminant
  -20; T(p) delta_omega = (1 + chi(p)) delta_omega + 3 sum over CM(-3p^2); sum |c_theta|^2 N^(-s) = 3^5 zeta_K(s) zeta_K(3s-1)/zeta_K(2s) (from the quoted
  coefficients); sum gamma_2(n)^3 N(n)^(-s) = 1/L(s,alpha); Parseval on the class group; completeness of the Hecke multipliers
  (no Hecke-equivariant constrained space).
- **P9** (NOTES D6): norms of square-integrable residues see L-functions at real points only; central-value positivity is
  blind to a real tilt.

## F. To read next (in order)
0. For OBJECT_PHI: Bombieri-Garrett sections 4, 5, 7; Patterson 1977 (coefficients of the cubic theta function) and any
   Rankin-Selberg integral of |theta_3|^2 (Patterson, Bump-Hoffstein, Suzuki); Davenport-Heilbronn 1936; Stark 1967;
   Colin de Verdiere, Pseudo-laplaciens II; Waldspurger 1985.
1. Zagier, "The Rankin-Selberg method for automorphic functions which are not of rapid decay" (J. Fac. Sci. Univ. Tokyo
   28 (1981)): the renormalised integral of |E(z,s)|^2 E(z,w) (four zeta functions), to make NOTES D7 (f) exact.
2. Lax-Phillips, Scattering Theory for Automorphic Functions (1976) and their Bull. AMS 2 (1980) survey; Pavlov-Faddeev:
   M6. 3. Suzuki 1606.05726 sec. 4 with his G at (w, nu) = (1/2, 1): to turn NOTES D5 (c) from HEURISTIC into PROVED.
4. Wohlfahrt 1957 or a modern source for Hecke operators with real weight (NOTES D10 (f)). 5. Lehmer 1948 (PROOF_dial
   novelty). 6. Jacquet-Shalika's proof of H_n(1/2); Rudnick-Sarnak 1996 appendix. 7. Hejhal 1990 p. 85-89.
8. Lagarias math/0601653 (de Branges spaces E_h and the half-shift). 9. Vinogradov-Takhtajan 1980 (heuristic for RH
   from I(T,s)). 10. Lachaud 2002/2003 (toroidal forms and Connes).
