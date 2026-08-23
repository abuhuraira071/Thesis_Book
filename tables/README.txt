TABLES FOLDER
=============

Most tables are written directly inside the chapter .tex files - that is the
simplest approach and it is what the worked example in
chapters/chapter3_results_discussion.tex does.

Use this folder when a table is very long or you want to reuse it. Save it
as its own file, for example tables/comparison_table.tex, containing only:

    \begin{table}[!t]
    \centering
    % EEE requirement: table title/caption is above the table and center aligned.
    \caption{Comparison of the reviewed methods.}
    \label{tab:comparison}
    \begin{tabular}{lccc}
    \toprule
    ...
    \bottomrule
    \end{tabular}
    \end{table}

Then pull it into a chapter with:

    \input{tables/comparison_table}

EEE MANUAL REQUIREMENTS FOR TABLES
----------------------------------
* The title/caption goes ABOVE the table and is centre aligned, so \caption
  comes before \begin{tabular}.
* Follow the IEEE table style: horizontal rules only (\toprule, \midrule,
  \bottomrule from the booktabs package), no vertical rules.
* Avoid unnecessary colours and decorative shading.
* Place tables preferably at the top or the bottom of a page - use [!t]
  or [!b].
* Refer to every table from the text by its number: Table~\ref{tab:comparison}.

If a table is wider than the text block, try \small or \footnotesize before
the tabular, or rotate it with the sidewaystable environment from the
rotating package. If it is longer than a page, use the longtable environment
(already loaded in format.tex).
