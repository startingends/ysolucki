# r1_C  Lane C (Spectral / geometric) -- proposer, round 1

Started 2026-11-10. Read: SUBAGENT_PREAMBLE, PROJECT_BRIEF, KNOWLEDGE (B1-B10), IDEAS (#1-#5), rhlib.py,
and lane A's PROGRESS.md (so as not to redo the truncated Weil form: lane A already reproduced the
Connes-van Suijlekom minimiser and ran it on Davenport-Heilbronn).

Plan (written before computing):
- E1  Real-rooted prime-only family (Hermite-Biehler / Gonek type): F_X(t) = Re[e^{i theta(t)} P_X(1/2+it)],
      P_X = truncated Euler product. Real zeros are free (real function of real t). Measure zero error vs X.
      Controls: fake primes (Beurling-type, B10) and the formal "Euler product" of Davenport-Heilbronn (B1).
- E2  Hermitian pencil (B, A) built ONLY from values of xi'/xi in Re s > 1 (absolutely convergent prime sums):
      rational-Krylov Rayleigh-Ritz for the would-be Hilbert-Polya operator. Ritz values vs first 20 zeros.
      Control: same pencil on Davenport-Heilbronn; positivity scan in the half-plane parameter a.
