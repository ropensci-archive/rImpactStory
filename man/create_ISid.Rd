\name{create_ISid}
\alias{create_ISid}
\title{Creates a ImpactStory ID for a new object. (This function will be deprecated shortly since Impact Story plans to discontinue assinging their own IDs)}
\usage{
  create_ISid(id = NULL, nspace = "doi",
    key = getOption("ImpactStoryKey", stop("Missing ImpactStory consumer key")))
}
\arguments{
  \item{id}{The id of an object. If you specify a
  \code{doi}, then leave the namespace blank. Otherwise
  please specify the namespace. Currently acceptable
  namespaces are \code{github}, \code{url}, and \code{pmid}
  (the last one is new and experimetal as of 09/07/2012)}

  \item{nspace}{Default is \code{doi}}

  \item{key}{An ImpactStory API key}
}
\value{
  character
}
\description{
  Creates a ImpactStory ID for a new object. (This function
  will be deprecated shortly since Impact Story plans to
  discontinue assinging their own IDs)
}
\examples{
\dontrun{
create_ISid(id='10.1038/nrg3270')
}
}

