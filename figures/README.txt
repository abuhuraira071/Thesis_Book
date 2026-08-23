FIGURES FOLDER
==============

Put every image used in your thesis in this folder.

HOW TO USE
----------
Because Thesis_Book.tex sets \graphicspath{{figures/}{assets/}}, you can write just
the file name:

    \begin{figure}[!t]
      \centering
      \includegraphics[width=0.65\textwidth]{my_block_diagram.pdf}
      \caption{Block diagram of the proposed system.}
      \label{fig:block_diagram}
    \end{figure}

FILE FORMAT
-----------
Best  : PDF or EPS  (vector - stays sharp at any zoom level)
Good  : PNG at 300 dpi or higher (for screenshots and oscilloscope captures)
Avoid : JPG for diagrams and plots - it blurs thin lines and text.

Export MATLAB/Simulink plots with:      exportgraphics(gcf,'name.pdf','ContentType','vector')
Export Python/matplotlib plots with:    plt.savefig('name.pdf', bbox_inches='tight')

EEE MANUAL REQUIREMENTS FOR FIGURES
-----------------------------------
* The caption goes BELOW the figure and is centre aligned.
* Figures must be of excellent quality and must keep their aspect ratio -
  give only a width in \includegraphics, never both width and height.
* Every graph axis must be labelled with the quantity and its unit.
* Do not place a figure immediately after a heading or subheading.
* Place figures preferably at the top or the bottom of a page - use [!t]
  or [!b].
* If a figure is taken from another source, cite it after the caption text.

NAMING
------
Use lower case, no spaces, and a descriptive name:
    ch3_efficiency_vs_load.pdf     not     Figure 1 (final)(2).png

The file example_figure_placeholder.png in this folder is only used by the
worked example in Chapter 3. Delete it once you have replaced the example.
