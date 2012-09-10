\name{tiid}
\alias{tiid}
\title{Retrieves the total impact ID for a given object.}
\usage{
  tiid(id = NULL, nspace = "doi")
}
\arguments{
  \item{id}{= NULL <what param does>}

  \item{nspace}{Default is \code{doi} but can be changed to
  \code{github}, \code{url}, \code{pmid}. Others such as
  \code{Mendeley} and \code{arXiv} are forthcoming.}
}
\value{
  \code{list} if a valid total impact ID was found.
  Otherwise returns an error.
}
\description{
  If an object was previously queried at total impact, it
  will have a ti ID and this function will retrive that ID
  which can then be used to retrieve the latest metrics or
  add the item to a collection using
  \code{\link{create_collection}}. If the object doesn't
  exist in Total Impact, this will call
  \code{\link{create_tiid}} and return the newly assigned
  ID.
}
\examples{
\dontrun{
get_tiid('10.1038/nrg3270')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}
\seealso{
  \code{create_collection}
}

