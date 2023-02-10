# Sistedes Digital Library LaTeX template

This LaTeX template should be used for the camera ready version of papers to be published in the [Sistedes Digital Library](https://biblioteca.sistedes.es).


## How to use this template?

### I already have a paper formatted using the LLNCS class file

**Simple!** Just add a copy of `sistedes.cls` to your existing files (next to your main LaTeX file) and change the `\documentclass[...]{llncs}` LaTeX command to `\documentclass{sistedes}` at the beginning of your document.

Everything should just compile and work out of the box. If you get compile errors, double check the packages you load in your project and their options (e.g., `xcolor`).

### I use **[Overleaf](https://www.overleaf.com)** and I want to start from scratch

Great! Just use any of the available templates!:

* [Sistedes regular paper (Spanish)](https://www.overleaf.com/latex/templates/sistedes-regular-paper-spanish/qcfpycfdwxqw)
* [Sistedes regular paper (English)](https://www.overleaf.com/latex/templates/sistedes-regular-paper-english/zvvwsdxpfgrr)
* [Sistedes relevant journal paper (English)](https://www.overleaf.com/latex/templates/sistedes-relevant-journal-paper-abstract-english/hvtjqnnnnnqc)
* [Sistedes relevant conference paper (English)](https://www.overleaf.com/latex/templates/sistedes-relevant-conference-paper-abstract-english/djtvkcnpzjpp)

### I use my own LaTeX environment

1. If your LaTeX distribution is modern enough, and already contains the `llncs` LaTeX class among its pre-installed packages, simply put a copy of `sistedes.cls` together with your main LaTeX file and use the `\documentclass{sistedes}` LaTeX command at the beginning of your document.

Otherwise:

2. Copy all three files `sistedes.cls`, `llncs.cls` and `splncs04.bst` in a directory that is searched by LaTeX (e.g., the local directory with your main LaTeX file) and use the `\documentclass{sistedes}` LaTeX command similarly.

Yoy may want to use any of `ejemplo-articulo-regular-en.tex`, `ejemplo-articulo-regular-es.tex`, `ejemplo-relevante-revista.tex` or `ejemplo-relevante-congreso.tex` as a starting point for your contribution.

## What does this template provide?

The `sistedes` LaTeX class relies on the the [LLNCS class definition](https://ctan.org/pkg/llncs), but without modifying any source files. Instead, it is implemented as an extension that imports the standard LLNCS class.
The `sistedes` LaTeX class is licensed under the same terms than the LLNCS LaTeX class file (CC BY 4.0).

This `sistedes` class implements the following extensions with respect to LLNCS:

* It always adds a watermark at the bottom of the page specifying the [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) license, as required for publications in the Sistedes Digital Library.
* It produces PDF/A documents to improve portability, since papers are aimed to be permanently archived in the Sistedes Digital Library.
* It automatically sets the document metadata in the produced PDF (authors, title, and license).
* It provides some custom commands to easily typeset the "relevant paper" special type of submission.

## Repository contents

This repository consists of the following files:

* `sistedes.cls`: main class file for the Sistedes digital library LaTeX template.
* `llncs` directory: contains an unmodified copy of the LLNCS template, as published at [CTAN](https://ctan.org/pkg/llncs) under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode) license.
* `llncs.cls`: an unmodified copy of the LLNCS LaTeX document class in the `llncs` directory (required by the `sistedes.cls` class file).
* `splncs04.bst`: an unmodified copy of the BibTeX bibliografy style template for LLNCS (required, if using _BibTex_).
* `fig1.eps`: example image file, as made available at the [Information for Authors of Springer Computer Science Proceedings](https://www.springer.com/gp/computer-science/lncs/conference-proceedings-guidelines) site.
* `ejemplo-articulo-regular-en.tex`: Example file, showing a regular paper written in English (sources).
* `ejemplo-articulo-regular-en.pdf`: Example file, showing a regular paper written in English (result).
* `ejemplo-articulo-regular-es.tex`: Example file, showing a regular paper written in Spanish (sources).
* `ejemplo-articulo-regular-es.pdf`: Example file, showing a regular paper written in Spanish (result).
* `ejemplo-relevante-revista.tex`: Example file demonstrating the submission of the abstract and metadata of an already published (in a journal) relevant paper (sources).
* `ejemplo-relevante-revista.pdf`: Example file demonstrating the submission of the abstract and metadata of an already published (in a journal) relevant paper (result).
* `ejemplo-relevante-congreso.tex`: Example file demonstrating the submission of the abstract and metadata of an already published (in a conference) relevant paper (sources).
* `ejemplo-relevante-congreso.pdf`: Example file demonstrating the submission of the abstract and metadata of an already published (in a conference) relevant paper (result).
* `LICENSE.txt`: The license file (CC BY 4.0).
* `README.md`: This file.

## Any issues using this template?

Just post [an issue](https://github.com/sistedes/sistedes.cls/issues) and let us know!