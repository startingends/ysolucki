# Theory document

Lemmas with dependencies. This is where results accumulate into a structure (owner, 2026-11-10).
Written through `python3 tools/records.py theory ...` (add / set / status / check / tree / frontier).

Statuses: `open` stated, no accepted proof · `proved` full written proof, not yet independently checked ·
`checked` an independent verifier went through it line by line · `formal` machine-checked ·
`known` in the literature (citation given), not reproved here · `refuted` false (counterexample in the note).
A lemma is established when it is checked, formal or known; `checked` and `formal` are refused while a
dependency is not established. **Any lemma a live route depends on must reach `formal` or `known`.**
`routes` names the ideas (main-log numbers) that use the lemma.

## T1 · Weil's positivity criterion
- statement: RH holds iff the Weil functional W(f * f~) = pole + arch - primes is >= 0 for every test function f of compact support (equivalently on every window [-L, L]).
- status: known
- source: Weil 1952 (from memory); the window form 'RH fails iff the lowest eigenvalue is negative for some window' is quoted from Yoshida 1992 in Suzuki arXiv 2606.09096 v3, which was read (KNOWLEDGE section 7)
- routes: #8, #9, #10, #21
- note: 2026-11-10 -> known: citation recorded; not reproved here

## T2 · Continuity of the lowest window eigenvalue
- statement: The lowest eigenvalue of the Weil form on (-a, a) is continuous in a, for all a > 0, unconditionally; for small a it is positive, simple, with even ground state.
- status: known
- source: Suzuki arXiv 2606.09096 v3, Thm 1.3 and 1.4 (quoted from the text, KNOWLEDGE section 7)
- routes: #8
- note: 2026-11-10 -> known: citation recorded

## T3 · Symmetrisation lemma (Hermite-Biehler form)
- statement: If A(s) = sum_{n<=N} c_n n^(-s) with real c_n has no zeros in Re s > 1/2 and w >= (1/2) log N, then f(t) = 2 Re[e^(iwt) A(1/2 + it)] has only real zeros.
- status: proved
- proof: rh/NOTEBOOK.md (entry N2)
- source: lead; classical in substance (Polya, de Branges), not searched
- routes: #6

## T4 · Sign of the arithmetic kernel
- statement: Off the diagonal, the kernel of N = primes - arch is pointwise >= 0: atoms Lambda(n)/sqrt(n) at |x - y| = log n plus the smooth kernel w(u) = e^(u/2)/(2 sinh u) = sum_{m>=0} e^(-(2m+1/2)u).
- status: proved
- proof: rh/NOTEBOOK.md (entry N24)
- source: lead
- routes: #10, #21

## T5 · Parity-block form of RH on a window
- statement: With c = cosh(u/2), s = sinh(u/2): the pole term is +2<f,c>^2 on even f and -2<f,s>^2 on odd f; RH is equivalent to: N(f) <= 2<f,c>^2 for all even f and N(f) <= -2<f,s>^2 for all odd f, on every window. 'N has one positive eigenvalue' alone is weaker.
- status: open
- depends: T1
- source: round-1 judge (wall WJ13); proofs written by seats R2-parity and R2-curv, on the verification track
- routes: #10, #21

## T6 · Bridge: mirror positivity implies the block inequalities
- statement: OPEN, and not yet a precise statement: for the kernel of T4 (mirror-positive on the integers, completely monotone Gamma part) the block inequalities of T5 hold on every window. Must fail for a Beurling system.
- status: open
- depends: T4, T5
- source: idea #21
- routes: #21






