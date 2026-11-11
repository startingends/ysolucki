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
| 4 | Reproduction of planks 1–3 by a second implementation | open | S1-parity's independent builder; same numbers to 3 digits | — |
| 5 | The exact identity: for g supported in [−λ, λ] with g(0) = ĝ(0) = 0, the window form of f = ℰ(g) on the window equals the Weil form of the tail built from the out-of-band part of ĝ (notebook N40) | HEURISTIC | a written proof with the convergence and the pole bookkeeping, checked; and a numerical check of both sides to 10 digits on one g | — |
| 6 | Definition of the comparison form D_L on the WHOLE window space (least leak over all companions g), and the upper comparison Q ≤ C · D (expected easy) | open | proof, or the exact obstruction | — |
| 7 | Eliminate the primes on the tail side: because the tail is a convolution with Σ m^(-1/2) δ_{log m}, the prime term acts on it through Λ ∗ 1 = log, i.e. as multiplication by the log variable. Conjectured consequence: the window form is an explicit PRIME-FREE quadratic form in the out-of-band part of ĝ (integers enter only through Poisson summation) | CONJECTURE (lead, not derived) | derive the form exactly, or find the boundary term that brings the primes back | — |
| 8 | The lower comparison Q ≥ κ D on all directions | open: THIS IS THE BRIDGE'S SPAN | first on the window with no prime (from Connes–Consani 2006.13771 Thm 1), then with the prime 2 (the foothold seat's certified window), each with an explicit κ | — |
| 9 | What a control violates. The comparison must fail for every system that violates RH, and the failure must be visible in the planks, not only in the conclusion | open | for the twisted control F_d, the one-prime system and the impostor: which plank breaks, stated as mathematics. Blind expectation (lead): plank 5's identity survives for F_d with its own summation formula, and what breaks is plank 8 away from the near-null ladder; for the impostor there is no Poisson map at all (no Euler product), so plank 5 has no analogue | — |

### What would end this bridge
- κ_K falling without bound as K grows at fixed L (plank 3 extended to K = 8, 12).
- Plank 5 false, or true only with correction terms as large as the form itself.
- Plank 9 finding that F_d passes every plank (then the bridge is twist-blind, barrier B11, and leads nowhere).

### Not claimed
None of this is a proof of anything about zeta. Planks 1–3 are numbers from one implementation in truncated bases.
The mechanism of planks 1–2 is in print as a heuristic; what may be new is the form-level comparison and its
numbers. Nothing has been searched beyond the papers already read.
