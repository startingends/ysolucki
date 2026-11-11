# S3_SLOPE: the 7/8 comparison system with the copy slope as a parameter (SP-sieve, session 6, 2026-11-11)
Labels: PROVED / KNOWN (what I read) / COMPUTED (command, numbers) / CONJECTURE / RISK. Board s3 was CLOSED (B18) before I could post;
everything is here. Predictions P0-P3 were written in PROGRESS.md at 05:25 UTC, before any computation.
READ (7/8 paper text, rh/library/src/qrh-main/5raw.txt): sec. 19.2 with Prop 19.2 and its proof (lines 14984-15335); Lemma 20.1, (20.4),
sec. 20.3, 20.4, Lemma 20.2 (15592-16010); Lemma 10.4 and (10.15) (6361-6475); sec. 12 opening, (12.1)-(12.4) (7010-7130); statement of
Prop 15.3 (8858-8870); Lemma 17.1, 17.6 (session 5). Code: `slope_system.py.txt` (logs `slope_V1.log`, `slope_V2.log`, `slope_V2k*.log`,
`slope_V3.log`, `slope_V4.log`), every run under `tools/memcap.py 1`, about 4 min per optimisation.

## 1. The system, as reconstructed (each line from a cited equation)
Geometry (12.4): X = Z^lx, Y = Z^ly, ly = lx + b, l = 1 - 2 lx - b (M + l = 1), h = 1 - lx + l. Paper: lx = 17/48, b = 1/8, l = 1/6, h = 13/16.
LOW side (Prop 15.3): |I_mod| << Z^(lx/2 + b/12). SIGNAL (Lemma 10.4): C(sigma0) = sigma0 + lx/2 - 1 + h/6. The low side must not exceed
the signal: sigma0 >= 1 - h/6 + b/12  (= 7/8 at the paper's geometry, exactly).
HIGH side (Lemma 10.4, (10.15) at d = h, a = (1+delta)/2, g = q l, q = x delta):
   E(delta, x) = (1 + delta)(1 - ly)/2 - sigma0 - h/6 - l/2 + x delta l + h R* + h delta/2  <= 0  for 1/50 <= delta <= alpha, 0 <= x <= 1/2
(reproduces the paper's second line of (20.4) with C0 = -1/48: checked by hand). R* = row-count exponent of Prop 19.2: min over t in [1, 3/2]
of the worst witness split r + m = t, m <= 1/2, of the best available count: inverse with slots 1 - delta r - 2q z_M(r), z_M = (1 - r)/2
(Lemma 17.1's r + 2z <= 1); plain 1 - 2 delta m - 2q z_P(m), z_P = (1 - 2m)/(6 kappa) (Lemma 18.1); for r >= 1 the amplified bound
1 - alpha + (alpha - delta) r (Lemma 17.6, (19.3)). Supply cap l/h on the inverse capacity. Floor bin delta0 = 1/50 with R = 1.
WHERE THE SIXTH POWERS SIT (reading): (i) the 1/6 in h/6 is the pole z = 1/6 of zeta_F(6z), the density of sixth powers a^6 among the
Poisson frequencies u a^6 (digest sec. 5; Lemma 10.4); (ii) the 1/12 = (1/2)(1/6) in the low bound comes from counting the exceptional
frequencies (k) = a_1^6 e, q_(a_1) <= (K/q_e)^(1/6) (proof of Prop 15.3, line ~8840); (iii) alpha = 5/6 = 1 - 1/6 in Lemma 17.6. So write c for
the copy density: (i), (ii) are copies on the DUAL (frequency) side, (iii) on the row side. Theorem 2 of COPY_BARRIER allows c <= 1/2 for
kernel copies of a homomorphic family, on either side.

## 2. Check of the reconstruction (prediction P0: HIT)
COMPUTED. Paper geometry, c = 1/6, alpha = 5/6: max E at sigma0 = 7/8 is -1.91e-4 (the paper certifies -E* >= 49/440640 = 1.11e-4);
my R* agrees with the paper's closed form R* = 1 - delta + (alpha - delta) delta Px/(2J) to 2e-5 on a test grid. Optimising (lx, b):
best sigma0 = 0.874996 at (0.3514, 0.1305) on the fine grid (low-side value there 0.874962), against Liu's B_new = 0.874957 (abstract).
Agreement to 4e-5 (optimiser/grid); the reconstruction is taken as faithful for the parametric study below. RISK: Liu's system may differ
in details I did not read; agreement of one number is not a proof.

## 3. Results (COMPUTED; optimised over (lx, b); kappa dynamic = 2 sigma0 - 1, and separately kappa fixed at 3/4)
| run | c in (i),(ii) | alpha (17.6) | Lemma 17.1 relaxed to r + 2z <= 1 + rho | best sigma0 | predicted |
|---|---|---|---|---|---|
| paper | 1/6 | 5/6 | rho = 0 | 0.874996 (Liu 0.874957) | P0 ~0.87496: HIT |
| V1 | 1/6 | 3/4 | 0 | 0.874544 | P1 >= 0.86: HIT |
| V1 | 1/6 | 2/3 | 0 | 0.873935 | |
| V1 | 1/6 | 1/2 (Thm 2 limit) | 0 | 0.872228 | |
| V2 | 1/4 | 3/4 | 0 | 0.810131 (kappa = 3/4: 0.810250) | P2 1 - 3c/4 = 0.8125 |
| V2 | 1/3 | 2/3 | 0 | 0.743856 (kappa = 3/4: 0.744137) | P2 0.75 |
| V2 | 1/2 | 1/2 | 0 | 0.609375 = 39/64 (kappa = 3/4: same) | P2 0.625 |
| V3 | 1/6 | 5/6 | rho = 1/4, 1/2, 1 (t up to 3/2 + rho), 1/2 (t <= 3/2) | 0.869792 = 167/192 in all four | P3 small, saturating: HIT |
| V4 | 1/2 | 5/6 | 0 | 0.609375 again, at a different geometry (0.3212, 0.1700) | |
Readings (each a statement about THIS system, COMPUTED):
(a) The Moebius-side lemmas are SLACK at the optimum. Changing Lemma 17.6's slope from 5/6 to the Theorem-2 limit 1/2 moves the exponent by
    0.0028 (V1). Relaxing Lemma 17.1's length condition (the short regime, exit E2) helps once, to 167/192 = 0.8698 at b = 0, lx = 13/32
    (exactly the low line 2/3 + lx/2 at b = 0), and then saturates for every rho >= 1/4 (V3).
(b) The BINDING constraint is the low estimate against the principal signal, sigma0 >= 1 - c h + c b/2: at every optimum found, sigma0 equals
    the low-side value to <= 4e-5, and in V2 the high side stays feasible. At the paper's geometry this line is exactly 1 - 3c/4 (P2's guess).
(c) With the dual-side copy density c as a parameter (V2) the system goes BELOW 3/4 once c > ~0.32, and reaches 39/64 = 0.609 at c = 1/2,
    the most Theorem 2 allows for kernel copies. Fixing kappa = 3/4 (inside Lemma 18.1's stated range, licensed by Part I since
    1 - c/2 <= 7/8 for c >= 1/4) changes nothing material: the kappa range is not what binds.
(d) WHAT BINDS IN V2-V4: the FLOOR BIN (a = 51/100, no zero witness, trivial count R = 1). PROVED as algebra on the reconstructed system,
    in the limit delta0 -> 0: the floor bin needs sigma0 >= l_x/2 + (1 - c) h, the low side needs sigma0 >= 1 - c h + c b/2, with
    h = 2 - 3 l_x - b. Minimising the larger of the two over (l_x, b) gives b = 0 (for c < 1/2), h = 4/5 and
         sigma0 >= 1 - 4c/5      (every geometry, every copy slope alpha, every relaxation rho),
    with the b-coefficient vanishing exactly at c = 1/2 (which is why V2 and V4 give the same value at different geometries). With
    delta0 = 1/50 the computed value is 39/64. At c = 1/6 this floor line is 13/15 = 0.867, and the intermediate bins bind instead (7/8).
    So no change of the Moebius-side inputs can take this bookkeeping below 1 - 4c/5: at the Theorem-2 limit c = 1/2, below 3/5.
CONSEQUENCE (my reading, labelled): my S3 B9 (d) said "E1 meets the copy barrier at Lemma 17.1's length condition" and conjectured the
infimum stays >= 3/4 even at slope 1/2. The first half is right as a statement of WHERE (H2) enters; the conjecture is CONFIRMED for the
row-side slope alone (V1: 0.872) and REFUTED as a statement about the architecture: inside this comparison system, 3/4 is not forced by
the copy barrier. What fixes 7/8 (and Liu's 0.874957) is the low/signal balance, whose copy density is the sixth-power density among
the Poisson FREQUENCIES; with that density at 1/2 the same bookkeeping would give 39/64.
RISKS that could undo (c): (1) a quadratic (c = 1/2) instance of the architecture may not exist: the Moebius absorption (mu x sextic Gauss
sum = cubic theta coefficient, QRH Lemma 4.1) is what makes the dual side automorphic; for quadratic symbols the Gauss sums do not absorb mu
(S2 B22, unanswered). With c = 1/3 (cubic rows) the absorption question is the same. (2) Other sixth-power constants may be hidden in the
lemmas whose proofs I did not read (the 6 kappa of Lemma 18.1, its 5M/6 threshold, the contour 17/50, the low estimate's other terms);
I varied only the three I could trace. (3) Constraints I did not model: small/large row ranges of sec. 20.3 (checked only that a contour
z0 with c < z0 < min(c + ly/(2h), 1 - alpha/2) exists at the V2 optima; it does), the supply margins, the detector's height condition.
So: (c) is a statement about the bookkeeping, not a theorem about any family.

## 4. Answer to SP-operator's B11 (board closed; written here)
(1) Exact, untruncated: YES (PROVED). For a quadratic ray-class character psi, b multiplicative on squarefrees with b(p) = 1 - psi(p) in {0, 2}
    gives b = (mu psi) * 1 and b * mu = mu psi: step 5 survives with nu -> nu psi; positively biased (sum_{l<=L} b_l ~ c L/L(1,psi) against
    sum |b_l|^2 ~ L (log L)^c').
(2) Any FINITE amplifier: NO (PROVED, given PNT in short intervals of length o(D) over the field). Claim: if b is finitely supported, W smooth
    with support [A, B], and c_m = sum_{l|m} b_l mu(m/l) W(m/(lD)) equals mu(m) g(m) V(m/X) on squarefrees (|g| = 1 multiplicative, V uniformly
    continuous, X comparable to D) for a sequence D -> inf, then b = b_1 delta_1. Proof: at primes m, |V(m/X)| = |b_1 W(m/D)|, hence by
    density and continuity everywhere in the range; let l_0 be the least l > 1 with b_l != 0 and q a prime with q/D near a point of (B/l_0, B]
    where W != 0; then c_(l_0 q) = -b_(l_0) W(q/D) != 0 (the divisors 1, q, l_0 q contribute 0), while |V(l_0 q/X)| = |b_1 W(l_0 q/D)| = 0.
    If b_1 = 0, V vanishes at all primes, hence identically: same contradiction. []
(3) Reading: the identity lives on one multiplicative cutoff of the product m = l n; an amplifier truncates l and n separately. Not Selberg's
    parity barrier as such; parity enters through (1): the one exact b is (mu psi) * 1, whose truncation is a Moebius-sum problem again.

## 5. Answer to SP-reflection's B13 (board closed; SP-reflection withdrew the level reading in B17, so briefly)
Level 1/2 uniformly in h is elementary (CRT, error <= X^2). Beyond 1/2 the error is a sum of Kloosterman fractions with coefficients
mu(d) mu(e) (the off-diagonal of BCR sec. 3 / Conrey Lemma 8; KNOWN, digests). Near level 1 there is an exact identity (PROVED): for n > X,
sum_{d|n, d<=X} mu(d) = -sum_{k|n, k<n/X} mu(n/k), so sum_{n~N} c_n c_(n+h) = sum_{k,k' < N^(1-vartheta)} sum_{km + h = k'm'} mu(m) mu(m'):
binary Moebius correlations with small cofactors, i.e. Chowla, the parity wall in explicit form.

## 6. Summary (for the lead)
1. Reconstructed the 7/8 comparison system from sec. 19-20, 10.4, 12, 15.3; it reproduces the paper's margin and Liu's 0.874957 (to 4e-5).
2. Lemma 17.6's slope alone barely matters: 0.8750 -> 0.8722 from 5/6 to 1/2.
3. Relaxing Lemma 17.1 (the short regime) gives once 167/192 = 0.8698 and saturates.
4. The binding constraint is low estimate vs principal signal; both carry the sixth-power density of the Poisson FREQUENCIES.
5. With that density c as a parameter: 0.810, 0.744, 0.609 at c = 1/4, 1/3, 1/2; below 3/4 for c > ~0.32 (RISK: no c != 1/6 instance known).
   Hard floor of the bookkeeping (PROVED algebra): sigma0 >= 1 - 4c/5 from the trivial-count floor bin, whatever the Moebius-side inputs.
6. So 3/4 is the floor of the amplifier chain (Thm 3), not, in this bookkeeping, of the October architecture; the question that decides it is
   whether any family other than the sextic one has the Gauss-sum absorption of mu (S2 B22).
