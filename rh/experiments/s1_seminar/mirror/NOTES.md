# S1-mirror: notes (memory between turns)

Seat: S1-mirror, seminar board `s1`. Speaks for idea #21 (docs/IDEAS.md), notebook N32, e21_reflection,
Theorem D of r2_curv/PROOF_bochner_parity.md. Write only here. No commits.

## Turn 1 (started 2026-11-10 23:41 UTC)

### Reading (what the record says, in my words)
- D1 (R2-curv): sum_{a,b>=2} phi(a)phi(b) Lambda(ab)/sqrt(ab) = sum_p log p (sum_k phi(p^k) p^{-k/2})^2. A direct sum of rank-one blocks.
- D3: Gamma kernel w(u) = sum_m e^{-(2m+1/2)u} is Hankel-positive on the whole half line u = x + y, x, y > 0.
- D4/D5: prime atoms are NOT Hankel-positive on the continuum half line; N_even - N_odd = 4 Hankel(K) after folding.
- #21: restricted to integers a, b >= 2 both are Hankel-positive: K(ab) = sum_m (ab)^{-(2m+1/2)} + sum_p log p chi_p(ab).
- NOTE (mine): the matrix [c(ab)], a,b >= 2, never uses c at primes or c(1). Lambda(p) is invisible to it.

### Thoughts BEFORE computing (theory, each to be checked)
T1. Twist invariance. [c(ab) psi(a) psi(b)] = D [c(ab)] D for any real completely multiplicative psi. So mirror positivity
    is invariant under every real multiplicative twist of c; the shift inequality is not. Examples that stay mirror positive:
    (i) Liouville twist c = lambda * Lambda (weights at 2, 3 negated, 4 kept);  (ii) real tilt c(n) n^t;
    (iii) zeta(s-d) zeta(s+d), 0 < d < 1/2: whole Weil kernel multiplied by 2 cosh(d u): integers, Euler product, FE s -> 1-s,
    all couplings positive, mirror positive, Gamma kernel still completely monotone, zeros OFF the centre line (unconditional).
T2. Odd/even: for phi on (0, L], f_pm = phi +- mirror(phi): Q(f_-) - Q(f_+) = 4 [H_Gamma + H_primes - H_pole](phi) (D5 plus pole).
    Mirror positivity helps the odd block and works against the even block; the lowest eigenvalue is in the even block (r1_A).
T3. Multi-time Kallen-Lehmann is TRUE but gives a LOWER bound on the kernel (kernel + self-energy >= 0 on Q_+^x for the height
    extension c(ab), a, b coprime), while RH needs an UPPER bound N <= pole. And the height extension of the Gamma kernel
    w(log ab) is not the Gamma kernel w(|log a/b|) of the Weil form.
T4. Dial n = 4: F = (1 - 4^{1-s}) zeta(s) zeta(s-1); c(2^j) = log 2 (1 - (-2)^j): local roots at 2 are +1 (mult +1) and -2 (mult -1).
    So "exactly one negative eigenvalue" is the numerator Euler factor at 2, not the zeros.
T5. GL(2) with Ramanujan (roots e^{+-i theta}): mirror positivity FAILS (Hankel [2 cos((i+j) theta)] has signature (1,1)).

### TWO-PRIME MODEL: definitions (posted on the board before computing)
Form: Q = pole + arch - primes (r1_A conventions), atoms only at 2^k and 3^k (k log p) with weights c_p(k) p^{-k/2};
true weights c_p(k) = log p.
 Model A ("small window"): all of L^2[-L, L] with e^{2L} < 5 (L <= 0.80). Here zeta's own Weil form contains only the atoms
   2, 3, 4, so the two-prime model IS zeta. Zero margin (mu ~ 1e-15 at L = 0.75). Self-energy: none needed (L^2 functions).
 Model B ("lattice bumps"): f = sum_{x in F} phi(x) b_eps(. - x), F finite subset of Z log 2 + Z log 3 in [-L, L], b_eps a hat
   function of half-width eps. Self-energy of atoms handled by the finite width eps (it is ~ (1/eps)(log(1/eps) + C)); the atomic
   limit eps -> 0 is trivial (diagonal dominates), so eps is a parameter and is reported. Two variants: (B-zeta) all primes present
   (then M is a compression of zeta's form) and (B-23) only the atoms 2^k, 3^k.
 Variations: (V1) weight at 4 times (1 + eta): eta < 0 breaks mirror positivity of [c(2^{i+j})], eta > 0 keeps it.
   (V2) mirror-positive one-parameter family c_2(k) = log 2 (t sqrt 2)^k (twist at 2), truth at t = 1/sqrt 2.
   (V3) Liouville twist (weights at 2 and 3 negated). (V4) Beurling: 2 -> 2.1 (positions k log 2.1, weights log 2.1 * 2.1^{-k/2}).

### BLIND PREDICTION (written 2026-11-10 23:50 UTC, before any computation of this turn)
P1. Model A, L = 0.75, V1: let eta_+ > 0 and eta_- < 0 be the first relative changes of the weight at 4 at which the lowest
    eigenvalue of Q turns negative. PREDICTION: both |eta_+| and |eta_-| lie between 1e-15 and 1e-7, and they are within a
    factor 1000 of each other. I.e. the mirror-preserving direction (eta > 0) is NOT protected.
    Would change my mind: |eta_+| >= 1e-3 while |eta_-| <= 1e-7 (then mirror positivity protects the shift inequality).
P2. Model A, V2: the set of t with Q >= 0 at L = 0.75 is an interval around 1/sqrt 2 of width below 1e-6.
P3. Model A, V3 (Liouville twist, mirror positive): lowest eigenvalue at L = 0.5 negative, between -1 and -0.01.
P4. Model B, eps = 0.05, F = lattice points with |i| <= 2, |j| <= 2 in [-1.5, 1.5], thinned to spacing >= 2 eps: lowest eigenvalue
    positive for the true model AND for V1 with eta = +-0.5, AND for V4 (2.1), all within 20% of each other: the coarse model
    cannot tell. Would change my mind: 2.1 negative while 2 positive at the same eps.
Meaning for the kill line of #21 if P1-P3 hold: "the shift inequality fails for some mirror-positive weights with the true
log 2, log 3" is hit; what survives is the criterion as a control, and the question of what input breaks the twist symmetry.

### RESULTS of turn 1 (2026-11-10 23:50 to 2026-11-11 00:05 UTC). Files: lib.py.txt, modelA.py.txt (+ logs modelA_*.log),
### lead2.py.txt, modelB.py.txt (modelB_150.log, modelB_300.log), mirror2.py.txt, b40.py.txt, PROOF_mirror_criterion.md
Predictions against results:
- P1 (thresholds for the weight at 4, L = 0.75, both in [1e-15, 1e-7], within factor 1000): MISS on size, HIT on content.
  Got eta in [-6.0e-5, +1.4e-5] (L = 0.75), [-3.9e-8, +6.1e-9] (L = 0.80). The mirror-preserving direction breaks FIRST.
  Weight at 2: [-1.4e-11, +1.3e-13]; weight at 3: [-1.7e-9, +9.1e-11] (L = 0.75). Reproduced by S1-parity (B43), second
  basis 5-15% narrower. L = 0.70 rows WITHDRAWN (not converged: atom at 4 is 0.0137 inside the edge; S1-parity B43).
- P2 (twist at 2, interval width < 1e-6): HIT, [-1.4e-11, +1.3e-13].
- P3 (Liouville twist negative in [-1, -0.01] at L = 0.5): HIT, -0.12 even / -0.74 odd.
- P4 (Model B at eps = 0.05: true, eta = +-0.5, 2.1 all positive within 20%): MISS. Weight at 4 x 1.5 is negative (-0.025);
  flipped to -log 2 stays positive (+0.022); 2.1 positive (+0.40): not detected. Self-energy is only ~ log(1/eps).
- One-prime system (B5): fails between L = 0.54 and 0.56 (odd block first), when the missing 3 would enter.
- Two-prime world without 5: true weights fail at L = 0.90 (-0.12 / -0.45).
- Lead's test B12: (a) positive, (b) weight at 4 flipped: negative from 0.75, (c) 2.1: negative from 0.40. But weight at 4 doubled
  (mirror positive) is negative too: -0.144 / -2.5e-4 at L = 0.75.
Kill line of #21, first clause ("shift inequality fails for some mirror-positive weights with the true log 2, log 3"): MET.
Posted as numbers (B47), not as a verdict; the lead decides.

Proved / settled this turn:
- PROOF_mirror_criterion.md: Theorem 1 KNOWN (Perfekt-Pushnitski 2018, Thm 3.3, Helson matrices); Theorem 2 (a, b >= 2 version:
  sigma-finite measure + PSD term w at products of two primes); Corollary 3 (Euler product: real roots, positive multiplicity,
  inertia count). Idea #21's claim field is FALSE outside the dial: mirror test = local roots, not zeros.
  Fails: L(chi)L(chi-bar) mod 5 (-3.89), L(Delta) (-3.62). Passes: zeta(s)zeta(s-1), zeta(s-d)zeta(s+d), Liouville twist.
- Dial n = 4 = (1 - 4^(1-s)) zeta(s) zeta(s-1): roots at 2 are +1 (m=+1), -2 (m=-1): exactly one negative square. (Also S1-parity.)
- Obstruction to B3: real tilt F_d = zeta(s-d)zeta(s+d): kernel x 2cosh(du). Hypotheses closed under real exponentials,
  conclusion only under imaginary ones. S1-parity's extra hypothesis "one wrong-sign square in the mirror form" kills F_d only.
- Three meanings of "the integers": positions / completeness / weights; mirror matrix blind to all three (B50, asked the lead).
- Shifted mirror (B40): mirror at log r is positive only on atoms at r * integers; r = 2, a,b = 3..12: min eig -1.33.
- Two-sided form (B60): positivity on [-L, L] <=> |H_W(phi)| <= T_W(phi) on (0, L], H_W = sum_zeros phihat(g)^2,
  T_W = Weil form on a half-size window; primes in (e^L, e^(2L)] enter only through the mirror form.
- H_primes(phi) = E_+^2 - sum_{m>=1} E_m^2 - sum_zeros phihat(g)^2 on L^2(0, L]: each zero pair gives signature (1,1); explains "half negative".

Open threads (for turn 2):
- Asked: B48 (S1-parity: sign pattern even block caps increases / odd block caps decreases; H_n > T_n on the odd ground state?),
  B49 (S1-cubic: can one fibre node be absorbed by the m = 0 Gamma square?), B50 (lead: which meaning of "the integers" is B10?).
- Promised/accepted: S1-parity computes the first failing window of F_d, d = 0, 0.05, 0.1, 0.25 (B59).
- Offered to S1-curv (B54): profile width at which the comb matrix [K_psi(log ab)] loses positivity. Not computed.
- My own next step (IDEAS_LOCAL #2): doubling on L in (0.347, 0.693), where the half window has NO primes and T_W is purely
  archimedean + pole; check how tight |H_W| <= T_W is and which phi saturate it.
- Not done: Model B with all integer points (not only 3-smooth) and eps ~ e^(-2L) (S1-curv did the comb, B39);
  a numerical check of Theorem 2's w-term (raise c(4), c(6), c(9) by a PSD pattern).
- Literature: 5 queries recorded in the proof file. Not searched: Bisgaard / Ressel on semigroups without identity.
