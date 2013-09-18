###########################################################################
## This 'tangle' R script was created from an RSP document.
## RSP source document: 'Dynamic_document_creation_using_RSP.tex.rsp'
## Metadata 'title': 'Dynamic document creation using RSP'
## Metadata 'keywords': 'RSP markup language, literate programming, reproducible research, report generator, Sweave, knitr, brew, noweb, TeX, LaTeX, Markdown, AsciiDoc, reStructuredText, Org-Mode, HTML, PDF'
## Metadata 'author': 'Henrik Bengtsson'
## Metadata 'engine': 'R.rsp::rsp'
###########################################################################

# Required R packages
library("R.rsp")
library("R.devices")
hpaste <- R.utils::hpaste
t0 <- Sys.time()
R.rsp$version
R.rsp$author
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Set default graphics options
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Use greater objects by default
options("devNew/args/par"=list(lwd=2));

# Change the default dimensions for PNGs
devOptions("png", width=840)
format(as.Date(R.rsp$date), format="%B %d, %Y")
Sys.Date()
LETTERS
hpaste(LETTERS)
n <- length(letters)
for (i in 1:n) {
letters[i]
LETTERS[i]
if(i < n) ", "
}
myTemplate <- function(n, ...) {
hpaste(1:n, abbreviate="\\ldots")
sum(1:n)
} # myTemplate()
myTemplate(n=3)
for (ii in c(3,5,10,100)) {
myTemplate(ii)
} # for (ii ...)
s <- "will have its surrounding whitespace"
s
toPDF("MyFigure,yeah,cool", aspectRatio=0.6, {
   curve(dnorm, from=-5, to=+5);
  })
evalCapture({
for (kk in 1:3) {
  cat("Iteration #", kk, "\n", sep="")
}

print(Sys.time())
type <- "horse";  # Comments are dropped
type
})
toLatex(sessionInfo())
dt <- round(Sys.time()-t0, digits=2)
attr(dt, "units")
