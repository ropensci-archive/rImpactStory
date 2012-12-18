\name{about_IS}
\alias{about_IS}
\title{About ImpactStory}
\usage{
  about_IS(key = getOption("ImpactStoryKey", stop("Missing Dropbox consumer key")),
    as.df = FALSE)
}
\arguments{
  \item{key}{An ImpactStory API key}

  \item{as.df}{Default is \code{FALSE}. Set this to
  \code{TRUE} if you would like a \code{data.frame}
  returned instead.}
}
\value{
  \code{list}
}
\description{
  Retrieves the latest information about the ImpactStory
  API. This package now requires an API key. You can obtain
  one by emailing \code{team at impactstory dot org}. Then
  the key can be saved in your \code{.rprofile} as
  \code{options(ImpactStoryKey="YOUR_KEY")} or specified
  inline with each function call. Any API call cannot go
  through without a valid key.
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

