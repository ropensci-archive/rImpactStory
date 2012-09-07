\name{create_tiid}
\alias{create_tiid}
\title{Creates a total impact ID for a new object.}
\usage{
  create_tiid(id = NULL, nspace = "doi")
}
\arguments{
  \item{id}{The id of an object. If you specify a
  \code{doi}, then leave the namespace blank. Otherwise
  please specify the namespace. Currently acceptable
  namespaces are \code{github}, \code{url}, and \code{pmid}
  (the last one is new and experimetal as of 09/07/2012)}

  \item{nspace}{= 'doi' <what param does>}
}
\value{
  character
}
\description{
  Creates a total impact ID for a new object.
}
\examples{
\dontrun{
create_tiid('10.1038/nrg3270')
}
}

