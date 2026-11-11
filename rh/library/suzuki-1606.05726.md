# Suzuki, "Hamiltonians arising from L-functions in the Selberg class"

Note by SP-operator, 2026-11-11. For understanding only (rh/library/README.md).

## 1. Reference and how much was read
Masatoshi Suzuki, arXiv 1606.05726 (TeX file `HSSC_part2_201001.tex`, 2020-09-30; published J. Funct. Anal.
2021 per the project's record). Read IN FULL from the TeX source (rh/library/src/1606.05726/clean.tex, 109k
characters): sections 1 to 8 (Introduction; Main results; Inverse problem; Proofs of Thms 1-2; Proof of
Thm 3; Proof of Thm 4; Spectral realisation; Miscellaneous remarks). The bibliography was not read. The
companion "preliminary paper" it leans on throughout ([Su19_1], the inverse problem for a special canonical
system: Theorem 1.1, Prop. 2.4, Lemmas 2.1, 2.2, 4.1 there) was NOT read; neither was arXiv 1204.1827 (the
zeta-only predecessor, downloaded).

## 2. What it proves
Setting. S_R = L-functions L of the Selberg class with real coefficients and real completed function, L not 1.
xi_L(s) = s^m (s-1)^m Q^s prod Gamma(lambda_j s + mu_j) L(s), entire, xi_L(s) = eps xi_L(1-s), eps = +-1.
z-variable: s = 1/2 - iz. For w > 0, nu a positive integer:
   E(z) = E_L^{w,nu}(z) = xi_L(1/2 + w - iz)^nu,   E#(z) = E(-z) = eps^nu xi_L(1/2 - w - iz)^nu,
   Theta = E#/E,   K = inverse Fourier transform of Theta (taken on Im z = c large).
- **Prop 2.1.** GRH(L) holds if E^{w,1} in HB-bar for all w > 0. **Prop 2.2.** E^{w,nu} in HB for every w > 1/2
  UNCONDITIONALLY, and for 0 < w <= 1/2 under GRH(L). (Via Lagarias-Suzuki, Thm 4 of "LS".)
- **Prop 4.3.** For w0 >= 0, equivalent: (1) L(s) != 0 for Re s > 1/2 + w0; (2) E^{w,nu} in HB for every w > w0;
  (3) Theta^{w,nu} is a meromorphic inner function in C_+ for every w > w0.
- **Prop 4.1.** K(x) = eps^nu sum_{n <= e^x} q(n) n^{-1/2} G(x - log n) for x > 0 and K = 0 for x < 0, where
  sum q(n) n^{-s} = (L(s-w)/L(s+w))^nu, q(n) = n^w sum_{d|n} a^{nu}(n/d) a^{-nu}(d) d^{-2w}, and G is explicit:
  a multiplicative convolution of the functions y^{w - 1/2 - mu/lambda}(1 - y^{-1/lambda})^{2 lambda w - 1}
  /(lambda Gamma(2 lambda w)) (from Gamma(lambda(s-w)+mu)/Gamma(lambda(s+w)+mu)) with the elementary factor from
  ((s-w)(s-w-1)/((s+w)(s+w-1)))^{nu m}. If nu w d_L > 1 (d_L = degree): K is continuous on R, |K(x)| << e^{c|x|},
  |K'| locally integrable; K in C^k if nu w d_L > k + 1.
- **Theorem 2.1.** If nu w d_L > 1, K[t]: f -> 1_{(-inf,t)}(x) int_{-inf}^t K(x+y) f(y) dy is a Hilbert-Schmidt
  self-adjoint operator on L^2(-inf,t) with continuous kernel, K[t] = 0 for t <= 0, and there is tau > 0 such
  that +-1 are not eigenvalues for 0 <= t < tau. UNCONDITIONAL. "We need only the values of K on [0,2t)", i.e.
  the Gamma factor and finitely many q(n), n <= e^{2t}.
- **Theorem 2.2.** With gamma(t) = (det(1 + K[t])/det(1 - K[t]))^2 and H(t) = diag(1/gamma(t), gamma(t)) on
  [0,tau): explicit A(t,z), B(t,z) (built from the solutions phi_t^+- of (1 +- K[t]) phi = K(x+t)) are real
  entire, even / odd in z, solve -d/dt (A,B)^T = z [[0,-1],[1,0]] H(t) (A,B)^T, and A(0,z) - iB(0,z) = E(z).
  UNCONDITIONAL.
- **Prop 4.4 / Theorem 2.3.** If E in HB-bar (unconditional for w > 1/2): ||K[t]|| < 1 for every t >= 0, so H is
  a Hamiltonian on [0,inf), J(t;z,z) is not identically 0 and J(t;z,w) -> 0 as t -> inf.
- **Theorem 2.4 (the equivalence).** GRH(L) <=> there is a sequence (w_n, nu_n) with w_n strictly decreasing to
  0, nu_n w_n d_L > 1, det(1 +- K^{w_n,nu_n}[t]) != 0 for every t >= 0, and lim_{t->inf} J^{w_n,nu_n}(t;z,z) = 0
  for every z in C_+. **Variant (sec. 6.3):** for 0 < w0 < 1/2, the same with w_n -> w0 <=> L(s) != 0 for
  Re s > 1/2 + w0.
- **Section 7.** If E in HB-bar then dom(multiplication by z) is dense in H(E) (Theorem 7.x), so the zeros of
  A = (E+E#)/2 and B are spectra of self-adjoint extensions of one symmetric operator, realised as i d/dx on a
  space V_0 = L^2(0,inf)/K(L^2(-inf,0)); eigenfunctions e^{-i gamma x}(1_{x>=0} - e^{-2i theta} int_0^x K(y)
  e^{i gamma y} dy). Compared with Connes' absorption-spectrum picture.
- **Closing remarks.** (1) The Ramanujan bound (S4) is not needed for Thms 2.1-2.3: a polynomial bound on
  a_L(n) suffices. (2) The Euler product (S5) is essential: it gives K as a function supported on [0,inf).
  (3) local Hamiltonians H_{L,p} exist for the local factors (another paper); relation to the global family
  open. (5) the role of K at +infinity is unknown. (6) a stronger sufficient condition (4') is stated with "no
  plausible evidence" for necessity.

## 3. Method in ten lines
E# / E = Theta is a ratio of two SHIFTED copies of xi_L, hence (Euler product) a Dirichlet series times a ratio
of Gamma factors: its inverse Fourier transform K is supported on the half-line and is a sum over n of
translates of one explicit function. The inverse problem "E -> Hamiltonian" is solved without knowing E in HB,
by the method of Burnol (2011) for the Hankel transform: K[t] is a Hankel-type operator (kernel K(x+y) cut at
t); as long as 1 +- K[t] are invertible the two integral equations (1 +- K[t]) phi = K(. + t) have solutions,
and the ratio of the two Fredholm determinants is the diagonal Hamiltonian (a Krein string; the two signs are
the even and odd parts). Unconditionally this works on a short interval [0,tau) (a norm estimate of Theta high
in the upper half-plane). If Theta is inner, the full operator K is an isometry, K[t] a strict contraction
(a function with K[t]f of norm ||f|| would have compactly supported image, impossible by a zero count:
T log T zeros against O(T) for exponential type), so everything extends to [0,inf). Conversely existence on
[0,inf) plus J -> 0 gives E in HB-bar (de Branges theory), i.e. no zeros of xi_L to the right of 1/2 + w.
The power nu only makes K continuous (decay |u|^{-nu w d_L} of Theta) and does not change the HB property.

## 4. Where it stops
- The equivalence is a reformulation: conditions (3), (4) of Thm 2.4 are not verified for any w <= 1/2.
  The unconditional interval [0,tau) has no explicit tau.
- The limit w -> 0 is not taken: at w = 0, Theta = eps^nu identically and the de Branges space degenerates;
  the "genuine" space is that of E = xi + xi', for which no Hamiltonian is constructed (remark (3), and the
  end of section 7). nu(w) -> infinity as w -> 0.
- "A sharp estimate of K(x) for large x is not necessary ... we do not know the role of the behaviour of K at
  +infinity" (remark (5)). All q(n) are needed for the limit t -> infinity, finitely many for each t.
- Depends on the unread companion paper for the inverse-problem theorem and for "J -> 0 implies HB-bar".

## 5. What it changes in our record
- KNOWLEDGE section 7 entry ("search-result summaries only; equivalent condition for GRH in terms of canonical
  systems"): CONFIRMED, now with the exact statement (Thm 2.4) and the exact object. Correction of emphasis:
  the canonical systems are NOT the window family of the Weil form; they are attached to the shifted functions
  xi(1/2 + w - iz), one system per w > 0, each chain running over t >= 0 with primes <= e^{2t}.
- Notebook N19 / lane A idea A4 / idea #8 log ("RH <=> the window family is a Krein/canonical system with no
  singularity is KNOWN in substance"): the known theorem is about the w-family. For the window family the
  corresponding statement is only in Suzuki 2606.09096 sec. 7.9 (under RH) and SP-operator PROOFS.md P1.
- Barrier B11 (KNOWLEDGE): the family F_d = zeta(s-d) zeta(s+d) of seminar S1 is this paper's dial: on its
  centre line the completed F_d equals |E^{d,1}(x)|^2, and the paper uses the RATIO zeta(s-d)/zeta(s+d) where
  the seminar used the product. Prop 4.3 is the precise form of "the dial knows only where it stops".
  Remark (1) is a published instance of "the construction does not use the size of the local roots".
- Seminar B60 / B84 (doubling step, T +- H): gamma = (det(1+K)/det(1-K))^2 is the ratio of the even and odd
  determinants; atoms at log n enter at t = (1/2) log n (answer B123).
- Idea #7 ("adjoin p"): remark (3) points to local Hamiltonians H_{L,p} (Suzuki's "Su16", not read).
- Reading list: add [Su19_1] (the inverse-problem paper), Burnol 2011, Lagarias 2005/2006/2009, Lagarias-Suzuki.

## 6. Reliability
Refereed (J. Funct. Anal.), by a specialist. The arXiv TeX contains leftover drafting comments (in a
\comment block and coloured notes), which do not affect statements. I checked the logic of sections 4-6 as I
read; the key external inputs ([Su19_1] Thm 1.1 and Prop. 2.4; de Branges Thm 40; Lagarias-Suzuki Thm 4) were
not verified by me. Lemma 4.3's zero-counting argument ("almost surely" language) is informal in wording but
the conclusion used (T log T zeros of the numerator survive) is plausible and standard.
