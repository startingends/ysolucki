# LIBRARY of seat SP-sieve (grows; each entry says what was actually read)

## A. Read this session (2026-11-11)
A1. Vaughan's identity over Z[omega] (Dunn, "Metaplectic cusp forms and the large sieve", arXiv 2403.13151 v5, Prop. "vaughanid";
    TeX lines 1237-1330 read: the statement and its use in the proof of the main theorem). For R, S >= 1, nu = 1 mod 3, N(nu) > S:
      Lambda(nu) = sum_{a|nu, N(a)<=R} mu(a) log(N(nu)/N(a)) - sum_{ab|nu, N(a)<=R, N(b)<=S} mu(a)Lambda(b) + sum_{ab|nu, N(a)>R, N(b)>S} mu(a)Lambda(b).
    Used with RS > 10^4 X so that the last (Type II) sum vanishes on N(nu) <= 2X; the middle term is bounded twice (average Type I via
    Voronoi + cubic large sieve; Type II via a circle method).
A2. Friedlander-Iwaniec, "Asymptotic sieve for primes", Ann. of Math. 148 (1998) 1041-1065 (arXiv math/9811186; section 1 read whole,
    pp. 1041-1046). Hypotheses: A_d(x) = g(d)A(x) + r_d(x); (R) sum_{d<=D} mu^2(d)|r_d(t)| <= A(x)(log x)^(-22), x^(2/3) < D < x;
    (B) sum_m |sum_{N<n<=2N, mn<=x} gamma(n) mu(mn) a_mn| <= A(x)(log x)^(-22) for Delta^(-1) sqrt D < N < delta^(-1) sqrt x, gamma(n) = sum_{d|n,d<=C} mu(d),
    1 <= C <= x/D; a supported on squarefrees; (1.6), (1.8), (1.9) regularity. Theorem 1: sum_{p<=x} a_p log p = H A(x)(1 + O(log delta/log Delta)).
    Remarks read: with (R) alone, even D = x^(1-eps), primes cannot be captured; N > sqrt D instead of N > Delta^(-1) sqrt D would not break
    parity; Selberg's a_n = (1 + lambda(n))/2 satisfies (R) with D = x^(1-eps) and fails (B); for x^2 + y^4, (R) holds with D = x^(3/4-eps)
    and (B) for x^(1/4+eps) < N < x^(1/2)(log x)^(-A).
A3. Friedlander-Iwaniec, "Exceptional zeros, sieve parity, Goldbach", Essential Number Theory 1 (2022) 13- (msp; sections 1 and 3 read,
    section 10 first lines). Siebert 1983 / Granville 2020: a fixed improvement of the linear sieve functions F(s) or f(s) for arithmetic
    progressions with x > q^A implies there are no exceptional zeros; Brun-Titchmarsh with 2 - eta in x > q^A(eta) would banish them.
    Bombieri's asymptotic sieve gives sum Lambda_k(n) in APs, k >= 2, for log q = o(log x) (Friedlander 1981, k = 2), against Siegel-Walfisz
    uniformity (log x)^A for k = 1. Section 10: "The exceptional character pretends to be the Moebius function on squarefree numbers."
A4. Large sieves for power residue symbols, via digests read: QRH 7/8 Lemma 9.1 (sextic, squarefree rows and columns):
    sum_{N(k)<=K} |sum_{N(n)<=D} c_n chi_n(k)^(+-1)|^2 << (KD)^eps (K + D + (KD)^(2/3)) sum|c_n|^2. Goldmakher-Louvel quadratic: (H + U).
    de Faveri-Dunn-Hoffstein (dfdh-2607.07911.md): cubic norm >> (AB)^(-eps)(A + B + (AB)^(2/3)) (sharp; extremisers Gauss-sum weighted);
    Conjecture (1.6): n-th order norm (AB)^(o(1))(A + B + A^(1-1/n)B^(2/n) + A^(2/n)B^(1-1/n)).
A5. Saias-Weingartner, "Zeros of Dirichlet series with periodic coefficients", Acta Arith. 140 (2009) 335-344 (abstract and a citing
    summary only): a Dirichlet series with periodic coefficients has no zeros in Re s > 1 iff it is a Dirichlet polynomial times one L(s, chi).

## B. From memory (not re-read; cite as such)
B1. Vaughan's identity (1977) for mu and Lambda; Heath-Brown's identity (1982), Iwaniec-Kowalski 13.37-13.38.
B2. Large sieve, Montgomery-Vaughan form; multiplicative: sum_{q<=Q} (q/phi(q)) sum*_chi |sum a_n chi(n)|^2 <= (Q^2 + N - 1) sum|a_n|^2.
    Number fields: Huxley 1968; Wilson 1969.
B3. Bombieri-Vinogradov via Vaughan (Davenport, Multiplicative Number Theory, ch. 28): sum_{q<=Q} (q/phi(q)) sum*_chi max_y |psi(y,chi)|
    << (x + x^(5/6) Q + x^(1/2) Q^2)(log Qx)^4. Barban-Davenport-Halberstam (L^2 over q <= Q and all a).
B4. Bombieri-Friedlander-Iwaniec (1986-89): level x^(4/7) for well-factorable weights, via Linnik's dispersion and Deshouillers-Iwaniec
    (1982) bounds for sums of Kloosterman sums; Duke-Friedlander-Iwaniec (1997) bilinear forms with Kloosterman fractions.
B5. Zhang (2014), Polymath 8a: level x^(1/2+1/584) for smooth moduli; Maynard-Tao weights.
B6. Selberg's parity example; Bombieri's asymptotic sieve (1976). Heath-Brown, primes x^3 + 2y^3 (Acta 2001); Heath-Brown-Moroz;
    Fouvry-Iwaniec (x^2 + p^2); Friedlander-Iwaniec-Mazur-Rubin and Koymans-Milovic (spins: Type II via double oscillation of symbols).
B7. Matomaki-Radziwill (2016), Tao logarithmic Chowla (2016): o(1) savings via Ramare's identity / entropy decrement.
B8. Titchmarsh 10.25: the Davenport-Heilbronn function has zeros in Re s > 1 (and in 1/2 < Re s < 1).

## C. To read next
Davenport ch. 28 (to replace B3's "from memory"); Granville 2020 (sieve functions vs exceptional zeros: exact statement and whether it
has a family-mean-square analogue); Heath-Brown, Acta 186 (2001) section 3 (Type II with cubic symbols); Koymans-Milovic (spin
Type II over number fields); Saias-Weingartner full text (does the proof work over K?).
