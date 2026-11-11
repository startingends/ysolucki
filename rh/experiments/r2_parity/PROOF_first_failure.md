# PROOF_first_failure: the exact statement of the first-failure template (idea #8), and what is provable about the null vector

Agent R2-parity, 2026-11-10. JOB 1 (c). Notation as in PROOF_parity_index.md (Q = P + A - Pi, zero side, Z, nu).

## 0. What is cited (not proved here)
(S1) Suzuki, arXiv 2606.09096, Thm 1.1: for each L > 0 the form Q_L is closed and bounded below on a form domain
     Dom_L in L^2[-L, L]; the associated self-adjoint operator has discrete spectrum. [as recorded in KNOWLEDGE 7]
(S3) ibid. Thm 1.3: the lowest eigenvalue lambda(L) is continuous in L.
(S4) ibid. Thm 1.4: lambda(L) > 0 for all sufficiently small L.
(CORE) ASSUMPTION, to be checked against Suzuki's text: Dom_L is the set of f in L^2[-L,L] with
     int log(2+|r|) |fhat(r)|^2 dr < infinity, extension by zero embeds Dom_L in Dom_L' for L < L', translation by c
     maps Dom_L into Dom_{L+|c|}, the zero-side formula Q(f,h) = sum_gamma m_gamma fhat(gamma) conj hhat(conj gamma) holds
     on Dom_L, and Q is translation invariant. (All are immediate for D_L = C_c^infinity; they are properties of the
     kernel. I have not read the part of the paper that fixes the domain, so this is marked as an assumption.)
(SEL) Selberg 1942: the number N_0(T) of zeros on the line up to height T is >= c T log T, c > 0.

## 1. Lemma 1 (monotonicity). PROVED (given CORE)
lambda(L) = inf { Q(f)/||f||^2 : f in Dom_L, f != 0 } is NON-INCREASING in L.
Proof. Dom_L is contained in Dom_L' for L < L' and the form is the same; an infimum over a larger set is smaller. QED
(KNOWLEDGE section 7 records "no monotonicity found" in the literature read; it is one line from the min-max principle.)

## 2. Lemma 2 (no null vector under RH; more generally the transform of a null vector must see an off-line zero). PROVED
Let f in Dom_L, f != 0. Then fhat does not vanish at all real gamma. Consequently:
 (i) if RH holds, Q_L(f) = sum m_gamma |fhat(gamma)|^2 > 0 for every f != 0: lambda(L) > 0 for every L (strictly);
 (ii) in general, Q(f) <= 0 forces sum_{z in Z} m_z Re[ fhat(z) conj(fhat(conj z)) ] < 0.
Proof. fhat is entire, |fhat(z)| <= ||f||_1 e^{L |Im z|}, not identically zero. Write fhat(z) = z^j F(z), F(0) != 0.
Jensen's formula: int_0^r n_F(s)/s ds <= log max_{|z|=r} |F| - log|F(0)| <= L r + O(log r). Hence
n_F(r) log 2 <= int_r^{2r} n_F(s)/s ds <= 2 L r + O(log r): F has O(r) zeros in |z| <= r. By (SEL) the number of real gamma
with |gamma| <= r is >= 2 c r log r, eventually larger. So some real gamma has fhat(gamma) != 0 and
Q^+(f) = sum_{real} m |fhat(gamma)|^2 > 0. (i): under RH, Q = Q^+. (ii): Q = Q^+ + 2 sum_{z in Z} m_z Re[fhat(z) conj fhat(conj z)]. QED

## 3. Theorem 3 (first-failure template, exact form). PROVED given S1, S3, S4, CORE
The following are equivalent:
 (A) RH is false;
 (B) there is L with lambda(L) < 0;
 (C) there is L_0 > 0 with lambda(L) > 0 for 0 < L < L_0 and lambda(L_0) = 0 (the "first failure"); then Q_{L_0} >= 0 and
     there is psi != 0 in Dom_{L_0} with Q_{L_0}(psi) = 0;
 (D) for some L there is psi != 0 in Dom_L with Q_L >= 0 on Dom_L and Q_L(psi) = 0.
Moreover the set {L : lambda(L) = 0} is a closed interval [L_0, L_1] (possibly a point, possibly empty exactly when RH
holds), lambda > 0 to its left and lambda < 0 to its right.
Proof. (A) => (B): PROOF_parity_index Theorem 4, Step 4 with k = 1 gives g in some D_L with Q(g) < 0.
(B) => (C): by S4 and S3 and Lemma 1, L_0 := inf{L : lambda(L) <= 0} is positive; lambda > 0 on (0, L_0) by definition;
lambda(L_0) >= 0 by continuity from the left and <= 0 by continuity from the right (there are L_n -> L_0 with
lambda(L_n) <= 0). By S1 the infimum of the spectrum is an eigenvalue: an eigenvector psi for the eigenvalue 0.
(C) => (D) is trivial. (D) => (A): Lemma 2 (i). The interval statement: Lemma 1 and continuity. QED
Remark. In (C) the classical statement uses only (B) <=> (A) (Yoshida). What is added here: the strict form of (i), the
interval structure from monotonicity, and that (D) at ANY L (not only the first) already contradicts RH.

## 4. The equation of the null vector, all terms. PROVED (given CORE)
Let Q_L >= 0 and Q_L(psi) = 0. Then Q_L(psi, h) = 0 for every h in Dom_L (Cauchy-Schwarz for a non-negative form:
|Q(psi,h)|^2 <= Q(psi) Q(h)). In kernel form, with psi extended by 0 outside [-L, L], for |x| < L (as distributions):

   e^{x/2} int psi(y) e^{-y/2} dy + e^{-x/2} int psi(y) e^{y/2} dy                                  [pole]
   - (log pi) psi(x) + int_0^inf ( psi(x) e^{-2u}/u - w(u) [psi(x-u) + psi(x+u)] ) du                [archimedean]
   - sum_{2 <= n < e^{2L}} Lambda(n) n^{-1/2} [ psi(x - log n) + psi(x + log n) ]  =  0,             [prime powers]

w(u) = e^{u/2}/(2 sinh u) = sum_{m>=0} e^{-(2m+1/2)u}. Only n < e^{2L} occur because psi(x -+ log n) vanishes on
(-L, L) otherwise. (Derivation: Q(psi,h) = int conj h(x) (K psi)(x) dx with the three kernels of section 0 of the other
proof file; e.g. A(f,h) = int conj h(x) { -(log pi) f(x) + int_0^inf ( f(x) e^{-2u}/u - w(u)[f(x-u)+f(x+u)] ) du } dx.)
The archimedean operator is the Fourier multiplier Re psi_digamma(1/4 + i r/2) - log pi = log|r| - log(2 pi) + O(r^{-2})
(r -> infinity): an operator of logarithmic order.
Zero side of the same equation: the distribution x -> sum_gamma m_gamma psihat(gamma) e^{-i gamma x} vanishes on (-L, L).

## 5. Proposition 5 (properties of a null vector at the first failure L_0). PROVED unless marked
Let psi != 0, Q_{L_0}(psi) = 0, L_0 as in Theorem 3 (C).
 (a) Reality and parity. Re psi, Im psi, the even part and the odd part of psi are each null vectors or zero. So there
     is a real null vector that is even or odd.
     Proof: Q has a real, even kernel, so Q(psi) = Q(Re psi) + Q(Im psi) and Q(psi) = Q(psi_e) + Q(psi_o), all terms >= 0.
 (b) Full support. The convex hull of supp psi is exactly [-L_0, L_0]: psi does not vanish near either end.
     Proof: if supp psi lies in [a, b] with b - a < 2 L_0, the translate psi(. + (a+b)/2) is in Dom_{L'} with
     L' = (b-a)/2 < L_0 and has Q = 0 (translation invariance), so lambda(L') <= 0, contradicting lambda > 0 on (0, L_0).
 (c) Transform. psihat is entire of exponential type exactly L_0 in both the upper and the lower half-plane
     (Paley-Wiener plus (b)), bounded on R, with O(r) zeros in |z| <= r; it does not vanish on all on-line zeros, and
          sum_{gamma real} m_gamma |psihat(gamma)|^2  =  - 2 sum_{z in Z} m_z Re[ psihat(z) conj(psihat(conj z)) ]  > 0.
     For a real null vector of parity +-1: conj(psihat(conj z)) = +- psihat(z), so the right side is
     -+ 2 sum_{z in Z} m_z Re[psihat(z)^2]. If there is a single off-line quartet with representative gamma_0, an even
     null vector has Re[psihat(gamma_0)^2] < 0 (the phase of psihat(gamma_0) is within pi/4 of +-i) and an odd one has
     Re[psihat(gamma_0)^2] > 0.
     Proof: Lemma 2 (ii) with Q(psi) = 0.
 (d) Finite multiplicity. The null space of Q_{L_0} is finite dimensional (S1: discrete spectrum).
 (e) NOT PROVED (named wall). Regularity at the ends x = +-L_0. The equation in section 4 is a Dirichlet-type exterior
     problem for an operator of logarithmic order with right-hand side made of translates of psi itself. For the pure
     logarithmic Laplacian the boundary behaviour of solutions is known (Chen-Weth 2019, from memory: continuity up to
     the boundary with a 1/|log dist|-type modulus); I did not derive the corresponding statement here, and the
     translates psi(x -+ log n) carry any end singularity of psi to the interior points +-(L_0 - log n).
     Named statement I cannot prove: "psi is continuous on [-L_0, L_0] and psi(x) = O(1/|log(L_0 - |x|)|) at the ends".
 (f) NOT PROVED. Simplicity of the null space and the parity of the first null vector (numerically the lowest
     eigenvector is even in every case computed; for the impostor the even block fails first, L in (1.70, 1.72]).

## 6. What the template is and is not
* It is an EQUIVALENT form of "RH is false" (Theorem 3). By owner rule 2 it is not a result; its use is that the key lemma
  "no psi as in (D) exists" has the equality-case shape S3(iii).
* Wall W2 restated with (c): a proof that no psi exists must exclude an entire function of type L_0 whose "energy" on the
  on-line zeros is exactly cancelled by the indefinite pairing at the off-line quartets. Nothing in section 4-5 uses the
  Euler product (B1): the same statements hold for the Davenport-Heilbronn form, where psi exists (L_0 in (1.70, 1.72]).
  So any continuation must use Lambda(n) >= 0, the support on prime powers, or the integrality of positions.
