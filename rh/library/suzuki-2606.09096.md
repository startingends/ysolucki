# Suzuki, "Weil's quadratic form via the screw function"

Note by SP-operator, 2026-11-11. For understanding only (rh/library/README.md).

## 1. Reference and how much was read
Masatoshi Suzuki, arXiv 2606.09096 (TeX file `screwzelf_11.tex` dated 2026-09-23, i.e. v3 as recorded in
KNOWLEDGE section 7). Read IN FULL from the TeX source (rh/library/src/2606.09096/clean.tex, 132k characters
after removing comment lines): sections 1 to 8 and the bibliography. Nothing skipped. Proof details of
section 2 (computations with the Hurwitz-Lerch function) were read but not recomputed.

## 2. What it proves (all UNCONDITIONAL unless marked)
Objects. W = Weil functional; Q_W(v) = W(v * v~); Q_W^a = restriction to L^2(-a,a). Screw function g (eq. 1.3):
continuous, real, even, built from the pole term, sum_{n <= e^{|t|}} Lambda(n) n^{-1/2}(|t| - log n), and a
Hurwitz-Lerch term; near 0: g(t) = (1/2)|t| log|t| + A|t| + (prime sum) + r(t), A = (1/2)(log 2pi + C_0 - 1) =
0.7075..., r even C^2, r = O(t^2) (eq. 2.2). G = convolution by g; G_a = P_a G P_a on mean-zero functions;
D = i d/dx with Dirichlet conditions; B_a = D* G_a D on H_0^1(-a,a).
- **Theorem 1.1.** For each a > 0 the self-adjoint operator A_a of the closed form Q_W^a (existence: Connes-
  Consani-Moscovici) is the Friedrichs extension of B_a.
- **Corollary 1.2.** Any minimiser of the Rayleigh quotient lies in the form closure of C_c^inf(-a,a);
  lambda_a = inf over C_c^inf(-a,a) of <B_a v, v>/||v||^2.
- **Theorem 1.3.** The lowest eigenvalue lambda_a is continuous in a. (No parity restriction.)
- **Theorem 1.4.** For sufficiently small a: lambda_a > 0, simple, lambda_a = log(1/a) + mu_1 - log(2pi) + psi(2)
  - 1 + O(a) with a constant mu_1 > 0; the eigenfunction is even (and positive a.e., from the proof).
- **Theorem 1.5.** Fix lambda < lambda_a, T_a = A_a - lambda, H(T_a) = completion of C_c^inf(-a,a) for <T_a v, v>.
  i d/dx on C_c^inf(-a,a) is symmetric in H(T_a) with deficiency indices (1,1); with v_+- solving
  T_a v_+- = C_+- e^{+-x}, the function W(a,theta;z) = (z-i) int v_+ e^{izx} + e^{i theta}(z+i) int v_- e^{izx} is
  entire, its zeros are exactly the eigenvalues of the self-adjoint extension with parameter theta, and all are
  real. The proof uses only that finitely many primes enter for fixed a.
- **Corollary 1.6 (conditional, a sufficient condition for RH).** If for large a one can choose lambda(a),
  theta(a), phi(a,z) analytic in C_+ with e^{phi} W(a,theta;z) -> xi(1/2-iz)/(xi(1/2-iz) + xi'(1/2-iz)) locally
  uniformly in C_+, then RH.
- Formulas: Q_W^a(v) = int int g(x-y) v'(y) conj v'(x) = int int (-g''(x-y)) v(y) conj v(x) for v in C_c^inf
  (2.9); -g'' = -(1/2)Pf(1/|t|) - (2A+1) delta - sum Lambda(n) n^{-1/2}(delta_{log n} + delta_{-log n}) - r'' ;
  Q(v) = (1/2pi) int (Re psi(1/4 + iz/2) - log pi)|vhat|^2 - (1/2pi) int |vhat|^2 2 sum_{n<=e^{2a}} Lambda(n)
  n^{-1/2} cos(z log n) - (pole part);  = (1/2pi) int (log|z| - log 2pi)|vhat|^2 + O(a)||v||^2 (2.8).
  Archimedean form: L_a(v) = (1/4) int int |v(x)-v(y)|^2/|x-y| - (1/2) int log(a^2-x^2)|v|^2
  = (1/2pi) int (log|z| + C_0)|vhat|^2.
- Section 8: Q_W^a(v)/||v||^2 = <G_a u,u>/<K_a u,u>, u = Dv, K_a = inverse Neumann Laplacian with kernel
  (x^2+y^2)/(4a) - |x-y|/2 + a/6: the spectrum of A_a is that of the generalised problem G_a u = lambda K_a u,
  two compact operators with continuous kernels. Bombieri's Problem 1 is the eigenvalue problem of G_a.
Quoted with attribution (not proved here): RH <=> Q_W >= 0 on C_c^inf(R) (Weil); RH <=> positive definite on
every window, odd functions alone suffice, even ones up to real zeros (Yoshida 1992, Prop. 1); RH <=>
non-degenerate on the completion (Yoshida Thm 2); lambda_a > 0 for small a (Yoshida Lemma 2); RH <=> g is a
screw function (Suzuki JLMS 2023, Thm 1.2); lower boundedness and closedness (Connes-Consani 2023, Prop 2.1);
discrete spectrum (CCM arXiv 2511.22755, Thm 3.6). Bombieri's claimed continuity of the even/odd infima
(2001, Thm 5) "calls for a more careful analysis".

## 3. Method in ten lines
The Weil distribution is the second derivative of a CONTINUOUS function g, so Q_W(v) = <G Dv, Dv> and the
distribution theory is replaced by an integral operator with continuous kernel acting on v'. The local
expansion g = (1/2)|t| log|t| + A|t| + ... isolates a universal logarithmic form L_a (a Dirichlet form with
jump kernel 1/|x-y| and killing term -log(a^2-x^2)) plus bounded perturbations (finitely many translations,
a continuous kernel). Thm 1.1: show C_c^inf is a form core by cutting off exponentials near the ends
(error eps log(1/eps)). Thm 1.3: rescale to [-1,1]; the principal form is a-independent, the rest is
continuous in (a,w); compactness of H^log -> L^2 gives lower semicontinuity. Thm 1.4: as a -> 0 the form is
log(1/a) + L + O(a); L is an irreducible Dirichlet form, so its semigroup is positivity improving, ground
state simple and positive; Kato perturbation transfers simplicity. Thm 1.5: von Neumann extension theory for
i d/dx in the Hilbert space with norm Q - lambda; eigenvectors of the adjoint are T_a^{-1} e^{-izx}.

## 4. Where it stops
- Nothing is said about lambda_a for a not small: no monotonicity statement (it is one line from min-max, see
  r2_parity/PROOF_first_failure Lemma 1), no derivative in a, no lower bound, no use of the Euler product
  beyond "finitely many primes".
- Thm 1.4 has no explicit range of a; the perturbation argument treats primes as absent (a < (1/2) log 2 in
  the formula used).
- Cor 1.6 is expected by the author to need lambda = 0 for all large a, "which is equivalent to RH"; "does not
  appear to provide a simple route".
- Section 7 is explicitly heuristic and assumes RH; the convergence H(E_a) -> B "is understood only
  heuristically"; possible singularity of the reproducing kernel J_a as a -> inf is left open.
- Numerical evidence for (1.12) with theta = pi is asserted, not shown.

## 5. What it changes in our record
- KNOWLEDGE section 7 entry (first 40k read): CONFIRMED and completed. Add: Thm 1.5 and Cor 1.6; section 8
  (generalised eigenproblem with two continuous kernels: a cheaper numerical route than lane A's basis); the
  exact form domain; the attribution of closedness / discrete spectrum to Connes-Consani(-Moscovici).
- THEORY T1, T2: sources correct. T2 could add "eigenfunction positive a.e. for small a" (proof of Thm 1.4).
- r2_parity/PROOF_first_failure: its assumption (CORE) is essentially right: form domain = {v in L^2(-a,a):
  int log^+|z||vhat|^2 finite} (not stated as an equality by Suzuki; he defines D(Q) = {|Q(v)| finite} and
  proves D(Q) inside H^log); C_c^inf is a form core (Thm 1.1 proof); the zero-side formula is stated for
  C_c^inf and extends by closure. Its (C)<=>(A) is Yoshida Thm 2 + Thm 1.3 as Suzuki notes on p. 5.
- r2_parity/PROOF_parity_index sec. 6, caution (1) ("the Weil kernel is a distribution, Krein-Langer needs a
  continuous function"): removed by g. The window form is the screw-kernel form of a continuous function.
- Seminar B58 Fact 2 (positive folded ground states): KNOWN for small a (Thm 1.4 proof). The mechanism fails
  for the full form only through the pole term (SP-operator, B131).
- Idea #8 (first-failure): the "smallest" field (a Hadamard formula for d lambda_a/da) is still not in this
  paper. The paper does give the natural operator in which to look for it: G_a u = lambda K_a u.
- Lane A's A4 / idea #8 log ("Krein function a(L) never defined"): section 7.9 gives the object: the de Branges
  chain H(E_a); SP-operator's PROOFS.md P1 shows it exists whenever Q_a > 0, not only under RH.
- Idea #7 / notebook N19: "RH <=> a canonical system exists" is in Suzuki's OTHER paper (1606.05726), for the
  shifted functions xi(1/2 + w - iz); this paper's chain E_a is a different one (window parameter).

## 6. Reliability
arXiv preprint (2026), single author with a refereed track record on exactly this topic (JLMS 2023, J. Funct.
Anal. 2021, Canad. J. Math.). Proofs of Thms 1.1, 1.3, 1.4, 1.5 are complete and standard in method; I found no
gap in reading (not line-by-line verification of the special-function identities of section 2). Section 7 is
labelled heuristic by the author. Not refereed as far as the source shows.
