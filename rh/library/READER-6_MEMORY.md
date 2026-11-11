# READER-6 memory (reader seat, kept current)

Seat: READER-6. Writes only: `rh/library/<id>.md` digests, its rows appended to `rh/library/INDEX.md`, sources
under `rh/library/src/<id>/` (untrusted text, never executed), and this file. No commits, no pushes. Digests
report; they never recommend.

## Brief (lead, 2026-11-11)
Subject: zeros of s -> E(z, s) (Epstein zeta of the form attached to z) as z varies over the modular surface.
Priority: (1) Lagarias-Suzuki math/0412039 + follow-ups (H. Ki, zeros of constant term); (2) zeros of Epstein zeta:
Davenport-Heilbronn, Bombieri-Hejhal, families in z, "y large => zeros up to T on the line", collisions,
de Bruijn-Newman for Epstein/Eisenstein; (3) Hecke: Epstein zeta with harmonic polynomial = Hecke L with
Grossencharacter; Taylor/Maass-raising coefficients at a CM point. Answer (a)-(d); compare with rh/NOTEBOOK.md N45
items (1)-(4) and rh/specialists/reflection/OBJECT_PHI.md section 4 (Dfc). NOT mine: Bombieri-Garrett and Garrett's
pseudo-Laplacian papers (READER-5).

## Checked before starting
INDEX.md, README.md, READER-1..5 memory files: no library digest on Lagarias-Suzuki, Ki, Epstein zeros, Hecke.
SP-modular (rh/specialists/modular/LIBRARY.md) PARTLY read Lagarias-Suzuki (sec 1, start of sec 2-3); its TeX is
at src/sp_modular_lagarias_suzuki/paper.tex. I read it whole myself.

## Log
- 2026-11-11: seat started.
- READ WHOLE: Lagarias-Suzuki math/0412039 (src/math0412039/paper.tex, 70,841 ch, 1 Nov 2005 post-referee
  version); Lee 1204.6297 (75,460); Betermin-Samaj-Travenec 2110.09368 (73,411; figures not opened); McPhedran
  1601.01724 (33,373; figures not opened); Ki CRAS 342 (2006) 79-81 (numdam PDF, 3 pp.); Reznikov 1008.0995
  (74,359 incl. text after \end{document}).
- PARTLY: Rezvyakova 2411.18492 sections 1-4 + bibliography (44,248 / 203,396); Nakamura 2001.01981 subsection
  "The Epstein zeta function" only (5,658 / 56,377).
- NOT OBTAINED: Ki, Acta Arith. 124 (2006) 197-204 (impan shop + captcha: not pursued); Ki PLMS 90 (2005)
  (paywall); Davenport-Heilbronn JLMS 1936; Bombieri-Hejhal Duke 1995; Bateman-Grosswald 1964; Hejhal 1990;
  Steuding Math. Ann. 2005; Reznikov dir.pdf on u.math.biu.ac.il (connection reset twice).
- COMPUTED (scratchpad dc.py.txt, mpmath 50 digits): zero of y -> E*(iy,1/2) is y = 4 pi e^-gamma (1 - 4.196e-20);
  so Betermin et al.'s Conjecture 1.1 (Delta_c* = e^gamma/4pi exactly) is false at the 20th digit.
- Container restarted mid-session (coordinator); all sources under src/ and the scratchpad survived; nothing re-fetched.
- DONE: digests math0412039.md, 1204.6297.md, 2110.09368.md, 1601.01724.md, ki-cras-2006.md, 1008.0995.md,
  2411.18492.md (partial), 2001.01981.md (partial); 8 INDEX rows appended.
- de Bruijn-Newman + Epstein/Eisenstein: 3 web queries, plus grep of the Newman-Wu survey source (src/1901.06596,
  "Constants of de Bruijn-Newman type...") for Epstein/Eisenstein: no hits. Laplace-in-z as a flow on zeros: nothing found.
- Unread but identified: Lamzouri 1907.06387 (Epstein zeros right of the line, h>=2), Lee 1811.01613 (near the line),
  Stromberggson-Sodergren 1305.1333 (random lattices, large dimension), Travenec-Samaj 1909.07112 (hypercubic),
  Zhou 1410.8312 (downloaded, unread), Rodriguez Villegas-Zagier (CM values of derivatives of Eisenstein series).
- Report sent to lead (SubagentHandback).
