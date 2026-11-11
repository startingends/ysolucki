# PROOF_bridge: planks 5, 6, 7 of bridge 1 (rh/BRIDGE.md, idea #27)

SP-operator, session 2, 2026-11-11. Labels: PROVED (full argument here, given the facts marked CITED) /
COMPUTED (command and numbers) / HEURISTIC / KNOWN (with what I read). Numerics: `bridge/bridge5.py.txt`,
logs `bridge/run_L0.5_K8.log`, `bridge/run_L0.75_K8.log`; predictions written first in `bridge/PREDICTION.md`.

## 0. Setting and conventions
* lambda = e^L. Multiplicative variable x > 0, d*x = dx/x, u = log x. Window [1/lambda, lambda] = {|u| <= L}.
* Weil form of real functions on the line (PROOF_parity_index sec. 0; Suzuki 2606.09096 sec. 1, read):
  Q(phi, chi) = P + A - Pi,
  P(phi,chi) = int int phi(u) chi(u') 2cosh((u-u')/2),
  A(phi,chi) = (psi(1/4) - log pi) <phi,chi> + int_0^inf w(t) <phi - S_t phi, chi - S_t chi> dt,
       w(t) = e^{-t/2}/(1 - e^{-2t}) = sum_{m>=0} e^{-(2m+1/2)t},  (S_t phi)(u) = phi(u - t),
       [equivalent to A = -log(pi) c(0) + int_0^inf (c(0) e^{-2t}/t - 2 w(t) c(t)) dt, c(t) = <phi, S_t chi>
        symmetrised; Gauss: int_0^inf (e^{-2t}/t - 2w(t)) dt = psi(1/4)],
  Pi(phi,chi) = sum_{n>=2} Lambda(n) n^{-1/2} ( <phi, S_{log n} chi> + <S_{log n} phi, chi> ).
  Off the diagonal the kernel of Q is k(t) = 2cosh(t/2) - w(|t|) - sum_n Lambda(n) n^{-1/2} delta(|t| - log n),
  and 2cosh(t/2) - w(t) = e^{t/2} - sum_{m>=1} e^{-(2m+1/2)t} for t > 0.
* EXPLICIT FORMULA (CITED: Weil 1952; in Barner's class, from memory; used by the project throughout): if
  phi, chi are real, piecewise C^1 with finitely many jumps, and O(e^{-(1/2+eps)|u|}) with their derivatives,
  then Q(phi,chi) = sum_rho phi~(rho) chi~(1 - rho), phi~(s) := int phi(log x) x^{s-1/2} d*x, the sum over the
  zeros of xi with multiplicity, absolutely convergent. (For such phi, chi the function phi * chi~ is
  continuous, piecewise C^1, exponentially decaying at rate > 1/2: Barner's conditions.)
* For g even on R: g^(xi) = int g(y) e^{-2 pi i xi y} dy. E(g)(x) = x^{1/2} sum_{n>=1} g(n x), x > 0.
  B = band-limiting to |xi| <= lambda, B_perp = 1 - B.

## 1. PLANK 5: the exact identity

### Theorem 5.1 (PROVED).
Let g be even, supported in [-lambda, lambda], continuous, piecewise C^2 with g' continuous
(so g(+-lambda) = 0 = g'(+-lambda) and g^(xi) = O(|xi|^{-3})), with g(0) = 0 and g^(0) = 0. Put F = E(g),
f = F 1_{[1/lambda, lambda]} and T = F 1_{(0, 1/lambda)}. Then
 (i)  F(x) = 0 for x > lambda; F is continuous and piecewise C^2 on (0, inf);
 (ii) T(x) = x^{-1/2} sum_{m>=1} g^(m/x) = x^{-1/2} sum_{m>=1} (B_perp g^)(m/x) for 0 < x < 1/lambda, and
      T(x) = O(x^{5/2}) as x -> 0 (O(x^{k+1/2}) if g^ = O(|xi|^{-k-1}));
 (iii) F~(s) = zeta(s) Mg(s), Mg(s) = int_0^inf g(y) y^s d*y, entire; so F~(rho) = 0 at every zero rho;
 (iv) Q(F, chi) = 0 for every chi in the class of sec. 0; in particular Q(F,F) = 0 and Q(F,T) = 0;
 (v)  Q_L(f) = Q(T) = W(T) = -Q(f, T), and each of the three parts P, A, Pi of W(T) converges absolutely.
      The last form is a pure coupling across the cut:
        Q_L(f) = - int int_{u < -L <= u'} T(u) f(u') k(u' - u) du du',
        k(t) = e^{t/2} - sum_{m>=1} e^{-(2m+1/2)t} - sum_n Lambda(n) n^{-1/2} delta(t - log n)   (t > 0).

Proof. (i) g(nx) = 0 when nx > lambda; on a compact subset of (0, inf) the sum is finite; joins at
x = lambda/n are C^1 because g and g' vanish at lambda.
(ii) Poisson summation for g (continuous, compactly supported, g^ = O(xi^{-3}), so both sides converge
absolutely): sum_{n in Z} g(n x) = (1/x) sum_{m in Z} g^(m/x). With g even, g(0) = 0 = g^(0):
sum_{n>=1} g(nx) = (1/x) sum_{m>=1} g^(m/x). For x < 1/lambda and m >= 1, m/x > lambda, so only B_perp g^
enters. The bound follows from |g^(xi)| <= C |xi|^{-3}.
(iii) For Re s > 1: int x^{1/2} sum_n g(nx) x^{s-1/2} d*x = sum_n n^{-s} int g(y) y^s d*y (Fubini; g bounded with
compact support). Mg is analytic in Re s > -2 because g(y) = O(y^2) at 0 (g even, C^2 near 0, g(0) = 0), with
a simple pole of zeta at s = 1 cancelled by Mg(1) = int_0^inf g = g^(0)/2 = 0. On the other hand F~(s) is
analytic in Re s > -2 by (i), (ii) (F = O(x^{5/2}) at 0, compact support). The two agree for Re s > 1, hence
everywhere; zeta(rho) = 0 and Mg(rho) finite give F~(rho) = 0.
(iv) F and chi are in the class of sec. 0 (F by (i), (ii)); apply the explicit formula; every term has the
factor F~(rho) = 0. T = F 1_{u < -L} is F cut at one point: piecewise C^1 with one jump, same decay; so T is
an admissible chi.
(v) f = F - T. Q(f) = Q(F,F) - 2Q(F,T) + Q(T) = Q(T). Also Q(f,T) = Q(F,T) - Q(T) = -Q(T). f and T have
disjoint supports separated only by the point u = -L, so Q(f,T) involves the kernel of Q only at u' - u > 0:
no diagonal term. Absolute convergence: T = O(e^{5u/2}) as u -> -inf, so <T, e^{-u/2}> converges, c_T(t) =
O(e^{-5t/2}) and sum Lambda(n) n^{-1/2} c_T(log n) converges; A(T) is finite because T is piecewise C^1 with one
jump (the jump energy of a jump is int_0 w(t) t dt-integrable). QED

Remarks. (1) The identity is three lines of algebra once (iv) is known: for ANY null vector F = f + T of a
symmetric form, Q(f) = Q(T) = -Q(f,T). All the content is in (i)-(iii): the null vector is supported on
x <= lambda and its part below 1/lambda is the Poisson image of the out-of-band part of g^.
(2) Nothing uses the Euler product. For a Dirichlet series D(s) = sum a_n n^{-s} with a_1 = 1 and an explicit
formula of the same shape (functional equation), E_a(g)(x) = x^{1/2} sum a_n g(nx) has transform D(s) Mg(s) and
the same proof gives Q^D_L(f) = W^D(T), T = E_a(g) cut to x < 1/lambda, for the control F_d and for the
Davenport-Heilbronn impostor alike (its a_n are periodic mod 5, so its tail is given by a twisted Poisson
formula). Not written out control by control: HEURISTIC that no extra condition appears. Consequence for
plank 9: plank 5 is NOT where a control fails.

### Proposition 5.2 (pole bookkeeping; PROVED).
Same g but with arbitrary a := g^(0)/2 and b := g(0)/2. Then for 0 < x < 1/lambda
   E(g)(x) = T_0(x) + a x^{-1/2} - b x^{1/2},     T_0(x) := x^{-1/2} sum_{m>=1} (B_perp g^)(m/x),
(T_0 is the leak tail; the two extra terms are not in L^2(d*x) / not in the Weil class), f := E(g) on the window
is still a window function, and with X(s) := T_0~(s) + a lambda^{1-s}/(s-1) - b lambda^{-s}/s:
   Q_L(f) = sum_rho X(rho) X(1 - rho)
          = W(T_0) + 2a l_1(T_0) - 2b l_0(T_0) + (a^2 lambda + b^2/lambda) s_1 + 2ab s_2,
   l_1(T) = sum_rho lambda^{1-rho} T~(1-rho)/(rho - 1),   l_0(T) = sum_rho lambda^{-rho} T~(1-rho)/rho,
   s_1 = sum_rho 1/(rho(1-rho)) = 2 + gamma - log(4 pi) = 0.0461914...,   s_2 = sum_rho rho^{-2} = -0.0461543...
(the two constants: KNOWN values, from memory; s_1 = 2 x Li's lambda_1, checked against KNOWLEDGE sec. 4).
Proof. R := E(g) - (a x^{-1/2} - b x^{1/2}) 1_{x<1/lambda} = f + T_0 is in the class of sec. 0 (one jump at
1/lambda). For Re s > 1, R~(s) = zeta(s)Mg(s) - a lambda^{1-s}/(s-1) + b lambda^{-s}/s; R~ is entire, the right
side is meromorphic with its poles at s = 1 (residue Mg(1) - a = 0) and s = 0 (residue zeta(0) g(0) + b = 0)
cancelled; so at a zero R~(rho) = -a lambda^{1-rho}/(rho-1) + b lambda^{-rho}/rho, and f~(rho) = R~(rho) -
T_0~(rho) = -X(rho). Apply the explicit formula to Q(f,f) and expand; the sums converge absolutely
(T_0~(rho) = O(1/|rho|)). QED
On the prime side the linear terms contain the primes through Chebyshev's function: for y < 1/lambda,
sum_rho (lambda y)^{-rho}/rho = x - psi_0(x) - log 2 pi - (1/2) log(1 - x^{-2}) at x = 1/(lambda y) (von Mangoldt),
so l_0(T) = int_0^{1/lambda} T(y) y^{1/2} [x - psi_0(x) - log 2pi - (1/2) log(1 - x^{-2})] d*y, and similarly l_1.
(The interchange of the sum over zeros with the integral is formal here: the von Mangoldt series converges
only conditionally; label for this prime-side form of l_0, l_1: HEURISTIC. The zero-side formula is PROVED.)
SIZE of the corrections on the e27 vectors (g = h_n - (h_n(0)/h_b(0)) h_b, time-limited prolates): b = 0
exactly; a = g^(0)/2 = psi_n(0)(mu_n - mu_b)/2 is of order 1 - chi_n (the two truncated-Fourier eigenvalues
differ by that much), while ||T_0|| is of order (1 - chi_n)^{1/2}. So W(T_0) ~ (1 - chi_n), the linear
correction ~ a ||T_0|| ~ (1 - chi_n)^{3/2}, the quadratic one ~ (1 - chi_n)^2: the corrections are SMALLER than
the form by a factor (1 - chi_n)^{1/2}. HEURISTIC (orders of magnitude, not computed). They are not zero, so
the e27 numbers are not literally W(T_0).

### Proposition 5.3 (g with jumps at +-lambda, e.g. time-limited prolates; PROVED as a limit).
If g is piecewise C^2 on [-lambda, lambda] with g(+-lambda) != 0, then E(g) = g(lambda) x^{1/2} (1/2 - {lambda/x})
+ O(x^{3/2}) as x -> 0 (Euler-Maclaurin; a sawtooth times x^{1/2}): the tail decays exactly at the critical rate
e^{u/2}, the three parts of W(T) are only conditionally convergent, and Theorem 5.1 does not apply as stated.
What holds: with g_eps a smooth even mollification of g supported in [-lambda, lambda] (dilate slightly, then
mollify) and keeping g_eps(0) = g_eps^(0) = 0, f_eps -> f in the form norm of Q_L (a mollified jump converges
to the jump in H^log with error eps log(1/eps), as in Suzuki's proof of Thm 1.1), hence
Q_L(f) = lim W(T_eps). Whether W(T) itself converges as an iterated sum is not needed and not decided here.
So for prolate companions the right side must be defined by this limit, or computed on the zero side.

## 2. Numerical confirmation of plank 5 (COMPUTED)
Command: `flock <scratchpad>/heavy.lock python3 tools/memcap.py 2 python3 bridge5.py.txt 0.5 8 60 3.2 80 60`
(33 s) and `... 0.75 8 70 3.0 60 50` (47 s). g(y) = G(y/lambda), G(s) = s^2(1 - 7s^2)(1 - s^2)^8: g(0) = 0,
g^(0) = 0 exactly, g in C^7. F is an exponential sum on each piece (-log(N+1), -log N] of v = log(x/lambda), so
every integral in P, A, Pi is in closed form; the arch term is summed as -2 sum_m [I(a_m) - c(0)/a_m] with a
fitted asymptotic tail; 60-70 digits; tail kept down to v = -4.2; prime powers up to 80; no zeros used.
Evaluator check: on the constant function it reproduces lane A's matrix entry 2L q_00 = 0.0880146104737...
to 8e-45 (prediction P5: HIT).

| L | Q_L(f) | W(T) | relative difference | Q_L(f)/‖f‖² | W(T)/‖T‖² | W(F)/‖F‖² |
|---|---|---|---|---|---|---|
| 0.5 | 5.319033963532684672e-8 | 5.319033963532955979e-8 | 5.1e-14 | 4.93e-4 | 0.7459 | 1.6e-26 |
| 0.75 | 3.666016833422032901e-11 | 3.666016833422022343e-11 | 2.9e-15 | 2.65e-7 | 1.5085 | 5.7e-17 |

Parts at L = 0.5. Window side f: pole 1.2658e-4, arch -1.2611e-4, primes 4.18e-7: a difference of numbers
2400 times the result. Tail side T: pole 1.4889e-8, arch 3.8191e-8, primes -1.10e-10: all of the size of the
result, the prime term 0.2 percent of it and NEGATIVE. Predictions P1 (agreement better than 1e-10), P2 (W(F)
= 0), P3 (sizes) all HIT. The residual differences 5e-14, 3e-15 are the truncation of the tail.

## 3. PLANK 7: the primes are eliminated on the tail side, exactly, with no boundary term

Log variable. phi := B_perp g^, psi(v) := e^{-v/2} phi(e^{-v}) (supported in v <= -L), Z := sum_{m>=1}
m^{-1/2} S_{log m} (convolution with sum m^{-1/2} delta_{log m}), V := sum_{n>=2} Lambda(n) n^{-1/2} S_{log n},
U := multiplication by u, C := multiplication by 1_{u < -L}. Then T = C Z psi, and Pi(T) = 2 <T, V T>.

### Theorem 7.1 (PROVED, under the hypotheses of Theorem 5.1).
 (a) V Z = [U, Z] := U Z - Z U = sum_{k>=2} (log k) k^{-1/2} S_{log k}      (this is Lambda * 1 = log);
 (b) C V (1 - C) = 0     (V only shifts to the right, C cuts to a left half-line);
 (c) Pi(T) = 2 <T, [U,Z] psi> = 2 <T, U T> - 2 <T, Z U psi>
           = 2 int_0^{1/lambda} T(x) T_log(x) d*x,    T_log(x) := x^{-1/2} sum_{m>=2} (log m) phi(m/x).
 So   W(T) = P(T) + A(T) - 2 <T, T_log>,
 a quadratic form in phi = B_perp g^ in which no prime occurs: the integers enter through the two lattice sums
 T = x^{-1/2} sum_m phi(m/x) and T_log = x^{-1/2} sum_m (log m) phi(m/x), and there is NO boundary term from the
 cut. The conjecture of the plank holds.
Proof. (a) V Z = sum_{n,m} Lambda(n) (nm)^{-1/2} S_{log nm} = sum_k (sum_{n|k} Lambda(n)) k^{-1/2} S_{log k}, and
(U S_a - S_a U) chi (u) = (u - (u - a)) chi(u - a) = a (S_a chi)(u). (b) If chi vanishes on u < -L then S_a chi,
a > 0, vanishes on u < -L + a. (c) <T, V T> = <T, C V C Z psi> = <T, C V Z psi> - <T, C V (1-C) Z psi> =
<T, [U,Z] psi> by (b), (a). [U,Z]psi (u) = sum_k log k k^{-1/2} psi(u - log k) = x^{-1/2} sum_k (log k) phi(k/x).
Also <T, U Z psi> = <T, U T> because T = C Z psi and U commutes with C. All sums converge absolutely:
phi(xi) = O(xi^{-3}). QED

COMPUTED (same runs): Pi(T) as a sum over prime powers = -1.104406501998788e-10 (L = 0.5),
-3.3987917708390654e-14 (L = 0.75); prime-free 2 <T, T_log> with g^ in closed form, 12-point Gauss-Legendre
per piece, m <= 60 / 50: -1.1044065022843e-10 and -3.39879177067184e-14; relative differences 2.6e-10 and
4.9e-11 (prediction P4, < 1e-9: HIT; the limit is the quadrature of the second expression).

### What kind of object this is, in my toolkit
1. TOEPLITZ LANGUAGE (PROVED, same computation). On L^2(-inf, -L) put T_h := C h(shifts) C for a "symbol" h.
   Right shifts compressed to a LEFT half-line are backward shifts, so symbols built from right shifts
   (Dirichlet series in n^{-1/2} S_{log n}) are co-analytic for this half-line and their Toeplitz operators
   MULTIPLY: T_{h1 h2} = T_{h1} T_{h2}. With zeta-bar := the symbol of Z and nu-bar := the symbol of V
   (the Dirichlet series -zeta'/zeta): T = T_{zeta-bar} psi and C V C T_{zeta-bar} = T_{nu-bar} T_{zeta-bar} =
   T_{nu-bar zeta-bar} = T_{-zeta'-bar} = [U, T_{zeta-bar}]. That is all plank 7 is: for co-analytic Toeplitz
   operators the product rule holds without Hankel correction (Brown-Halmos; in Widom's identity
   T(ab) = T(a)T(b) + H(a)H(b~) the Hankel term vanishes when a is co-analytic). The cut is on the right side
   of the tail for this to work; on the window side (cut on both sides) it fails, which is why the primes cannot
   be eliminated from Q_L(f) itself.
2. So W(T) = <T_{zeta-bar} psi, Acal T_{zeta-bar} psi> - 2 <T_{zeta-bar} psi, [U, T_{zeta-bar}] psi>, where
   Acal := C (P + A) C is the compression to the half-line of the PRIME-FREE Weil operator (pole + Gamma,
   Fourier symbol Re psi_digamma(1/4 + ir/2) - log pi plus the rank-two pole term). The first term is "the
   archimedean Weil form of the tail", the second a commutator with the position operator. In the two runs
   the commutator term is 0.2 percent (L = 0.5) and 0.09 percent (L = 0.75) of W(T) and has the favourable sign
   (Pi(T) < 0). COMPUTED for one g only; no claim for other g.
3. Equivalent statement (Theorem 5.1 (v)): W(T) = -Q(f,T), a HANKEL-type coupling across the cut with the
   classical explicit-formula kernel e^{t/2} - sum_{m>=1} e^{-(2m+1/2)t} - sum Lambda(n) n^{-1/2} delta(t - log n)
   (the kernel of S1-parity's B25). So the window form is, exactly, minus the mirror coupling between the
   window function and its Poisson tail.
4. IS IT THE SONIN TRACE of Connes-Consani 2006.13771 (Thm 4.7: tr(theta(f) S) = W_inf(f) + int f eps d*rho;
   Thm 1: W_inf(g*g*) >= Tr(theta(g) S theta(g)*) on the no-prime window)? I CANNOT IDENTIFY THEM, and I do
   not think they are the same object. What I can say from the digest (read: parts 2-3 of
   rh/library/connes-consani-weil-positivity-archimedean.md; the paper itself not read by me): their exact
   identity is at the archimedean place only, with the pair of projections at scale 1 (prolate parameter
   2 pi), valid for all test functions; the positive term is a trace over Sonin's space (functions vanishing
   with their transform on [-1,1]). Ours is at all places, at scale lambda (parameter 2 pi lambda^2), valid on
   the window, and the positive candidate is W(T) with T built from phi = B_perp g^. phi is NOT in a Sonin
   space: it vanishes on the band but its transform g - (B g^)^ does not vanish on [-lambda, lambda]. The link
   I can prove is only this: on the no-prime window L <= (1/2) log 2, for f with f^(+-i/2) = 0, Q_L(f) is their
   W_inf(f * f*), so their Theorem 1 reads W(T) >= Tr(theta(f) S theta(f)*) - c |f^(0)|^2: the Sonin trace is a
   candidate LOWER bound for our tail form there, i.e. it sits where plank 8 wants kappa D, not where W(T) sits.
   What is missing to compare Tr(theta(f) S theta(f)*) with D_L(f): the relation between the scaling action
   theta(f) on L^2(R)_ev and the map g -> E(g) (they are adjoint to each other through the lattice sum), which
   I have not worked out.

## 4. PLANK 6: the comparison form D_L on the whole window space

Definition. For f in L^2 of the window let g_f := the unique function on 1/lambda <= |y| <= lambda with
E(g_f) = f on the window. It exists and is given by Moebius inversion (PROVED: for x in [1/lambda, lambda],
x^{-1/2} f(x) = sum_{n <= lambda/x} g(nx) involves only arguments in [x, lambda], so
g_f(x) = sum_{n <= lambda/x} mu(n) (nx)^{-1/2} f(nx), a finite sum; f -> g_f is a bounded bijection of
L^2([1/lambda, lambda]) with bounded inverse). A companion is g = g_f + h with h even, supported in
|y| < 1/lambda. Let P_in = restriction to |y| < 1/lambda, P = restriction to |y| <= lambda.
   D_L(f) := inf { ||B_perp (g_f + h)^||^2 : h in L^2_even(|y| < 1/lambda), int (g_f + h) = 0 }.

Proposition 6.1 (PROVED).
 (a) Without the constraint int g = 0: D'_L(f) = <g_f, Sigma g_f>, Sigma := the Schur complement of the positive
     operator M := P B_perp P = 1 - P B P on L^2(|y| <= lambda) with respect to the inner block
     N := P_in B_perp P_in = 1 - P_in B P_in. N >= 1 - chi_0(2 pi) > 0 (P_in B P_in is the time-and-band limiting
     operator with parameter 2 pi (1/lambda) lambda = 2 pi, whose top eigenvalue chi_0(2 pi) is < 1), so N is
     boundedly invertible, the infimum is attained at h* = -N^{-1} P_in B_perp g_f, and
     (1 - chi_0(2 pi lambda^2)) ||g_f||^2 <= D'_L(f) <= ||g_f||^2.
 (b) The constraint int g = 0 is one bounded linear condition on h; the constrained infimum D_L is again a
     bounded quadratic form of g_f, with D'_L <= D_L <= C ||g_f||^2.
 (c) Hence D_L is a BOUNDED, everywhere-defined, closed quadratic form on L^2(window), strictly positive, with
     D_L(f) = 0 only for f = 0. Its domain is all of L^2(window). Its small eigenvalues are those of a Schur
     complement of 1 - PBP (prolate defects at c = 2 pi lambda^2).
 (d) The condition g(0) = 0 is NOT closable in L^2 (point evaluation of h at 0 is not continuous), so it drops
     out of the infimum: the infimum over companions with g(0) = 0 equals the infimum over all companions, and
     is not attained in the constrained class. To keep g(0) = 0 the leak must be measured in a norm that
     controls int |g^|, for example int |phi(xi)|^2 (1 + |xi|)^{1+eps} d xi on the out-of-band part (then
     g -> g(0) = int g^ is continuous). With the plain L^2 norm, D_L does not see the second pole condition.
Proof. (a) inf_h <g_f + h, B_perp (g_f + h)> is a quadratic minimisation in h with Hessian N; standard. The two
bounds: Sigma is a Schur complement of M and M >= (1 - chi_0(2 pi lambda^2)) on L^2(|y| <= lambda) (Slepian-
Pollak-Landau: the top eigenvalue of PBP is chi_0(c) < 1, KNOWN, from memory); a Schur complement of M is
>= the bottom of M and <= the corresponding diagonal block, which is <= 1. (b), (c) follow. (d) The set
{h : h(0) = 0} is dense in L^2. QED

Consequences for the planks (PROVED from 6.1 unless marked).
 * UPPER COMPARISON Q_L <= C D_L (plank 6, "expected easy") is FALSE on the form domain: D_L is bounded on
   L^2(window), Q_L is not (its symbol grows like log|r|). Exact obstruction: sup Q_L(f)/D_L(f) = infinity,
   along f = high-frequency oscillations. An upper comparison can hold only after the leak norm is replaced
   by one of logarithmic order (for instance the weighted norm of (d) with a log weight), or on a
   finite-dimensional ladder as in plank 3.
 * LOWER COMPARISON Q_L >= kappa D_L (plank 8) is a meaningful statement for this D_L, and because D_L >=
   (1 - chi_0(c)) c' ||f||^2 it implies positivity of Q_L. But its two sides are different KINDS of objects:
   by Theorem 5.1, Q_L(f) = W(T) is a form of logarithmic order in the TAIL T = C Z psi, and T is related to the
   leak phi through the lattice sum Z, which is unbounded on L^2 (||T||^2 is, for the uncut sum, the integral of
   |zeta(1/2 + ir)|^2 |M phi(1/2 + ir)|^2 dr). So "W(T) >= kappa ||phi||^2" has to pass through a lower bound
   for the compressed lattice-sum operator T_{zeta-bar} on the half-line, and it is not automatic that the g
   minimising the L^2 leak is in the class of Theorem 5.1 (it has g(0) != 0 in general: then the true tail
   contains -(g(0)/2) x^{1/2}, which the leak does not see, and Prop. 5.2's corrections appear).
 * WHICH D TO COMPARE WITH (my suggestion, HEURISTIC): define the comparison form on the tail side, where the
   identity lives: D^tail_L(f) := inf over admissible companions (g(0) = 0 = g^(0), class of Thm 5.1 or its
   closure) of ||T||^2_{L^2(d*x)} or of the archimedean form <T, Acal T>. Then plank 8 reads
   "W(T) >= kappa <T, Acal_+ T>" on tails, a statement about ONE function T and two forms of the same order,
   with the commutator term of Theorem 7.1 as the only non-archimedean piece; in the two computed cases
   W(T)/||T||^2 = 0.75 and 1.51.

## 5. What these planks say about plank 9 (controls)
Theorem 5.1 uses only: a Dirichlet series with a_1 = 1, the explicit formula, Poisson summation. Theorem 7.1
uses only c * a = a log (the definition of the logarithmic derivative) and the one-sidedness of the cut.
Neither uses the Euler product, the sign of the coefficients, or the size of the local roots. PROVED for zeta;
for F_d and the impostor the same proofs apply with their own lattice sums (HEURISTIC that no extra hypothesis
is needed; not written out). So planks 5 and 7 are twist-blind and impostor-blind identities, and every
arithmetic input of the bridge has to enter in plank 8. For a control the identity reads the same way:
Q_L(f) = W(T) < 0 must then happen for some tail, i.e. the control's tail form is NOT positive: the place to
look is which tails make the impostor's W(T) negative (its first failure at L = 1.71).

## 6. Novelty (owner rule 5)
Searched 2026-11-11 (two web queries, result lists and snippets only, no paper opened): (1) Burnol co-Poisson /
Sonine spaces / Weil quadratic form / tail identity; (2) Connes trace formula P_Lambda, P^_Lambda, map E, cutoff
identity. Found: Burnol's co-Poisson formula and Sonine spaces (C. R. 2002; "Two complete and minimal systems
associated with the zeros of the Riemann zeta function", arXiv math/0203120; "Co-Poisson intertwining", Ann.
Inst. Fourier 2007) and Connes 1999 are the neighbouring literature; neither snippet states the identity
Q_L(f) = W(T) or the elimination of Theorem 7.1. The reader's digests rh/library/2511.22755.md (lines 374-384)
and 2106.01715.md say the same of Connes-Consani-Moscovici and Connes-Consani: the mechanism (range of E in
the radical, support statements) is there, the identity and D_L are not. Status: NOT FOUND in what was read;
NOT established as new. Theorem 5.1 is three lines once the radical statement is known and Theorem 7.1 is the
multiplicativity of co-analytic Toeplitz operators; both are of the kind that specialists would consider
immediate. Burnol's papers must be read before anything is called new.
