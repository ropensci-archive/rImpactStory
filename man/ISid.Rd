\name{ISid}
\alias{ISid}
\title{Retrieves the Impact Story ID for a given object.}
\usage{
  ISid(id = NULL, nspace = "doi")
}
\arguments{
  \item{id}{= NULL <what param does>}

  \item{nspace}{Default is \code{doi} but can be changed to
  \code{github}, \code{url}, \code{pmid}. Others such as
  \code{Mendeley} and \code{arXiv} are forthcoming.}
}
\value{
  \code{list} if a valid Impact Story ID was found.
  Otherwise returns an error.
}
\description{
  If an object was previously queried at Impact Story, it
  will have a IS ID and this function will retrive that ID
  which can then be used to retrieve the latest metrics or
  add the item to a collecISon using
  \code{create_collection}. If the object doesn't exist in
  Impact Story, this will call \code{\link{create_ISid}}
  and return the newly assigned ID.
}
\examples{
\dontrun{
ISid('10.1038/nrg3270')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}
\seealso{
  \code{create_collecISon}
}

