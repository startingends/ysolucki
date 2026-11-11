# VERDICT (V-CUB): the "two-variable cubic family" candidate Re s > 0.8136 for zeta

Adversarial verifier, 2026-11-11. Labels: PROVED / KNOWN (what I read) / COMPUTED (command, numbers) / HEURISTIC / CONJECTURE.
No commits. All numerics under `tools/memcap.py 1`. Files here: PROGRESS.md, absorb_check.py.txt/.log, corrected_signal.py.txt,
cs_*.log, grid_check.py.txt/.log, rerun_*.log.

Scope, whatever the outcome: even if it were correct, this would be an improved zero-free HALF-PLANE (a quasi-RH exponent below 7/8).
It would NOT prove the Riemann Hypothesis. The architecture's own floor is above 1/2 (N73: at best 3/5).

## 0. Verdict

**NOT ESTABLISHED. The candidate rests on a normalisation error in the model and is wrong as modelled.** The two-variable family
gets its absorption of mu (`mu gamma_2^2 = alpha conj gamma_2`, correct) by doing **two** Poisson summations, one in u1 and one in u2.
Each Poisson summation brings its own normalised Gauss sum and its own factor N^(-1/2). The family's dual box is therefore twice as
long (in log-size), and its copies (cube pairs) have density 1/3 of that doubled box. SP-sieve's model (A1) takes the **one-variable**
normalisation, with dual length Z/X and c = 1/3, and **two-variable** absorption. These belong to different families. The
one-variable cubic family does NOT absorb mu (CUBIC_ABSORB 2, correct).

With the signal computed for the family that really absorbs mu, the principal term is the SEXTIC signal times X^(-1/6) (sec. 2).
Put that into SP-sieve's own script and change nothing else (COMPUTED, sec. 4):
- C1: 0.8136 becomes 1.0114, i.e. no zero-free region at all.
- C2: 0.7786 becomes 0.9822.
- Even with the sextic's sharp sieve, its Moebius-side lemmas and c = 1/6 in the low term: 0.9002 (grid check 0.9043).
  That is worse than 7/8.
In the 11/12 architecture (Part I), the family gives NOTHING, not 8/9 (sec. 3, PROVED as exponent bookkeeping). In this architecture
the two-variable cubic family is dominated by the sextic family: its signal is weaker and its sieve is weaker.

## 1. Check (1): the absorption identity (PROVED and COMPUTED; it holds)
- Derivation (PROVED). On squarefree primary n prime to 6, Lemma 4.1 (as corrected by READER-4) gives gamma_2(n)^3 = mu(n) alpha(n).
  Since |gamma_2| = 1 and mu^2 = 1: mu gamma_2^2 = mu gamma_2^3 / gamma_2 = alpha / gamma_2 = alpha conj(gamma_2).
  Squarefree composites: twisted multiplicativity gives gamma_2(n1 n2) = gamma_2(n1) gamma_2(n2) zeta with zeta^3 = 1, so the cube is
  multiplicative and the identity extends.
- COMPUTED (prediction "errors <= 1e-12" written first: HIT). Command: `python3 tools/memcap.py 1 python3 absorb_check.py.txt 400`,
  independent code, double precision, about 20 s. Results:
  - 72 split primary primes with 13 <= p <= 400: (I1) gamma_2^3 = mu alpha to 3.4e-14; (I3) mu gamma_2^2 = alpha conj gamma_2 to
    2.6e-14; (I6) gamma_2^2 = gamma_1 conj G, G = conj(chi(4)) gamma_3, to 3.0e-14.
  - 144 composites pi1 pi2 (norms < 80): (I3) holds to 3.8e-13, and the twisted-multiplicativity phase is a cube root of unity to 3.9e-13.
- The two-variable dual coefficient. Per column it is mu(n) gamma_2(n)^2 conj((h1 h2/n)_3) (H_CUB 1(a)-(c)). This is correct, PROVED:
  g(psi, h) = conj psi(h) g(psi) for primitive psi, and the CRT cocycle is trivial by cubic reciprocity.
  **Note: it depends on h1, h2 only through h = h1 h2.**

## 2. The decisive point: the signal of the two-variable family (PROVED for the model probe; see the caveat)
Model probe (the shape of the 7/8 paper's (6.1) once its s-variable, compensation primes and corrections are suppressed; these enter
the sextic and the cubic versions identically):
  P = (1/X) sum_m sum_n theta(n) eta(n) T_n(m) Phi(N(m)/X) W(N(n)/N),
with N the column-modulus norm (Z, or Z^(1+l) with compensation) and X the total row size.

Poisson over the lattice: sum_m psi(m) Phi(N(m)/X_i) = (X_i/N) sum_h g(psi, h) Phihat(...), with |g(psi, h)| = N^(1/2). Mellin in the
frequency sum gives the principal (copy) frequencies.
- Sextic, T_n(m) = chi_n(m), one Poisson summation: theta gamma_1 = mu.units. The sixth powers a^6 among frequencies of range N/X give
  zeta_F(6z) with residue (N/X)^(1/6). Principal term = X^(-1/6) N^(-1/3) A_1(N).
  This matches the paper's "X^(1/2 - z) Z^(s+z-1) at z = 1/6" up to the fixed normalisation X^(1/2) N^(-1/2).
- One-variable cubic (SP-sieve's model, c = 1/3, h = log(N/X)): X^(-1/3) N^(-1/6) A_1. **This family does not absorb mu.**
- Two-variable cubic, T_n = (m1 m2/n)_3, rows X1 X2 = X, two Poisson summations:
  - the prefactor is (X1 X2/N^2) g^2 / X = gamma_2(n)^2 / N, which is N^(-1/2) smaller than one-variable;
  - theta gamma_2^2 = gamma_2^3 = mu alpha (the absorption);
  - the cube pairs among the box N(h_i) <= N/X_i form the double series sum_{h1 h2 = cube} N(h1)^(-z1) N(h2)^(-z2), with a pole at
    z1 = z2 = 1/3 (a higher-order pole, so log powers);
  - residue (N/X1)^(1/3) (N/X2)^(1/3) = N^(2/3) X^(-1/3).
  Principal term = X^(-1/3) N^(-1/3) A_1^alpha(N).
- **Ratios:** two-variable / sextic = X^(-1/6); two-variable / model = N^(-1/6). In the exponent system:
      C_two(sigma0) = C_sextic(sigma0) - l_x/6 = C_model(sigma0) - (1 + l)/6.
- Consistency check (HEURISTIC, independent of the paper's normalisation): balance the principal frequencies against the
  square-root size of a generic dual sum.
  - Sextic: beta <= 1/2 + (1/3) log_Z(N/X).
  - Two-variable: beta <= 1/2 + (1/6) log_Z(N^2/X).
  - At N = Z, X = Z^x: 5/6 - x/3 against 5/6 - x/6. The two-variable family is worse by x/6 for every x > 0, which is the same
    X^(-1/6) deficit.
- The low side does not compensate (PROVED up to X^eps). The two-variable rows enter only through m = m1 m2, with the divisor-type
  weight r(m) <= X^eps and sum_m r(m)^2 << X log^3 X. So the reflected row energy is the one-variable cubic one up to X^eps, and it
  carries Heath-Brown's (KL)^(2/3) excess.

Caveat: I did not re-derive the 7/8 paper's probe (6.1) and its Lemma 7.1 in full. The deficit is computed for the model probe. Every
extra ingredient of (6.1) (the Gauss variable s, the compensation primes, the corrections xi, b*, G, R) multiplies the sextic and the
two-variable versions by the same factor. If someone can point to a step of (6.1) where the two-variable version gains back
X^(1/6), the verdict on this point would change. I found none.

## 3. Part I (11/12 architecture): the family gives nothing (PROVED, exponent bookkeeping)
Rows N(u_i) <= H_i, total U = H1 H2, column length D, Poisson modulus n1 n2 of norm about D^2.
(a) Copies: pairs with u1 u2 a cube, about U^(1/3) up to logs (count: u1 = a b^2 c^3, u2 in a^2 b . cubes). The amplifier gives
    |A_1|^2 << U^(-1/3) sum |A|^2. With the diagonal U D this is nontrivial only if U < D^(3/2).
(b) Absorption needs Poisson in BOTH u1 and u2. The dual character depends only on h = h1 h2, and
    N(h) <= (D^2/H1)(D^2/H2) = D^4/U.
    - For U < D^(3/2) the dual row range is >= D^(5/2): it exceeds the column length D by D^(3/2).
    - Prop 5.1 of the 11/12 paper needs a dual row range <= Sigma D^(-kappa) with Sigma about D, i.e. U >= D^(3+kappa). Even requiring
      it only for each h_i needs U >= D^(2+2kappa).
    - With U >= D^2: |A_1|^2 << D U^(2/3) >= D^(7/3). Trivial.
    - Below that, every large sieve (even K + L with no excess) applied to the dual gives sum |A|^2 << (U/D^2)(D^4/U) D = D^3. That is
      the trivial bound.
(c) So "Part I alone 8/9" (S3_SLOPE sec. 7: 1/2 + (1-c)(7/6)/2) is WRONG for this family. It uses family size H = D^(7/6) with dual
    D^2/H, i.e. the one-variable geometry. With the family's real size and dual, no exponent below 1 results.
    The same arithmetic error is in **A3**: "calH = D^2/H, L = calH^2/X, holds iff H >= D^(7/6)". For the two-variable family,
    calH = D^4/U, or D^2/H_i per variable with family size H_i^2.

## 4. Check (3): SP-sieve's reconstruction, its assumptions, and the reruns
Reruns (COMPUTED, `python3 tools/memcap.py 1 python3 rh/specialists/sieve/slope_system.py.txt ...`, about 4 min each; logs rerun_*.log):
| run | result | S3_SLOPE |
|---|---|---|
| check: Emax at 7/8, paper geometry | -1.913e-4 (paper certifies <= -1.11e-4) | CONFIRMED |
| check: Part I geometry | 0.916667 = 11/12 | CONFIRMED |
| sextic optimum | 0.874991 at (0.35599, 0.12119) | 0.874996, CONFIRMED to 5e-6 (Liu 0.874957) |
| C1 | 0.813619 | CONFIRMED |
| C2 | 0.778634 | CONFIRMED |
| 8/9 | the arithmetic is right | its premise is wrong (sec. 3) |

Corrected signal (my `corrected_signal.py.txt`: SP-sieve's file loaded unchanged, only the signal term h c replaced by
h/6 - l_x/6; prediction ">= 0.875, about 0.90-0.95" written first: HIT). Nelder-Mead, with a 36x36 grid check:
| variant | model signal h/3 | corrected h/6 - l_x/6 | grid check |
|---|---|---|---|
| C1 (c_low 1/3, alpha 2/3, rho -1/7, cubic low) | 0.813619 (reproduced) | **1.011378** | 1.0133 |
| C2 (rho = 0) | 0.778634 | **0.982195** | 0.9900 |
| most generous: sextic Moebius side, no cubic excess, c_low = 1/6 | n/a | **0.900200** | 0.9043 |

Assumptions, each judged:
- **A1** (c = 1/3 in the signal, pole of zeta_F(3z)): **WRONG as used.** The density 1/3 is right for the pair box, but the box is
  twice as long and carries an extra N^(-1/2). Net: X^(-1/6) BELOW the sextic signal (sec. 2). This is the error that decides the
  outcome. The same density in the low term (b c/2 with c = 1/3) is a guess: the paper's b/12 comes from the a_1^6 e count in the
  proof of Prop 15.3, and its cubic analogue is unread.
- **A2** (cubic sieve, low exponent takes HALF the excess (M - 2/3)): a guess. S3_SLOPE says so itself ("I assumed the half"; only
  Prop 15.3's statement was read). Plausible for a Cauchy-Schwarz square root, not checked against the proof of Prop 15.3.
- **A3** (Moebius-side width 6/7, slope 7/9): **WRONG geometry** (sec. 3, calH = D^4/U, not D^2/H). Also, Lemma 17.6's amplification
  for this family would count cube PAIRS against the squared family size. Not modelled.
- **A4** (Lemma 18.1 unchanged): OPTIMISTIC and unjustified. Lemma 18.1 is stated for the sextic plain polynomials with the
  hypothesis beta* <= (1 + kappa)/2 and a threshold 5M/6 "from the transformed rows whose inducing characters lie in Theta". Its
  cubic analogue does not exist in the text.
- **A5** (a dual large sieve exists after theta): now answered positively in shape (H_CUB, Heath-Brown Thm 2 as quoted;
  see sec. 5, R1), but only for the wrong K.
- Unstated assumptions (guesses):
  - (a) kappa fixed at 3/4 in the cubic runs.
  - (b) the floor bin delta0 = 1/50 and the contour constants copied from the sextic.
  - (c) The high-side rows E(delta, x) use the sextic row normalisation h R* + h delta/2. In the two-variable family, rows are
    cube-free parts of h1 h2 over a box of log-size h + 1 + l, with the extra N^(-1/2). Not modelled; my correction changes only the
    signal, which is generous to the candidate.
  - (d) Every constant of Lemma 20.2's certificate (sextic numbers).
- Validation is one number (sextic margin and Liu's optimum). That validates the sextic bookkeeping, not any cubic modification.

## 5. Check (2): the steps where the paper uses the sextic family, one at a time
| step | status | note |
|---|---|---|
| Exact copies and their density | proved / wrong as used | Pair copies number U^(1/3) of U pairs (PROVED). "Density 1/3" is right only relative to the doubled box; used with one-variable normalisation it is WRONG (sec. 2, 3). |
| Poisson step | proved, but gap/wrong downstream | Exact, two-variable, cocycle-free (PROVED). Dual range D^4/U (11/12 form) or N^2/X (probe form), with an extra N^(-1/2). Every downstream use of the one-variable range is wrong. |
| Theta step, R1 (multiplier sign) | resolved in the candidate's favour | See R1 below. |
| R1-bis (non-squarefree rows) | gap (minor) | See below. |
| Large sieve after theta | known, applies | Heath-Brown Thm 2 as quoted in Dunn-Radziwill (H_CUB sec. 2, read there; I did not re-open the Dunn-Radziwill source): sum_a mu^2(a) abs(sum_b beta_b (b/a)_3)^2 << (A + B + (AB)^(2/3)) (AB)^eps norm(beta)^2. It applies with the (KL)^(2/3) term, but with K the TRUE dual range, which is longer than in the model. The H_CUB argument "L <= K so no loss" uses the model's exponents. |
| Lemma 17.1's length condition | gap | Lemma 17.1 is a sextic statement (r + 2z <= m - c1, 2r + 8z <= 3m - c2, from the two-Poisson recursion). The cubic analogue (relaxation rho = -1/7) is modelled, not proved, and rests on A3's wrong calH. |
| Lemma 17.6 amplification | gap | Its analogue would amplify over cube pairs (u, a) -> u a^3 in a two-variable row space. The slope "(1 - c)(7/6) = 7/9" assumes one-variable row size. Not established. |
| Endgame, Prop 19.2 and Lemma 20.2 | gap | Prop 19.2's counts and the certificate are specific to the sextic constants (alpha = 5/6, 6 kappa, 49/440640). No cubic certificate exists. 0.8136 is an optimum of a model, not a certified margin. |
| Divisor weight and the object (CRITICAL question) | harmless for the object | See below. |

**R1, the theta multiplier sign.** I read App. A.2 of the 11/12 paper: (6.5), (A.5), (A.10), (A.12).
- The multiplier used is conj kappa(g1) = prod chi_p(a)^(-2).
- With the Fourier factor chi_p(h_p)^(-j), the post-theta local factor is B_{p,j} = chi_p^(-j-2) for j != 0, 4. It is trivial (a
  Ramanujan-type factor) for j = 4.
- The two-variable dual is a theta coefficient gamma_2 with twist (h/n)_3 = chi_h(n)^2 (up to conjugating the whole sum), so j = 2,
  giving B = chi^(-4) = chi^2: a NON-trivial cubic character.
- **R1 is resolved in the candidate's favour:** H_CUB's sign is right, as far as the paper's printed (6.5)/(A.12) are right (CLAIMED
  by the paper, Lean-verified per the publisher, not by me).
- Side effect: the angular factor becomes conj(alpha) = alpha^(-1) instead of alpha. This needs d/dz in place of d/dz-bar; it also
  kills the constant term. Minor, unchecked.

**R1-bis (gap, minor).** Rows h = h1 h2 with p | gcd(h1, h2) have v_p(h) = 2, hence j = 4 at p after theta: no character at p, so no
orthogonality in that part of the row. H_CUB sec. 2 handles square parts PRE-theta only. The loss is probably controlled (such
pairs have density 1/N(g)^2), but it is not written.

**The divisor weight and the object.**
- PROVED: the divisor weight sits on the ROWS (A depends on u1 u2). The untwisted members (u1 u2 a cube, coprime to n) are
  sum_{(n, S u) = 1} mu(n) nu(n) W(N(n)/D), whose Mellin transform is What(s)/L_K^{S u}(s, nu): it is still **1/L**, not 1/L^2.
- In the probe form, the principal frequency series sum_{h1 h2 = cube} N(h1)^(-z1) N(h2)^(-z2) has a higher-order pole at (1/3, 1/3)
  (log powers) and multiplies 1/L^S(x, eta).
- For nu = 1, L_K(s, 1) = zeta(s) L(s, chi_{-3}), so a zero-free region for it would be one for zeta. On this point the object is fine.
- The divisor structure does its damage elsewhere: in the size of the family and the normalisation of the dual (secs. 2, 3).

## 6. Check (4): literature (KNOWN: abstracts and listings only, read 2026-11-11)
- Queries:
  - WebSearch, "zero-free half-plane Riemann zeta below 7/8 arXiv 2026 quasi-Riemann" (extended);
  - WebSearch, "... Xu Sang 2610.15291";
  - WebSearch, "quasi-Riemann hypothesis OpenAI cubic family variant improvement 0.87";
  - WebSearch, "Heath-Brown cubic large sieve zero-free region zeta Dunn Radziwill ... cubic twists Moebius";
  - arXiv API all:"quasi-Riemann" (20 results);
  - arXiv API abs:"zero-free half-plane" (sorted by date).
- Found:
  - Liu 2610.12234 v2: 0.874957019 for Q(sqrt-3) and Dirichlet.
  - Liu 2610.26835 v2: 0.874886647 over all number fields, using Xu-Sang.
  - Xu-Sang 2610.15291 v2: 0.8748867, "assuming the analytic inputs".
  - Users of 7/8: Pintz-Althöfer 2610.15559 (conditional on a common zero-free half-plane), Fiori-Jaskari 2609.23222, Frei-Sofos-Widmer
    2610.18491, Visser 2610.20058, Li-Zhong 2611.12500, Grobner 2610.24900.
  - Cureton-Thorner (Dedekind, 31/32).
- **No claim of a zero-free half-plane for zeta below about 0.87488.** No abstract mentions a cubic-symbol (rather than sextic)
  variant of the October method.
- Limit: abstracts only. A cubic variant inside a paper body cannot be excluded.

## 7. What is established, precisely
- PROVED or COMPUTED here: the identities (I1), (I3), (I6) on squarefree n. The structure of the two-variable dual (cocycle-free,
  depends on h1 h2). The post-theta character chi^(+-4) for the family's sign (from the paper's (6.5)/(A.12)). The reproduction of
  0.874991, 11/12, 0.813619, 0.778634 and of the arithmetic 8/9.
- **Not established, and not supported:** "no zeros of zeta in Re s > 0.8136". The only precise conditional statement available is
  vacuous: "IF a family existed with mu-absorption, one-variable Poisson normalisation, copy density 1/3 among its frequencies, and
  A2-A4, the reconstructed system would give 0.8136". The two-variable cubic family is not such a family. The one-variable cubic family
  has the normalisation but no absorption.
- For the two-variable family itself, the same reconstruction gives 1.011 (C1, nothing), 0.982 (C2), or at most 0.900 with sextic
  inputs everywhere else. That is no improvement of 7/8, and in the 11/12 architecture nothing at all.

## 8. Gaps and errors, each with its location
1. **WRONG**, S3_SLOPE sec. 7 (A1) and the line "Part I alone ... 8/9". The signal uses one-variable Poisson normalisation for a
   family needing two Poisson summations; the correct principal term is the sextic one times X^(-1/6). Corrected: 1.011 / 0.982 / 0.900.
2. **WRONG**, S3_SLOPE sec. 7 (A3) and H_CUB sec. 2 ("L <= K so no loss"): the dual range is D^4/U (the per-variable D^2/H_i with
   family size H_i^2), not D^2/H. The 11/12 recursion's precondition fails for every U that makes the amplifier nontrivial (sec. 3).
3. GAP, S3_SLOPE A2: "half of the cubic excess" in the low estimate is assumed; the proof of Prop 15.3 is unread.
4. GAP, A4: Lemma 18.1 has no cubic analogue; it was kept unchanged.
5. GAP, Lemmas 17.1 and 17.6 for the cubic pair family: modelled by rho = -1/7 and slope 7/9 (on the wrong geometry), not proved.
6. GAP, the high-side rows E(delta, x) of the system keep the sextic normalisation (not modelled for two variables).
7. GAP, Prop 19.2 and Lemma 20.2: no cubic certificate; 0.8136 is a model optimum.
8. GAP (minor), post-theta rows with p^2 | h1 h2 (j = 4, no character) are not treated (H_CUB treats square parts pre-theta only).
9. RESOLVED, R1: the multiplier sign gives chi^(+-4), a non-trivial cubic character (App. A.2, (6.5)/(A.12) as printed).
10. NOT A PROBLEM, the object: the untwisted member generates 1/L_K(s, nu) (1/zeta_K for nu = 1), so zeros are those of zeta and
    L(s, chi_{-3}).

## 9. Plain English
The October proof works like this. Take the sum of the Moebius signs mu(n) and hide it among many "twisted" copies of itself.
Show that, on average, the twisted sums are small. Then argue that the untwisted one, which reappears at special rows, must be
small too. How strong the result is depends on how often the untwisted sum reappears. The October proof uses sixth-power symbols:
among the first million rows, the sum reappears at about 10 rows (the sixth powers). The chain's idea was to use cube symbols in
two variables, so that it reappears at about 100 rows per million (the cubes). That is ten times more often, and the model said
the exponent would drop from 0.875 to 0.8136.

The catch is in the bookkeeping. To make the Moebius signs "dissolve" into the cubic theta function, the cubic version has to use
two independent row variables, and pay for a Fourier transform in each of them. Each Fourier transform costs a fixed fraction of
the signal. It is like having to send a message through two noisy channels instead of one. Once that second toll is charged, the
extra reappearances do not pay for it: the useful signal ends up weaker than the sextic one by a factor X^(1/6).

With that single correction, SP-sieve's own model gives no improvement on 7/8 (at best 0.90, and in the main variant nothing at
all). The other pieces the chain checked are correct: the algebraic identity behind the dissolving (verified here to 14 digits),
the sign after the theta reflection, and the reproduction of the paper's numbers. So the candidate is not a theorem and, as
modelled, not even a correct prediction. In any case it would only have moved a zero-free half-plane, which says nothing about the
Riemann Hypothesis itself.
