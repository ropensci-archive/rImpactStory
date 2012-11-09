\name{about_IS}
\alias{about_IS}
\title{About ImpactStory}
\usage{
  about_IS(as.df = FALSE)
}
\arguments{
  \item{as.df}{Default is \code{FALSE}. Set this to
  \code{TRUE} if you would like a \code{data.frame}
  returned instead.}
}
\value{
  \code{list}
}
\description{
  Retrieves the latest information about the ImpactStory
  API
}
\examples{
\dontrun{
about_IS()
about_IS(as.df = TRUE) # will return a nicely formatted data.frame
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

