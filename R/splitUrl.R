###########################################################################/**
# @RdocDefault splitUrl
#
# @title "Decomposes a URL into its components"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{url}{A @character string.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a named @list of URL components.
# }
#
# @author
#
# \references{
#  [1] \url{https://en.wikipedia.org/wiki/URI_scheme}
# }
#
# @keyword IO
# @keyword programming
# @keyword internal
#*/###########################################################################
setMethodS3("splitUrl", "default", function(url, ...) {
  # Argument 'url':
  url <- Arguments$getCharacter(url, asGString=FALSE)
  if (length(url) == 0L) {
    return(NULL)
  }

  if (!hasUrlProtocol(url)) {
    throw("Can not split URL. Not a valid URL: ", url)
  }

  # Get the protocol
  pattern <- "^([abcdefghijklmnopqrstuvwxyz]+)(://)(.*)"
  protocol <- gsub(pattern, "\\1", url, ignore.case=TRUE)
  tail <- gsub(pattern, "\\3", url, ignore.case=TRUE)

  host <- NULL
  path <- NULL
  query <- NULL
  fragment <- NULL
  parameters <- NULL

  # Get the host
  parts <- strsplit(tail, split="/", fixed=TRUE)[[1L]]
  if (length(parts) > 0L) {
    host <- parts[1L]
    tail <- paste(parts[-1L], collapse="/")

    # Get the path
    parts <- strsplit(tail, split="?", fixed=TRUE)[[1L]]
    if (length(parts) > 0L) {
      path <- parts[1L]
      tail <- paste(parts[-1L], collapse="/")

      # Get the query and fragment
      parts <- strsplit(tail, split="#", fixed=TRUE)[[1L]]
      query <- parts[1L]
      fragment <- paste(parts[-1L], collapse="#")

      # Get the parameters
      parts <- strsplit(query, split="&", fixed=TRUE)[[1L]]
      if (length(parts) > 0L) {
        parts <- strsplit(parts, split="=", fixed=TRUE)
        if (length(parts) > 0L) {
          names <- unlist(lapply(parts, FUN=function(x) x[1L]), use.names=FALSE)
          parameters <- lapply(parts, FUN=function(x) paste(x[-1L], collapse="="))
          names(parameters) <- names
        }
      }
    }
  }

  list(protocol=protocol, host=host, path=path,
       query=query, fragment=fragment, parameters=parameters)
})
