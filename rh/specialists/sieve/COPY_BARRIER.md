# COPY_BARRIER: copies cost the general large sieve, kernel copies have density <= 1/2, and the copy amplifier stops at 3/4
SP-sieve, session 3, 2026-11-11. Labels: PROVED (argument here) / KNOWN (with what I read) / COMPUTED / CONJECTURE / RISK.
Read for this file: NOTEBOOK N49, N67, HUNCHES part G; my TRANSPORT.md, S2_B10d.md; the 11/12 digest (sessions 1-2).
Numerics: `squarefull_check.py.txt` (log `.log`), under `tools/memcap.py 1`. This is a barrier for one class of arguments,
nothing more.

## 0. Setting
F is a finite MULTISET of functions chi: {1..D} -> C with |chi| <= 1 (characters, rows counted with multiplicity). The sum is
A_chi = sum_{n<=D} mu(n) chi(n) W(n/D) (over a number field: n runs over integral ideals, N(n) <= D). Delta(F, D) is the least constant
with sum_{chi in F} |sum_n a_n chi(n)|^2 <= Delta sum |a_n|^2 for ALL a (a general-coefficient large sieve).
An (exact) COPY is a member that is principal: chi(n) = 1_{(n, r_chi) = 1} for some modulus r_chi; it is an eta-copy if
sum_{p | r_chi} 1/N(p) <= eta. C_eta(F) = number of eta-copies (with multiplicity).
THE COPY AMPLIFIER (the step of the 11/12 paper's (3.2), digest step 4): for an eta-copy, A_chi = A_1 - sum_{(n, r) != 1} mu W, so
|A_chi - A_1| <= eta D + O(omega(r)); dropping non-copies from a sum of squares, |A_1|^2 <= 2 S/C_eta + 2(eta D + O(log D))^2, S := sum_F |A_chi|^2.

## 1. Theorem 1 (general sieves pay for the copies). PROVED.
For every F, D >= 1 and 0 <= eta < 1/2:  Delta(F, D) >= (1 - 2 eta)^2 C_eta(F) D.
Proof. Take a_n = 1 (n <= D), sum |a|^2 = D. For an eta-copy, sum_{n<=D} chi(n) = D - #{n <= D : (n, r) != 1} >= D - sum_{p|r} D/N(p) >= (1 - eta) D
(over a number field use #{n : N(n) <= D, p | n} <= D'/N(p) with D' = #{N(n) <= D}; same argument). So each copy row is >= (1 - eta)^2 D^2,
hence Delta D >= C_eta (1 - eta)^2 D^2. (The constant (1 - 2eta)^2 covers members that are 1 off the multiples and arbitrary on them.) []
Corollary 1 (PROVED). If S is bounded through a general-coefficient sieve, S <= Delta sum mu^2 W^2 <= Delta D, then the amplifier gives
a bound for |A_1|^2 of size 2 Delta D / C_eta >= 2 (1 - 2eta)^2 D^2: no better than trivial. So the copy amplifier can only run on a mean square SPECIFIC to mu,
not implied by any inequality for all coefficient vectors. This is exactly the October situation (digest section 7: "coefficient 1 in place
of mu: the bound (3.1) would be false; the rows u = p^6 alone would contribute H^(1/6) D^2 > D H").
Remark (PROVED, same proof with a_n = conj chi_0(n)): every character appearing with multiplicity M in F forces Delta >= c M D. So a family whose
sieve is near-optimal, Delta <= (|F| + D) D^eps, has every multiplicity, copies included, <= (|F|/D + 1) D^eps.

## 2. Theorem 2 (kernel copies have density at most 1/2). PROVED.
HOMOMORPHIC FAMILY. K a number field, m_0 a fixed ideal, S the primes dividing m_0. A map u -> psi_u from nonzero integral ideals (or
elements of a PID, up to units) to finite-order ray class characters of K, MULTIPLICATIVE (psi_(uv) = psi_u psi_v as characters on ideals
coprime to u v m_0) and LOCAL: psi_u = product of local components psi_(u,v), with psi_(u,p) trivial for p not in S and p not dividing u.
(These encode "conductor of psi_u divides u^infinity m_0^infinity", the multiplicative form of 'conductor <= family size'.)
F_H := (psi_u)_{N(u) <= H}, |F_H| ~ c_K H. For p not in S let m_p := order of the p-component psi_(p,p); P_0 := {p not in S : m_p = 1}.
Kernel lemma. psi_u principal => m_p | v_p(u) for every p not in S.
Proof. For p not in S, locality and multiplicativity give psi_(u,p) = psi_(p,p)^(v_p(u)) (all other prime factors of u contribute trivially
at p). A principal character has every local component trivial, so psi_(p,p)^(v_p(u)) = 1, i.e. m_p | v_p(u). []
Counting. If P_0 is finite, every copy u factors as u = a b with a supported on S u P_0 and b SQUAREFULL (all exponents >= 2), since
m_p >= 2 off S u P_0. Squarefull ideals: b = c^2 d^3 (d squarefree) gives #{N(b) <= X} <= sum_d #{c : N(c) <= (X/N(d)^3)^(1/2)} << X^(1/2).
Hence C_0(F_H) <= sum_{a (S u P_0)-supported} #{b squarefull, N(b) <= H/N(a)} << H^(1/2) prod_{p in S u P_0} (1 - N(p)^(-1/2))^(-1) << H^(1/2).
Over Q: #{n <= X squarefull} <= zeta(3/2) X^(1/2) (proof as above); COMPUTED: 2027, 21044, 214122, 2158391 at X = 1e6, 1e8, 1e10, 1e12, i.e.
2.027, 2.104, 2.141, 2.158 times X^(1/2), below zeta(3/2) = 2.612 and tending to zeta(3/2)/zeta(3) = 2.173.
THEOREM 2. In a homomorphic family with P_0 finite, C_0(F_H) << H^(1/2) << |F_H|^(1/2). []
WHY A STRUCTURAL HYPOTHESIS IS NEEDED (PROVED, counterexample to the brief's form (ii)): 'conductors <= |F| and an optimal sieve on the
complement of the copies' does not bound C: F = {principal characters mod q : q <= Q} has empty complement and C = |F|. Copies have
conductor 1, so conductor bounds never limit them; only the way the family is parametrised does (kernel lemma).
Examples (PROVED from the definitions; reciprocity KNOWN). (a) m-th power residue symbols over K with mu_m in K: psi_u = (u/.)_m; by m-th power
reciprocity the pi-component of (pi/.)_m is (./pi)_m, of order exactly m for pi not dividing m (N(pi) = 1 mod m), so P_0 = {} and the
copies are the m-th powers (times m-th-power units): C ~ c H^(1/m) (lower bound: the m-th powers themselves are copies, by
(w^m/n)_m = 1_{(n,w)=1}). m = 2 ATTAINS the bound: quadratic symbols, copies = squares, ~ H^(1/2). The sextic family of the October proof
has m = 6, density H^(1/6). (b) Dirichlet: the full family of all characters mod q, q <= Q (not homomorphic, counted directly):
|F| = sum_{q<=Q} phi(q) ~ 3Q^2/pi^2, copies = the principal characters, C = Q <= (pi^2/3)^(1/2) |F|^(1/2) (1 + o(1)) = 1.81 |F|^(1/2); conductors <= Q.
Restricted to primitive characters (as in Bombieri-Vinogradov) C = 1.

## 3. Theorem 3 (the barrier). PROVED as a statement about the inequality chain.
Hypotheses: (H1) copies are exact kernel copies of a homomorphic family with P_0 finite (Theorem 2), or the Dirichlet family 2(b);
(H2) the mu-specific mean square is used at its diagonal size, S(H, D) <= H D^(1+eps), and only for H >= D^(1 - eps0) (the regime in which it
is provable: the October proof needs H >= D^(1+theta), SHORT_FAMILY 1(b)); (H3) A_1 is bounded only through the amplifier of section 0.
Then the best bound the chain can output is |A_1|^2 <= 2 S/C + O(eta^2 D^2) with C << H^(1/2), i.e.
   inf over H >= D^(1-eps0) of  H D^(1+eps) / H^(1/2)  =  D^(3/2 - eps0/2 + eps),   so  |A_1| << D^(3/4 - eps0/4 + eps) at best,
and through Mellin (digest step 1) no zero-free half-plane beyond Re s > 3/4 - eps0/4. With eps0 -> 0: Re s > 3/4. The copy count enters as
H^(1/2) = (number of rows)^(1/2); the general form of the output is 1 - delta/2 with delta = (log C)/(log H) <= 1/2 (N49's formula). For the
October family delta = 1/6 gives 11/12; a quadratic family with a mu-specific diagonal mean square would sit exactly ON the barrier (3/4).
Proof: the copy count from Theorem 2, the arithmetic from (H2), (H3). [] (The content is Theorem 2; the rest is bookkeeping.)

## 4. Where each hypothesis can fail, and what that costs (the exits)
E1 (H3) The bootstrap. The 7/8 paper does not stop at the amplifier: it feeds beta* back into a fourth-moment lemma (digest, Lemma 18.1).
   Theorem 3 says nothing about such fixed-point arguments; the record's (1 + kappa)/2 reading (N50) caps them at 3/4 by a different argument.
E2 (H2) The short regime. A mu-specific diagonal S(D^eta, D) << D^(1+eta+eps) would give Re s > (1 + eta)/2 WITHOUT copies (u = 1 is a row:
   S >= |A_1|^2; SHORT_FAMILY 0a) and (1 + eta/2)/2 with copies. Below 3/4 iff eta < 1/2. Not excluded by anything here; it is the
   short-family wall of S2, and S2_B10d showed Vaughan / Type II gives nothing there.
E3 (H1, P_0 infinite) Primes in the kernel. If P_0 has positive density, copies include all P_0-smooth u: H (log H)^(-c) of them, density
   above 1/2. But then S <= H D^(1+eps) alone gives |A_1|^2 << D^(1+eps) (log H)^c: RH-strength from the mean square, so the mean square is
   as hard as the conclusion (circular in the sense of N49 (c)). OPEN (CONJECTURE): no POISSON-ABLE family (psi_u(n) = chi_n(u) with chi_n a
   character mod n of u, multiplicative in n, as needed for the October first step) has P_0 infinite except degenerate ones.
E4 (H1, exactness) Approximate copies: members with |A_chi - A_1| small that are not principal (HUNCHES G5; in t: Bagchi). Theorem 2 does
   not apply. The G5 experiment found them only at the random rate. A provable positive-density supply would evade the barrier.
E5 (H1, characters) Non-character families. Additive twists e(n a/q), q <= Q: |F| ~ Q^2, exact copies a = 0, one per q: again |F|^(1/2)
   (PROVED, by counting). Automorphic twists lambda_f(n) over a family of forms: no exact copies (lambda_f = 1 identically never; RISK).
   I know no family of any kind with exact copies of density above 1/2 and a provable diagonal mu-specific mean square.
E6 (Dirichlet, H2) For the full family 2(b) a mu-specific diagonal INCLUDING the principal characters is not available: the large sieve
   (Q^2 + D) holds for PRIMITIVE characters only (KNOWN, from memory: Montgomery-Vaughan); adding the imprimitive rows weights each primitive
   chi* by Q/q*, so the bound needs |A_chi*|^2 << q* D for all small conductors q*: power-strength Siegel-Walfisz (a zero-free region for
   every small modulus), i.e. the conclusion. The October family is the one known case where the mu-specific diagonal holds WITH the copies.

## 5. What is new here (novelty NOT searched this session; to be searched)
Theorem 1 is a one-line observation (multiplicity costs the large sieve), surely folklore. The kernel lemma + squarefull count (Theorem 2)
and its reading as a barrier for copy amplification (Theorem 3) I have not seen stated; the quasi-RH papers state no barrier (digests).

## 6. Finite cores nominated for Lean (each a clean finite statement)
L1. For X >= 1: #{n <= X : n squarefull} <= zeta(3/2) sqrt(X) (or the cruder 3 sqrt(X)), via the unique decomposition n = a^2 b^3, b squarefree.
L2. Kernel lemma over N: let m : primes -> N_{>=2}, and call n a copy if m(p) | v_p(n) for all p. Then every copy is squarefull, hence
    #{copies <= X} <= 3 sqrt(X). (With exceptional set P_0 finite: <= 3 sqrt(X) prod_{p in P_0} (1 - p^(-1/2))^(-1).)
L3. Gram lower bound: if a family of C vectors v_1..v_C in C^D each satisfies Re sum_n v_i(n) >= (1 - 2eta) D, then the operator V: C^D -> C^C,
    (Va)_i = sum_n a_n v_i(n), has ||V||^2 >= (1 - 2eta)^2 C D (test vector a = (1, ..., 1)).
L4. Amplifier arithmetic: for H >= D >= 1, H D/(3 sqrt H) >= D^(3/2)/3 (so x^2 C <= H D with C <= 3 sqrt H never yields x^2 < D^(3/2)/3).
L5. Orthogonality (TRANSPORT 3c): for q > 2D and any a on [1, D], sum_{chi mod q} |sum a_n chi(n)|^2 = phi(q) sum_{(n,q)=1} |a_n|^2.
