\name{about_ti}
\alias{about_ti}
\title{About Total Impact}
\usage{
  about_ti(as.df = FALSE)
}
\arguments{
  \item{as.df}{Default is \code{FALSE}. Set this to
  \code{TRUE} if you would like a data.frame returned
  instead.}
}
\value{
  \code{list}
}
\description{
  Retrieves the latest information about the Total Impact
  API
}
\examples{
\dontrun{
about_ti()
about_ti(as.df = TRUE) # will return a nicely formatted \\code{data.frame}
}
}

