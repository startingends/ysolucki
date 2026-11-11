<!-- local-idea-log owner=r1_A_critic -->
# Local idea log of r1_A_critic

Private working log of agent `r1_A_critic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `r1_A_critic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Zero-surgery controls: move one pair of zeta zeros off the line and find the window where the Weil form first notices
- status: open
- source: r1_A_critic
- date: 2026-11-10
- tags: control,instrument,laneA,WJ1
- plain english: Make an impostor to order. Take zeta's true list of zeros, slide two neighbouring ones together and push them off the line by a chosen amount; the energy test of ideas #2 and #8 changes by a small explicit correction, so each experiment costs about a minute. Then widen the window until the energy first goes negative. Example: push zeros number 20 and 21 (height 78) off the line by 0.3; the window first notices at half-width 0.93, when 12.6 times the largest number in play reaches 1.03 x 78. Push them off by only 0.01 and it takes until half-width 1.01 (1.20 x 78). So how soon a bad zero is seen depends on how far off the line it sits, something the one real impostor could not show.
- wall: none: instrument (dial-an-impostor at any height and any distance from the line). It serves wall WJ1 (locality) by measuring where a window first sees a planted bad zero.
- new input: none: instrument. Unlike the single Davenport-Heilbronn impostor of #1 it gives a control at any chosen height and offset. It is a set of zeros, not a Dirichlet series: no prime side exists for it.
- claim: L*(T,delta) = 0.5*log(T/4pi) + s, s in [-0.02,0.35], decreasing in T, increasing 0.05-0.10 per decade as delta shrinks (critic, verbatim). Scope set by the judge: this is the near-line regime only; far from the line see #16.
- prediction: Registered by the critic before computing (critic PROGRESS 21:25): L* DOES depend on the offset delta, with a shift of at least 0.1 in L per decade of delta, and for small delta the ratio 4 pi e^(2L*)/m drifts toward 2; 'if L* is delta-independent to 0.03, I am wrong'. Outcome, by the critic's own score: direction right, size overestimated (0.05 to 0.10 per decade); the drift toward 2 was not seen except at the lowest height (1.93 at m = 17.6). The competing prediction, lane A's law A2 (no dependence on delta, ratio within [0.6, 1.2]): 10 of 20 controls fell outside.
- smallest: none identified for the instrument itself; the statement it feeds is the visibility lemma under #16.
- first test: Done (critic, surgery.py.txt, N = 90, 400 bits): 20 configurations, pair midpoints m = 17.6, 35.3, 51.4, 78.2, 100.1 and offsets 0.3, 0.1, 0.03, 0.01. Next (judge, round-2 items 1 and 4): second implementation in Arb; surgery sets with exactly one quartet to count negative squares per parity block and positive eigenvalues of N = primes - arch as L grows.
- kill line: None was fixed by the critic for the instrument itself. Judge's round-2 kill lines that use it: a one-quartet configuration whose form has fewer than two negative squares at every L up to 2 (then the per-block count is wrong); or the one-quartet configuration keeps N at exactly one positive eigenvalue (then idea #10's signature target cannot see a single quartet).
- novelty: UNSEARCHED: neither the critic nor the judge searched for zero-surgery controls of the windowed Weil form.
- evidence: COMPUTED by the critic, ONE implementation of the perturbation (surgery.log; N = 90, 400 bits; Rayleigh-Ritz, not interval-certified). 4 pi e^(2L*)/m for offsets 0.3, 0.1, 0.03, 0.01: m = 17.6: 1.44, 1.61, 1.77, 1.93; m = 35.3: 1.16, 1.24, 1.35, 1.45; m = 51.4: 1.07, 1.17, 1.25, 1.31; m = 78.2: 1.03, 1.10, 1.15, 1.20; m = 100.1: 0.99, 1.05, 1.10, 1.15. The underlying matrix code has two implementations: the critic's independent one agrees with lane A's to every printed digit (zeta, L = 1, N = 80: 6.6401193e-30; impostor, L = 1.72: -7.91085e-30). Judge: the wave-packet run (#16) agrees with the surgery in mechanism, not digit for digit; judge's fit to this table: 4 pi e^(2L*) = T + (0.9 +- 0.2) log T ln(1/delta) for T >= 35.
- log:
  - 2026-11-10: promoted to main #17 by R1-AUD
  - 2026-11-10: auditor R1-AUD replaced the 'plain english' field before promotion; the agent's original text was: Take zeta's true zero list, slide two neighbouring zeros together and push them off the line; the energy matrix changes by an explicit rank-4 piece. Example: moving zeros 20,21 (height 78) off by 0.3 is first noticed at window 0.93, i.e. when 4*pi*e^(2L) reaches 1.03 x 78.
  - 2026-11-10: auditor R1-AUD replaced the 'claim' field before promotion; the agent's original text was: L*(T,delta) = 0.5*log(T/4pi) + s, s in [-0.02,0.35], decreasing in T, increasing 0.05-0.10 per decade as delta shrinks

## #2 · Horizon lemma: garbage above 1.2 x 4 pi e^{2L} cannot make the window form negative (pure Paley-Wiener sampling statement, no primes)
- status: open
- source: r1_A_critic
- date: 2026-11-10
- tags: killed,laneA,WJ1
- plain english: The claim was: bad zeros that sit high enough can never spoil a short window. Precisely: if every zero below about 1.5 x 12.6 x (the largest number the window sees) is on the line, the energy stays non-negative whatever junk sits above. Example in favour (critic): window half-width 0.58 (numbers up to 3), 192 zeros from height 48 upward replaced by off-line junk: the lowest energy is still +4e-9. Example that killed it (judge): window half-width 3 (numbers up to 403, claimed safe height 1.5 x 5070 = 7600), ONE bad zero planted at height 15000, 0.49 off the line: an explicit short wave has energy -2.48. So the claim is false: a bad zero far from the line is visible far above the supposed horizon.
- wall: WJ1 (locality: what a finite window can see). The lemma tried to turn the verified height 3e12 into unconditional positivity on large windows. It did not get past the wall: killed by the judge's counterexample.
- new input: A pure sampling statement (Paley-Wiener type) about zero sets with the right counting function, with no primes in it: an input the bare criterion lacks. It turned out false as stated.
- claim: For zero sets with zeta's counting function and all off-line members above C*4pi*e^{2L} (C<=1.5), the window-L form is nonnegative
- prediction: Registered by the critic before running (critic PROGRESS 21:42): at L = 0.58 (4 pi e^(2L) = 40.1), with all zero pairs from index n0 up replaced by quartets, the form stays positive for n0 = 21 and is negative for n0 = 5 (H = 33). Both confirmed (garbage.log: no negative eigenvalue for H = 48 to 104; -4.8e-4 at H = 32.9). The lemma's general prediction (never negative for junk above 1.5 x the horizon) was then tested by the judge at L = 3 and came out -2.48: falsified.
- smallest: What survives (judge): generic junk is harmless at L = 0.58, i.e. in the near-line regime. The corrected statement to prove is the visibility lemma under #16.
- first test: Done. Critic: garbage test at L = 0.58 (N = 90, 400 bits, zeros n0..200 replaced pairwise by quartets). Judge: one off-line quartet at height 15000.37, offset 0.49, at L = 3.0, evaluated on an explicit wave packet (wavepacket.py.txt).
- kill line: The critic's own, as quoted by the judge: any configuration with the correct counting function, all members on the line below 1.5 x 4 pi e^(2L), and a negative eigenvalue. HIT.
- novelty: SEARCHED by the judge only (web search, summaries): nothing found on 'verified height implies positivity on a window'; Yoshida 1992 and Bombieri's 'Remarks' unread. The critic ran no search for this lemma.
- evidence: Critic, COMPUTED (garbage.log; L = 0.58, offsets 0.4 and 0.1; Rayleigh-Ritz, so 'no negative eigenvalue' is not certified; zeros above index 200 untouched; one L only): H = 32.9 (0.82 x 4 pi e^(2L)): negative, -4.8e-4 (offset 0.4), -8.1e-6 (offset 0.1); H = 48.0 to 103.7 (1.20 to 2.59 x): no negative eigenvalue, lowest 4.0e-9 to 7.3e-9. Judge, COMPUTED (double precision, one implementation, not interval-certified): Rayleigh quotient -2.478 (taper 2) and -5.62 (taper 1) at L = 3.0 with the quartet at 15000.37 = 2.96 x 4 pi e^(2L); -2.78 at L = 2.7 with the quartet at 8000.37 = 2.88 x. Base value by two routes (5.1696 zero side, 5.1695 prime side).
- log:
  - 2026-11-10: promoted to main #18 by R1-AUD
  - 2026-11-10: auditor R1-AUD replaced the 'plain english' field before promotion; the agent's original text was: Replace every zero above height H by off-line junk; the window form stays positive as long as H is above about 1.2 x 12.6 x (largest number in play). Example: window 0.58 (numbers up to 3), junk from height 48 upward: lowest energy still +4e-9.
