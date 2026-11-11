# MEMORY of SP-operator

Rewritten at the end of session 1 (2026-11-11, seminar S1; one container restart mid-session, nothing lost).
A session starts by reading this file, CHARTER.md, LIBRARY.md, PROOFS.md and IDEAS_LOCAL.md.

## Files of this seat
- CHARTER.md (fixed): the toolkit, what it can and cannot do.
- LIBRARY.md: 18 entries with exact statements and read status; list "Still to read" at the end.
- PROOFS.md: P1 window space is de Branges when Q_a > 0; P2 twist = conjugation, curvature sign;
  P3 multiplier duality; P4 Poisson splitting, Weyl function, class N_1; P5 Suzuki's dial; P6 derivative of the
  parity determinants; P7 odd block on the no-prime window has a simple positive ground state.
- IDEAS_LOCAL.md: 5 entries (SP-operator/#1..#5). ladder.py.txt + ladder.log (one small computation).
- board_drafts/: texts of my board posts (p1..p12).
- Library notes written for the project: rh/library/suzuki-2606.09096.md, rh/library/suzuki-1606.05726.md.
- Sources under rh/library/src/: 2606.09096, 1606.05726 (both read in full), basor-chen-0202062 (read in
  full), kaltenbaeck-woracek-1998 (pp. 1-6 of 37 read), luger-ou-2202.13246 (sec. 3.2 read),
  1204.1827 and 2511.23257 (downloaded; only the abstract and theorem list of the latter read).

## What I now know about the project, through my toolkit
1. The project's object is the Weil form Q on windows [-L, L] (log variable; primes <= e^(2L)), Q = pole + arch
   - primes, N = primes - arch. Lane A: lowest eigenvalue ~ exp(-4 pi e^(2L)) (prolate ladder); impostor
   (Davenport-Heilbronn) fails first at L in (1.70, 1.72]. In my language: Q_a is a truncated Wiener-Hopf form
   whose symbol is the zero-counting measure; Q_W(v) = <G v', v'> with Suzuki's continuous screw function g;
   when Q_a > 0 the Fourier image of the window is a de Branges space H(E_a) (P1), and the windows form a
   chain = canonical system with DIAGONAL Hamiltonian (even measure). The tiny eigenvalues are the
   finite-window form of "no Szego condition": forced by the zeros being discrete; only the rate is extra.
2. The three seats' inertia statements (S1-cubic Lemma A, S1-parity B32, B56) are Haynsworth's inertia
   additivity; function-theoretic form: q(z) = i(Lambda'/Lambda)(1/2 - iz) (Lambda without s(s-1)) is in N_kappa
   with kappa = 1 + #zeros right of the line; RH <=> q in N_1 (P4). The "+1" is the pole of zeta.
3. B60 (positivity on [-L,L] <=> |H_W| <= T_W on the half window) is "Toeplitz +- Hankel for even symbols"
   (Basor-Ehrhardt eq. (13)); each parity block has its own Borodin-Okounkov identity with ONE Hankel operator
   of the phase function (their Prop 3.13 + Lemma 3.15; read via machine summary only).
4. Borodin-Okounkov on the Weil form: the exact symbol (discrete measure) has no Wiener-Hopf factorisation
   WITH OR WITHOUT RH (Szego condition); on one window a positive factorisable representative exists iff
   Q_a >= 0 (it is dx/|E_a|^2); so nothing is gained there. The identity has content only for the smoothed dial
   1/|xi(1/2+d+ix)|^2, whose factors are explicit; "factor zero-free in the upper half-plane" = "no zeros right
   of 1/2 + d" (Suzuki Prop 4.3).
5. Barrier B11 / family F_d = zeta(s-d) zeta(s+d): (i) Q_{F_d} = 2cosh(d ad_X) Q; curvature
   -2<x psi,(Q - lambda_0) x psi> <= 0 (P2; confirmed to 8 digits by S1-parity B136); (ii) cosh(d(x+y)) is
   Hankel-positive, cosh(d(x-y)) is Toeplitz-indefinite, the reverse for cos (P3): every Hankel-type hypothesis is
   twist-invariant by Schur products; (iii) 2cosh(du) = e^(-d|u|) + e^(+d|u|): forward Poisson half is harmless
   (positive for d > 1/2 unconditionally), backward half crosses the spectrum; (iv) Suzuki's canonical systems
   H_d(t) are the SAME dial as a ratio zeta(s-d)/zeta(s+d); they exist for d > d0 = sup Re rho - 1/2; d = 0 is
   special only as the fixed point of d -> -d (E_d# = E_{-d}); nothing in the construction knows the centre
   (Suzuki: Ramanujan not needed, Euler product needed).
6. SP-reflection's side, as answered to me: Widder's theorem makes S1-curv's "two test spaces" wall a theorem
   (no kernel with an atom in (0,2L) is mirror positive on L^2(0,L); B146, with a 5-line extension to
   distributions); mirror = identity involution (dual R), Ramanujan = inverse involution (dual T), intersection
   +-1 (B117); local Toeplitz positivity is independent of Bochner positivity on R because of the infinite atom
   at 0 (B146 (3)); every bridge SP-reflection owns gives positivity of PROPAGATORS, the Weil form is an
   inverse propagator (B129); the Jorgensen-Neeb-Olafsson window theorem needs + K where Weil has - K.

## What I was asked and what I answered (board s1)
- B75 (moderator): doubling step known? -> B122: yes, T +- H (Basor-Ehrhardt); no kernel-side theorem gives
  |H| <= T; on F_d the failing hypothesis is "symbol is a positive measure on the real axis".
- B84 (S1-mirror) -> B123: confirmed; R = canonical-correlation operator of adjacent half windows; d/dL log
  (det_even/det_odd) = 2 Gamma_L(L,-L) (P6, for I + K only); atoms enter at t = (1/2) log n in Suzuki's K[t].
- B80 (moderator) -> B124: T_p is the rank-one projection for zeta, eigenvalues p^(+-d) for F_d; d = 0 <=>
  T_p^2 = T_p <=> c(p^(k+1)) = c(p^k), k >= 3; no extension to window shifts can keep an idempotent.
- B93 (S1-parity) -> B125: Haynsworth; class N_1; Krein-Langer does not give the first window at which a
  non-real point is counted; heuristic count rule from the ladder. Check posted in B145 (ladder at L = 1:
  even 8.2e-30, 3.3e-23, 1.9e-17, 1.8e-12, 5.5e-8, 2.8e-4, 0.17; my stated threshold 1e-3 was off by one: MISS).
- B100 (S1-curv) -> B126: nu(L) = norm of differentiation in H(E_L) (Dyakonov / Baranov, from memory);
  commutation relation Q(xg) = Re Q(x^2 g, g) + (1/2)<g, T(sigma'') g>; it does not see the tilt.
- B115 (S1-cubic) -> B127: the t-indexed object is the chain H(E_t) / Hamiltonian; as an existence statement it
  is vacuous (like Lemma C); N_1 is the home of "one positive eigenvalue"; closed form for t < 0.347 PROMISED.
- B138 (SP-reflection) -> B150: Suzuki's K_d[t] is not >= 0 (2x2 minor); I do not know which determinant
  vanishes first; no prime-by-prime factorisation (local factors are not unimodular); continuation problem on
  a window is always indeterminate (deficiency (1,1), Suzuki Lemma 6.2); zero margin = failure of Szego.
- B152 (moderator: the pole in the odd block; novelty check) -> B163: both sentences right; PROOFS.md P7:
  for EVERY L <= (1/2) log 2 the odd block has a simple ground state, positive a.e. after folding (first
  Beurling-Deny criterion + irreducibility; no perturbation); Suzuki has nothing on the odd eigenfunction and no
  explicit range; per the digest yoshida-1992.md the proved positivity on the no-prime window is on the
  hyperplane where the transform vanishes at +-i/2 (secondary sources disagree; primary not read).
- B158 (moderator, to all: name the one statement) -> B164: I have no candidate meeting the lead's three
  conditions; (A) on the no-prime window cannot be violated by any control (archimedean only); it breaks
  exactly when the mirror atom of 2 enters. I said I would try to break (C) (doubling step) and asked
  S1-curv / S1-mirror whether its saturating vector is a Perron vector.
- S1-parity answered my B135 in B159: t_1(L) = <1, Q_L^(-1) 1> for zeta 0.42 (L=0.1), 3.9 (0.2), 67.7 (0.3),
  3208 (0.4), 6.6e5 (0.5), 1.5e14 (0.75), 8.8e28 (1.0); impostor 0.11 .. 1.1e28 (L = 0.1 .. 1.7);
  t_1 x mu_1 between 0.1 and 0.73 (zeta). Slope of log t_1 is NOT smooth across L_n = (1/2) log n: zeta drops by
  5-10 (12%) at n = 2 and n = 4, no drop at n = 3; impostor +0.4 at n = 2 (c_2 > 0), -2.5 at n = 4 (c_4 < 0);
  resolution 0.01 in L; no rule fits all six cases. S1-parity asks for a formula for the one-sided derivatives
  of <1, Q_L^(-1) 1> at L_n from boundary values of Q_L^(-1) 1: OWED by me (next session).
- My claims: B131 (known theorems; P1; ground-state positivity known for small a and where the mechanism
  stops), B132 (Borodin-Okounkov), B133 (the dial). My questions: B134 to SP-reflection (answered: B146),
  B135 to S1-parity (t_1(L) = <1, Q_L^(-1) 1> and its log-derivative across (1/2) log n; NOT yet answered),
  B145 question back to S1-parity (couplings c_5, c_6 at L = 1; not yet answered).

## Blind predictions of this seat (owner rule 4)
- #1: first failing L*(d) for F_d: guessed 0.28-0.33 / 0.35 / 0.38-0.40 for d = 0.25 / 0.1 / 0.05; measured
  0.436 / 0.476 / 0.505. MISS (coefficient c(L) is ~1e-4, not ~a^2). Formula confirmed.
- B125 check "count rungs below 1e-3": 6 vs observed 5 in the even block. MISS by one; rule needs couplings.

## Holding for next session
0. OWED to S1-parity (B159): one-sided derivative formula for t_1(L) = <1, Q_L^(-1) 1> at L = (1/2) log n.
   Starting point: Hadamard-type variation d/dL <1, Q_L^(-1) 1> = (boundary term in u = Q_L^(-1) 1 at +-L); in
   Krein's theory it is |u(L)|^2-type (pi h_1(L)); with an atom entering, the equation Q_L u = 1 gains the
   term -Lambda(n) n^(-1/2) u(x -+ log n) at the window edge. This is idea #8's 'smallest' statement
   (Hadamard formula for the window) in my language. Also: PROOFS.md P7's unchecked point (form core of the odd
   part) and the two Reed-Simon theorems cited from memory must be read.
1. PROMISED (B127): closed-form chain E_t, h_1(t) for the archimedean-only window t < (1/2) log 2; read Burnol
   (Sonine spaces; the 2011 paper Suzuki builds on) and Connes-Consani (archimedean place) first; compare with
   "background alone turns negative (odd block) between L = 0.370 and 0.375".
2. Open with S1-parity: numbers for t_1(L) and (d/dL) log t_1 across L = (1/2) log n, zeta vs impostor (B135).
   If they come: is h_1 continuous at prime powers? I stated no expectation.
3. Unknown to me, asked by SP-reflection: which of det(1 +- K_d[t]) vanishes first for a function with an
   off-line zero. Needs Suzuki's companion paper [Su19_1] and a small computation (his remark (4)).
4. P4's bookkeeping for infinitely many real zeros (convergence of the partial-fraction sum inside the kernel
   count) is not written out; do it or cite Krein-Langer properly.
5. P1 Remark 2 (indefinite window -> de Branges Pontryagin space) is from memory; read Kaltenbaeck-Woracek.
6. The identification "Suzuki's K[t] = Hankel block of Basor-Ehrhardt Prop 3.13 for the symbol 1/|E_d|^2" is
   HEURISTIC (normalisations unchecked; his section is inside [0,2t], Borodin-Okounkov's is the complement).
7. P6 is proved only for I + (continuous kernel); the Weil form needs a regularised determinant.

## Library entries whose source still has to be read (see LIBRARY.md end)
from memory: L4, L5 (de Branges 1968), L7 (Dyakonov, Baranov), L8 (Krein; Krein-Langer IEOT 2014), L11
(Haynsworth), L14 (Widom / Boettcher-Silbermann), L15 (Szego-Kolmogorov-Krein; Denisov), Lagarias 1999 /
Hinkkanen 1997. Partly read: L9 (KW98 pp. 7-37 unread), L13 (Basor-Ehrhardt, verbatim read owed), L3
(Connes-van Suijlekom: whole paper), Suzuki 1204.1827, Suzuki JLMS 2023, Suzuki Canad. J. Math., [Su19_1].

## Rules I keep
Answer from the toolkit; label PROVED / COMPUTED / HEURISTIC / CONJECTURE / KNOWN (citation, how much read);
never post whether an idea is likely to work; the main move is the question; everything my toolkit proves is
an equivalence or a count, not the inequality (CHARTER, "what it cannot do").
