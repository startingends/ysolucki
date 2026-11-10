<!-- local-idea-log owner=R2-free -->
# Local idea log of R2-free

Private working log of agent `R2-free`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-free/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Dial property = infinite divisibility (compound Poisson) of the scale distribution of theta^n; n=1,2 as isolated points of an ID-set
- status: open
- source: R2-free
- date: 2026-11-10
- plain english: Take the list of how many ways each number m is a sum of n squares, weight m by m^-s: that is a probability law on log m. For zeta-like members the law can be split into k independent equal pieces for every k (infinitely divisible). At n=1.4 the piece at m=3 has weight (2/3)(0.4)(-0.6)=-0.16: negative, impossible.
- log:

## #2 · Wallach set of theta: for which REAL n does theta^n have all coefficients >= 0? (carried from Wishart/Gindikin theory on symmetric cones)
- status: open
- source: R2-free
- date: 2026-11-10
- plain english: A Wishart law with real shape n exists only for n in {0,1,..,r-1} or n > r-1. Same question for sums of n squares: r_n(2)=2n(n-1)<0 for 0<n<1 because 2 is not a square; r_n(3)<0 on (1,2) because 3 is not a sum of two squares; r_n(7)<0 on (2,3) because 7 is not a sum of three. Guess: {0,1,2} then everything from 3 on (Lagrange).
- log:

## #3 · Three-window determinant (Koteljanskii / strong subadditivity) statements as a detector
- status: killed
- source: R2-free
- date: 2026-11-10
- log:
  - 2026-11-10: KILLED by logic before computing: every such inequality is implied by positivity of the big window form, so it cannot detect earlier nor imply more. Only three-scale properties STRONGER than positivity are of use.
  - 2026-11-10: status -> killed: implied by positivity; cannot add information

## #4 · Hadamard-infinite-divisibility of the zero-side kernel: would mean zeros form an additive semigroup (zeros as Beurling integers)
- status: killed
- source: R2-free
- date: 2026-11-10
- log:
  - 2026-11-10: Dead on arrival: contradicts linear independence heuristics / GUE; no sumset structure in zeros. Not computed.
  - 2026-11-10: status -> killed: zeros are not closed under addition
