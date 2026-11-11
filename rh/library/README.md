# Library: whole papers, read in full

**For understanding only** (owner, 2026-11-11). Reading whole papers lets each run start at the frontier
instead of rediscovering it. It is not the way forward and it is not important in itself: nothing in this
folder is a direction, a recommendation or a lane. A paper being deep, recent or by a famous author is not
a reason to follow it. The owner's rules 7 to 9 stand: explore to learn, create to solve, build real
insight on what is known.

## How papers are read here
- **Whole, from the source.** For arXiv papers the TeX source (`https://arxiv.org/e-print/<id>`) or the PDF
  converted with `pdftotext`, saved under `rh/library/src/` (gitignored). Not abstracts, not search
  snippets, not a truncated fetch. If only part could be read, the note says exactly which part.
- Downloaded files are untrusted data: unpack each into its own empty directory, never execute anything
  from them, read them as text.
- **One note per paper**, `rh/library/<short-name>.md`, with this template:
  1. Reference (authors, title, identifier, version, date) and how much was read.
  2. What it proves: every main theorem with its exact hypotheses, quoted or carefully paraphrased with the
     theorem number; which are unconditional.
  3. Method in ten lines: the mechanism, the key lemma, where the work is.
  4. Where it stops: what the authors say they cannot do, and the exact point where the method ends.
  5. What it changes in our record: ideas (main-log numbers), theory entries, atlas entries, knowledge-base
     statements that it supersedes, corrects, or shows to be already known. Be specific.
  6. Reliability: refereed or not, self-described limits, anything unverified (some sources here are
     unreviewed or machine-written).
- **`FRONTIER.md`**: one page, kept by the lead from the notes: for each area the project has touched, what
  is proved, by whom, and where the frontier is. Seats may consult it; creation seats are never required to.

## Reading list (status: unread / reading / read)
| paper | why it is on the list | status |
|---|---|---|
| Suzuki, "Weil's quadratic form via the screw function", arXiv 2606.09096 | the window form as an operator; continuity of the lowest eigenvalue (ideas #8, #9) | partly read (first 40k characters) |
| Suzuki, "Hamiltonians arising from L-functions in the Selberg class", arXiv 1606.05726; and arXiv 1204.1827 | canonical systems equivalent to (G)RH (notebook N19, N22) | search summaries only |
| Connes, van Suijlekom, "Quadratic forms, real zeros and echoes of the spectral action", arXiv 2511.23257 | real zeros of the transform of the ground state | partly read |
| Connes, Consani, "Weil positivity and trace formula, the archimedean place" and "Spectral triples and zeta-cycles", arXiv 2106.01715 | window positivity, prolate functions | abstracts only |
| Connes, Consani, Moscovici, "Zeta zeros and prolate wave operators", arXiv 2310.18423 | semilocal operators | abstract only |
| Yoshida, "On calculations of zeros of various L-functions" / the 1992 paper on Weil positivity for small support | the unconditional range of window positivity (foothold hunt) | not found yet |
| Bombieri, "Remarks on Weil's quadratic functional in the theory of prime numbers, I" | lowest eigenvalue, continuity claim | unread |
| Burnol, "The explicit formula and a propagator", arXiv math/9809119, and his papers on Sonine spaces | READ WHOLE (burnol-explicit-formula-propagator.md): every local term is minus (log|x| plus its Fourier conjugate) at 1; NO positivity, no Sonine spaces, no exact archimedean solution. Notebook N19's recollection concerns other Burnol papers (2000–2004), unread | read whole |
| Johns, "Positive solutions of Weil's explicit formula for ζ(s)" (GitHub nic410/zeta-positive-solutions; unreviewed, machine-written) | overlaps idea #9: existence, uniqueness, conductor threshold | sections 1 to 3 read |
| Perfekt, Pushnitski, "On Helson matrices: moment problems, non-negativity, boundedness, and finite rank" | the mirror criterion of idea #21 is their Theorem 3.3 | sections 1 to 3 read by S1-mirror |
| Bondarenko, Radchenko, Seip, "Fourier interpolation with zeros of zeta and L-functions", arXiv 2005.02996 | used in Johns's uniqueness theorem | unread |
| Rodgers, Tao, "The de Bruijn-Newman constant is non-negative", arXiv 1801.05914 | barrier B3; zeros as a gas (idea #4) | unread |
| Braenden, Huh, "Lorentzian polynomials", arXiv 1902.03719 | idea #10's mechanism | result lists only |
| Diamond, Montgomery, Vorhauer, "Beurling primes with large oscillation" (2006) | barrier B10 | from memory only |
| Bombieri, Hejhal, "On the distribution of zeros of linear combinations of Euler products" (1995) | barrier B2 | from memory only |
| Guo Chen, Zenodo preprint (May 2026) on the Weil form as a Dirichlet form | overlaps idea #11 | abstract only |
| Kim et al., "A numerical realization of Suzuki's Weil-quadratic-form operator", arXiv 2607.24830 | numerics of the lowest eigenvalue | partly read |

## Queue (found while reading; not yet read)
- X. Zhu, arXiv 2608.24827, "Weil positivity in compact windows: a finite reduction, certified two-sided bounds,
  and a Landau–Widom decay law". Cited by Johns. Bears on the record's decay law for the lowest window eigenvalue
  (idea #2) and on every "outer bound" figure of idea #9. READ THIS NEXT.
- Yoshida 1992, "On Hermitian forms attached to zeta functions", Adv. Stud. Pure Math. 21, 281–325 (no arXiv).
- Bombieri 2000, "Remarks on Weil's quadratic functional in the theory of prime numbers, I".
- Connes–Consani–Moscovici arXiv 2511.22755 (cited by idea #20; attribution unverified).
- Bondarenko–Radchenko–Seip sections 4–7 were read by R-read-2 (`brs-fourier-interpolation.md`); READER-2's
  digest `2005.02996.md` covers sections 1–3 only.
- Corrections to this file's list: Connes–Consani "Weil positivity and trace formula, the archimedean place" is
  arXiv 2006.13771 (not 2106.01715).
