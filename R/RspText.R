###########################################################################/**
# @RdocClass RspText
#
# @title "The RspText class"
#
# \description{
#  @classhierarchy
#
#  An RspText is an @see "RspConstruct" that represents a plain text
#  section, i.e. everything that is inbetween any other types of
#  @see "RspConstruct":s.
#  Its content is independent of the underlying programming language.
# }
#
# @synopsis
#
# \arguments{
#   \item{text}{A @character string.}
#   \item{escape}{If @TRUE, character sequences \code{<\%} and \code{\%>}
#                 are escaped to \code{<\%\%} and \code{\%\%>}.}
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
#
# @author
#
# @keyword internal
#*/###########################################################################
setConstructorS3("RspText", function(text=character(), escape=FALSE, ...) {
  if (escape) {
    text <- escapeRspTags(text)
  }
  extend(RspConstruct(text), "RspText")
})


setMethodS3("getInclude", "RspText", function(object, ...) {
  TRUE
})


#########################################################################/**
# @RdocMethod getContent
#
# @title "Gets the contents of the RSP text"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{unescape}{If @TRUE, character sequences \code{<\%\%} and
#                \code{\%\%>} are unescaped to \code{<\%} and \code{\%>}.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("getContent", "RspText", function(text, unescape=FALSE, ...) {
  text <- as.character(text)
  if (unescape) {
    text <- unescapeRspTags(text)
  }
  text
})


setMethodS3("asRspString", "RspText", function(text, ...) {
  RspString(getContent(text))
})
