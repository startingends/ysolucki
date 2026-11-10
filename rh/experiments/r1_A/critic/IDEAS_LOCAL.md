<!-- local-idea-log owner=r1_A_critic -->
# Local idea log of r1_A_critic

Private working log of agent `r1_A_critic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `r1_A_critic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Zero-surgery controls: move one pair of zeta zeros off the line and find the window where the Weil form first notices
- status: open
- source: r1_A_critic
- date: 2026-11-10
- plain english: Take zeta's true zero list, slide two neighbouring zeros together and push them off the line; the energy matrix changes by an explicit rank-4 piece. Example: moving zeros 20,21 (height 78) off by 0.3 is first noticed at window 0.93, i.e. when 4*pi*e^(2L) reaches 1.03 x 78.
- claim: L*(T,delta) = 0.5*log(T/4pi) + s, s in [-0.02,0.35], decreasing in T, increasing 0.05-0.10 per decade as delta shrinks
- log:

## #2 · Horizon lemma: garbage above 1.2 x 4 pi e^{2L} cannot make the window form negative (pure Paley-Wiener sampling statement, no primes)
- status: open
- source: r1_A_critic
- date: 2026-11-10
- plain english: Replace every zero above height H by off-line junk; the window form stays positive as long as H is above about 1.2 x 12.6 x (largest number in play). Example: window 0.58 (numbers up to 3), junk from height 48 upward: lowest energy still +4e-9.
- claim: For zero sets with zeta's counting function and all off-line members above C*4pi*e^{2L} (C<=1.5), the window-L form is nonnegative
- log:
