# Proofs (seat curv, agent R2-curv, 2026-11-10)

Everything here is finite-dimensional linear algebra or a one-line integral identity. Each statement is labelled.
None of it is a statement about the zeros; Theorems A and E are reformulations (owner rule 2: not results by
themselves), B, C, D are the new small statements. Numerical checks: `check.log`, `check2.log`, `hankel.py.txt`.

Setting (finite). W a finite set of sites, N a real symmetric matrix on W with N_xy >= 0 for x != y and
irreducible. lambda_1 = top eigenvalue, u > 0 its eigenvector (Perron-Frobenius), ||u|| = 1, pi = u^2.
q_xy = N_xy u_y / u_x (x != y), L f(x) = sum_y q_xy (f_y - f_x), E(h) = (1/2) sum_{x != y} N_xy u_x u_y (h_x - h_y)^2.
Gamma(f)(x) = (1/2) sum_y q_xy (f_y - f_x)^2, Gamma_2(f) = (1/2) L Gamma(f) - Gamma(f, L f).
For the window form: W = boxes of [-L, L], N = Galerkin compression of primes - arch (so N_xy >= 0 exactly).

## Theorem E (PROVED; decomposition of the archimedean term; probably classical, see novelty note)
For real f in L^2(R) with compact support and g = f * f~,
  -arch(g) = c_inf ||f||^2 - int_0^inf w(u) int_R |f(x+u) - f(x)|^2 dx du,   c_inf = log(pi) - psi(1/4) = gamma + pi/2 + log(8 pi) = 5.3721834...
Proof. arch(g) = -log(pi) g(0) + int_0^inf (g(0) e^{-2u}/u - 2 w(u) g(u)) du. Write
g(0) e^{-2u}/u - 2 w g(u) = 2 w(u) (g(0) - g(u)) + g(0) (e^{-2u}/u - 2 w(u)). Both pieces are integrable
(2w(u) = 1/u + O(1) at 0, g(0) - g(u) = O(u) for f of bounded variation, in general the first piece is >= 0 and the
identity holds in [0, inf]). g(0) - g(u) = (1/2) int |f(x+u) - f(x)|^2 dx. With t = 2u,
int_0^inf (e^{-2u}/u - 2w(u)) du = int_0^inf (e^{-t}/t - e^{-t/4}/(1 - e^{-t})) dt = psi(1/4) (Gauss's integral for psi).
psi(1/4) = -gamma - pi/2 - 3 log 2.  QED.  COMPUTED check: N_ii of a box from both sides agrees to 12 digits (d = 0.1, 0.05, 0.025).
Consequence: N = c_inf + (prime shifts) - (Dirichlet form of the Levy measure w(|u|) du, f extended by 0 outside the
window, i.e. with killing rate kappa_L(x) = int_{y outside} w(|x-y|) dy). Off the diagonal the kernel of N is
K(x-y) = w(|x-y|) + sum_n Lambda(n) n^{-1/2} delta(|x-y| - log n) >= 0.

## Theorem A (PROVED; the ground-state transform in the two parity blocks)
Let J be an involution of W with JNJ = N (reflection x -> -x); then u is even. Let c be an even vector, s an odd
vector (c = <box, cosh(x/2)>, s = <box, sinh(x/2)>), gamma := c/u, sigma := s/u (pointwise quotients).
(A0) For every h: <uh, N uh> = lambda_1 ||h||_pi^2 - E(h).
(A1) even block: [N <= 2 c c^T on even vectors] <=> E(h) >= lambda_1 ||h||_pi^2 - 2 <h, gamma>_pi^2 for all even h.
     If N_even is invertible this holds <=> N_even has exactly one positive eigenvalue AND 2 c^T N^{-1} c >= 1.
(A2) odd block: [N <= -2 s s^T on odd vectors] <=> E(h) >= lambda_1 ||h||_pi^2 + 2 <h, sigma>_pi^2 for all odd h.
     If N_odd is invertible this holds <=> N_odd < 0 AND 2 s^T (-N)^{-1} s <= 1
     <=> gap of -L on odd functions > lambda_1 AND int_0^inf e^{lambda_1 t} E_pi[ sigma(X_0) sigma(X_t) ] dt <= 1/2,
     X the stationary process with generator L.
So RH on the window is: a Poincare inequality on odd functions STRENGTHENED by a rank-one term, and one on even functions
WEAKENED by a rank-one term; equivalently "one positive direction" plus two scalar sum rules.
Proof. (A0): sum_xy N_xy u_x u_y h_x h_y = sum_x h_x^2 u_x (Nu)_x - (1/2) sum_xy N_xy u_x u_y (h_x - h_y)^2, by
h_x h_y = (h_x^2 + h_y^2)/2 - (h_x - h_y)^2/2 and symmetry; (Nu)_x = lambda_1 u_x. Diagonal terms drop from the last sum.
(A1), (A2) first lines: put f = uh (h even/odd iff f is, since u is even) and <f, c> = <h, gamma>_pi.
Second lines: Haynsworth inertia additivity for the bordered matrices
  B_e = [[-N_e, c], [c^T, -1/2]] :  In(B_e) = In(-1/2) + In(-N_e + 2cc^T) = In(-N_e) + In(-1/2 + c^T N_e^{-1} c),
  B_o = [[-N_o, s], [s^T, +1/2]] :  In(B_o) = In(1/2) + In(-N_o - 2ss^T) = In(-N_o) + In(1/2 - s^T (-N_o)^{-1} s).
Even: neg(-N_e + 2cc^T) = neg(-N_e) + neg(c^T N_e^{-1} c - 1/2) - 1, and neg(-N_e) >= 1 because <u, N u> = lambda_1 > 0.
So the left side is 0 iff neg(-N_e) = 1 and c^T N_e^{-1} c >= 1/2. Odd: neg(-N_o - 2ss^T) = neg(-N_o) + neg(1/2 - s^T(-N_o)^{-1}s).
Process form: N = U (L + lambda_1) U^{-1} with U = diag(u), so s^T (-N)^{-1} s = <sigma, (-L - lambda_1)^{-1} sigma>_pi
= int_0^inf e^{lambda_1 t} <sigma, e^{tL} sigma>_pi dt when -L > lambda_1 on odd functions.  QED.
COMPUTED (zeta, L = 1, boxes M = 40/80/160): 2 c^T N^{-1} c - 1 = 5.6e-4, 1.6e-4, 5.0e-5; 1 - 2 s^T(-N)^{-1}s = 3.2e-2, 1.1e-2, 3.2e-3:
both sum rules are saturated in the continuum limit (this is the zero margin). Beurling (2 -> 2.1), L = 0.5: N has 3
positive eigenvalues, so both blocks already fail at the "one positive direction" stage.

## Theorem B (PROVED; Bochner formula for the transformed prime jump process)
(B1) total rate. If N has constant diagonal N_xx = D (true for the window form: translation invariance), then
     sum_y q_xy = lambda_1 - D for every x.   [Proof: (Nu)_x = lambda_1 u_x.]
(B2) path form. For any chain with constant total rate,
     Gamma_2(f)(x) = (1/2) (Lf(x))^2 + (1/2) sum_{y,z} q_xy q_yz [ (f_z - f_y)^2 - (1/2) (f_z - f_x)^2 ].
(B3) parallelogram form. Let W be a subset of a lattice (or of R), N_xy = k(y - x) for x != y in W with k even >= 0,
     r_a(x) = u(x+a)/u(x), rho_ab(x) = u(x+a+b)/u(x) (u := 0 outside W), H_ab(x) = r_a(x) r_b(x) - rho_ab(x)
     = [u(x+a) u(x+b) - u(x) u(x+a+b)] / u(x)^2. Then
     Gamma_2(f)(x) = (1/4) sum_{a,b : x+a, x+b, x+a+b in W} k(a) k(b) rho_ab(x) (f(x+a+b) - f(x+a) - f(x+b) + f(x))^2      [sum of squares]
                   + (1/2) sum_{a,b : x+a, x+b in W} k(a) k(b) H_ab(x) (f(x+a) - f(x)) (f(x+b) - f(x))                       [discrete -Hess log u]
                   + (1/2) sum_{a,b : x+a, x+a+b in W, x+b not in W} k(a) k(b) rho_ab(x) [ (f(x+a+b) - f(x+a))^2 - (1/2)(f(x+a+b) - f(x))^2 ]   [open paths: window edge].
     On the whole line with u = 1 (no window) only the first sum is present: Gamma_2 = (1/4) int int |D_a D_b f|^2 nu(da) nu(db) >= 0,
     and for the prime part of nu the squares are over multiplicative parallelograms (X, mX, nX, mnX), m, n prime powers.
(B4) Selberg. In (B2) the two-step kernel of the prime part has atoms at log(mn) with total weight (Lambda*Lambda)(n)/sqrt(n)
     = (Lambda_2(n) - Lambda(n) log n)/sqrt(n) at log n (Selberg's identity Lambda log + Lambda*Lambda = mu*log^2), plus atoms at log(m/n).
Proof. (B2): by definition 2 Gamma_2(f)(x) = sum_y q_xy (Gamma f(y) - Gamma f(x)) - sum_y q_xy (f_y - f_x)(Lf(y) - Lf(x)).
The last term is (Lf(x))^2 - sum_{y,z} q_xy q_yz (f_y - f_x)(f_z - f_y), and
(f_y - f_x)(f_z - f_y) = (1/2)[(f_z - f_x)^2 - (f_y - f_x)^2 - (f_z - f_y)^2]. With Q the constant total rate,
sum_z q_yz (f_z - f_y)^2 = 2 Gamma f(y) and sum_{y,z} q_xy q_yz (f_y - f_x)^2 = 2 Q Gamma f(x). Collecting:
2 Gamma_2 = (Lf)^2 + 2 sum_y q_xy Gamma f(y) - (1/2) sum_{y,z} q_xy q_yz (f_z - f_x)^2 + [ - Q Gamma f(x) + Q Gamma f(x) ], which is (B2).
(B3): in (B2) write y = x+a, z = x+a+b, q_xy q_yz = k(a) k(b) rho_ab(x). Split the paths into closed (x+b in W) and open
(x+b not in W). The set of closed paths is symmetric under a <-> b. With A = f(x+a) - f(x), B = f(x+b) - f(x),
Delta = f(x+a+b) - f(x+a) - f(x+b) + f(x): f_z - f_y = B + Delta, f_z - f_x = A + B + Delta, and the symmetrised bracket is
(1/2)[(A+Delta)^2 + (B+Delta)^2] - (1/2)(A+B+Delta)^2 = (1/2) Delta^2 - AB. Finally (Lf(x))^2 = sum_{a,b} k(a)k(b) r_a r_b AB over
x+a, x+b in W, and rho_ab = 0 when x+a+b is outside W. (B4): sum over mn = n of Lambda(m) Lambda(n') is the Dirichlet convolution.  QED.
COMPUTED: (B2) and (B3) agree with Gamma_2 computed from the definition to 3e-14 at four sites (zeta, L = 1, M = 40; check.log, check2.log).
At the centre site: sum-of-squares part >= 0; Hessian part has smallest eigenvalue -0.034 (largest 3.24): u is almost
"log-concave along jumps"; the open-path part has smallest eigenvalue -1.57. So the curvature deficit comes from the window edge.

## Theorem C (PROVED; why Bakry-Emery loses a factor 2, and the calibration that is exact)
Resampling chain: q_xy = lambda pi_y (self-jumps allowed), L f = lambda (pi f - f); its gap is lambda.
(C1) Gamma_2(f)(x) = lambda^2 [ (1/4)(f(x) - pi f)^2 + (3/4) Var_pi f ],  Gamma(f)(x) = (lambda/2)[ Var_pi f + (f(x) - pi f)^2 ].
(C2) Its Bakry-Emery constant is exactly (lambda/2)(1 + 2 min_x pi_x): half the gap in the non-atomic limit.
     (For the complete graph K_n with unit rates this gives (n+2)/2, the known value.)
(C3) Gamma_2(f) - lambda Gamma(f) = (lambda/4) L[(f - pi f)^2] pointwise.
(C4) For ANY reversible chain: if for some rho and some map f -> F_f one has Gamma_2(f) >= rho Gamma(f) + L F_f pointwise for all f,
     then gap >= rho. With F_f = (rho/4)(f - pi f)^2 this criterion is sharp (rho = gap) for the resampling chain.
Proof. (C1): (B2) with q_xy q_yz = lambda^2 pi_y pi_z: (Lf)^2 = lambda^2 a, a := (f(x) - pi f)^2; sum_y lambda pi_y Gamma f(y) = lambda^2 V, V := Var;
(1/4) lambda^2 sum_z pi_z (f_z - f_x)^2 = (lambda^2/4)(V + a). (C2): Gamma_2/Gamma = (lambda/2)(1 + 2V/(a+V)), and a/V is maximal for
f = delta_x: with g = f - pi f, sum_y pi_y g_y = 0 gives (Cauchy-Schwarz) V >= pi_x g_x^2 + (pi_x g_x)^2/(1 - pi_x) = a pi_x/(1 - pi_x),
so V/(a+V) >= pi_x, with equality for f = delta_x. Self-jumps contribute nothing to L, Gamma, Gamma_2 and make the total rate constant, so (B2) applies. (C3): L(g^2)(x) = lambda (V - a) for g = f - pi f, and
(C1) gives Gamma_2 - lambda Gamma = (lambda^2/4)(V - a). (C4): integrate against pi: int Gamma_2 = int (Lf)^2, int Gamma = E(f), int L F = 0;
so ||Lf||^2 >= rho E(f) for all f, which for a reversible chain is gap >= rho.  QED.

## Theorem D (PROVED; reflection positivity: what the prime atoms satisfy and what they do not)
(D1) For every finitely supported real function phi on the integers a >= 2:
     sum_{a,b >= 2} phi(a) phi(b) Lambda(ab)/sqrt(ab) = sum_p (log p) ( sum_{k >= 1} phi(p^k) p^{-k/2} )^2 >= 0.
     Equivalently, in the coordinates v_p (p-adic valuations) of the lattice of positive rationals, the prime coupling
     J(a, a p^k) = (log p) p^{-|k|/2} is reflection positive for every single-coordinate reflection v_p -> -v_p
     (each axis carries an exponential, i.e. a geometric series: this is the Euler product of -zeta'/zeta).
(D2) The same matrix on a, b >= 1 is NOT positive semidefinite (minor on {1, 2}: [[0, log 2/sqrt 2], [log 2/sqrt 2, (log 2)/2]], det < 0).
(D3) The archimedean kernel w(u) = sum_m e^{-(2m+1/2)u} is reflection positive for the reflection x -> -x of the scale
     variable: int int_{x,y>0} phi(x) phi(y) w(x+y) = sum_m ( int phi e^{-(2m+1/2)x} )^2 >= 0.
(D4) The prime atoms are NOT reflection positive for x -> -x: for phi = (b_{x0} - b_{log p - x0})/sqrt 2 with b an even
     L^2-normalised bump of width eps (0 < x0 < log p, 2 x0 != log p, x0 generic), the Hankel form of the measure
     sum_n Lambda(n) n^{-1/2} delta_{log n} equals -(log p)/sqrt p + O(eps).
(D5) On the window, with f even/odd folded to phi on (0, L]: N_even(f) - N_odd(f) = 4 * Hankel form of K at phi; so
     "N_even >= N_odd after folding" is false for zeta although it is true for the archimedean part alone.
Proof. (D1): Lambda(ab) != 0 with a, b >= 2 forces a = p^i, b = p^j, i, j >= 1, and then Lambda(ab) = log p: the matrix is a
direct sum over p of (log p) v_p v_p^T, v_p(p^k) = p^{-k/2}. (D2) by inspection. (D3) termwise. (D4): the cross term is
2 * (1/2) * (-1) * (log p / sqrt p) * int b_{x0}(x) b_{log p - x0}(log p - x) dx = -(log p)/sqrt p; self terms need
2 x0 or 2(log p - x0) within eps of some log n, excluded for generic x0 and small eps; other atoms n != p need
x + y = log n with (x, y) near (x0, log p - x0) or equal positions, excluded likewise. (D5): for f(x) = phi(|x|) resp.
sign(x) phi(|x|), <f, N f> = 2 [T(phi) +- Hankel(phi)], T the Toeplitz form on (0, L].  QED.
COMPUTED (hankel.py.txt, L = 1): Hankel form of the arch part: 0 negative eigenvalues of 20 (M = 40) and of 40 (M = 80);
with the zeta atoms: 9 of 20 and 19 of 40 negative, smallest -1.12 and -1.21; Beurling the same picture (-1.17, -1.31).
[Lambda(ab)/sqrt(ab)] for 2 <= a, b <= 60: smallest eigenvalue -7e-17, rank 17 = number of primes <= 60; for 1 <= a, b <= 60: smallest -2.6.
Meaning: the two halves of the form are reflection positive for DIFFERENT reflections (primes: one valuation at a time;
Gamma factor: all valuations at once, a -> 1/a). An infrared-bound argument would need one reflection for both. This is
barrier B10 written as a statement about reflections; it is true for Beurling primes too, so it does not use the integers.

## Barriers (rule 6)
B1: only Theorem D1 uses the Euler product (the geometric series along each prime). B2: nothing here proves RH for anything;
Theorems A-C apply verbatim to a Beurling system (process exists, curvature the same to 0.5%), and for the impostor the
transform does not exist (5.5% of box couplings negative). B3: Theorem A shows where zero margin sits (two saturated sum
rules); Theorem C shows pointwise Gamma_2 >= rho Gamma can never reach it (factor 2), and what would (an L-exact correction).
