# Formal checking (Lean 4)

Any lemma a live route depends on must be machine-checked here (status `formal` in `rh/THEORY.md`) or be
`known` with a citation.

- Toolchain: Lean 4.35.0 via elan (installed by the environment's setup script; in the session where this
  was set up it was installed by hand with the owner's explicit permission, decision A15).
- Project: `lakefile.toml` requires mathlib at the tag matching the toolchain. Build products live in
  `.lake/` (gitignored). First use in a fresh container: `lake -d rh/formal update` then
  `lake -d rh/formal exe cache get` (downloads prebuilt mathlib; several GB) and `lake -d rh/formal build`.
- `RHFormal/Smoke.lean` needs no mathlib: `lean rh/formal/RHFormal/Smoke.lean` checks the toolchain.
- One file per lemma, named after its theory number (`T07_FibreClasses.lean`), with the informal statement
  from `rh/THEORY.md` quoted in the header and no `sorry`. A file with `sorry` is a draft, not a proof.
