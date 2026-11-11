# VERDICT on rh/specialists/sieve/COPY_BARRIER.md (V-COPY, independent verifier, 2026-11-11)
Verification track: for proofs the default when unsure is "gap". Labels: PROVED (argument given here or in the file and checked line
by line) / KNOWN (with what I read) / COMPUTED (command and numbers) / HEURISTIC / CONJECTURE.
Numerics: `copy_tests.py.txt`, log `copy_tests.log`, run as
`flock <scratch>/heavy.lock python3 tools/memcap.py 1 python3 rh/specialists/sieve/verifier/copy_tests.py.txt` (8.6 s, exact integers).
Predictions were written in `PROGRESS.md` at 04:45 UTC, before the run.

## Summary table
| Statement | Verdict |
|---|---|
| Theorem 1 over Q | **verified as stated** (in fact holds with the stronger constant (1 - eta)^2) |
| Theorem 1 over a number field (the parenthetical) | **refuted as written**; **verified with corrections** (constant depends on K) |
| Remark after Corollary 1 (multiplicity) | verified with correction (the "c" is not absolute) |
| Corollary 1 | verified as stated (within its definition: a bound S <= Delta * sum |mu W|^2 with Delta the all-vectors l^2 constant) |
| Theorem 2 (kernel lemma + count) | **verified with corrections** (definitions of "local component", "principal/copy", "C_0" must be repaired; one regime gap for general K) |
| Theorem 3 (barrier 3/4 - eps0/4) | **verified with corrections** (arithmetic right; "at best" is proved for the stated chain once an optimality step is supplied, which I supply; scope must name the full family F_H) |
| Section 4, E2 | arithmetic slip ("below 3/4 iff eta < 1/2" holds only for the no-copy version; with copies the condition is eta < 1) |
| Section 4, E3 | overstatement ("copies include ALL P_0-smooth u" is false; only those in the kernel of the S-component map) |

## 0. The setting and the copy amplifier (section 0)
- |A_chi - A_1| <= eta D + O(omega(r)): PROVED for W supported in [0,1] with |W| <= 1 (over Q one even has #{n <= D : p | n} = floor(D/p),
  so the O(omega(r)) is not needed). For W supported in a compact I in (0, inf) (the October normalisation) the constants change by
  max|W| and the support length. Harmless.
- |A_1|^2 <= 2 S/C_eta + 2(eta D + O(log D))^2: PROVED ((a+b)^2 <= 2a^2 + 2b^2, then average over the C_eta copies, then drop the
  non-copies from S by positivity).
- **Definitional point that matters later (gap G1).** Section 0 defines a copy as a member of F, which is a function on {1..D}, that is
  "principal: chi(n) = 1_{(n, r_chi) = 1}". That is agreement ON [1, D]. Section 2 uses "psi_u principal" in the global sense
  (trivial as a Hecke character). These differ: see section 2 below, numerics T1/T2.
- **Notation (gap G2, cosmetic).** With the section-0 definition, C_0 counts members with sum_{p|r} 1/N(p) <= 0, i.e. r = 1; for the sextic
  family u = w^6 has r = rad(w), so it is NOT a 0-copy, and C_0(F_H) = O(1) (unit rows only). Theorem 2's "C_0(F_H)" must be read as
  C_inf := number of exact copies with any r. Since C_eta <= C_inf for every eta, the bound then covers every C_eta, which is what
  Theorem 3 needs.

## 1. Theorem 1
Line by line.
1. "Take a_n = 1 (n <= D), sum |a|^2 = D." Proved (D an integer, or floor D).
2. "For an eta-copy, sum chi(n) = D - #{(n, r) != 1} >= D - sum_{p|r} D/N(p) >= (1 - eta) D." Over Q: proved.
3. "Each copy row is >= (1 - eta)^2 D^2, hence Delta D >= C_eta (1 - eta)^2 D^2." Proved (operator norm >= value on one test vector).
   So over Q the theorem holds with (1 - eta)^2 for 0 <= eta <= 1; the stated (1 - 2 eta)^2 is weaker and also true.
4. "(The constant (1 - 2 eta)^2 covers members that are 1 off the multiples and arbitrary on them.)" Proved: Re sum chi >= D - 2 #multiples.
5. **"Over a number field use #{n : N(n) <= D, p | n} <= D'/N(p) with D' = #{N(n) <= D}; same argument." WRONG.** The count of multiples
   is I(D/N(p)) (I(x) = number of ideals of norm <= x), and I(D/N(p)) <= I(D)/N(p) is false in general.
   COMPUTED (T3): Z[i], D = 10, p = (1+i): I(5) = 5 > I(10)/2 = 4.5.
   **Counterexample to the theorem itself over K (COMPUTED, T3):** K = Q(sqrt -163), D = 41. Every rational prime < 41 is inert, so the
   ideals of norm <= 41 have norms {1, 4, 9, 16, 25, 36, 41, 41}: I(41) = 8. Let p be one of the two prime ideals of norm 41, F = {chi}
   with chi = 1_{(n,p)=1}: an exact copy with eta = 1/41 < 1/2. Delta(F) = ||chi||^2 = 7, while (1 - 2/41)^2 I(41) = 7.2385.
   With D itself in place of D' the statement fails for every K with residue c_K < 1 (Delta <= C I(D) ~ c_K C D).
   The mechanism: for N(p) close to D the loss is 1 ideal out of I(D) ~ c_K D, while eta = 1/N(p) ~ 1/D, so the relative loss is
   eta / c_K; here 1/c_K = sqrt(163)/pi = 4.06 > 4.
   **Corrected Theorem 1 over K (PROVED, same proof):** with kappa_K(D) := max_{1 <= y <= D} y I(D/y) / I(D),
   Delta(F, D) >= (1 - kappa_K(D) eta)^2 C_eta(F) I(D) for 0 <= eta <= 1/kappa_K(D) (and (1 - 2 kappa_K eta)^2 for members arbitrary
   on the multiples). kappa_K(D) is bounded in D for fixed K (it tends to sup_{x >= 1} I(x)/(c_K x) <= a constant depending on K), so
   Corollary 1 and everything downstream are unaffected (they only need some constant).
6. Corollary 1: S <= Delta sum mu^2 W^2 <= Delta D needs |W| <= 1 (else a factor ||W||^2). Then 2 Delta D / C_eta >= 2(1 - 2eta)^2 D^2:
   PROVED. Scope: it rules out any bound of the form S <= Delta * ||a||_2^2 valid for all a. It also rules out restricted classes that
   contain a vector correlated with 1 (e.g. a = mu^2: a copy row is >= (6/pi^2 - eta) D; PROVED the same way). The closest printed
   statements are KNOWN (below): Heath-Brown's quadratic large sieve must restrict to squarefree indices for exactly this reason.
7. Remark ("every character with multiplicity M forces Delta >= c M D"): the proof gives Delta >= M sum_{n <= D} |chi_0(n)|^2, so
   c = (1/D) #{n <= D : |chi_0(n)| = 1}, which depends on chi_0 (it is phi(q)/q-ish for a character mod q with q small, and can be as
   small as 1/D when q is divisible by every prime <= D). The follow-up "every multiplicity <= (|F|/D + 1) D^eps" holds only for
   members whose support has density >= D^(-eps). Correction, not a refutation.

**Verdict Theorem 1: verified as stated over Q (stronger constant available); the number-field extension is refuted as written and
holds with the corrected constant above.**

## 2. Theorem 2
### 2.1 Definitions
- **"LOCAL: psi_u = product of local components psi_(u,v), with psi_(u,p) trivial for p not in S and p not dividing u."** Read literally
  (the local component of an idele class character is a character of all of K_p^*), this forces psi_u(p) = psi_(u,p)(uniformiser) = 1
  for every prime p outside S and u, i.e. psi_u trivial: every member would be a copy. So the definition as written is **wrong**
  (it makes the family degenerate). The intended and workable reading, consistent with "conductor of psi_u divides u^inf m_0^inf", is:
  **psi_(u,p) := the restriction of the local component to the local units O_p^*** (the ramified part), and locality = "psi_u is
  unramified at every p not in S, p not dividing u". m_p := order of psi_(p,p) restricted to O_p^*; P_0 = primes outside S at which
  psi_p is unramified. With this reading everything below goes through. Correction required in the text.
- **"psi_u principal"** must mean trivial as a Hecke character (equivalently: equal to 1 on all ideals coprime to some modulus; a ray
  class character that is 1 on all primes outside a finite set is trivial since every ray class contains infinitely many primes). It
  must NOT be the section-0 notion "equal to 1_{(n,r)=1} on [1, D]" (gap G1, discussed in 2.4).
- Index set: the October family is indexed by ELEMENTS u of O (units change the symbol: (eps u/n)_6 = (eps/n)_6 (u/n)_6), not by ideals
  and not "up to units". The theorem covers it if units are put into the S-part (finitely many in an imaginary quadratic field). Over
  fields with infinite unit groups the element-indexed family is infinite and one must index by ideals. Minor.

### 2.2 Kernel lemma: PROVED (with the unit-restriction reading)
Multiplicativity as equality of characters on ideals coprime to uvm_0 implies equality of the primitive (idelic) characters, hence of
all local components. For u = prod q^(e_q) and p outside S: psi_(u,p) = prod_q psi_(q,p)^(e_q) = psi_(p,p)^(e_p), since for q != p,
q outside S, psi_q is unramified at p by locality, and for q in S also (p does not divide q). If psi_u is globally trivial, its
restriction to O_p^* is trivial, so m_p | e_p. Correct.
- Composite orders: nothing changes; m_p is the order of a finite-order character of O_p^*, any integer >= 1.
- "Trivial at p but ramified": a character whose global value or behaviour looks trivial at p while its p-component is ramified cannot
  be a copy, because a copy is globally trivial and so has every local component trivial. Characters unramified at their own prime
  (m_p = 1) are exactly P_0; they are excluded by the hypothesis "P_0 finite", not by the lemma. No hidden case found.

### 2.3 Counting: PROVED (with a sharper constant available)
- "every copy u factors as u = a b with a supported on S u P_0 and b squarefull": PROVED from the lemma (m_p >= 2 off S u P_0).
- **Squarefull vs m_p-th power part.** The sharp consequence of the lemma is: b = prod_{p not in S u P_0} p^(v_p) with m_p | v_p for
  every p. "Squarefull" is a correct but lossy consequence. It is the right thing for an UPPER bound of size H^(1/2). The bound is of
  the right order only when m_p = 2 for essentially all primes (HEURISTIC: if m_p = 2 only on a set of primes of density alpha < 1, the
  count is about H^(1/2) (log H)^(alpha - 1)); for m_p = m it is ~ c H^(1/m); for the family psi_p := a generator of the characters
  mod p (m_p = p - 1, over Q, S empty) the copies are prod p^((p-1)k_p), of which there are H^(o(1)) (PROVED: at most
  prod_{p : p^(p-1) <= H} (1 + log H / ((p-1) log p)) = H^(o(1))). So the theorem's statement C << H^(1/2) is right; "squarefull" is
  the correct key word for the bound, "m_p-th powers" for the truth.
- Squarefull count over K: b = c^2 d^3 (d squarefree) is the unique decomposition; #{c : N(c) <= Y} <= C_K Y; sum over d gives
  <= C_K zeta_K(3/2) X^(1/2). PROVED. Over Q the file's bound zeta(3/2) X^(1/2) is proved; in fact the same proof (floor <= value,
  sum over SQUAREFREE d only) gives the sharper **#{n <= X squarefull} <= (zeta(3/2)/zeta(3)) X^(1/2) = 2.1733 X^(1/2) for every X**.
  COMPUTED (T4, independent method: smallest-prime-factor sieve and direct exponent test): 185, 619, 2027, 6553 at X = 1e4, 1e5, 1e6, 1e7,
  agreeing with the file's 185 and 2027; max_{X <= 1e7} count/sqrt X = 2.0731 < 2.1733. (The file's values at 1e8..1e12 were not
  recomputed by an independent method; they use the a^2 b^3 formula, which I checked line by line in squarefull_check.py.txt.)
- Sum over a: sum_{a (S u P_0)-supported} (H/N(a))^(1/2) = H^(1/2) prod (1 - N(p)^(-1/2))^(-1). PROVED. The implied constant depends on
  K, S, P_0 (finite product) and C_K zeta_K(3/2): fine as a << statement.
- Example (a) (power residue symbols): kernel = m-th powers. PROVED by Kummer theory (mu_m in K: (a/.)_m trivial iff a in K^(*m), and
  then a = w^m with w integral); the order-m claim for the pi-component is right (x -> (x/pi)_m is onto mu_m when N(pi) = 1 mod m).
  For Z[omega], m = 6: copies are exactly the w^6 (units eps != 1 and lambda = 1 + 2 omega give non-trivial symbols; lambda^2 = -3).
- Example (b): sum phi(q) ~ 3Q^2/pi^2 and C = Q, ratio -> pi/sqrt 3 = 1.8138. PROVED; COMPUTED below.

### 2.4 Numerical tests (predictions in PROGRESS.md, written first)
**T1, quadratic family** (Kronecker (d/n), 1 <= d <= H, n <= D; copy on [1,D] := (d/n) = 1 for all n <= D coprime to d).
| H | squares (global copies) | D*(H) | copies on [1,D] at D = 2, 5, 13, 30, 50 | Thm-2 bound (2-part x odd squarefull) |
|---|---|---|---|---|
| 1e4 | 100 | 37 | 7500, 3003, 512, 113, 100 | 236 |
| 1e5 | 316 | 53 | 75000, 30003, 5047, 560, 320 | 785 |
| 1e6 | 1000 | 79 | 750000, 300003, 50352, 4158, 1051 | 2567 |
D*(H) = largest least-n with (d/n) = -1 over non-square d <= H. Predictions: global copies = squares (confirmed; no non-square d is a
copy on [1, 400]); D*(1e4) in [15,40], D*(1e5) in [20,60], D*(1e6) in [25,80] (all confirmed: 37, 53, 79); copies on [1,D] exceed
the squares for small D, by about H 2^(-pi(D)) (confirmed in order of magnitude; the true excess is 2-3x that heuristic because d
sharing a prime with n <= D are not constrained there). The Theorem-2 bound is 2.4-2.6x the truth (constant, as expected).
**T2, all Dirichlet characters mod q <= Q** (count = sum_q [(Z/q)^* : <n <= D, (n,q)=1>], exact):
Q = 100, 200, 400: |F| = 3044, 12232, 48678; C = Q once D >= D** = 19 (for all three Q); C/|F|^(1/2) = 1.8125, 1.8083, 1.8130
(prediction: within 3% of 1.81; confirmed). Small D: Q = 200 gives C = 12232, 4366, 1413, 521, 284, 225, 205, 200 at D = 1, 2, 3, 5, 8,
12, 15, 20 (D = 1: every character a copy, as predicted). Prediction D** in [8, 30]: confirmed (19).
**Reading.** In both families the statements of Theorem 2 hold for global copies, and the global copies are exactly the predicted
ones. The section-0 notion (agreement on [1, D]) gives MANY more "copies" when D is small against log H. This is gap G1.

### 2.5 Gap G1 and its repair
Theorem 2 is a statement about globally principal members. Theorem 3 (H3) uses the amplifier, which works for any member that agrees
with 1_{(n,r)=1} on [1, D] (or is merely 1 off the multiples of r). So for the barrier one needs: copies on [1,D] are few. Repair:
- (PROVED, standard; Polya-Vinogradov, KNOWN from memory, in the imprimitive form |sum_{n<=x} chi(n)| <= tau(q) sqrt(q) log q for
  non-principal chi mod q.) If chi is non-principal mod q and chi(n) = 1 for all n <= D coprime to r, with
  eta = sum_{p | r, p <= D} 1/p <= 1/2 - delta, then (1 - 2 eta) D - 1 <= Re sum chi <= tau(q) sqrt q log q, so q >= D^(2 - eps) for
  D >= D_0(delta, eps). Hence for the quadratic family with H <= D^(2-eps), and the Dirichlet family with Q <= D^(2-eps), copies on
  [1, D] (even in the "arbitrary on multiples" sense) are globally principal. The optimum of Theorem 3 (H = D^(1-eps0)) lies in this
  range.
- (PROVED, for the quadratic family, larger H.) By Theorem 1 read backwards, C_[1,D] <= Delta(F_H, D)/((1 - 2eta)^2 D). Schur's test
  with K(n,m) = sum_{d <= H} (d/nm) gives Delta <= H D^(1/2) + O(D^2 log D) (|K| <= H when nm is a square, at most D^(1/2) such m per
  n; |K| << sqrt(nm) log(nm) otherwise, by Polya-Vinogradov in d). So C_[1,D] << H D^(-1/2) + D log D, and the amplifier output
  H D / C is >> min(D^(3/2), H/log D) >= D^(3/2 - eps) for H >= D^(2-eps): again no better than 3/4. For the Dirichlet family,
  Delta <= (Q^2 + Q D) by orthogonality per modulus, and the output is >> D^2 for Q >= D^(2-eps): trivial.
- **Remaining gap (minor):** for a general homomorphic family over K the same needs a Polya-Vinogradov/Landau bound for ray class
  characters with conductor norm up to H and a Schur-type count; standard, but not written in COPY_BARRIER.md or here.

**Verdict Theorem 2: verified with corrections.** Corrected statement:
> Let u -> psi_u be multiplicative (as Hecke characters) and local in the sense that psi_u is unramified at every prime p outside S
> with p not dividing u. Let m_p be the order of psi_p restricted to O_p^*, and P_0 = {p outside S : m_p = 1}, assumed finite. Then every
> u with psi_u trivial as a Hecke character has the form u = a b, a supported on S u P_0, m_p | v_p(b) for all p (in particular b
> squarefull), and #{u : N(u) <= H, psi_u trivial} <= C(K, S, P_0) H^(1/2). Over Q one can take
> C = (zeta(3/2)/zeta(3)) prod_{p in S u P_0} (1 - p^(-1/2))^(-1). The same bound holds for members equal to 1_{(n,r)=1} on [1, D]
> provided the conductors are <= D^(2-eps) and D is large (quadratic and Dirichlet families: PROVED above; general K: gap).

## 3. Theorem 3
- Arithmetic: inf_{H >= D^(1-eps0)} H D^(1+eps)/H^(1/2) = D^(1+eps) D^((1-eps0)/2) = D^(3/2 - eps0/2 + eps), square root
  D^(3/4 - eps0/4 + eps/2). **Correct.** Consistency: the general formula 1 - delta/2 at H = D with delta = 1/6 gives 11/12 (matches
  the digest, CHECKED there), delta = 1/2 gives 3/4.
- **Is it really "at best"?** The file's proof is one line ("the copy count from Theorem 2, the arithmetic from (H2), (H3)"); it does not
  show that no variant of the chain does better. The missing step, which I supply (PROVED): the chain's free choices are (i) H, (ii) eta
  and the subset of copies used, (iii) weights on the copies. For (iii): if A_1 = A_chi + E_chi on a set of copies and c_chi are any
  weights, |A_1| <= |sum c A_chi|/|sum c| + max|E|, and the only available bound for the first term is Cauchy-Schwarz against S:
  |sum c A_chi|^2 / |sum c|^2 <= (sum |c|^2 / |sum c|^2) S, where sum |c|^2 / |sum c|^2 >= 1/C with equality for uniform weights:
  uniform averaging is optimal. For (ii): a subset only lowers C,
  and the error 2(eta D)^2 only adds (to beat D^(3/2) one needs eta <= D^(-1/4), which removes copies). For (i): C <= c H^(1/2) for EVERY
  H (Theorem 2), so the lower bound for the output, (2/c) H^(1/2) D^(1+eps), is increasing in H and minimised at the smallest admissible
  H. So within the stated chain the claim "at best D^(3/4 - eps0/4 + eps)" is PROVED, not just for the natural parameter choice.
- **Scope that must be stated (correction).** (H1)-(H2) are about the FULL family F_H = (psi_u)_{N(u) <= H} (or smooth weights in
  N(u)/H). The barrier is false for sub-families or weighted families, but only because (H2) then becomes unprovable: e.g. the
  multiset {psi_(a^2 b) : a <= A, b <= B} (all quadratic) has a proportion B^(-1/2) of copies, and a diagonal bound for it with B = 1
  would give |A_1|^2 << D (RH-strength). The theorem should say that (H2) is assumed for F_H itself, and that families re-weighted toward
  copies (Iwaniec-style amplifiers whose weights concentrate on the kernel) are outside it. As written, "H1 ... (Theorem 2)" implicitly
  fixes F_H; I count this as a needed clarification, not an error.
- (H1) refers to exact kernel copies; via 2.5 the barrier also covers [1, D]-copies for the quadratic and Dirichlet families at every
  H >= D^(1-eps0) (PROVED above), and for general K families when conductors are <= D^(2-eps) (needs the Landau-type bound: gap).
- Mellin: "no zero-free half-plane beyond Re s > 3/4 - eps0/4" must be read as "the chain cannot certify one", not as a statement
  about zeros. It is so intended.

**Verdict Theorem 3: verified with corrections** (scope: full family F_H with uniform or smooth weights; the optimality step above
added; [1,D]-copies covered for quadratic/Dirichlet families). Corrected statement:
> Suppose the members used by the amplifier are the members of F_H that equal 1_{(n,r)=1} on [1, D] (with sum_{p|r} 1/N(p) <= eta), F_H a
> homomorphic family with P_0 finite (or the quadratic or full Dirichlet family), and S(F_H, D) <= H D^(1+eps) is available only for
> H >= D^(1-eps0). Then for every choice of H, eta and weights on the copies, the bound obtained for |A_1| is >> D^(3/4 - eps0/4 + eps/2)
> (for general K, under conductors <= D^(2-eps), or for exact kernel copies).

## 4. Smaller points elsewhere in the file
- E2: "(1 + eta/2)/2 with copies. Below 3/4 iff eta < 1/2." (1+eta)/2 < 3/4 iff eta < 1/2 (no copies), but (1 + eta/2)/2 < 3/4 iff
  eta < 1. Slip in the sentence; the conclusion that the short regime is an exit is unaffected.
- E3: "copies include all P_0-smooth u" is false in general: for p in P_0, psi_p is unramified at p but need not be trivial (e.g. psi_p =
  a fixed non-trivial character chi mod m_0 for all p: copies = {u : ord chi | Omega(u)}). Correct form: the P_0-smooth u in the kernel of
  u -> (S-components and unramified part of psi_u), a subgroup of finite index only if that image is finite.
- L1-L5 (Lean cores): L1 true (and with 2.1733 in place of 3); L2 true (count <= 2.1733 sqrt X; with P_0 the product bound is right);
  L3 true; L4 true (sqrt H D/3 >= D^(3/2)/3 for H >= D); L5 true (q > D suffices). Checked by hand.

## 5. Literature (task 3): what I searched and read
Queries (web search): "large sieve inequality imprimitive characters principal character lower bound multiplicity"; "quasi-Riemann
hypothesis 11/12 sextic twists amplification barrier 3/4"; "limitations of the amplification method family of twists trivial character
members power residue symbols Moebius mean square barrier"; "quasi-Riemann barrier 3/4 sixth powers density amplifier squares quadratic
large sieve Tao"; "Heath-Brown mean value estimate for real character sums squarefree necessary squares large sieve".
Read (via page fetch, targeted extraction, not whole papers unless stated):
- Goldmakher-Louvel, "A quadratic large sieve inequality over number fields", arXiv 1112.1642 (first 100k of 111k characters, by
  targeted extraction): **Remark 4** states that without the squarefree condition the bound fails, taking lambda_b = 1 on square ideals,
  "as already noticed in" Heath-Brown (Acta Arith. 72 (1995), p. 236). KNOWN: this is Theorem 1 in the special case of the quadratic
  family (squares = copies), in print. The general form of Theorem 1 (any principal/repeated member costs a general large sieve; the
  reason classical large sieves are stated for primitive characters) is folklore (from memory: Montgomery-Vaughan, Iwaniec-Kowalski
  section 7.4 restrict to primitive characters). I found no paper stating it for general families.
- MathWorld, "Quasi-Riemann Hypothesis" (whole page): reports that T. Tao "noted that the method could not move the zero-free boundary
  to the left of Re[s] = 3/4 without another extremely clever idea" (Numberphile, 15 Oct 2026, 16:04-16:59; video not watched). No
  argument given.
- emergentmind OpenAI math explorer, results/003 (whole page): one forum line, "the method has a barrier at 3/4, so it needs a nice new
  idea", no argument.
- B. Liu, arXiv 2610.12234 (whole HTML, by two targeted extractions): improves 7/8 to 0.874957...; optimality claimed only "for the
  particular direct and character-count estimates considered here"; no barrier for copies.
- Y. Xu, H. Sang, arXiv 2610.15291 (first 100k of 143k characters, targeted): 0.8748867 under the 7/8 paper's inputs; "No claim is made
  that the resulting exponent is optimal"; kappa >= 3/4 enters through the licensing beta* <= (1+kappa)/2 (the record's N50 reading),
  not through a copy count.
- J. Gomila's exposition (judegomila.com, truncated page): "a square column index makes every entry of that column equal to 1"
  (the dual of Theorem 1, for the quadratic sieve), and "An average bound says nothing about one particular row unless that row appears
  many times"; no barrier statement.
- Kontorovich, github quasi-rh README: "direct sixth-power amplifier"; no barrier statement.
**Conclusion of the search:** a 3/4 barrier for the method is ASSERTED in public (Tao, orally; a forum post) but I found no written
argument. Theorems 2-3 (kernel lemma + squarefull count as a barrier for amplification by imprimitive/principal members) were not found
in print. Theorem 1 is in print in the quadratic special case (Heath-Brown 1995 via Goldmakher-Louvel Remark 4) and is folklore in
general. This is a search of limited depth (5 queries, 7 sources, none read cover to cover except the short pages); "not found" is not
"new".

## 6. Plain English
The October 2026 method bounds one sum (the Moebius sum A_1) by averaging over a large family of twisted versions of it and then
pointing at the members of the family that are secretly the same as the original, the "copies". If a family of H members contains C
copies and the average of the squares is about D per member, the original sum is at most about the square root of H D / C. The file
proves three things, and here is what survives. (1) Proved, and old in a special case: you cannot get the average from any
general-purpose inequality, because such inequalities already "see" the copies (the all-ones test vector), so the average must use
special facts about the Moebius function. The extension to number fields needs a field-dependent constant; as written it is false
(example: in Q(sqrt -163) with D = 41 there are only 8 ideals, and removing one of them breaks the stated constant). (2) Proved after
repairing the definitions: in a family built multiplicatively from characters whose ramification sits at the primes of the index, a
copy must have every prime exponent divisible by a number m_p >= 2, so the copies are "S-part times squarefull", at most about sqrt(H)
of them. Example: among d <= 1,000,000 the quadratic characters (d/.) that are trivial are exactly the 1000 squares, and our computer
check confirms that no other d up to 10^6 looks trivial on 1..400 (but many do look trivial on 1..13: 50,352 of them, which is why the
definition must say "trivial as a character", or D must not be tiny). (3) Proved for the stated chain: if the average can only be proved
for families at least about as long as the sum, then this route can never give a zero-free region better than about Re s > 3/4; the
exponent 3/4 - eps0/4 is correct, and no choice of family length, copy set or weights does better within the chain. What is NOT
established: anything about methods that use weighted or thinned families, approximate copies, the 7/8 paper's bootstrap, or a mean
square in the short regime; and nothing here bears on the Riemann Hypothesis itself. It limits one method.
