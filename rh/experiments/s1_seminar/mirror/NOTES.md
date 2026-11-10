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
