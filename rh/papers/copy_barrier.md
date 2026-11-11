# Copies in character families and a 3/4 barrier for copy amplification

*Project note, rh/papers, 2026-11-11. Sources: rh/specialists/sieve/COPY_BARRIER.md (original), rh/specialists/sieve/verifier/VERDICT.md
(independent verification and corrections), rh/THEORY.md T106–T114, rh/library/NOVELTY_copy_barrier.md (literature search). All proofs
below were re-derived for this note. Statements taken from the literature without re-reading are marked "cited from memory".*

**Abstract.** Recent zero-free half-plane arguments (the October 2026 quasi-Riemann papers) bound a Möbius sum $A_1$ by a mean square
over a family of character twists, using the members of the family that are secretly principal ("copies"). We record three facts about
this step. (1) A general-coefficient large sieve pays for every copy, so the mean square has to be specific to $\mu$; this is Heath-Brown's
1995 observation in a general form. (2) In multiplicative, local families of Hecke characters, the copies number $O(H^{1/2})$ among $H$
members (kernel lemma plus squarefull count). (3) Consequently a precisely defined copy-amplifier chain can never give a bound better than
$|A_1|\ll D^{3/4-\varepsilon_0/4+\varepsilon/2}$, and so cannot certify a zero-free half-plane beyond $\operatorname{Re}s>3/4$. This
limits one method. It says nothing about the zeros themselves.

---

## 1. Introduction

**The amplifier route to zero-free regions.** Let $W$ be a weight and $A_1(D)=\sum_{n\le D}\mu(n)W(n/D)$. A bound
$A_1(D)\ll D^{\theta+\varepsilon}$ for all $D$ implies, through the Mellin transform (for $W=\mathbf 1_{[0,1]}$ by partial summation in
$1/\zeta(s)=\sum\mu(n)n^{-s}$), that $\zeta(s)\ne0$ for $\operatorname{Re}s>\theta$. The October 2026 papers [OAI-11/12, OAI-7/8]
(machine-produced, author line "OpenAI", unrefereed; all their statements are *claimed*) obtain such a bound indirectly. They place $A_1$
inside a family of twisted sums $A_u=\sum_n\mu(n)\chi_n(u)W(N(n)/D)$ over $\mathbb Q(\sqrt{-3})$, with $\chi_n(u)=(u/n)_6$ the sextic
residue symbol. They prove a mean square $\sum_{N(u)\le H}|A_u|^2\ll HD^{1+\varepsilon}$ of diagonal size for $H\ge D^{1+\vartheta}$
([OAI-11/12], Prop. 3.1). Then they observe that for $u=p^6$ the twist is $\chi_n(p^6)=\mathbf 1_{p\nmid n}$, so $A_{p^6}$ is
essentially $A_1$. Dropping every other row gives $H^{1/6}|A_1|^2\lesssim HD$, hence $A_1\ll D^{11/12+\varepsilon}$ ([OAI-11/12] (3.2);
[OAI-7/8] Lemma 17.6, "sixth-power amplification"). We call members of a family that are principal characters, or agree with one on
$[1,D]$, **copies**. We call the step "mean square, then restrict to copies" the **copy amplifier**.

**Questions.** How many copies can a family have? Could a different family, with denser copies, push the exponent to $1/2$? And can the
mean square come from a general large sieve?

**What is known** (search record in rh/library/NOVELTY_copy_barrier.md; "not found" there is not "new").
- That copies make general-coefficient large sieves fail is known. Heath-Brown [HB, pp. 236–237] notes, for real character sums
  $\sum_{m\le M}|\sum_{n\le N}a_n(n/m)|^2$, that with $a_n=1$ the square $m$ (the copies, about $M^{1/2}$ of them) contribute about
  $M^{1/2}N^2$. This is why his quadratic large sieve restricts to squarefree indices. The dual form over number fields is
  [GL, Remark after (4.x)]. The folklore form ("without primitivity the inequality would be obviously false") is in [CIS]. Our
  Theorem 1 is this argument written for arbitrary multisets, with explicit constants.
- The squarefull count $\#\{n\le X\text{ squarefull}\}\sim(\zeta(3/2)/\zeta(3))X^{1/2}$ goes back to Erdős–Szekeres and
  Bateman–Grosswald [BG]. Decompositions of row indices into squarefree, powerful and $n$-th power parts, with powerful parts counted
  as $O(V^{1/2})$, are used in [BGL] and in [OAI-7/8, Prop. 9.2]. For power-residue families, the fact that the trivial members are the
  $m$-th powers is in substance in [BGL] and follows from Kummer theory.
- The *conclusion* that the October method stops at $3/4$ has been asserted without a written argument. T. Tao is reported [MW] to have
  said the method "could not move the zero-free boundary to the left of $\operatorname{Re}s=3/4$ without another extremely clever idea".
  A forum post [EM] says "the method has a barrier at 3/4". Written barrier analyses found in the search concern the parameter
  systems of the $7/8$ chain: [Liu1, Liu2], [New] (not obtained), [XS1], and [tomoto0], which identifies the $1/6$ in $1-1/12$ as
  coming from the sextic copies $ua^6$. None of them bounds copy density in general families.

**What this note adds.** Stated exactly, and subject to the limited search:
1. a kernel lemma for multiplicative, local families of finite-order Hecke characters, and the resulting bound
   $\#\{\text{copies}\}\le C(K,S,P_0)H^{1/2}$ (Theorem 2). Special cases (power-residue symbols, Dirichlet characters) are known;
   we did not find the general form;
2. a definition of the copy-amplifier chain and a proof that its output is $\gg D^{3/4-\varepsilon_0/4+\varepsilon/2}$ for every choice
   of family length, copy set and weights, when the mean square is available only for $H\ge D^{1-\varepsilon_0}$ (Theorem 3). This
   includes the optimality step (uniform weights and the shortest family are best), which the independent verifier supplied. We also
   show that the exponent is attained, conditionally, by the quadratic family (Remark 5.8);
3. a number-field form of Theorem 1 with the correct field-dependent constant, and a counterexample to the naive constant
   (Theorem 1′).

Theorem 1 is known in substance [HB]. Corollary 1 is immediate from it. Theorem 3 is a statement about one class of arguments, defined
in §5. It is not a statement about the location of zeros.

---

## 2. Setting and notation

- $D\ge1$ is an integer and $[D]=\{1,\dots,D\}$. $p$ always denotes a prime, or a prime ideal over a number field $K$. $N$ is the
  absolute norm, $I(x)=\#\{\mathfrak n\subseteq\mathcal O_K:\ N\mathfrak n\le x\}$, and over $\mathbb Q$, $I(x)=\lfloor x\rfloor$.
- A **family** $F=(\chi_i)_{i\in\mathcal I}$ is a finite indexed family (a multiset) of functions $\chi_i:[D]\to\mathbb C$ with
  $|\chi_i|\le1$. Over $K$, the domain is the set of ideals of norm $\le D$.
- $\Delta(F,D)$ denotes **any** constant such that
  $$\sum_{i\in\mathcal I}\Big|\sum_{n\le D}a_n\chi_i(n)\Big|^2\le\Delta\sum_{n\le D}|a_n|^2\quad\text{for all }a\in\mathbb C^D .\tag{2.1}$$
- For an integer (ideal) $r\ge1$, $\eta(r)=\sum_{p\mid r}1/N(p)$.
- $\chi$ is an **exact copy of modulus $r$** if $\chi(n)=\mathbf 1_{(n,r)=1}$ for all $n\le D$. It is a **near copy of modulus $r$** if
  $\chi(n)=1$ for every $n\le D$ coprime to $r$, with $|\chi(n)|\le1$ arbitrary on the other $n$. These are notions *on $[1,D]$*.
  The global notion ("trivial as a Hecke character") is introduced in §4. The two must be kept apart (verifier's gap G1, §4.4).
- $W:[0,\infty)\to\mathbb C$, $|W|\le1$, $\operatorname{supp}W\subseteq[0,1]$. Put $A_\chi=\sum_{n\le D}\mu(n)\chi(n)W(n/D)$, write
  $A_1$ for $\chi\equiv1$, and let $S(F,D)=\sum_{\chi\in F}|A_\chi|^2$. If $W$ is supported in a compact subset of $(0,\infty)$, as in
  [OAI-11/12], only the constants change.
- "Cited from memory" marks standard results used without re-reading: Pólya–Vinogradov, facts on Jacobi symbols, ideal counting,
  Kummer theory with Chebotarev, and Mertens' $\sum_{q\le Q}\varphi(q)\sim3Q^2/\pi^2$.

---

## 3. Theorem 1: general sieves pay for the copies

**Theorem 1** (over $\mathbb Q$; [HB, pp. 236–237] for the quadratic family). Let $F$ be a family on $[D]$ and $\Delta$ satisfy (2.1).
1. If $C$ members of $F$ are exact copies with moduli $r_i$, $\eta(r_i)\le\eta\le1$, then $\Delta\ge(1-\eta)^2CD$.
2. If $C$ members are near copies with $\eta(r_i)\le\eta\le1/2$, then $\Delta\ge(1-2\eta)^2CD$.

*Proof.* Take $a_n=1$ for $n\le D$, so $\sum|a_n|^2=D$. For any $r$,
$$\#\{n\le D:(n,r)\ne1\}\le\sum_{p\mid r}\lfloor D/p\rfloor\le\eta(r)D .\tag{3.1}$$
For an exact copy, $\sum_{n\le D}\chi(n)=D-\#\{n\le D:(n,r)\ne1\}\ge(1-\eta)D\ge0$. For a near copy, the $n$ coprime to $r$ contribute
exactly their number, and each other $n$ contributes a real part $\ge-1$. So
$\operatorname{Re}\sum_{n\le D}\chi(n)\ge D-2\#\{n\le D:(n,r)\ne1\}\ge(1-2\eta)D\ge0$. In both cases $|\sum_n\chi(n)|^2\ge(cD)^2$,
with $c=1-\eta$ or $c=1-2\eta$. All terms of the left side of (2.1) are non-negative, so dropping the non-copies gives
$C(cD)^2\le\Delta D$. $\square$

**Theorem 1′** (number field; corrected constant, from the verifier). Let $K$ be a number field and
$\kappa_K(D)=\sup_{1\le y\le D}yI(D/y)/I(D)$. Run $n$ over the ideals of norm $\le D$. If $C$ members are exact copies with
$\eta(r_i)\le\eta\le1/\kappa_K(D)$, then $\Delta\ge(1-\kappa_K(D)\eta)^2C\,I(D)$. For near copies with $\eta\le1/(2\kappa_K(D))$,
$\Delta\ge(1-2\kappa_K(D)\eta)^2C\,I(D)$. Moreover $\kappa_K(D)\le A_K/a_K$ for all $D\ge1$, with constants depending only on $K$.

*Proof.* Multiplication by $p$ is a bijection from ideals $\mathfrak m$ with $N\mathfrak m\le D/N(p)$ onto the multiples of $p$ of norm
$\le D$. So the multiples of $p$ number $I(D/N(p))$. This is $\le\kappa_K(D)I(D)/N(p)$ (take $y=N(p)$ if $N(p)\le D$; otherwise it is
$0$). Hence $\#\{n:(n,r)\ne1\}\le\kappa_K(D)\eta I(D)$, and the proof of Theorem 1 goes through with $D$ replaced by $I(D)$ and $\eta$
by $\kappa_K\eta$. For the bound on $\kappa_K$, ideal counting (cited from memory: $I(x)=c_Kx+O_K(x^{1-1/[K:\mathbb Q]})$) gives
$I(x)\le A_Kx$ for $x\ge1$ and $I(D)\ge a_KD$ for $D\ge1$, with $a_K>0$ because $I(D)\ge1$. Then
$yI(D/y)/I(D)\le A_K/a_K$. $\square$

*The naive constant is false* (verifier; re-checked here). The original file used "$\#\{n:p\mid n\}\le I(D)/N(p)$", which fails already
for $\mathbb Z[i]$, $D=10$, $p=(1+i)$, where $I(5)=5>I(10)/2$. The theorem with constant $(1-2\eta)^2I(D)$ fails too. Take
$K=\mathbb Q(\sqrt{-163})$ and $D=41$. Here $-163\equiv5\pmod8$ and $(-163/p)=-1$ for every odd $p<41$, while $41$ splits. So the
ideals of norm $\le41$ have norms $1,4,9,16,25,36,41,41$, and $I(41)=8$. For $\mathfrak p$ of norm $41$, the single exact copy
$\chi=\mathbf 1_{(n,\mathfrak p)=1}$ has $\eta=1/41$ and $\Delta=\|\chi\|^2=7<(39/41)^2\cdot8=7.2385$. (The corrected bound gives
$\kappa\ge41/8$ and $(1-1/8)^2\cdot8=6.125\le7$.) These values were recomputed for this note.

**Remark 3.1** (multiplicity; corrected). If a function $\chi_0$ occurs $M$ times in $F$, then $a=\overline{\chi_0}$ gives
$\Delta\ge M\sum_{n\le D}|\chi_0(n)|^2$. The constant $\frac1D\sum|\chi_0|^2$ depends on $\chi_0$ and is not absolute.

**Lemma 3.2** (the amplifier step). If $\chi$ is an exact copy of modulus $r$, then $|A_\chi-A_1|\le\eta(r)D$. If it is a near copy,
then $|A_\chi-A_1|\le2\eta(r)D$. Hence, if $F$ contains $C\ge1$ near copies with $\eta(r)\le\eta$,
$$|A_1|^2\le\frac{2S(F,D)}{C}+2(2\eta D)^2 .\tag{3.2}$$

*Proof.* $A_\chi-A_1=\sum_{n\le D,(n,r)\ne1}\mu(n)(\chi(n)-1)W(n/D)$. Here $|\chi(n)-1|$ is $1$ for an exact copy and at most $2$ for a
near copy, so (3.1) gives the first two bounds. Then $|A_1|^2\le2|A_\chi|^2+2|A_\chi-A_1|^2$. Average over the $C$ copies and use
$\sum_{\text{copies}}|A_\chi|^2\le S$. $\square$

(T108 states the near-copy error as $\eta D+O(\omega(r))$. While re-deriving we found the correct constant is $2\eta D$, because
$|\chi-1|$ can be $2$ off the coprime residues. This changes nothing downstream.)

**Corollary 1.** If $S$ is bounded only through a general-coefficient constant, $S\le\Delta\sum_n|\mu(n)W(n/D)|^2\le\Delta D$, then the
bound (3.2) is $\ge2\Delta D/C\ge2(1-2\eta)^2D^2$. That is no power saving over the trivial $|A_1|\le D$. So the copy amplifier can only
run on a mean square that uses properties of $\mu$ beyond $|\mu|\le1$.

*Proof.* Apply (2.1) with $a_n=\mu(n)W(n/D)$, then Theorem 1(2). $\square$

The same proof rules out any restricted class of coefficient vectors that contains a vector correlated with $1$ (for example
$a=\mu^2$, where a copy row is $\ge(6/\pi^2-\eta)D$, as the verifier notes). The October papers' mean square is $\mu$-specific
([OAI-11/12] digest: with coefficient $1$ in place of $\mu$, the rows $u=p^6$ alone would give $H^{1/6}D^2>DH$).

---

## 4. The kernel lemma and the copy count

### 4.1 The abstract kernel lemma (T110)

**Lemma 4.1.** Let $G_p$ be groups and $g_p\in G_p$. If $u\ge1$ satisfies $g_p^{v_p(u)}=1$ for every $p$, then
$\operatorname{ord}(g_p)\mid v_p(u)$ for every $p$. Now let $m(p)\in\mathbb N$, and call $n\ge1$ an **$m$-copy** if $m(p)\mid v_p(n)$
for all $p$. If $m(p)\ne1$ for all $p$ outside a finite set $P_0$, then every $m$-copy is $ab$ with $a$ supported on $P_0$ and $b$
squarefull. If $P_0=\emptyset$, $b=n$.

*Proof.* The first claim is the definition of order. For the second, put $a=\prod_{p\in P_0}p^{v_p(n)}$ and $b=n/a$. For $p\notin P_0$,
$m(p)\mid v_p(b)$ with $m(p)\ne1$. If $m(p)=0$ this forces $v_p(b)=0$. If $m(p)\ge2$ it forces $v_p(b)=0$ or $v_p(b)\ge2$. So $b$ is
squarefull. $\square$

### 4.2 Homomorphic families

**Definition 4.2** (corrected per VERDICT §2.1). Let $K$ be a number field, $\mathfrak m_0$ an ideal, and $S$ the set of primes dividing
$\mathfrak m_0$. A **homomorphic family** is a map $u\mapsto\psi_u$ from nonzero integral ideals to finite-order Hecke (idele class)
characters of $K$ with two properties.
- *Multiplicative:* $\psi_{uv}=\psi_u\psi_v$ as idele class characters.
- *Local:* $\psi_u$ is unramified at every $p\notin S$ with $p\nmid u$, that is, its local component $\psi_{u,p}$ is trivial on
  $\mathcal O_p^\times$.

For $p\notin S$ let $\chi_p:=\psi_{p,p}|_{\mathcal O_p^\times}$ (the ramified part, at $p$, of the character attached to $p$ itself), and
let $m_p\ge1$ be its order. Put $P_0=\{p\notin S:m_p=1\}$. The **member** attached to $u$ is the function
$n\mapsto\psi_u(n)\mathbf 1_{(n,r_u)=1}$ on ideals of norm $\le D$. Here $\psi_u(n)$ is the value of the primitive character and $r_u$
is some ideal, for instance $u\mathfrak m_0$. The member is a **(global) copy** if $\psi_u$ is trivial. It is then the exact copy
$\mathbf 1_{(n,r_u)=1}$.

Read literally, the original definition ("$\psi_{(u,p)}$ trivial for $p\notin S$, $p\nmid u$", with the full local component) would
force $\psi_u(p)=1$ at almost all primes, so every member would be trivial. The restriction to $\mathcal O_p^\times$ is the workable
reading.

**Lemma 4.3** (kernel lemma). If $\psi_u$ is trivial, then $m_p\mid v_p(u)$ for every $p\notin S$.

*Proof.* Write $u=\prod_qq^{e_q}$. By multiplicativity $\psi_u=\prod_q\psi_q^{e_q}$. Restriction to $K_p^\times$ and then to
$\mathcal O_p^\times$ are homomorphisms, so $\psi_{u,p}|_{\mathcal O_p^\times}=\prod_q(\psi_{q,p}|_{\mathcal O_p^\times})^{e_q}$. Fix
$p\notin S$. For $q\ne p$ we have $p\nmid q$, and this includes $q\in S$, so $\psi_q$ is unramified at $p$ by locality and its factor is
$1$. Hence $\psi_{u,p}|_{\mathcal O_p^\times}=\chi_p^{e_p}$. A trivial idele class character has trivial local components, so
$\chi_p^{e_p}=1$ and $m_p\mid e_p$. $\square$

Lemma 4.1 is exactly the last step of this proof, and it is machine-checked. The identity $\psi_{u,p}|=\chi_p^{v_p(u)}$ enters the
Lean file as a hypothesis (§7).

### 4.3 Counting

**Lemma 4.4** (squarefull counts). Every squarefull $b$ (an integer, or an ideal) is $c^2d^3$ with $d$ squarefree: at each $p$ with
$e=v_p(b)\ge2$, take $(v_p(c),v_p(d))=(e/2,0)$ if $e$ is even and $((e-3)/2,1)$ if $e$ is odd. Hence, for all $X\ge1$:
1. over $\mathbb Q$: $\#\{n\le X\text{ squarefull}\}\le\sum_{d\text{ sqfree}}\sqrt{X/d^3}=(\zeta(3/2)/\zeta(3))\sqrt X=2.1733\sqrt X$,
   and a fortiori $\le\zeta(3/2)\sqrt X\le3\sqrt X$;
2. over $K$: $\#\{b\text{ squarefull},N b\le X\}\le\sum_dI\big((X/Nd^3)^{1/2}\big)\le A_K\zeta_K(3/2)X^{1/2}$. Only $d$ with
   $Nd^3\le X$ contribute, and for those the argument of $I$ is $\ge1$.

Uniqueness of the decomposition is not needed, since we only need an upper bound. Recomputed for this note (exact, via
$a^2b^3$ with $b$ squarefree, checked against brute force at $10^4$): $185,2027,21044,214122,2158391$ at $X=10^4,10^6,10^8,10^{10},10^{12}$.
That is $1.85,2.03,2.10,2.14,2.16$ times $\sqrt X$, increasing towards $2.1733$ as Bateman–Grosswald predicts [BG].

**Theorem 2** (copy count in homomorphic families). In a homomorphic family with $P_0$ finite, put $T=S\cup P_0$. Every $u$ with
$\psi_u$ trivial is $u=ab$, with $a$ supported on $T$ and $m_p\mid v_p(b)$ for every $p$. In particular $b$ is squarefull and coprime to
$T$. Moreover
$$\#\{u:Nu\le H,\ \psi_u\text{ trivial}\}\le A_K\zeta_K(3/2)\prod_{p\in T}\big(1-N(p)^{-1/2}\big)^{-1}H^{1/2}=:C_2(K,S,P_0)\,H^{1/2}.$$
Over $\mathbb Q$ one may take $C_2=(\zeta(3/2)/\zeta(3))\prod_{p\in T}(1-p^{-1/2})^{-1}$, and the machine-checked version has $3$ in
place of $\zeta(3/2)/\zeta(3)$.

*Proof.* The factorisation follows from Lemma 4.3. For $p\notin T$, $m_p\ge2$. Lemma 4.1 then makes $b$ squarefull. The map
$u\mapsto(a,b)$ is injective, since $a$ is the $T$-part of $u$. So the count is at most
$\sum_{a:\,Na\le H}\#\{b\text{ sqfull}:Nb\le H/Na\}\le A_K\zeta_K(3/2)H^{1/2}\sum_aN(a)^{-1/2}$, where $a$ runs over $T$-supported
ideals. Since $T$ is finite and $N(p)\ge2$, this sum is the finite Euler product shown. $\square$

**Examples 4.5.**
- (a) *$m$-th power residue symbols* ($\mu_m\subset K$, $\psi_u=(u/\cdot)_m$, indexed by elements). By Kummer theory and Chebotarev
  (cited from memory), $(u/\cdot)_m$ is trivial iff every prime splits completely in $K(u^{1/m})$, iff $u\in K^{\times m}$, iff
  $u=w^m$ with $w$ integral. So the copies are the $m$-th powers, about $H^{1/m}$ of them. For $m=2$ this matches the bound of
  Theorem 2. For the October sextic family, $m=6$ gives $H^{1/6}$. The element-indexed version is covered when the unit group is
  finite and the unit members are unramified outside $S$: the proof of Lemma 4.3 is unchanged, and the count gains a factor
  $|\mathcal O_K^\times|$.
- (b) *Quadratic (Jacobi) family over $\mathbb Q$:* $\psi_d=(\cdot/d)$, $d$ odd, $d\le H$. For odd $d$, $n\mapsto(n/d)$ is a character
  mod $d$, principal iff $d$ is a square (cited from memory). The copies are the $\le\sqrt H$ odd squares $d=k^2$, and
  $(n/k^2)=\mathbf 1_{(n,k)=1}$.
- (c) *All Dirichlet characters mod $q\le Q$* (not homomorphic; counted directly). $|F_Q|=\sum_{q\le Q}\varphi(q)\sim3Q^2/\pi^2$, and
  the copies are the $Q$ principal characters, so $C=Q\sim(\pi/\sqrt3)|F_Q|^{1/2}=1.814|F_Q|^{1/2}$. Recomputed: $Q=400$ gives
  $|F|=48678$ and $Q/|F|^{1/2}=1.8130$.

**Remark 4.6** (why a structural hypothesis is needed). Bounds on conductors never limit copies, because copies have conductor $1$. The
family of principal characters mod $q$, $q\le Q$, consists entirely of copies. The hypothesis "$P_0$ finite" cannot be dropped either
(§6, E3). In the other direction, the bound $H^{1/2}$ is often far from the truth: it is $H^{1/m}$ in Example (a), and the
verifier shows it is $H^{o(1)}$ when $m_p=p-1$.

### 4.4 Copies on $[1,D]$ versus global copies (gap G1)

The amplifier (Lemma 3.2) works with near copies **on $[1,D]$**. Theorem 2 counts **global** copies, and the two counts can differ a
lot when $D$ is small against $\log H$. The verifier computed that 50,352 Kronecker symbols $(d/\cdot)$, $d\le10^6$, are trivial on
$[1,13]$, against 1000 squares. For the quadratic and Dirichlet families we close this gap in Proposition 5.5. **For general
homomorphic families over $K$ we do not.** That would need a Pólya–Vinogradov/Landau bound for ray class characters and a Schur-type
large sieve. So Theorem 3(a) below is stated for global copies only.

---

## 5. Amplifier arithmetic and the barrier

**Lemma 5.1** (T112). (i) If $1\le D\le H$ and $0<C\le3\sqrt H$, then $HD/C\ge D^{3/2}/3$. (ii) If $D\ge1$ and $H\ge D^{1-\varepsilon_0}$,
then $HD^{1+\varepsilon}/H^{1/2}\ge D^{3/2-\varepsilon_0/2+\varepsilon}$, with equality at $H=D^{1-\varepsilon_0}$. Also
$(D^{3/2-\varepsilon_0/2+\varepsilon})^{1/2}=D^{3/4-\varepsilon_0/4+\varepsilon/2}$. (iii) If $1\le D\le H$, $0<C\le H^\delta$ and
$\delta\le1$, then $HD^{1+\varepsilon}/C\ge D^{2-\delta+\varepsilon}$.

*Proof.* (i) $HD/C\ge HD/(3\sqrt H)=\sqrt HD/3\ge D^{3/2}/3$. (ii) $H^{1/2}D^{1+\varepsilon}\ge D^{(1-\varepsilon_0)/2}D^{1+\varepsilon}$.
(iii) $HD^{1+\varepsilon}/C\ge H^{1-\delta}D^{1+\varepsilon}\ge D^{1-\delta}D^{1+\varepsilon}$. $\square$

The original file wrote $D^{3/4-\varepsilon_0/4+\varepsilon}$. The $\varepsilon$ is halved, which is harmless.

**Definition 5.2** (the copy-amplifier chain). We are given a family $\mathfrak F=(F_H)_H$ of families on $[D]$, fixed weights
$0<w_\chi\le1$ on members, $S_w(F_H,D):=\sum_{\chi\in F_H}w_\chi|A_\chi|^2$, and a pool $\mathcal P(F_H)\subseteq F_H$ of admissible
members. Each pool member is a near or exact copy on $[1,D]$ of a declared modulus $r_\chi$, with declared error
$E_\chi=2\eta(r_\chi)D$ (near) or $\eta(r_\chi)D$ (exact). The available input is
$$\textbf{(H2)}\qquad S_w(F_H,D)\le B(H,D):=HD^{1+\varepsilon}\quad\text{for }H\ge D^{1-\varepsilon_0}\ \text{only}.$$
A **certificate** is a choice of admissible $H$, a non-empty finite $\mathcal C\subseteq\mathcal P(F_H)$ (a sub-multiset) and complex
weights $(c_\chi)_{\chi\in\mathcal C}$ with $\sum c_\chi\ne0$. Its **output** is
$$\beta=\frac{(\sum_{\mathcal C}|c_\chi|^2/w_\chi)^{1/2}}{|\sum_{\mathcal C}c_\chi|}B(H,D)^{1/2}+\frac{\sum_{\mathcal C}|c_\chi|E_\chi}{|\sum_{\mathcal C}c_\chi|}.$$
**(H3)**: $A_1$ is bounded only by such outputs. Uniform weights give $\beta=(B/C)^{1/2}+\max E$ when $w\equiv1$. Squaring,
$\beta^2\le2B/C+2\max E^2$, which is (3.2). This is exactly the step of [OAI-11/12] (3.2). Specifying the declared errors and the
Cauchy–Schwarz form of the main term *is* the definition of the class of arguments the barrier covers.

**Lemma 5.3** (soundness). If (H2) holds, then $|A_1|\le\beta$ for every certificate.

*Proof.* $|\sum c|\,|A_1|\le|\sum cA_\chi|+\sum|c||A_1-A_\chi|$. The second sum is $\le\sum|c|E_\chi$ by Lemma 3.2. By Cauchy–Schwarz,
$|\sum cA_\chi|\le(\sum|c|^2/w)^{1/2}(\sum_{\mathcal C}w|A_\chi|^2)^{1/2}\le(\sum|c|^2/w)^{1/2}S_w^{1/2}$. $\square$

**Lemma 5.4** (optimality; the verifier's step, re-derived). Let $C(\mathcal P)$ be the number of pool members of $F_H$, and
$C'(\mathcal P)$ the number with $\eta(r_\chi)\le1/4$. Then every certificate satisfies
$$\text{(a)}\ \ \beta\ge\big(B(H,D)/C(\mathcal P)\big)^{1/2},\qquad\text{(b)}\ \ \beta\ge\min\Big(\frac D8,\ \big(B(H,D)/4C'(\mathcal P)\big)^{1/2}\Big).$$

*Proof.* (a) Cauchy–Schwarz gives $(\sum_{\mathcal C}|c|)^2\le(\sum|c|^2/w)(\sum_{\mathcal C}w)\le(\sum|c|^2/w)\,|\mathcal C|$, using
$w\le1$. Together with $|\sum c|\le\sum|c|$ and $|\mathcal C|\le C(\mathcal P)$, the first term of $\beta$ is $\ge(B/C)^{1/2}$.
(b) Split $\mathcal C=\mathcal C'\cup\mathcal C''$ according to $\eta(r_\chi)\le1/4$ or $>1/4$, and let $s',s''$ be the sums of $|c|$ over
the two parts. Note $E_\chi\ge\eta(r_\chi)D$. If $s''\ge s'$, then $|\sum c|\le2s''$, and the error term is $\ge s''(D/4)/(2s'')=D/8$. If
$s'>s''$, then $|\sum c|\le2s'$. As in (a), $s'^2\le(\sum_{\mathcal C'}|c|^2/w)|\mathcal C'|$, so the first term is
$\ge s'B^{1/2}/(|\mathcal C'|^{1/2}\cdot2s')\ge(B/4C')^{1/2}$. $\square$

So with uniform weights the main term is already as small as any weighting allows. Using a subset of copies only lowers $C$, and the
error only adds. Since $B(H,D)/C$ is to be compared over admissible $H$, the remaining freedom is the choice of $H$.

**Proposition 5.5** (near copies on $[1,D]$: the repair of G1).
1. *Dirichlet family* $F_Q=\{\chi\bmod q:q\le Q\}$ (as a multiset). For all $D,Q\ge1$, $\Delta(F_Q,D)\le QD+Q^2$, and the number of near
   copies with $\eta\le1/4$ is $C'\le4(QD+Q^2)/D$.
2. *Jacobi family* $F_H=\{(\cdot/d):d\le H\text{ odd}\}$. There is an absolute $D_0$ such that for $D\ge D_0$: if $H\le D^{1.9}$, every
   near copy with $\eta\le1/4$ is a global copy ($d$ a square), so $C'\le\sqrt H$; and for every $H$,
   $C'\le4HD^{-1/2}+c_1D^{1.02}$ with $c_1$ absolute.

*Proof.* Theorem 1(2) applied to the near copies with $\eta\le1/4$ gives $C'\le\Delta/((1/2)^2D)=4\Delta/D$ for every admissible
$\Delta$. (Theorem 1 is used backwards.)

(1) By orthogonality, $\sum_{\chi\bmod q}\chi(n)\bar\chi(m)=\varphi(q)\mathbf 1_{n\equiv m\,(q),\,(n,q)=1}$. So
$\sum_{\chi\bmod q}|\sum_{n\le D}a_n\chi(n)|^2=\varphi(q)\sum_{b\in(\mathbb Z/q)^\times}|\sum_{n\le D,n\equiv b}a_n|^2$. By
Cauchy–Schwarz each class holds at most $D/q+1$ integers $n\le D$, so this is $\le\varphi(q)(D/q+1)\|a\|^2$. Summing over $q\le Q$
gives $\Delta\le\sum_q(\varphi(q)D/q+\varphi(q))\le QD+Q^2$. (For $q>D$ the identity is the machine-checked L5.)

(2) We use three facts, all cited from memory. (J1) For odd $d$, $n\mapsto(n/d)$ is a character mod $d$, principal iff $d$ is a square.
(J2) For $k\ge1$, $d\mapsto(k/d)$ on odd $d$ is a character mod $4k$, principal iff $k$ is a square (quadratic reciprocity). (PV) For a
primitive character $\chi^*$ mod $q^*\ge3$, $|\sum_{n\le x}\chi^*(n)|\le\sqrt{q^*}\log q^*$ [Dav, ch. 23].

For a non-principal $\chi$ mod $q$ induced by $\chi^*$, write $\chi(n)=\chi^*(n)\sum_{e\mid(n,q)}\mu(e)$. This gives
$|\sum_{n\le x}\chi(n)|\le\sum_{e\mid q}|\sum_{m\le x/e}\chi^*(m)|\le\tau(q)\sqrt q\log q\le c\,q^{0.51}$, with $c$ absolute.

*Range $H\le D^{1.9}$.* A near copy with $\eta\le1/4$ has $\operatorname{Re}\sum_{n\le D}\chi(n)\ge D/2$ (proof of Theorem 1). For
non-square odd $d\le H$, (J1) and the bound above give $|\sum_{n\le D}(n/d)|\le cH^{0.51}\le cD^{0.969}<D/2$ once $D\ge D_0$. So only
squares remain.

*All $H$.* $\sum_d|\sum_na_n(n/d)|^2=\sum_{n,n'\le D}a_n\bar a_{n'}K(n,n')$ with $K(n,n')=\sum_{d\le H\text{ odd}}(nn'/d)$. By
$|a_na_{n'}|\le(|a_n|^2+|a_{n'}|^2)/2$ and the symmetry of $K$, $\Delta\le\max_n\sum_{n'\le D}|K(n,n')|$ (Schur). If $nn'$ is a
square, $|K|\le H$, and for fixed $n$ there are at most $\sqrt D$ such $n'\le D$ ($n'=n_0t^2$ with $n_0$ the squarefree kernel of $n$).
Otherwise (J2) and the bound above give $|K|\le c(4nn')^{0.51}\le c'D^{1.02}$. Hence $\Delta\le H\sqrt D+c'D^{2.02}$ and
$C'\le4HD^{-1/2}+c_1D^{1.02}$ with $c_1=4c'$. $\square$

**Theorem 3** (the barrier). Fix $0\le\varepsilon_0<1$ and $0\le\varepsilon\le1/2$. In each of the following cases, every certificate
of Definition 5.2 (any admissible $H\ge D^{1-\varepsilon_0}$, any $\mathcal C$, any weights $c$, any $0<w\le1$) has
$$\beta\ \ge\ c_0\,D^{3/4-\varepsilon_0/4+\varepsilon/2}:$$
- (a) $F_H=(\psi_u)_{Nu\le H}$ a homomorphic family over $K$ with $P_0$ finite, pool = the global copies; $c_0=C_2(K,S,P_0)^{-1/2}$;
- (b) the Dirichlet family $F_Q$, with $H:=|F_Q|$, pool = all near copies on $[1,D]$; $c_0>0$ absolute;
- (c) the Jacobi family, pool = all near copies on $[1,D]$; $c_0>0$ absolute.

Through Mellin, then, the chain cannot certify a zero-free half-plane $\operatorname{Re}s>\theta$ with
$\theta<3/4-\varepsilon_0/4$. With $\varepsilon_0\to0$ the limit is $3/4$.

*Proof.* (a) By Lemma 5.4(a) and Theorem 2, $\beta^2\ge HD^{1+\varepsilon}/(C_2H^{1/2})=C_2^{-1}H^{1/2}D^{1+\varepsilon}$. This
increases with $H$, so it is smallest at $H=D^{1-\varepsilon_0}$, where it equals $C_2^{-1}D^{3/2-\varepsilon_0/2+\varepsilon}$ by
Lemma 5.1(ii).

(b) $H=|F_Q|$ satisfies $cQ^2\le H\le Q^2$ for an absolute $c>0$ (Mertens, cited). By Lemma 5.4(b) and Proposition 5.5(1),
$B/4C'\ge HD^{2+\varepsilon}/(16(QD+Q^2))$. If $Q\le D$, this is $\ge cQD^{1+\varepsilon}/32$, and $Q\ge H^{1/2}\ge D^{(1-\varepsilon_0)/2}$
gives $\ge(c/32)D^{3/2-\varepsilon_0/2+\varepsilon}$. If $Q>D$, it is $\ge(c/32)D^{2+\varepsilon}$, which is larger. The alternative
$D/8$ in Lemma 5.4(b) is $\ge\frac18D^{3/4-\varepsilon_0/4+\varepsilon/2}$, because the exponent is $\le1$ when $\varepsilon\le1/2$.

(c) For $D\ge D_0$, Lemma 5.4(b) and Proposition 5.5(2) apply. If $H\le D^{1.9}$, then $B/4C'\ge H^{1/2}D^{1+\varepsilon}/4\ge\frac14D^{3/2-\varepsilon_0/2+\varepsilon}$.
If $H>D^{1.9}$, then $B/4C'\ge HD^{1+\varepsilon}/(8\max(4HD^{-1/2},c_1D^{1.02}))\ge\min(D^{3/2+\varepsilon}/32,\ D^{1.88+\varepsilon}/(8c_1))$.
Both cases give $\gg D^{3/2-\varepsilon_0/2+\varepsilon}$. For $D<D_0$, Lemma 5.4(a) with $C(\mathcal P)\le|F_H|\le H$ gives
$\beta\ge D^{(1+\varepsilon)/2}\ge D_0^{-1/4}D^{3/4-\varepsilon_0/4+\varepsilon/2}$.

The Mellin sentence is the reading of §1: the exponent $\theta$ certified for $A_1(D)$ is the half-plane certified. $\square$

**Remark 5.6** (general form $1-\delta/2$). If the pool has at most $H^\delta$ members and (H2) holds from $H=D$ on, Lemma 5.1(iii)
gives $\beta\ge D^{1-\delta/2+\varepsilon/2}$. With the October sextic copies, $\delta=1/6$, this gives $11/12$, matching
[OAI-11/12]. Theorem 2 says $\delta\le1/2$ in every homomorphic family with $P_0$ finite.

**Remark 5.7** (scope). The hypothesis (H2) is for the *full* family $F_H$ at diagonal size $HD^{1+\varepsilon}$. Weights $w\le1$ with
the same bound are covered by Lemma 5.4. *Not* covered are re-indexed or thinned multisets that concentrate on the kernel, with a
diagonal hypothesis normalised to their own length. The verifier's example $\{\psi_{a^2b}:a\le A,b\le B\}$ has copy proportion
$B^{-1/2}$. For such multisets the barrier does not apply, and the corresponding diagonal bound would itself be of RH strength
($B=1$ gives $|A_1|^2\ll D^{1+\varepsilon}$).

**Remark 5.8** (the exponent is attained, conditionally). Suppose (H2) held for the Jacobi family, which is *not known*. The
asymptotics [GZ] (under GRH) and [Toma] concern squarefree $d$ only, hence families with no copies except $d=1$. Then for
$0<\varepsilon_0<1/3$, $H=D^{1-\varepsilon_0}$ and $D$ large, take $\mathcal C=\{(\cdot/p^2):p\text{ prime},\ D^{1/4+\varepsilon_0/4}<p\le\sqrt H\}$
with uniform weights. These are exact copies with $E=\lfloor D/p\rfloor\le D^{3/4-\varepsilon_0/4}$. Since
$(1-\varepsilon_0)/2>1/4+\varepsilon_0/4$, Chebyshev's bound gives $|\mathcal C|\gg\sqrt H/\log H$. So
$\beta\ll(HD^{1+\varepsilon}\log H/\sqrt H)^{1/2}+D^{3/4-\varepsilon_0/4}\ll D^{3/4-\varepsilon_0/4+\varepsilon/2}(\log D)^{1/2}$.
Thus Theorem 3 is sharp for the chain, up to $\log$.

---

## 6. Exits: which hypotheses, if dropped, escape the barrier

Each item of COPY_BARRIER.md §4 was re-checked. Status labels: **proved here**, **example (proved)**, or **remark (not proved)**.

- **E1. Drop (H3): bootstrap arguments.** The 7/8 paper feeds the amplifier's output back into a fourth-moment lemma ([OAI-7/8]
  Lemma 18.1). Theorem 3 says nothing about such fixed-point arguments. *Remark.* The parameter barriers near $0.8749$ in
  [Liu2, New, XS1] concern this bootstrap.
- **E2. Weaken (H2) to shorter families.** If (H2) held for $H=D^{\theta}$ with $\theta<1$, that is, with $\varepsilon_0=1-\theta$,
  Theorem 3 itself gives the floor $3/4-(1-\theta)/4=(1+\theta/2)/2$. This is below $3/4$ iff $\theta<1$. Even without copies, the row
  $u=1$ alone gives $|A_1|^2\le S\le D^{1+\theta+\varepsilon}$, i.e. $(1+\theta)/2$, which is below $3/4$ iff $\theta<1/2$.
  *Proved here* (the arithmetic). This corrects the original, which had "$\eta<1/2$" for the version with copies. So the short regime
  is not an exit from the theorem. It is the theorem with a larger $\varepsilon_0$, and the open problem is to prove a
  $\mu$-specific diagonal mean square for families shorter than $D$.
- **E3. Drop "$P_0$ finite".** *Example (proved).* Let $\chi$ be a character mod $m_0$ of order $k\ge2$ and set $\psi_u=\chi^{\Omega(u)}$
  over $\mathbb Q$. This is multiplicative, and local with $S=\{p\mid m_0\}$. Here $m_p=1$ for every $p\notin S$, so $P_0$ is infinite.
  The copies are $\{u:k\mid\Omega(u)\}$, so the copy proportion need not tend to zero. But then $S=\sum_{j\bmod k}N_j|A_{\chi^j}|^2$
  with $N_j=\#\{u\le H:\Omega(u)\equiv j\}$ and $\sum N_j\asymp H$. So (H2) forces $|A_{\chi^j}|^2\le kD^{1+\varepsilon}$ for every $j$
  with $N_j\ge H/k$, in particular for at least one $j$. That is a square-root bound for $\mu$ twisted by a fixed character, the
  strength of GRH for that character. The hypothesis then already contains the conclusion. (The original's claim that "copies include
  all $P_0$-smooth $u$" is false. Only the $P_0$-smooth $u$ in the kernel qualify, as the verifier noted.) *Remark (not proved):* the
  original conjectures that no "Poisson-able" family has $P_0$ infinite except degenerate ones.
- **E4. Drop exactness: approximate copies.** These are members with $|A_\chi-A_1|$ small that are not near copies. Lemma 3.2 and
  Theorem 2 do not apply. *Remark (not proved):* a provable positive-density supply would escape the barrier. The project's G5
  experiment found such members only at the random rate. In the $t$-aspect this is Bagchi-type recurrence, which is equivalent to
  RH.
- **E5. Non-character families.** *Example (proved).* For additive twists $e(an/q)$, $0\le a<q\le Q$, the value at $n=1$ shows that a
  near copy on $[1,D]$ needs $q\mid a$. So the copies are $a=0$, one per $q$: $C=Q\le\sqrt2|F|^{1/2}$, again density $1/2$.
  *Remark (not proved):* families of Hecke eigenvalues $\lambda_f$ were not examined. We know of no family with exact copies of
  density above $1/2$ and a provable diagonal $\mu$-specific mean square.
- **E6. The Dirichlet case of (H2) is hypothetical.** *Remark.* The classical large sieve $(Q^2+D)\|a\|^2$ is for primitive
  characters (cited from memory). For the full family $F_Q$, (H2) contains the $Q$ principal characters, so it already implies a
  bound of barrier strength for sums of $\mu$ coprime to $q$. The original's sharper claim (that (H2) needs $|A_{\chi^*}|^2\ll q^*D$
  for every small conductor) is imprecise as written: the induced and primitive sums differ at $n$ sharing factors with $q$. We do
  not use it. Theorem 3(b) is therefore a barrier for a hypothetical input.

---

## 7. Machine-checked parts

Lean 4 with mathlib, files in rh/formal/RHFormal/. We rebuilt them for this note with
`lake build RHFormal.CB_L1_Squarefull … RHFormal.CB_L5_CharacterOrthogonality`, which reported "Build completed successfully (3931
jobs)". The main theorems print axioms `propext, Classical.choice, Quot.sound` only. No `sorry`, `admit` or new `axiom` appears in the
files.

| File | Machine-checked statement | In this note | Not formalised |
|---|---|---|---|
| CB_L1_Squarefull | `card_squarefull_le_three`: #{1≤n≤X squarefull} ≤ 3√X; `card_squarefull_le_zeta`: ≤ Re ζ(3/2)·√X; `squarefull_decomp` (n = a²b³, b squarefree) | Lemma 4.4(1), constants 3 and ζ(3/2) | the constant ζ(3/2)/ζ(3); ideals over K |
| CB_L2_KernelCopies | `kernel_lemma` (gₚ^{vₚ(u)} = 1 ⇒ ord gₚ ∣ vₚ(u)); `squarefull_of_copy` (m(p) ≠ 1 ⇒ copies squarefull); `card_copies_le_three`; `copy_decomp`; `card_copies_le_euler`: #{copies ≤ X} ≤ 3√X ∏_{p∈P₀}(1−p^{−1/2})^{−1} | Lemma 4.1; Theorem 2 over ℚ (with 3) | Hecke characters, local components, Lemma 4.3 (the identity ψ_{u,p}\| = χₚ^{vₚ(u)} is a *hypothesis* in Lean); number fields; S and P₀ merged |
| CB_L3_GramLowerBound | `theorem1` (near copies, (1−2η)²·C·D, η ≤ 1/2); `theorem1_exact` ((1−η)², η ≤ 1); `delta_ge_of_test`, `opNorm_sq_ge` (Δ-form and operator-norm form); `card_not_coprime_le` (3.1) | Theorem 1 over ℚ, all of it | Theorem 1′ over K; Remark 3.1; Lemma 3.2, Corollary 1 |
| CB_L4_AmplifierArithmetic | `amplifier_floor`, `amplifier_floor_bound` (Lemma 5.1(i)); `exponent_floor`, `exponent_floor_attained`, `sqrt_exponent` (5.1(ii)); `delta_floor` (5.1(iii)) | Lemma 5.1 | Definition 5.2, Lemmas 5.3–5.4, Theorem 3 |
| CB_L5_CharacterOrthogonality | `sum_norm_sq_eq`: for D < q, Σ_{χ mod q} ‖Σ_{n≤D} aₙχ(n)‖² = φ(q) Σ_{n≤D,(n,q)=1} ‖aₙ‖² | the case q > D of Prop. 5.5(1) | the case q ≤ D; Prop. 5.5(2) |

Conventions in Lean: members are indexed by a finite type, so multiplicity is allowed, and $\Delta$ is any admissible constant. In
`theorem1` the near-copy hypothesis is stated for all $n\in\mathbb N$, not only $n\le D$. This is harmless: extend a member by $1$
outside $[1,D]$.

Not machine-checked anywhere: Theorem 1′, Lemma 4.3 for Hecke characters, Lemma 4.4(2), the optimality Lemma 5.4,
Proposition 5.5(2) (which rests on cited facts: Jacobi symbols, Pólya–Vinogradov), Theorem 3, and §6.

**Gaps.** None of the proofs above failed on re-derivation. Four points are scope limits, not gaps, and are stated where they arise:
- the $[1,D]$-copy extension of Theorem 3(a) to general homomorphic families over $K$ (§4.4) is not proved;
- the facts cited from memory in §2 were not re-read;
- the near-copy error constant ($2\eta D$, Lemma 3.2) corrects T108;
- the near-copy range $\eta\le1/(2\kappa_K)$ in Theorem 1′ makes T107 precise.

---

## References

Items marked "read" were opened by the project's readers (rh/library/NOVELTY_copy_barrier.md). Items marked "cited from memory" were not.

- [BG] P. T. Bateman, E. Grosswald, On a theorem of Erdős and Szekeres, *Illinois J. Math.* 2 (1958) 88–98 (cited via T. H. Chan,
  arXiv:2205.12108, read in its introduction). The original Erdős–Szekeres paper (1935) was not read.
- [BGL] V. Blomer, L. Goldmakher, B. Louvel, L-functions with $n$-th-order twists, *IMRN* 2014; arXiv:1112.1650 (read by keyword: §2
  and the proofs of the corollaries).
- [CIS] J. B. Conrey, H. Iwaniec, K. Soundararajan, Asymptotic large sieve, arXiv:1105.1176 (read: the remark on primitivity).
- [Dav] H. Davenport, *Multiplicative Number Theory*, ch. 23 (Pólya–Vinogradov) and ch. 5 (Jacobi symbols) — cited from memory.
- [EM] Emergent Mind, OpenAI math explorer, result page 003, forum post of 6 Oct 2026 (read).
- [GL] L. Goldmakher, B. Louvel, A quadratic large sieve inequality over number fields, *Math. Proc. Cambridge Philos. Soc.* 154 (2013);
  arXiv:1112.1642 (read: the definition of $n$-th order Hecke family and the Remark citing [HB, p. 236]).
- [GZ] P. Gao, L. Zhao, Mean squares of quadratic twists of the Möbius function, *J. Number Theory* 247 (2023); arXiv:2212.09241 (read:
  Theorem 1.1).
- [HB] D. R. Heath-Brown, A mean value estimate for real character sums, *Acta Arith.* 72 (1995) 235–275 (read: pp. 235–239).
- [Liu1] B. Liu, arXiv:2610.12234 (abstract and targeted extraction). [Liu2] B. Liu, Zero-free half-planes for Hecke $L$-functions over
  number fields and Quasi-Riemann Hypothesis, arXiv:2610.26835 (read: lines 215–340 of the TeX).
- [MW] E. W. Weisstein (ed.), "Quasi-Riemann Hypothesis", MathWorld (read by the verifier). It reports a remark of T. Tao in a
  Numberphile video of 15 Oct 2026, which was not watched.
- [New] T. Newton, Prime errors and the quasi-Riemann frontier, Zenodo, 16 Oct 2026 — not obtained (known from [Liu2]).
- [OAI-7/8] OpenAI, The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane $\operatorname{Re}s>7/8$, preprint, 30 Sep 2026 (read in part;
  claims unrefereed).
- [OAI-11/12] OpenAI, The Quasi-Riemann Hypothesis, preprint, 5 Oct 2026 (read whole; claims unrefereed).
- [Toma] Y. Toma, On the moments of averages of quadratic twists of the Möbius function, arXiv:2405.18778 (read: Theorem 1).
- [tomoto0] GitHub tomoto0/quasi-riemann-hypothesis-7-8-verification, reports/barrier_analysis.md (read whole).
- [XS1] Y. Xu, H. Sang, arXiv:2610.15291 (read in part). [XS2] Y. Xu, H. Sang, A matching lower bound for the sextic large sieve,
  arXiv:2610.17675 (read: §1).
- Also screened and only related: X. Chang, H. Wang, An exhaustion-aware product moment and zero-free half-planes for Hecke
  $L$-functions, arXiv:2611.00924; Guth–Maynard, arXiv:2405.20552 (the classical, unrelated $3/4$ of large-values theory).
