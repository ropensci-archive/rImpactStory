\name{metrics}
\alias{metrics}
\title{Returns the metrics for a valid ImpactStory ID}
\usage{
  metrics(id = NULL, nspace = "doi", addifnot = FALSE,
    sleep = 0.5,
    key = getOption("ImpactStoryKey", stop("Missing ImpactStory consumer key")))
}
\arguments{
  \item{key}{An ImpactStory API key}

  \item{id}{An object ID}

  \item{nspace}{Namespace for the identifier. Valid
  namespaces include doi, github (among others). Read more
  about available metrics here:
  \url{http://impactstory.org/faq}}

  \item{addifnot}{If TRUE, the function makes a call to
  \code{create_ISid} to put the object in ImpactStory, then
  the call is made again to retrieve data. If FALSE, and if
  the identifier is not found, a message returns saying so.
  Default is FALSE.}

  \item{sleep}{Number of seconds to sleep between pings to
  retrieve data after posting item to ImpactStory database.
  Only used if addifnot=TRUE. This is done so as not to hit
  their servers too hard.}

  \item{key}{Your ImpactStory API key.}
}
\description{
  Returns the metrics for a valid ImpactStory ID
}
\examples{
\dontrun{
Get metrics on a github repo (username,reponame)
metrics('karthikram,rtools', nspace ='github')
Get metrics on an article from its DOI
metrics('10.1038/171737a0')
# metrics on a figshare document
metrics('10.6084/m9.figshare.91458')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

