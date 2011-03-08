#######################################################################
# DO NOT EDIT!  DO NOT EDIT!  DO NOT EDIT!  DO NOT EDIT!  DO NOT EDIT!
#
# This R code was parsed from RSP by the R.rsp package.
#######################################################################
# Sets the public RspPage 'page' object
page <- RspPage(pathname="R.rsp/inst/tex.rsp/report.tex.rsp");
# Gets the output connection (or filename) for the response [OBSOLETE]
out <- getOutput(response);
#======================================================================
# BEGIN RSP CODE
#======================================================================
write(response, "\\documentclass[letter,12pt]{article}\n\\usepackage{graphicx} \n\\graphicspath{{figures/}}\n\n");
setMethodS3("sendToPng", "default", function(..., width=840) {
 devEval(type="png", width=width, ..., force=TRUE)$fullname;
})
write(response, "\n\\newcommand{\\code}[1]{\\texttt{#1}}\n\n\n\\title{Dynamic LaTeX reports with RSP}\n\\author{Henrik Bengtsson}\n\n\\begin{document}\n\n\\maketitle\n\\begin{abstract}\nAn important part of a statistical analysis is to document the results.  A common approach is to build up an R script as the the analysis progresses.  This script may generate image files and tables that are later inserted manually into a, say, LaTeX report.  This strategy works alright for small one-off analyzes, whereas for larger and partly repetitive analyzes an automatic report generator is more suitable.\n\nIn this article, we will illustrate how a LaTeX document can be extended with the RSP markup language resulting in a very powerful tool for generating dynamic reports in R.  \nAs we will discover, with RSP it is possible to generate document constructs that are not possible in Sweave, e.g. looping of a mix of R and LaTeX blocks.\nThe strategy of using RSP is not limited to LaTeX, but can easily be used in combination of other text-based documentation langua");
write(response, "ge such as HTML, and plain text.\nThis article was itself written using LaTeX and RSP.\n\\end{abstract}\n\n\n\\section{Compiling LaTeX documents with RSP markups}\nIn order to compile an LaTeX+RSP document named \\code{report.tex.rsp} into a PDF, use the \\code{rsptex()} function as follows:\n\\begin{verbatim}\nlibrary(\"R.rsp\")\nrsptex(\"report.tex.rsp\")\n\\end{verbatim}\n\nThis will (i) translate the LaTeX RSP document into a valid R script (\\code{report.tex.rsp.R}), (ii) run the R script resulting in a LaTeX document (\\code{report.tex}), and (iii) compile the LaTeX document into a PDF (\\code{report.pdf}).\n\nYou can try to compile this document by calling\n\\begin{verbatim}\nlibrary(\"R.rsp\")\npath <- system.file(\"tex.rsp\", package=\"R.rsp\")\nrsptex(\"report.tex.rsp\", path=path)\n\\end{verbatim}\nThe PDF (\\code{report.pdf}) will be available in the current directory of R (see \\code{getwd()}).\n\n\n\\section{The RSP markup language}\n\n\\subsection{\\code{<\\%\\{R code\\}\\%>} - Evaluating R code}\nThe RSP markup \\code{<\\%\\{R code\\}\\%>} evaluates the R");
write(response, " code (without inserting it into the document)..  For instance,\n\\begin{verbatim}\n<\\%:\na <- 1\nb <- 2\n%>\n\\end{verbatim}\nevaluates the code such that \\code{a == 1} and \\code{b == 2} afterward.\n\n\n\\subsection{\\code{<\\%:\\{R code\\}\\%>} - Evaluating and displaying code blocks}\nJust as \\code{<\\%\\{R code\\}\\%>}, the RSP markup \\code{<\\%:\\{R code\\}\\%>} also evaluates core, but in addition it also inserts the code verbatim into the document.  For instance,\n\\begin{verbatim}\n<\\%:\na <- 1\nb <- 2\n%>\n\\end{verbatim}\nevaulates the code and inserts\n\\begin{verbatim}\n");
write(response, "a <- 1\nb <- 2\n");
a <- 1
b <- 2
write(response, "\\end{verbatim}\ninto the document.  Formatting of the inserted code has to be taken care of by LaTeX.  For instance, here we wrapped the RSP markup inside a \\code{{\\textbackslash}begin\\{verbatim\\} ... {\\textbackslash}end\\{verbatim\\}} block.\n\n\n\\subsection{\\code{<\\%=\\{R code\\}\\%>} - Inlining values of R variables}\nThe RSP markup \\code{<\\%=\\{R code\\}\\%>} evaluates the R code (without inserting it into the document) and inserts the character representation of the returned R object.  For instance,\n\\begin{verbatim}\nThere are <\\%=b%> elephants and 3 <\\%=\"horses\"%>\n\\end{verbatim}\nwould produce the string \"There are 2 elephants and 3 horses\", e.g.\n\\begin{verbatim}\n> sourceRsp(text='There are ");
# <%=b%>
write(response, b);
write(response, " elephants and 3 ");
# <%="horses"%>
write(response, "horses");
write(response, "')\nThere are 2 elephants and 3 horses\n\\end{verbatim}\n\n\n\\section{Generating and inserting figures}\n\n\\begin{figure}[htp]\n \\begin{center}\n \\resizebox{0.70\\textwidth}{!}{%\n  \\includegraphics{");
# <%=sendToPng(name="MyFigure", tags="yeah,cool",
# width=840, aspectRatio=0.75, {
#    plot(1:10);
#    abline(a=0, b=1);
#   })%>
write(response, sendToPng(name="MyFigure", tags="yeah,cool",
width=840, aspectRatio=0.75, {
   plot(1:10);
   abline(a=0, b=1);
  }));
write(response, "}\n }%\n \\end{center}\n \\caption{This figures was generated by an RSP code snippet and transparently inserted into the LaTeX document.}\n \\label{fig:MyFigure}\n\\end{figure}\n\n\\end{document}\n\n");
#======================================================================
# END RSP CODE
#======================================================================
