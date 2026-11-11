<!-- local-idea-log owner=r1_D_critic -->
# Local idea log of r1_D_critic

Private working log of agent `r1_D_critic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `r1_D_critic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Multiplicity dial: integers are blind to a planted singularity exactly when its weight is a whole number
- status: open
- source: r1_D_critic
- date: 2026-11-10
- plain english: Delete primes at z times the zero-planting rate. z=1 plants a zero; z=0.5 plants a square-root branch point. Measured at a=0.55, X=1e10: true error grows like x^0.44 for z=0.5 but stays flat near 200 for z=1; the wobble after detrending is x^0.28 in both.
- claim: True error exponent of random z-deletion is a for non-integer z and a/2 for integer z; detrended oscillation is a/2 for all z.
- log:
  - 2026-11-10: audit: not promoted: merged into main #15

## #2 · Second critical line: a deletion system cheaper than x^(a/2) must carry about T extra zeros near Re s = a/2
- status: open
- source: r1_D_critic
- date: 2026-11-10
- log:
  - 2026-11-10: audit: not promoted: judge: open, score 2, below the promotion bar: heuristic only, nothing computed. It says what a cheap deletion system would have to look like (about T extra zeros of zeta_S near Re s = a/2); the exact unproved statement stays in the critic's PROGRESS.md under W(c2). The judge's remark that for S = all primes the line a/2 is the critical line itself is noted in JUDGEMENT.md section 5 item 5.
