# MEMORY of the formal seat (FORMAL)

Rewritten at the end of every session; updated after every file. Read this first next session.

## What is formal (builds, no sorry / axiom / native_decide, imported from RHFormal.lean)
(nothing yet in session 1; see PROGRESS.md for the file in work)

## Drafts (RHFormal/drafts/, not imported)
(none)

## How to work here
- One Lean process at a time (the machine was overloaded once). While iterating:
  `lake -d /home/user/ysolucki/rh/formal env lean /home/user/ysolucki/rh/formal/RHFormal/<File>.lean`.
  Full build only at the end: `lake -d /home/user/ysolucki/rh/formal build`.
- Never `lake update`; never touch lakefile.toml, lean-toolchain, .lake.
- Find lemma names by Grep over .lake/packages/mathlib/Mathlib/, not from memory.
