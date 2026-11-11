# The bridge

Owner's rule 12 (2026-11-11): one hunch, built in planks, each plank confirmed before the next. This file is the
record of the bridge being built. It is written by the lead. A plank is: a precise statement · its status
(computed / proved / checked / formal / open / FAILED) · the confirmation that was demanded of it · what happened.
A failed confirmation is recorded here and moves or ends the bridge.

## Bridge 1 (started 2026-11-11): the Weil form is comparable to the band-limiting leak (idea #27)

**The hunch, in plain words.** On a window the Weil energy is positive by an amount like 10^-30, and every route
so far needed to see that amount directly. But the smallness is not arithmetic: it is the same smallness as in a
classical fact about signals (a signal confined to a time interval must leak out of any frequency band, and the
smallest possible leaks are known exactly). The hunch is that the Weil energy of a window function is, up to a
constant factor, the least leak of a companion function. The leak is positive for free. If the comparison holds with
any positive constant on every window, RH follows, and the statement to prove has a constant factor of room
instead of hundreds of digits.

**Where the vicinity is thought to be, and why.** (1) Connes–Consani explained the tiny eigenvalues by this
mechanism (heuristic, 2021) and proved a statement of this shape at the archimedean place only (2020). (2) Our own
numbers below. (3) It is the only shape in the record that escapes wall WJ2. What is NOT known: whether the
comparison holds away from the near-null directions, and what, in it, a control violates.

### Planks

| # | plank | status | confirmation demanded | outcome |
|---|---|---|---|---|
| 1 | The small eigenvalues of the window form follow the defects 1 − χ_n of the band-limiting operator at c = 2π e^(2L), n = 4, 6, 8, ... (even block n ≡ 0 mod 4, odd block n ≡ 2 mod 4), with ratios of order 1 along the whole ladder, not only the bottom rung | COMPUTED (e27 round 1; one implementation) | blind prediction of the ratios | index rule predicted wrongly (missed), ratios of order 1 confirmed: 2.7, 1.9, 1.3, 1.1, 0.9 at L = 0.5; 4.7, 3.1, 2.1, 1.45, 1.65 at L = 0.75 |
| 2 | The explicit vector "Poisson image of a pole-corrected prolate function, cut to the window" is a near-null vector of the right size on each rung | COMPUTED (e27 round 2) | blind: Rayleigh quotient within a factor 3 (L = 0.5) and 30 (L = 0.75) of the true eigenvalue | HIT, much better than demanded: 1.10 to 1.41 at L = 0.5, 0.75, 1.0, for eigenvalues from 1e-6 to 1e-29; overlap deficiency with the true ground state 7.5e-6, 4.2e-7, 7.2e-8 |
| 3 | FORM level: on the span of the first K explicit vectors per parity, Q ≥ κ_K · (exact leak form), κ_K not collapsing with K | COMPUTED (e27 round 3) | blind: κ_K ≥ 0.3 κ_1 for K ≤ 4; κ_4 increases with L | 5 of 6 hit. κ_4 = 0.35 / 0.68 / 1.02 (even) and 0.22 / 0.55 / 0.91 (odd) at L = 0.5 / 0.75 / 1.0; upper ratio at most 4.6; at L = 1 the four rungs span defects from 1e-30 to 1e-12. One miss: odd block, L = 0.5, K = 4 (0.22 < 0.30) |
| 3b | WHOLE SPACE, second implementation (foothold seat, `rh/experiments/foothold/pencil.py.txt`; float, not certified): the pencil (Q, D_L) on ALL polynomials of degree < 28, both parities together, with D_L computed from its definition as a Schur complement over the free part of the companion and with the pole conditions imposed correctly | COMPUTED (one implementation, different basis and different D from the lead's) | seat's own blind range 0.05–0.35 (even), 0.03–0.22 (odd) | κ_min = 0.332 / 0.331 / 0.328 at L = 0.34 (no prime) / 0.50 / 0.54; stable in the degree (0.3319, 0.3309, 0.3307 at degree < 12, 20, 28) and across the entry of the prime 2 while the bottom of Q falls four orders of magnitude; κ_max about 2.3–2.5, growing slowly with the degree (Q is log-unbounded). Even block inside the predicted range, odd block above it. The minimiser is a small-leak combination, neither the bottom rung nor the bulk  **Extended to larger windows (foothold seat, session 3, multiprecision, `pencil_mp.py.txt`): κ_min = 0.328, 0.3265, 0.302, 0.298 at L = 0.65, 0.75, 0.85, 1.0, stable to three digits in the degree; it neither grows nor falls like e^(−2L). The minimiser is NOT on the ladder (the seat corrected its earlier statement): it is a coupling between ladder and bulk; at L = 1 the ten lowest eigenvalues of Q and D run parallel over 24 orders of magnitude with rung-wise ratios 0.92–1.12. κ_max is unbounded in the degree (Q is of logarithmic order, D is bounded).** |
| 4 | Reproduction of planks 1–3 by a second implementation | partly done by 3b (form level); S1-parity is reproducing 1–2 | same numbers to 3 digits | lead's convergence check, after an integration error in the lead's script was found and fixed (finer quadrature): at L = 0.75 the explicit vector's ratio to the true eigenvalue is 1.36 with 28 modes and 1.20 with 48 modes, so it IMPROVES with the basis. (An intermediate run that showed 1.92 was the integration error; a statement made to the owner on its basis is withdrawn.)  **S1-parity (board B203, B204): a second implementation sharing nothing with e27 reproduces every number of planks 1–3 to the printed digits in the same basis. Under refinement the lowest even eigenvalue falls 3.5%, 19%, 32% at L = 0.5, 0.75, 1.0 (L = 1 not converged); Rayleigh/μ₁ stays between 1.1 and 1.5; κ₄ becomes 0.37 / 0.68 / 0.84 (even), 0.32 / 0.59 / 0.84 (odd), so the lead's one miss in round 3 was truncation. OBJECTION (proved in two lines): with FIXED companions κ_K must tend to 0 as K grows, because the cut Poisson map kills every g supported below 1/λ (computed: κ_K halves between K = 4 and 5 at L = 0.75 and creeps to 0.27–0.29 by K = 8); the kill test must use the least leak over all companions (plank 6), which is what plank 3b does. Control: for F_d at L = 0.75 the even κ₄ falls from 0.675 to 0.333 (d = 7e-6), 0.104 (7.9e-6), negative at 1e-5.** |
| 5 | The exact identity: the window form of f = ℰ(g) on the window equals the Weil form of the tail built from the out-of-band part of ĝ | **PROVED for a stated class and CONFIRMED** (SP-operator, `rh/specialists/operator/PROOF_bridge.md`, board B205): g even, C¹, piecewise C², supported in [−λ, λ], g(0) = ĝ(0) = 0; rests on Weil's explicit formula in Barner's class (cited from memory) | written proof with convergence and pole bookkeeping; both sides to 10 digits on one g | both sides agree to 5e-14 (L = 0.5) and 3e-15 (L = 0.75) on G(s) = s²(1−7s²)(1−s²)⁸; all five of the seat's predictions hit. On the window side the result is a difference of terms 2400 times larger; on the tail side every term has the size of the result. With endpoint jumps (the e27 prolates) the identity holds only as a limit over mollified g. With g(0), ĝ(0) ≠ 0 there are explicit pole corrections |
| 6 | Definition of the comparison form D_L on the WHOLE window space. CORRECTED by the foothold seat: (i) the two pole conditions must be the continuous functionals ∫g = 0 and ∫_band ĝ = 0 (band-limited part of g vanishes at 0); "g(0) = 0" has no effect on an infimum over L², and with ĝ(0) = 0 alone the upper comparison fails by a factor 5e7–8e10; (ii) D_L is not parity-diagonal (hard support for g against a soft band for ĝ), so the pencil is taken on the full space or D is symmetrised; (iii) with the companion's free part set to 0 the leak is not small on the ladder at all: the infimum is essential | definition settled numerically; no proof of closedness or domain | SP-operator asked for the operator-theoretic statement | with the corrected definition the ladders are parallel at L = 0.5: D has 1.27e-6, 2.58e-4, 2.15e-2; Q has 9.42e-7, 1.96e-4, 1.81e-2  **SP-operator (B206, B208): D_L is a bounded, closed, strictly positive form on all of L² of the window, minimiser attained; therefore the UPPER comparison Q ≤ C·D is FALSE on the form domain (Q is of logarithmic order), and can hold only on finite ladders.** |
| 7 | Eliminate the primes. (a) WINDOW SIDE, exact and elementary: write a window function as f = Zψ, Z = Σ_m m^(-1/2)·(shift by log m) cut to the window (a finite triangular sum; its inverse is Möbius). Because the one-sided prime shifts of a function supported on u ≤ L never meet the lower cut, the prime term is 2⟨f, P⁺f⟩ with P⁺Z = −Z′ on the window (Λ ∗ 1 = log), so Q_L(Zψ) = pole(Zψ) + arch(Zψ) + 2⟨Zψ, Z′ψ⟩: no Λ, only the integers up to e^(2L). (b) TAIL SIDE, same argument on the half line v > L: primes(T) = 2⟨T, Σ_m m^(-1/2) log m · ψ(· + log m)⟩ | (a), (b) PROVED by the lead in the notebook (N41), three lines each; unchecked | a seat re-derives it; numerical check of (a) on one ψ to 12 digits | SP-operator asked. The lead's first conjecture (a closed prime-free form through repeated Poisson steps) did NOT close: the recursion produces a new window part each time. What survives is the triangular change of variable  **Re-derived and checked by SP-operator: window side to 1e-48 at L = 0.75 and 1.2; tail side with no boundary term, to 3e-10. It is the multiplicativity of Toeplitz operators with co-analytic symbol on a half-line; it repackages the primes as logarithms of integers and uses no Euler product.** |
| 7b | The constant. On the tail, treating the dilates ψ(· + log m) as orthogonal chirps of local frequency 2πλ m e^v and dropping the pole term: W(T) ≈ ∫ \|ψ(w)\|² K_L(w) dw, K_L(L + a) = Σ_{m ≤ e^a} (2L + a − 2 log m)/m ≥ 2L. So the comparison constant should be about 2L plus an average of log(ξ/λ) over the leak | HEURISTIC (N41) + COMPUTED (e27 round 4) | blind: prediction within a factor 0.6–1.6 of the measured constant on the bottom rungs at L = 0.5, 0.75, 1.0 | HIT: predicted 1.81 / 2.55 / 3.29 (even), 1.74 / 2.51 / 3.27 (odd) against measured 1.99 / 3.85 / 5.41 and 2.00 / 3.22 / 4.86 (ratios 0.61–0.91; the measured constant is larger than the heuristic). The constant GROWS with the window |
| 8 | The lower comparison Q ≥ κ D on all directions | open: THIS IS THE BRIDGE'S SPAN | first on the window with no prime (from Connes–Consani 2006.13771 Thm 1), then with the prime 2 (the foothold seat's certified window), each with an explicit κ | — |
| 9 | What a control violates | COMPUTED and partly PROVED (S1-mirror, board B199, B200; one implementation) | lead's blind expectation: the identity survives for F_d and what breaks is off the ladder; the impostor has no Poisson map at all | **The lead's expectation about the impostor was WRONG, and this moves the bridge.** (i) PROVED: the Davenport–Heilbronn impostor has a summation map (its period-5 coefficients are an eigenvector of the finite Fourier transform); Poisson needs the functional equation, not the Euler product. (ii) COMPUTED: the impostor obeys plank 1: its small eigenvalues follow the defects at c = 2πe^(2L)/5 with ratios 3.96, 2.42, 2.19, 1.94, 1.17 at L = 1.5, and even on its FAILED window L = 1.8 the positive ladder is still on the defects; the failure is ONE EXTRA negative eigenvalue per block (−2.5e-7, −6.8e-9) at the frequency of its off-line zero. (iii) F_d, tested with zeta's vectors at L = 0.75, fails on the bottom rung first (ratio 0.73 at d = 5e-6, −0.10 at d = 1e-5), rung after rung from the bottom; the mechanism is multiplication by the log variable. (iv) Weight at 4 × 1.01: the ladder is destroyed (ratios −552, +156, −29, +8.6). **Consequence: planks 1–7 use nothing that separates zeta from a function with a functional equation and no Euler product (barrier B1). The ladder and its constant are a property of Poisson summation. RH is decided by whether there is anything ELSE below the bulk** |

| 7c | The constant of the eigenvalue law, derived. For a tail with envelope a/ξ the model of 7b gives, per unit of one-sided leak, W(T) = ζ(2)(2L + 1) + ζ′(2) = ζ(2)·(2L + 0.430) (diagonal terms only: archimedean density log(frequency/2π), prime term through Λ ∗ 1 = log, no pole). With the measured ‖v‖² = 0.301·e^L and Rayleigh factor 1.3 this predicts the constant κ in "lowest eigenvalue = κ·(1 − χ₄)": κ(L) ≈ 2.10·(2L + 0.430), LINEAR in L | HEURISTIC + out-of-sample comparison | compare with numbers the model was not fitted to: Zhu's certified upper bounds on ln κ at L = 1.2, 1.4, 1.6, 1.8, 2.0 (1.83, 2.03, 2.06, 2.12, 2.26, as computed by our reader from Zhu's printed values) | predicted ln κ = 1.78, 1.92, 2.03, 2.14, 2.23: differences −0.05, −0.11, −0.03, +0.02, −0.03. NOT blind in the strict sense (I had seen Zhu's five numbers in the reader's report hours earlier); the two fitted factors come from my runs at L ≤ 1 only. In-sample (L = 0.5, 0.75, 1.0, with factor 1.0 instead of 1.3): 3.86, 5.26, 6.63 against measured 2.67, 4.68, 4.17 |

### Position against the literature (READER-3, Connes–Consani–Moscovici arXiv 2511.22755 read whole, 2026-11-11)
The frontier paper names exactly two missing steps: (1) the smallest eigenvalue of the window form is simple with an
even eigenvector; (2) the prolate guess k_λ = ℰ(h_λ) is "a sufficiently accurate approximation" to that eigenvector.
It gives no norm, rate or criterion for (2), no Rayleigh quotient of k_λ, no second eigenvalue, no gap, and it
contains NO inequality between the Weil form and a form built from prolate functions, for any window. Its Figure 4
compares the lowest eigenvalue with 1 − χ for λ² ≤ 17 (our L ≤ 1.42): that part of plank 1 is published.
So, against that paper: plank 2's numbers (Rayleigh quotient 1.10–1.41, overlap deficiency 7.5e-6, 4.2e-7, 7.2e-8,
falling with the window) are a quantitative statement about its missing step (2); the odd block and the higher rungs
(1 − χ₆, χ₈, ...), plank 3 (form level), planks 7–7c (the change of variable, the constant 2L, the linear growth of κ)
were not found in it. "Not found in the papers read", not "new".

### Where the difficulty now sits (lead, after planks 7 and 7b)
The heuristic of plank 7b cannot be a proof as it stands, and the reason is exact: the form ψ ↦ W(tail of ψ) has a
large null space (every g supported in (0, 1/λ) gives a tail that is a full Poisson image, with zero Weil form and
non-zero leak). So "W(T) ≥ κ‖ψ‖²" is false for arbitrary ψ and can only hold for the least-leak representative.
On that representative the diagonal terms give 2L and more; what has to be controlled is the cross terms between
different dilates m ≠ m′ and the pole term. If those could be bounded by a CONSTANT times the leak, uniformly in L,
the comparison would hold on all large windows, and the small windows are a finite certified computation (the
foothold seat's kind). That is the shape of the span: **a constant against 2L**. Nothing says the cross terms are
bounded; that is the next thing to measure (plank 8a) before anyone tries to prove it.

| # | plank | status | confirmation demanded | outcome |
|---|---|---|---|---|
| 8a | Measure the cross terms: for the least-leak representative on the span of the first K rungs, split W(T) into diagonal (same m), cross (m ≠ m′) and pole parts, as multiples of the leak, at L = 0.5, 0.75, 1.0 and K up to 8 | open | blind (lead): the cross + pole part is between −1.5 and +3 times the leak in every case and does not grow in absolute value with L | — |
| 8b | What a certificate of Q ≥ κD needs (foothold seat, analysis): it is a finite job of the size of FH-1 on the no-prime and one-prime windows, with no new kind of infinite-dimensional remainder; BUT the comparison does not remove the cost explosion with L. In the frequency band between 2πe^(2L) and the cap, everything is out of band, D is of the size of ‖g‖², and "Q ≥ κD" there is plain positivity with a margin of order 1: the comparison contributes nothing off the ladder. Connes–Consani 2006.13771 Thm 1 does not give plank 8 on the no-prime window as it stands (its Sonin trace is at a fixed cutoff, on a codimension-2 subspace, with uncertified numerics) | analysis by one seat, unchecked | — | so the span splits in two: (A) on the ladder, plank 5 plus a coupling bound |Q(v, w)| ≤ C·√D(v)·‖w‖_form; (B) OFF the ladder, a lower bound of order 1 for Q, where the old wall W-FH1 sits unchanged |

### The bridge is moved (lead, 2026-11-11, after plank 9)
What stands: planks 1–7 describe, with numbers, the part of the ocean that zeta and the impostor share. That is
real understanding (it explains the tiny eigenvalues and their constant) and it is not the island.
What the impostor's failure looks like, read against the ladder: not a broken ladder but an **intruder**: one extra
eigenvalue per parity block that does not belong to any rung. The atlas keeper's earlier run found that AT the first
failure (L = 1.70–1.72) the eigenvalue crossing zero is of ladder size (1e-28) and its vector looks like the bottom
rung; by L = 1.8 the negative eigenvector is a wave packet at the off-line zero's frequency and the ladder is back on
the defects. The simplest reading (HUNCH, not yet computed): a level descends from the bulk as the window grows,
passes the rungs from the top down through avoided crossings, reaches the bottom at the first failure and goes
negative. If so, an off-line zero is visible BEFORE the first failure as a level that has no rung, which the record
(wall WJ1) says does not exist.

| # | plank | status | confirmation demanded | outcome |
|---|---|---|---|---|
| 10 | The intruder: before its first failure the impostor's spectrum is the ladder plus one extra level descending through the rungs | **FAILED** (lead's runs, `e27_relative/intruder_*.log`, L = 1.2, 1.4, 1.5, 1.6, 1.65, 1.68, 1.70) | blind (a), (b), (c) as written when the plank was laid | (a) failed: at L = 1.5 there is no level without a rung below the bulk. An extra level appears only just below the bulk at L = 1.65–1.70 (0.72, 0.55; 0.43, 0.65). The ladder is regular, with ratios of order 1, down to the bottom rung at L = 1.70, which is 0.01 before the failure. The picture of a level descending through the rungs is wrong; wall WJ1 (no early warning in the SIZE of eigenvalues) stands |
| 12 | The wobble of the impostor's bottom-rung ratio is an oscillation at twice the height of its off-line zero (an early warning in a RELATIVE quantity) | **FAILED** (`e27_relative/scan_dh.log`, `scan_zeta.log`) | blind, committed before the scan | the impostor's ratio on L = 1.200–1.312 is one slow hump (3.07 → 4.03 → 3.51), nothing at period 0.0367; zeta's ratio on L = 0.600–0.712 shows a hump of the same size (3.48 → 4.52 → 3.68). The wobble is generic. There is no early warning in the ladder, in size or in ratio |
| 11 | If plank 10 holds: RH is "the window form has no level without a rung", a statement about a COUNT (number of eigenvalues below a threshold equals the number of defects below a comparable threshold, for every window and threshold). Counts are what index arguments and continuity arguments can reach, and the Euler product has to be what forbids the intruder | idea, not a statement yet | make it precise enough to compute for the F_d and theta-dial families (how many intruders, entering where) | — |

| 13 | The whole-space constant κ_min(L) of the pencil (Q, D_L) warns before the impostor's first failure, where the ladder does not (lead's prediction: within 20% of zeta's until L = 1.65, then falls; likely alternative: flat until the eigenvalue crosses) | **MEASURED: both predictions missed** (foothold seat, `experiments/foothold/PROGRESS.md` §23–25, `pencil_dh.py.txt`, `pencil_ctl.py.txt`; multiprecision floats, one implementation, not certified) | blind, committed before the runs | impostor κ_min: 0.549 (L = 1.0; zeta 0.298), 0.431 (1.3), 0.157 (1.4), ≈0.138 (1.5, 1.6), 0.121 (1.65), 0.051 (1.68), 0.041 (1.70), −0.048 (1.72). The drop at 1.3–1.4 is NOT the coming failure: 86–99% of the minimiser's Weil value sits on one close pair of ON-line zeros (40.163, 40.683), the off-line zeros carry < 0.3%. The off-line quartet (height 85.70) takes over κ_min only from L = 1.65 (at 1.70 it subtracts 4.9·Q(v)), 0.05–0.07 in L before the eigenvalue changes sign, and only in bases of Legendre degree ≳ 90L. Zeta does the same thing: its minimiser sits on its closest resolved pair (59.35/60.83 at L = 1.0; 111.03/111.88 at L = 1.25, κ_min 0.205, pair and range predicted in advance). Control L(s, χ₅) only drifts (0.399 → 0.325). **Reading: κ_min is a measure of the closest resolved pair of zeros.** There is an early warning, but it cannot tell an approaching off-line quartet from a close on-line pair. See N80 |

### Bridge 1: where it ends, and what it charted (lead, 2026-11-11)
**It does not reach the island, and the record now says why.** Three confirmations in a row came back negative for
the part that mattered: plank 9 (the impostor shares the ladder, its constant and its summation map), plank 10 (no
level descends through the rungs before failure), plank 12 (no oscillation in the ratio). Together with the foothold
seat's analysis (plank 8b) the conclusion is:
- **The near-null ladder is a property of the functional equation alone** (Poisson summation). Its positivity is of
  the classical unconditional kind: by plank 5 the energy of a rung is the Weil form of a tail of bounded duration
  living at frequencies above the band edge c = 2π e^(2L), where the archimedean term log(c/2π) = 2L wins. That is
  why every function with a functional equation has it, zeros on the line or not.
- **The band edge is Montgomery's line.** c = 2π e^(2L) is exactly the height t at which the window length 2L equals
  log(t/2π). Above it (the ladder's side) a window function cannot resolve individual zeros and positivity is
  soft; below it the window resolves the zeros, and a window function can be built that vanishes at every on-line
  zero in the band and keeps one off-line pair. RH is decided there, in the bulk, and on the prime side that is the
  regime where correlations between prime powers at nearby integers enter (test-function length beyond log of the
  height). No plank of this bridge contains a step that uses the Euler product (S1-mirror's sentence, which stands).
- **No early warning exists in this structure**, in absolute size (wall WJ1) or relative to the ladder (planks 10,
  12): the impostor's ladder is regular 0.01 before its failure.
**What the bridge leaves standing, as understanding:** an explanation, with numbers, of the tiny eigenvalues and of
their constant (about 2L per unit of leak; κ linear in L); the explicit near-null vectors to 20–50% on three windows;
the change of variable that removes the primes from the window form; a two-sided comparison Q ≍ D_L on small
windows by two implementations; two checked computer-assisted theorems on windows with one prime; and a sharper
map of where the difficulty is. **What it tells the next bridge:** aim at the bulk below the band edge, with an
input that the impostor lacks. The inputs the impostor lacks, on the record: non-negativity of the prime weights and
their bound by the logarithm (0 ≤ Λ ≤ log), support on prime powers, complete multiplicativity of the summation
weights. The one-prime system has all of those and lacks the functional equation. So the next hunch must use the
functional equation AND one of these together, in the bulk. No such hunch is formulated yet.

### What would end this bridge
- κ_K falling without bound as K grows at fixed L (plank 3 extended to K = 8, 12).
- Plank 5 false, or true only with correction terms as large as the form itself.
- Plank 9 finding that F_d passes every plank (then the bridge is twist-blind, barrier B11, and leads nowhere).

### Not claimed
None of this is a proof of anything about zeta. Planks 1–3 are numbers from one implementation in truncated bases.
The mechanism of planks 1–2 is in print as a heuristic; what may be new is the form-level comparison and its
numbers. Nothing has been searched beyond the papers already read.
