# RUET EEE — Project & Thesis (EEE 4000) LaTeX Template

A ready-to-use LaTeX template for the final-year Project & Thesis book of the
**Department of Electrical & Electronic Engineering, Rajshahi University of
Engineering & Technology**.

Every formatting rule in this template comes from the official
**EEE 4000 Project & Thesis Manual**, a copy of which is included in this
package as `EEE_4000_Thesis_Project_Manual.pdf`. The page layout, the
six-chapter structure, the preliminary pages and the cover page follow
**Annex III: Template for Project & Thesis (EEE 4000) Book Writing**.

> **Read this before you submit.** Departmental instructions change. Always
> check your final PDF against the newest official instruction from the
> Department (www.eee.ruet.ac.bd) or from your supervisor. This template is
> a convenience, not an authority.

---

## 1. What you get

```
EEE_Department_Thesis_Template/
│
├── Thesis_Book.tex          <- decides the ORDER of pages. Rarely needs editing.
├── config.tex        <- YOUR name, roll, title, supervisor. EDIT THIS FIRST.
├── format.tex        <- all the official formatting rules. Leave it alone.
├── bibliography.bib  <- all your references live here.
├── README.md         <- this file.
├── LICENSE.txt
├── TEMPLATE_VALIDATION_REPORT.txt
├── EEE_4000_Thesis_Project_Manual.pdf   <- the official manual
│
├── chapters/
│   ├── cover.tex
│   ├── acknowledgement.tex
│   ├── certificate_supervisor.tex
│   ├── certificate_external.tex
│   ├── abstract.tex
│   ├── abbreviations.tex
│   ├── symbols.tex
│   ├── publications.tex
│   ├── chapter1_introduction.tex
│   ├── chapter2_methodology.tex
│   ├── chapter3_results_discussion.tex
│   ├── chapter4_social_environmental_influence.tex
│   ├── chapter5_po_cep_cea.tex
│   ├── chapter6_conclusion_future_plan.tex
│   └── appendices.tex
│
├── figures/     <- put your images here (+ a README explaining the rules)
├── tables/      <- optional home for long tables
├── references/  <- optional home for downloaded .bib files and paper PDFs
└── assets/      <- the official RUET logos
```

**There is no `contents.tex`, `list_of_figures.tex` or `list_of_tables.tex`.**
Those three pages are generated automatically by LaTeX from your own
chapters — writing them by hand would guarantee wrong page numbers. They are
produced by three lines already present in `Thesis_Book.tex`.

---

## 2. Which file do I edit first?

**`config.tex`.** Nothing else. Open it and fill in the block marked

```
% ===== STUDENT SHOULD EDIT THESE =====
```

Your thesis title, name, roll number, supervisor, external member and
submission date all live there, and they flow automatically onto the cover
page, both certificate pages and the acknowledgement. You never have to type
your title twice.

The block marked `% ===== DO NOT EDIT UNLESS NECESSARY =====` holds the fixed
departmental wording. Change it only if the Department officially changes it.

Then write your thesis in `chapters/`. Every file there is full of
placeholders that look like this:

> *[Write the background of your research here.]*

Delete each one and replace it with your own writing. If you can still see
square brackets in your final PDF, you are not finished.

---

## 3. How to compile

### With Tectonic (recommended — one command, no LaTeX installation)

```bash
tectonic Thesis_Book.tex
```

Tectonic downloads whatever packages it needs on first run, and it runs
LaTeX and BibTeX as many times as required, so the table of contents and the
references come out right in a single command. Get it from
<https://tectonic-typesetting.github.io>.

### With XeLaTeX (TeX Live, MiKTeX, MacTeX)

Because the references and the table of contents need more than one pass,
run this **four-command sequence**:

```bash
xelatex Thesis_Book.tex
bibtex main
xelatex Thesis_Book.tex
xelatex Thesis_Book.tex
```

Or let `latexmk` handle the repetition for you:

```bash
latexmk -xelatex -bibtex Thesis_Book.tex
```

### On Overleaf

Upload the whole folder, then set **Menu → Compiler → XeLaTeX**. The default
pdfLaTeX will *not* work, because this template uses `fontspec` to get Times
New Roman.

### Cleaning up auxiliary files

```bash
latexmk -c            # removes .aux .log .toc .lof .lot .out .blg ...
```

or by hand:

```bash
rm -f *.aux *.log *.toc *.lof *.lot *.out *.bbl *.blg *.fls *.fdb_latexmk
```

Never delete `Thesis_Book.pdf` and never delete anything in `chapters/`.

---

## 4. Fonts — please read this

The manual requires **Times New Roman**. This template asks for it by name:

```latex
\IfFontExistsTF{Times New Roman}{ \setmainfont{Times New Roman} }{ ... }
```

If Times New Roman is installed on your computer (it is, on any Windows
machine, and on macOS), you get the real font. If it is **not** installed —
common on Linux and on Overleaf — the template automatically falls back to
**TeX Gyre Termes**, a free clone of Times with identical letter widths. The
page layout and line breaks are unchanged, and the difference is invisible
at normal reading size.

To be certain your submitted PDF uses the genuine font, compile on a machine
that has Times New Roman installed, or install it (on Debian/Ubuntu:
`sudo apt install ttf-mscorefonts-installer`).

The template never silently falls back to Computer Modern, LaTeX's default
font, which would look obviously wrong to your examiner.

---

## 5. Formatting rules this template implements

| Requirement | Manual | Implemented by |
|---|---|---|
| A4 paper | Instruction 1 | `geometry` |
| Times New Roman, 12 pt | Instruction 2, §7.1 | `fontspec` + document class |
| Single-sided printing | Instruction 3 | `oneside` class option |
| Left 1.5", Right 0.7", Top 1", Bottom 1.5" | Instruction 4 | `geometry` |
| Line spacing 1.15 | Instruction 5 | `setspace`, `\setstretch{1.15}` |
| Six chapters | Instruction 7 | `chapters/chapter1…6` |
| IEEE references | Instruction 9 | `\bibliographystyle{IEEEtran}` |
| Roman page numbers, Acknowledgement → Publications | Instruction 11 | `\pagenumbering{roman}` |
| Arabic page numbers from Chapter 1 | Instruction 12 | `\pagenumbering{arabic}` |
| Table caption **above**, centred | Instruction 13a | `caption` package |
| IEEE-style tables, no colour | Instruction 13b, 13c | `booktabs` |
| Tables at top/bottom of page | Instruction 13d | float placement `[!t]` / `[!b]` |
| Figure caption **below**, centred | Instruction 14a | `caption` package |
| Figures at top/bottom of page | Instruction 14g | float placement + `flafter` |

### One conflict in the manual you should know about

The manual states the line spacing **twice, differently**:

- **General Instruction 5** (page 5): *"Line Gap: 1.15 pt"*
- **Section 7.1** (page 3): *"12-point Times New Roman, 1.5-line spacing"*

This template uses **1.15**, because General Instruction 5 sits in the
section headed *"General Instructions for the Students to Write the
Thesis/Project Book"*, which is the formatting specification. If your
supervisor or the Department tells you to use 1.5 instead, change one line in
`format.tex`:

```latex
\setstretch{1.15}     % change 1.15 to 1.5
```

The book length is similarly stated twice: §7.1 says around 50 pages
excluding the appendix and preliminary pages, while Instruction 6 says a
minimum of 50 pages excluding the references and appendices. Either way,
aim for at least 50 pages of actual chapters.

---

## 6. Page numbering

You do not have to do anything — the transition is automatic.

| Page | Number |
|---|---|
| Cover | counts as i, but **no number is printed** |
| Acknowledgement | ii |
| Certificate (Supervisor) | iii |
| Certificate (External Member) | iv |
| Abstract | v |
| Contents | vi |
| List of Figures | viii |
| List of Tables | ix |
| List of Abbreviations | x |
| List of Symbols | xi |
| List of Publications | xii |
| Chapter 1 onwards | 1, 2, 3, … |

This matches the numbering shown in Annex III. Numbers are centred at the
bottom of the page, with no running header.

---

## 7. How to add things

### A chapter

The manual fixes the number of chapters at **six**. You should not add a
seventh. To add a *section* inside a chapter, just write:

```latex
\section{Your Section Title}
\subsection{Your Subsection Title}
\subsubsection{Your Sub-subsection Title}
```

Numbering (1.1, 1.1.1, …) is automatic. The manual explicitly allows this:
*"One can add additional subsection as per their requirements."*

### A figure

Put the image in `figures/`, then:

```latex
\begin{figure}[!t]
  \centering
  \includegraphics[width=0.65\textwidth]{my_diagram.pdf}
  \caption{What the figure shows.}
  \label{fig:my_diagram}
\end{figure}
```

Refer to it as `Figure~\ref{fig:my_diagram}`. Caption goes **below**. Give
only a width, never both width and height, so the aspect ratio is preserved.
Label both axes of every graph. Do not place a figure immediately after a
heading. See `figures/README.txt` for the full list of rules.

### A table

```latex
\begin{table}[!t]
  \centering
  % EEE requirement: table title/caption is above the table and center aligned.
  \caption{What the table shows.}
  \label{tab:my_table}
  \begin{tabular}{lcc}
    \toprule
    \textbf{Parameter} & \textbf{Unit} & \textbf{Value} \\
    \midrule
    Example & V & 12.0 \\
    \bottomrule
  \end{tabular}
\end{table}
```

Caption goes **above** — so `\caption` comes *before* `\begin{tabular}`. Use
only `\toprule`, `\midrule`, `\bottomrule`; no vertical lines, no colour.
For a table that runs over a page, use `longtable` (already loaded) — see
`chapters/chapter5_po_cep_cea.tex` for a working example.

### An equation

```latex
\begin{equation}
  \eta = \frac{P_{\mathrm{out}}}{P_{\mathrm{in}}} \times 100\%
  \label{eq:efficiency}
\end{equation}
```

Refer to it as `Equation~\ref{eq:efficiency}`. Define every symbol right
after the equation and give its unit. Worked examples of single and
multi-line equations are in `chapters/chapter3_results_discussion.tex`.

### A reference

Add the entry to `bibliography.bib`:

```bibtex
@article{rahman2024converter,
  author  = {M. Rahman and S. Islam},
  title   = {A new converter topology},
  journal = {IEEE Transactions on Power Electronics},
  volume  = {39}, number = {4}, pages = {1234--1245}, year = {2024}
}
```

Then cite it with `\cite{rahman2024converter}`. IEEE formatting, numbering
and ordering are all applied automatically by the `IEEEtran` style — you
never type the punctuation yourself. Only works you actually cite are
printed.

> **A trap worth knowing:** in a `.bib` file, `%` is *not* a comment
> character. Commenting an entry out with `%` will still cause BibTeX to
> read it and throw an error. Wrap unused entries in `@comment{ ... }`
> instead, as the extra examples at the bottom of `bibliography.bib` do.

### An appendix

`chapters/appendices.tex` is already wired in. Add `\chapter{...}` blocks to
it — they will be lettered A, B, C automatically. If you do not need an
appendix, comment out this line in `Thesis_Book.tex`:

```latex
\input{chapters/appendices}
```

Remember that the appendix does **not** count towards the 50-page minimum.

---

## 8. Before you submit — checklist

- [ ] Every `[placeholder in square brackets]` deleted and replaced
- [ ] Cover page: correct title, name, roll, supervisor, month and year
- [ ] Both certificate pages correct; external member's department and
      university correct (they may not be RUET EEE)
- [ ] Abstract is one page and under **200 words**, with a keyword line
- [ ] List of Abbreviations and List of Symbols reflect what you actually used
- [ ] At least **50 pages** of chapters, excluding references and appendices
- [ ] Every table caption is **above** its table; every figure caption is
      **below** its figure
- [ ] Every graph has both axes labelled, with units
- [ ] No colour or vertical rules in tables
- [ ] Every figure and table is referred to from the text by number
- [ ] References are complete and in IEEE format; every entry is cited
- [ ] Compiled the full four-pass sequence, so the Contents, List of
      Figures, List of Tables and References all show correct page numbers
- [ ] Roman numerals run ii–xii, Arabic numerals start at 1 on Chapter 1
- [ ] Similarity index checked with your supervisor
      (**maximum accepted plagiarism is 30% excluding references**)
- [ ] Checked the final PDF against the latest official Department
      instruction

A note the manual states plainly, in its own words: the use of AI tools is
strongly prohibited, and AI-generated text will be checked. This template
gives you *structure and formatting*; the research, the analysis and every
sentence of the writing must be your own.

---

## 9. Troubleshooting

**"Font Times New Roman not found"** — you will not see this error; the
template falls back automatically. See §4.

**References show as `[?]`** — you did not run BibTeX, or you did not run
XeLaTeX twice afterwards. Use the four-command sequence in §3.

**Contents shows the wrong page numbers** — same cause. Compile again.

**`IEEEtran.bst not found`** — your LaTeX installation is missing the
`IEEEtran` package. On TeX Live: `tlmgr install IEEEtran`. On MiKTeX it
installs on demand. Tectonic and Overleaf both have it already.

**A figure jumped to the wrong page** — that is LaTeX moving a float to
where it fits. Use `[!t]` or `[!b]`, and remember the manual asks for
figures and tables at the top or bottom of a page anyway. Never use `[H]`
to force a position; it creates large ugly gaps.

**The logo is missing** — check that `assets/ruet_logo_color.png` still
exists and that the path in `config.tex` matches.
