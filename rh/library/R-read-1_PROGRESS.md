# R-read-1 progress (reader seat)

Job: read whole papers (TeX sources under `rh/library/src/`), write one note each. Notes report what is in the
papers; they recommend nothing.

## Sources obtained (2026-11-11)
| paper | arXiv id / version | source file | size |
|---|---|---|---|
| Connes, van Suijlekom, "Quadratic forms, real zeros and echoes of the spectral action" | 2511.23257 v1 (28 Nov 2025) | src/2511.23257/x/Araki-final-oct25.tex (already on disk) | 105 055 bytes |
| Connes, Consani, "Spectral triples and zeta-cycles" | 2106.01715 v1 (3 Jun 2021) | src/2106.01715/Spectraltriples.tex | 148 286 bytes |
| Connes, Consani, "Weil positivity and trace formula, the archimedean place" | 2006.13771 v1 (24 Jun 2020), found through the arXiv API | src/2006.13771/weil-compo.tex | 198 369 bytes |
| Connes, Consani, Moscovici, "Zeta zeros and prolate wave operators" | 2310.18423 v2 (4 May 2024) | src/2310.18423/mainc2m24fine.tex | 99 875 bytes |
| Burnol, "The explicit formula and a propagator" | math/9809119 v2 (22 Nov 1998) | src/math9809119/explicV2.tex | 45 062 bytes |

## Reading log
- record read first: README, KNOWLEDGE (all), THEORY, ATLAS, r1_A/PROGRESS, IDEAS #1, #2, #8, #9, #10, #16 to #21,
  NOTEBOOK N19 to N22.
- paper 1 (2511.23257): read whole (lines 740 to 2149; preamble not read). Note:
  `connes-vansuijlekom-real-zeros.md`. DONE.
- paper 2 (2106.01715): read whole (lines 85 to 1544). Leftover text after `\end{document}`: unpublished
  appendix read; old draft of 2.1 and 6.2 compared by diff, not read line by line. Note:
  `connes-consani-zeta-cycles.md`. DONE.
- paper 3 (2006.13771, identifier found by arXiv API search): read whole (lines 67 to 2431, plus the leftover table
  after `\end{document}`). External data files (Dropbox) not fetched. Note:
  `connes-consani-weil-positivity-archimedean.md`. DONE.
- paper 4 (2310.18423 v2): read whole (lines 159 to 1475, including two `\iffalse` passages). Note:
  `connes-consani-moscovici-prolate.md`. DONE.
- numbering check: the arXiv PDFs of papers 1 to 4 were downloaded and converted with `pdftotext` only to verify
  theorem numbers (paper 4's propositions have a separate counter). All notes use the PDF numbering.
