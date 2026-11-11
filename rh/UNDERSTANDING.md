# Understanding: where do we even start?

Owner direction (2026-11-10): the hardest part is "where do I even start"; build a strong enough understanding
first, then branch out; note ideas and brainstorm constantly.

This file is the on-ramp. It is a chain of plain statements, each one backed by something **we ran ourselves**
(command given), followed by the questions we cannot answer yet. Brainstorming goes in `rh/NOTEBOOK.md`;
anything testable gets a number in `docs/IDEAS.md`.

## The chain

**U-1. Primes and zeros are the same information written two ways.**
Plain: the primes are like a recording of a chord; the zeros are the list of notes in it. Give me the notes
and I can replay the recording; give me the recording and I can read off the notes.
Checked (`rh/experiments/u1_understanding/duality.py.txt`, COMPUTED):
- zeros → primes: the first 5000 zeros rebuild the prime staircase ψ(x): at x = 100.5 the true value is
  94.0453 and the rebuilt one 94.0211; the rebuilt staircase jumps by 4.64 at 97 (true: log 97 = 4.57)
  and by −0.004 at 98 (true: 0, since 98 is not a prime power).
- primes → zeros: using only the primes below 100 (35 prime powers, no zeta function), the peaks of a simple
  cosine sum sit at 14.126, 21.024, 25.004, 30.438, 32.910; the true zeros are 14.135, 21.022, 25.011,
  30.425, 32.935.

**U-2. What RH says in this picture.** Each zero ρ = β + iγ adds a wave of size x^β to the prime count.
On the line (β = 1/2) every wave grows at the same rate √x: an orchestra where no instrument drowns the
others. One zero off the line would be one instrument growing louder than all the rest forever.
RH = the primes are as evenly spread as they can possibly be.

**U-3. Getting all zeros onto the line is cheap for look-alikes; one rule explains every case we know.**
Rule (PROVED, classical: Hermite–Biehler / Pólya; argument in NOTEBOOK N2): take any sum
A(s) = Σ c_n n^(−s) with real c_n, length N, that has no zeros to the right of the line (Re s > 1/2). Then the
symmetrised wave f(t) = 2 Re[e^(iωt) A(1/2 + it)], ω ≥ ½ log N, has **only real zeros**. [CORRECTION 2026-11-11: false as stated without the hypothesis c_1 ≠ 0 (counterexample in NOTEBOOK N2 and THEORY T3); the repaired statement T25 is open.]
Checked (`rh/experiments/u1_understanding/leeyang.py.txt`, COMPUTED, zeros counted on 0 < t < 20000):

| A | zeros found on the line | expected if all on the line | missing |
|---|---|---|---|
| 1 + 2^(−s) (sharp cut at 2) | 5833 | 5833.3 | 0 |
| sharp cut at 3 | 6855 | 7975.3 | **1120 (14%)** |
| sharp cut at 30 | 17258 | 21757.9 | **4500 (21%)** |
| smooth cut (1 − log n/log N), N = 30 | 21861 | 21861.4 | 0 |
| Euler-shaped product over p ≤ 13 | 34727 | 34727.5 | 0 |

The sharp cut at 3 fails for a reason visible by hand: 1/√2 + 1/√3 = 1.28 > 1, so the terms can cancel the
leading 1 to the right of the line. Products over primes can never cancel that way: each factor is non-zero
on its own. **This is the Euler product at work, in its simplest form (barrier B1).**

**U-4. So where is the difficulty? In the limit.** Every family of look-alikes with provably real zeros that
we know of converges to the true ξ only if RH-type information is fed in. Writing this down as the first wall:

> **Wall W1 (convergence wall).** For each known family of approximants F_N with all zeros real by
> construction (symmetrised finite Euler products, Jensen polynomials at large shift, heat-flowed H_t with
> t > 0, minimisers of truncated Weil forms), no proof of F_N → ξ locally uniformly is known that does not
> assume RH or something equivalent. With such a proof, RH would follow at once (Hurwitz).

**U-5. Tests that look like evidence are often blind.** Li's criterion needs index n ≈ 330 000 to notice the
impostor's off-line zero at height 86 (idea #1). Scaled to zeta: n ≈ 10²⁷. Numerical positivity proves nothing.

## What we do not understand yet (the questions that drive the work)

- **Q1.** In W1, *which* approximant family fails to converge for the mildest reason? Is there one where
  convergence is an estimate about primes in short ranges rather than about zeros?
- **Q2.** The Euler product gives "no zeros to the right" for free at every finite stage and loses it in the
  limit. What exactly is lost: is there a quantity (a margin, like min|A| over the polydisc in U-3's table:
  0.124, 0.043, 0.026 for p ≤ 3, 7, 13) whose decay rate we can relate to something provable?
- **Q3.** U-3 used a straight symmetrisation e^(iωt). The true ξ uses the Gamma factor instead. What is the
  right symmetrisation for a finite set of primes so that the *pair* (primes ≤ P, Gamma factor) is in balance?
- **Q4.** The impostor has the symmetry but not the product; Beurling systems have the product but not the
  symmetry (B10). Is there a single inequality that uses both and fails visibly when either is removed?
- **Q5.** Why is RH true "with no slack" (Λ ≥ 0)? What is the picture in which zero slack is natural (a
  phase transition point, a boundary of a cone) rather than a coincidence?
