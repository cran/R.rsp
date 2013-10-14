###########################################################################
## This 'tangle' R script was created from an RSP document.
## RSP source document: 'NonSweaveVignettes.tex.rsp'
## Metadata 'title': 'Include RSP and other non-Sweave vignettes in R packages'
## Metadata 'author': 'Henrik Bengtsson'
## Metadata 'keywords': 'R, package, vignette, static PDF'
## Metadata 'engine': 'R.rsp::rsp'
###########################################################################

t0 <- Sys.time()
R.rsp <- R.oo::Package("R.rsp");
format(as.Date(R.rsp$date), format="%B %d, %Y")
pathMk <- file.path("doc", "templates", fsep="/");
pathMk
pathMk
{pathname <- system.file(pathMk, "Makefile", package="R.rsp");
bfr <- readLines(pathname, warn=FALSE);
rr <- grep("^# HISTORY", bfr);
if (length(rr) > 0) {
  bfr <- bfr[1:(rr-2L)];
}
bfr <- gsub("\t", "    ", bfr, fixed=TRUE);
paste(bfr, collapse="\n");}
pathMk
{pathname <- system.file(pathMk, ",install_extras", package="R.rsp");
bfr <- readLines(pathname, warn=FALSE);
rr <- grep("^# HISTORY", bfr);
if (length(rr) > 0) {
  bfr <- bfr[1:(rr-2L)];
}
bfr <- gsub("\t", "    ", bfr, fixed=TRUE);
paste(bfr, collapse="\n");}
pathMk
{pathname <- system.file(pathMk, "dummy.Rnw", package="R.rsp");
bfr <- readLines(pathname, warn=FALSE);
rr <- grep("^# HISTORY", bfr);
if (length(rr) > 0) {
  bfr <- bfr[1:(rr-2L)];
}
bfr <- gsub("\t", "    ", bfr, fixed=TRUE);
paste(bfr, collapse="\n");}
toLatex(sessionInfo())
dt <- round(Sys.time()-t0, digits=2)
attr(dt, "units")
