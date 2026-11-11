# Burnol: The explicit formula and a propagator

Reader: R-read-1, 2026-11-11. This note reports what the paper contains. It recommends nothing.

## 1. Reference and how much was read
- J.-F. Burnol, "The Explicit Formula and a Propagator", arXiv math/9809119 v2 (22 Nov 1998; v1
  21 Sep 1998), 21 pages, plain TeX. No journal reference on the arXiv record.
- Source: `rh/library/src/math9809119/explicV2.tex` (397 lines, 45 062 bytes; a single gzipped TeX file).
- Read: **all of it**, lines 1 to 397: abstract, introduction, the six sections, conclusion, references.
- The paper has no numbered theorems. Its results are displayed formulas inside running text; they are
  referred to below by section title.

Conventions: K a number field, C its idele class group, test functions F(u) = f(|u|) chi(u)^(-1) on C with f
smooth of compact support on (0, infinity); Mellin transform fhat(s) = int f(t) t^s dt/t with NO shift by 1/2
(so the critical line is Re s = 1/2 and the kernels below lack the factor |u|^(1/2) of our conventions);
poles are counted with positive and zeros with negative multiplicity, on the same side.

## 2. What it proves
All unconditional; the paper is a derivation of the explicit formula in a uniform local form, followed by
remarks. Nothing is proved about positivity.

- **(Section "The explicit formula") Local terms as logarithmic derivatives of Tate's Gamma factors.**
  Z(chi, f) = sum_nu W_nu(chi, f), where W_nu(chi, f) = (1/2 pi i) int_{Re s = c} fhat(s) Lambda_nu(chi, s) ds,
  0 < c < 1, and Lambda_nu = -(d/ds) log Gamma_nu(chi, s), Gamma_nu the Tate-Gel'fand-Graev Gamma function
  (ratio of the local factors on the two sides of the functional equation; no zero or pole in the strip).
  The derivation uses the Euler product on Re s = 2 and its mirror on Re s = -1 and treats every place alike.
- **Main formula.** For every place nu, archimedean or not, ramified or not:
  "W_nu(chi, f; y) = -log(|y|_nu) F_nu(y) + F(-log(|x|_nu)) * F_nu(y)" (F = additive Fourier transform on
  K_nu, * = additive convolution, F_nu the local component of F), hence
  "W_nu(F) = (G_nu * F_nu)(1)" with "G_nu = F(-log(|x|_nu))", and the explicit formula reads
  sum over zeros and poles of m(chi') Fhat(chi') = sum_nu (G_nu * F_nu)(1). For K = Q_p or R and trivial chi
  this "is directly equivalent to a result of Haran" (Invent. Math. 1990); the extension to all number fields
  and characters is the paper's stated contribution.
- **(Section "Fourier transform of -log|x|").** G = gamma P + tau delta, where P is the finite part at s = 0 of
  the homogeneous distribution |x|^(s-1), gamma = 1/R the inverse residue, and for any omega with
  omega(0) = 1: G(phi) = gamma int (phi(x) - phi(0) omega(x)) dx/|x| + G(omega) phi(0); scaling law
  G(phi_t) = G(phi) - log|t| phi(0). Explicit constants: real place gamma = 1/2, tau = log(2 pi) + gamma_e;
  complex place gamma = 1/(2 pi), tau = 2(log(2 pi) + gamma_e); finite place
  R = q^(-delta/2)(1 - 1/q)/log q, with delta the differental exponent.
  Resulting local terms: at a finite place
  W_nu(F) = int_{|u|=1}(F_nu(1/u) - F_nu(1)) d^x u/|1-u| + int_{|u| != 1} F_nu(1/u) d^x u/|1-u|
  - delta log(q) F_nu(1), "Weil's local term, with the addition of the local component of the discriminant";
  at the real place
  W_R(F) = int_{1/2}^inf (F(1/u) - F(1)) d^x u/|1-u| + int_{-inf}^{1/2} F(1/u) d^x u/|1-u|
  + (log(2 pi) + gamma_e) F(1), d^x u = du/(2|u|); two further equivalent forms (regularising with
  sin(pi x)/(pi x) or its square, constants 1 + log 2 and 3/2); the complex place likewise.
- **(Section "The conductor operator").** For a ramified local character chi of conductor exponent f:
  Gamma_nu(chi, s) is q^((f + delta) s) up to a constant, so the local term is -(f + delta) log q F(1), and
  "f log(q) = int_{|u|=1}(1 - chi(u)) d^x u/|1-u|". Operator form: on the subspace L_0 of L^2(K_nu) spanned
  by g(|x|) chi(x) with chi ramified, let A = multiplication by log|x|, B = F A F^(-1), H = A + B. Then H
  commutes with dilations, rotations, inversion and Fourier transform; "H is a self-adjoint, positive
  operator, whose spectrum has its support consisting of the integer multiples (f + delta) log(q) of log(q)",
  with eigenspaces labelled by the conductor exponent; A and B commute on a dense subdomain of L_0.
- **(Section "A propagator").** (a) The decomposition into local terms is not canonical: for k in K^x,
  (G_nu * F_nu^(k))(k) = (G_nu * F_nu)(1) + log|k|_nu F(1), so "the multiplicative group K^x is a symmetry
  group of the Explicit Formula". (b) Reformulation of Weil's criterion C(F * F^tau) >= 0 as: existence of a
  probability measure on distributions on C (a generalised stationary zero-mean process) with covariance C.
  Not constructed. (c) At a finite place, -log|x| is the position-space propagator of the action
  S(phi) = (R/2) int |k| phi(k) phi(-k) dk, in position space
  S(phi) = [q (q-1) q^delta/(4 (q+1) log q)] int int (phi(x) - phi(y))^2/|x-y|^2 dx dy ("skipping a few
  calculational steps"), and, by Zabrodin (1989), for Q_p this action is the boundary (balayage) action of a
  Gaussian model on the Bruhat-Tits tree.

## 3. Method in ten lines
1. Tate's thesis: each L-function is the value of a distribution on the adeles; locally the Fourier transform
   of chi(x)|x|^(s-1) is Gamma_nu(chi, s) chi^(-1)(y)|y|^(-s).
2. Compute the sum over zeros and poles as a contour integral of fhat(s) times -L'/L over the rectangle
   between Re s = 2 and Re s = -1.
3. On the right edge use the Euler product; on the left edge use the mirror product given by the functional
   equation; move every local integrand to one line Re s = c inside the strip (no local zeros or poles).
4. The two halves combine place by place into -(log Gamma_nu)'.
5. Differentiate the local functional equation in s: this produces log|x| on one side and log|y| on the other.
6. Integrate against fhat(s): Mellin inversion turns chi(x)|x|^(s-1)/Gamma(chi, s) into the inverse Fourier
   transform of the test function (a lemma with Stirling bounds for the archimedean places).
7. Result: local term = -(multiplication by log|y| + Fourier-conjugate of multiplication by log|x|) applied to
   F_nu, evaluated at 1. The same computation for every place.
8. Evaluate F(-log|x|) by expanding the homogeneous distribution |x|^(s-1) and its functional equation at
   s = 1; recover Weil's local terms.
9. In the ramified case the Gamma factor is an exponential, so the operator of step 7 is diagonal: the
   conductor operator.
10. The last section is interpretation (propagator, stochastic process, quantum fields); it contains
   formulas and no theorem. The work is in steps 5 to 7.

## 4. Where it stops
- On positivity, in the author's words: "If such a probability measure mu could be constructed ... then the
  Riemann Hypothesis would follow of course. But such a generalized process could not be obtained and I now
  believe that this 'temporal' interpretation of the idele classes and the accompanying purely probabilistic
  formulation of the Riemann Hypothesis are slightly misguided." And, after the propagator remarks: "But the
  positivity has remained elusive so far."
- The conclusion states a conviction, not a result: "This paper finds its roots in the conviction that the
  Riemann Hypothesis has a lot to do with (suitably envisioned) Quantum Fields ... As this point of view has
  not so far led to success, I will conclude here with extracts from William Blake".
- The conductor operator is treated only on the ramified ("cuspidal") subspace of one finite place, where the
  Gamma factor is a pure exponential. The unramified and archimedean cases of H = A + B are not analysed here.
- The exact point where the mathematics ends: the identity W_nu(F) = (F(-log|x|_nu) * F_nu)(1). It is a
  rewriting of each local term; it gives no inequality, and the local decomposition is itself shown to be
  non-canonical (the K^x symmetry).
- Not in this paper at all: Sonine spaces, de Branges spaces, prolate functions, Painleve or other
  differential equations in a window parameter, restricted supports, any numerical work.

## 5. What it changes in our record
- **Library README, reading list**: "Burnol, 'The explicit formula and a propagator', arXiv math/9809119, and
  his papers on Sonine spaces | the archimedean part solved exactly (notebook N19)". The reason given does not
  describe THIS paper. It contains no exact solution of the archimedean part and no Sonine spaces; it is a
  uniform derivation of all local terms. What N19 recalls (Sonine spaces; an exactly solvable archimedean
  problem with Painleve-type functions) can only be in Burnol's other papers. The ones cited by the papers
  read by this seat are: C. R. Acad. Sci. Paris 331 (2000) 423-428 ("Sur les formules explicites I: analyse
  invariante"; cited in arXiv 2006.13771 for positivity of W_infty on small supports), C. R. 333 (2001)
  201-206, C. R. 335 (2002) 689-692 ("Sur les espaces de Sonine associes par de Branges a la transformation
  de Fourier"), and J. Theor. Nombres Bordeaux 16 (2004) 65-94. None of these was read. The Painleve part of
  N19 is confirmed by nothing this seat read.
- **KNOWLEDGE section 7**, "Searched and NOT found (one query): Burnol's work on Sonine spaces / Painleve":
  the references just listed exist (as cited by Connes-Consani and Connes-Consani-Moscovici); their content
  remains unread.
- **THEORY T4** ("Off the diagonal, the kernel of N = primes - arch is pointwise >= 0"; source: lead) and
  **IDEAS #10 novelty** ("NOT found: ... any statement of the non-negativity of the off-diagonal kernel as an
  input ... probably noted somewhere"). The fact is visible in the form of the local terms recalled here: at
  EVERY place the local term is, away from u = 1, integration of F(1/u) against the positive measure
  d^x u/|1 - u| (Weil 1952; Haran 1990; this paper). After Weil's shift by 1/2 this is the kernel
  |u|^(1/2)/|1 - u|: at the real place (1/2)(1/|1-rho| + 1/(1+rho)) rho^(1/2), which is our
  e^(u/2)/(2 sinh u) plus its mirror term, and at p the atoms (log p) p^(-k/2). So the sign fact of T4 is a
  direct reading of Weil's local terms and is at least implicit in the literature since 1952; the paper does
  not single it out or use it. What the paper adds is that the positive kernel is the same expression at all
  places, namely the Fourier transform of -log|x|_nu.
- **IDEAS #8, field "smallest"** ("its archimedean part is a logarithmic-Laplacian-type operator") and
  **KNOWLEDGE** ("the logarithmic-Laplacian literature ... for Hadamard-type domain-variation formulas"):
  the paper's main formula says exactly that each local term is minus the operator
  (multiplication by log|x|) + (Fourier multiplier log|xi|) applied to F_nu and evaluated at 1, in the ADDITIVE
  variable of K_nu, for every place including the finite ones. So the "logarithmic Laplacian" structure is
  explicit here (1998), and is not special to the archimedean place. The paper contains no formula for the
  variation of anything with a domain or window.
- **IDEAS #11** (killed) and its log ("the Dirichlet-form reading of the Weil form ... already exists in an
  unrefereed Zenodo preprint (Guo Chen, May 2026)"), **ATLAS F3**: this paper already writes, for a finite
  place, the non-local Dirichlet form int int (phi(x) - phi(y))^2/|x - y|^2 dx dy on K_nu whose Green kernel
  ("propagator") is -log|x|, and connects it (through Zabrodin) to a Gaussian model on the Bruhat-Tits tree.
  This is a Dirichlet form attached to ONE local term in the additive p-adic variable; it is not the
  ground-state-transformed jump process on scales of idea #11, and the paper proves no gap or curvature
  statement. The probabilistic reading of Weil's criterion (covariance of a stationary generalised process on
  the idele classes) is stated here and then abandoned by the author.
- **IDEAS #21** (killed), novelty field: "The lead has not yet searched for: ... Osterwalder-Schrader or
  Kallen-Lehmann with the Weil explicit formula." This paper is a 1998 instance of "explicit formula as
  quantum-field correlation/propagator". It contains no reflection positivity, no Kallen-Lehmann
  representation, and none of the mirror (Hankel-type) identities of idea #21.
- **r1_A PROGRESS, "T1 [Krein extension]: mu(L) >= 0 iff the Weil distribution on (-2L, 2L) is the restriction
  of the Fourier transform of some positive measure"** and **IDEAS #9** (admissible pairs of positive
  measures): the global, unrestricted version of this reading (Weil's distribution as the covariance of a
  process) is the paper's section "A propagator", item (b) above. No windowed version is in the paper.
- **KNOWLEDGE B10** ("Davenport-Heilbronn has the additive side ... Beurling systems have the multiplicative
  side"): the paper's derivation shows concretely where both enter the explicit formula: the Euler product on
  Re s = 2, the functional equation (Tate's adelic Poisson summation) on Re s = -1, and local additive Fourier
  analysis to identify each term. No statement about either control family.
- **THEORY T1, T2, T3, T5, T6; ATLAS F1, F2**: untouched.

## 6. Reliability
- arXiv preprint of 1998, apparently not published in this form; single author, later known for refereed work
  on the same subject. No theorem-proof structure: the derivation is given in running text, with the
  analytic estimates for the contour integral delegated to Weil's 1952 paper ("For the necessary analytical
  estimates to discard the horizontal contributions, see [2]").
- The constants of the section on F(-log|x|) were read but not recomputed by this reader. One internal check:
  the real-place constant tau = log(2 pi) + gamma_e is consistent, after the change of convention (shift by
  1/2 and the measure du/(2|u|)), with the constant log(4 pi) + gamma of Bombieri's form quoted in
  arXiv 2106.01715 only up to how the regularisation at u = 1 is split; this was not verified in detail.
- The position-space action is given "skipping a few calculational steps"; the identification with
  Zabrodin's tree model is asserted "at least for K_nu = Q_p" by citation.
- The last two sections are explicitly speculative.
