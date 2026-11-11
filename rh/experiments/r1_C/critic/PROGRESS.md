# r1_C critic -- PROGRESS
Started 2026-11-10. Read preamble, brief, KNOWLEDGE, IDEAS (#1-#4 in full), proposer PROGRESS.md and e3 script.
Plan: (1) C1 own implementation (mpmath/scipy quad for the Gamma term in the standard Guinand-Weil form, sympy primes,
zero side from rhlib / lane A DH zeros); (2) C2 own Loewner matrix on a DH window chosen to break the "count = pairs in
[T-8,T+8]" claim; (3) C3 push DH to X = 1e4..1e6; (4) C4 check the unitarity M(w)M(-w)=1 of the "formal product".
Predictions written BEFORE computing (rule 4):
- P-C2: DH nodes t in [85,115] step 0.6 on Re s = 1.25 (T = 100; no off-line ordinate in [92,108]): proposer's claim says 0
  negative eigenvalues; I predict >= 1 (zeros at 85.70 and 114.16 sit inside the node range).
- P-C3: for DH the "shadow pair closes up" is transient: swing of the phase from the off-line pair ~ e^{bV}/(bV)^2, b=0.3085;
  exceeds pi near X ~ 1e5-1e6, so I predict MORE than 2 real zeros of F_X in (84.7, 86.7) by X = 1e6 (zeta-like count would be 2).
- P-C4: M(w)M(-w) for M = Lambda(w)/Lambda(w+k) is not 1 for k = 0.5 (exactly 1 for k = 1).

## C1 recomputation [COMPUTED] `python3 c1_check.py.txt` (238 s, double precision, scipy.quad Gamma term in Guinand-Weil form, sympy primes)
zeta, prime side vs my zero side (30000 rhlib zeros + tail): X=50 t=0: 0.02060674 / 0.02060673; t=14.135: 3.94811192 / 3.94811191;
t=50: 3.86441616 / 3.86441616; X=10 t=0: 0.03337724; X=100 t=7.345: 0.01471789; X=1e3 t=0.455: 0.01057011; X=1e4 t=7.32: 0.00870263.
Minima on my own grid (step 0.02, [0,120)): X=10: 0.033377 at 0; X=100: 0.014719 at 7.34; X=1e3: 0.010572 at 0.46. AGREE with proposer to all digits given.
DH: max|Lambda_f| (n<=3000) = 30.8103 (agrees 30.8). X=70, t=84.455: prime side -0.132212; zero side from lane A's DH zeros
(122 on-line + 4 off-line quadruples below 200, complex arguments) -0.137692 + tail ~ +0.0046 => -0.1331. AGREE (-0.132).
X=50 at same t: +0.4540 (zero side 0.4482+0.0050). X=100 t=84.5: -0.4171 (zero side -0.4219+0.0043).
So the DH failure is real and is produced on the zero side by the off-line quadruple at 85.70 (cosh(bV) growth), as claimed.
Analytic check of the arch formula: proposer's -gamma + c0 - log(1-e^{-2V}) + int_0^{2V}[...] equals the standard
c0 + int_0^inf [e^-u/u - e^{-alpha u} g_even(u/2)/(1-e^-u)] du (used psi(1) = -gamma). OK.

## C2 [COMPUTED] own Loewner/Pick matrix (mpmath, Hurwitz-zeta log-derivative, mp.eigh, 120 digits)
`python3 c2_loewner.py.txt 70 100 48 120 dh`: 1 negative eigenvalue -5.31e-6 (proposer: -5.3e-6). AGREE.
`python3 c2_loewner.py.txt 85 115 51 120 dh` (T = 100, step 0.6): 2 negative eigenvalues (-4.07e-6, -2.74e-7), smallest positive 2.1e-51.
The proposer's claim predicts 0 here (no off-line ordinate in [92,108]). CLAIM AS STATED IS FALSE (prediction P-C2 confirmed).
Theory (PROVED, classical): S(u) is a generalized Nevanlinna function with kappa = number of poles in the open half plane
(Krein-Langer); every finite Pick matrix has <= kappa negative eigenvalues, the count is non-decreasing under adding nodes
(Cauchy interlacing), and reaches kappa on a set of uniqueness. For DH kappa = infinity. So "#neg = pairs in [T-8,T+8]" can only
be a statement about a numerical threshold, not an invariant.
Prior art (search): A and B are exactly the Loewner and shifted Loewner matrices (Mayo-Antoulas 2007, from memory); rational
approximation from data on Re s = 4 already recovers the first zero 0.4999999987 + 14.1347251412i (Trefethen, arXiv 2312.03565,
"Numerical analytic continuation"; also "Applications of AAA rational approximation", arXiv 2510.16237; search summary only).

## C3 [COMPUTED] `python3 c3_shadow.py.txt 30 300 3000 10000 100000 1000000` (own code, grid 0.001, t in (83,88.5))
X=30: zeros 85.262, 86.113; X=300: 85.474, 85.917; X=3000: 85.573, 85.822 (all AGREE with proposer to 3 decimals).
X=1e4: 85.605, 85.792; X=1e5: 85.646, 85.752; X=1e6: SIX zeros 85.398, 85.597, 85.669, 85.729, 85.801, 86.001.
min dPhi/dt = +0.58, -0.57, -2.39, -4.28, -10.9, -24.6. The phase is non-monotone from X = 300 on, and by X = 1e6 its swing
exceeds pi and creates new zeros. So "two real zeros whose gap tends to 0" is a transient; prediction P-C3 confirmed.
Mechanism (HEURISTIC, matches): off-line pair adds ~ e^{bV}/(bV)^2 oscillation to the phase, b = 0.3085.

## C4 [COMPUTED + PROVED two-line] `python3 c4_unit.py.txt`
M(w) = Lambda(w)/Lambda(w+k): M(w)M(-w) = 1 for k = 1; = 0.917 - 0.022i (k = .5, w = .3+2i); |M(5i)| = 0.99695 (k=.5), 0.99806 (k=.2).
M(w)M(1-k-w) = 1 always. So c_k is unitary on Re z = (1-k)/2, not on the tempered axis Re w = 0 of the local theories with
multiplicity k (rho = k). Re-centre: w' = z - (1-k)/2 gives c_k = Lambda(k'-w')/Lambda(k'+w'), k' = (1+k)/2. This is
E^#/E for the de Branges structure function E_h = xi(1/2 + h - iz), h = k/2: Lagarias, arXiv math/0601653, Lemma 2.1
(search summary: structure function for |h| >= 1/2 unconditionally, for all h != 0 under RH; h = 1/2 is de Branges 1986).
So part 1 of C4 is known; part 2 has the wrong local parameter: the pole at z = 1 sits at distance (1+k)/2 from the axis, so the
consistent multiplicity is k' = (1+k)/2 in (1/2, 1], and at the RH end (k' = 1/2) the scattering is identically 1 (functional equation).
First-order term at k' = 1/2: M = 1 - 2(k'-1/2) Lambda'/Lambda(1/2+w) + ..., so the limiting positivity is Re xi'/xi > 0 on Re s > 1/2,
which is the proposer's own E4 at a = 1/2 (Lagarias' criterion, from memory). Integer k = n-1: GL_n Epstein zeta (k' = n/2).

## New laboratory found while attacking C4 [COMPUTED] `python3 n1_thetapow.py.txt 40 1 1.02 1.1 1.3 1.5 1.8 2` (45 digits, ~3 min)
Z_n(s) = sum r_n(m) m^-s, r_n = coefficients of theta^n, REAL n. Completed function on Re s = n/4 is the cosine transform
Xi_n(t) = 2 int_0^inf (theta(i e^x)^n - 1) e^{nx/4} cos(tx) dx - (n/2)/(n^2/16 + t^2); exact functional equation for every n.
n = 1 is 2 zeta(2s) (zeros 7.07, 10.51, 12.51 = gamma/2: reproduced), n = 2 is 4 zeta(s) L(s,chi_4) (6.02, 10.24, 12.99, 14.13: reproduced).
On-line zeros below 40: n = 1: 21; 1.02: 21; 1.1: 21; 1.3: 21 (pair 20.90, 21.36 closing); 1.5: 19 (that pair gone: gap 18.42 -> 23.82);
1.8: 18; 2: 20 (pair back at 21.02, 21.45). Off-line zeros not located directly (only inferred from the missing pair).

## Literature (WebSearch, 4 queries, summaries only; no paper fetched in full)
1. "Loewner framework OR AAA ... zeta ... locate zeros": Trefethen arXiv 2312.03565 and arXiv 2510.16237: AAA fit of zeta on Re z = 4
   recovers the pole at 1 to ~11 digits and the first zero as 0.4999999987 + 14.1347251412i. Prior art for the C2 experiment (not for the DH control).
2. "explicit formula Fejer kernel ... RH nonnegative": no source with Lemma F verbatim. Formula is the Guinand-Weil formula for a triangle (classical).
3. "Lagarias Hilbert spaces of entire functions ... xi(1/2+h-iz)": arXiv math/0601653 Lemma 2.1 (structure function for |h| >= 1/2, all h under RH). Covers C4 part 1.
4. "zeros Dirichlet series real power of theta": zeta_alpha(s) = sum r_alpha(n) n^-s for real alpha IS a studied object (arXiv 2304.09545,
   arXiv 2401.02813: Hardy-type theorems, infinitely many zeros on Re s = alpha/4 for related combinations). Not found: tracking zeros leaving
   and returning as alpha runs from 1 to 2. One query; not a literature review.

## Verdicts
C1 wounded (correct and reproduced; pure B6 restatement = diagonal of the Weil form in the exponential basis; factor-10 law rests on one impostor).
C2 wounded (numbers reproduced; the counting claim is false: 2 negatives at T = 100; method = Loewner framework / AAA continuation).
C3 refuted (6 zeros at X = 1e6 instead of a closing pair; the true signature is non-monotone phase = C1).
C4 wounded (part 1 known: de Branges-Lagarias; part 2 mis-parametrised; the natural "fractional-dimension Poisson summation" theta^n exists
   but has no Euler product and loses a zero pair by n = 1.5).
Time: about 40 minutes, over the 25-30 budget (c1_check quad was slow: 4 min).
