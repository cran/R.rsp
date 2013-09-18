###########################################################################
## This 'tangle' R script was created from an RSP document.
## RSP source document: 'RSP-intro.md.rsp'
## Metadata 'title': 'Introductory slides on RSP'
## Metadata 'keywords': 'RSP markup language, literate programming, reproducible research, report generator, Sweave, knitr, brew, noweb, TeX, LaTeX, Markdown, AsciiDoc, reStructuredText, Org-Mode, HTML, PDF'
## Metadata 'author': 'Henrik Bengtsson'
## Metadata 'engine': 'R.rsp::md.rsp+knitr:pandoc'
###########################################################################

t0 <- Sys.time()
Sys.setenv("R.rsp/pandoc/args/format"="dzslides");
R.rsp <- R.oo::Package("R.rsp")
library("R.devices")
options("devEval/args/field"="dataURI")
devOptions("png", width=840)
page <- 2L; maxSlide <- 15L;
slide <- function(title) {
title
format(as.Date(R.rsp$date), format="%Y-%m-%d")
page
if (!is.null(maxSlide)) {
maxSlide
}
page <<- page + 1L
} # slide()
format(as.Date(R.rsp$date), format="%B %d, %Y")
slide("RSP: Hello world!")
slide("Objectives")
slide("Compiling RSP document into PDF, HTML, ...")
slide("Very simple idea: Translate RSP to R and evaluate")
slide("RSP Markup Language")
slide("RSP Markup Language")
slide("RSP Markup Language")
slide("RSP Markup Language")
slide("Looping over mixtures of code and text")
slide("RSP template functions")
slide("R.rsp package - RSP engine for R")
slide("rfile() - end-to-end compilation")
slide("Including graphics (using R.devices package)")
toPNG("MyFigure,yeah,cool", aspectRatio=0.5, {
  par(cex=2, mar=c(4,3,1,1), mgp=c(1.8,0.5,0))
  curve(dnorm, from=-5, to=+5);
})
slide("Appendix")
print(sessionInfo())
dt <- round(Sys.time()-t0, digits=2)
attr(dt, "units")
