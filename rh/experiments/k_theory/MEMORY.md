# K-theory MEMORY (rewritten at the end of every session; interim version written 00:22 UTC 2026-11-11)

State: all sources read (list in PROGRESS.md). Entries are being added by the batch scripts enter_*.py.txt in this folder
(each calls `tools/records.py theory ...`; run each ONCE; `records.py theory list` shows what is in).
Plan of entries (keys in the scripts): literature inputs, round-1 lemmas, notebook, parity seat, first failure (#8), bootstrap (#9),
cubic seat (#10), curvature seat (#11), mirror (#21, killed), then updates of seeds T1-T6 (T3 REFUTED by my counterexample, T6 REFUTED by F_d).
My own findings so far are in PROGRESS.md (Finding 1-3, checks C1-C17, the written-out inertia proof).
Still to do after the entries: STRUCTURE.md, final MEMORY.md, `theory check`, report.
Formal: a statement is `formal` only if its file is imported from rh/formal/RHFormal.lean and `lake -d rh/formal build` succeeds.
