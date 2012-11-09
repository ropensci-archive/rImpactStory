\name{metrics}
\alias{metrics}
\title{Returns the metrics for a valid Impact Story ID}
\usage{
  metrics(id = NULL, nspace = "doi")
}
\arguments{
  \item{id}{An Impact Story ID}

  \item{nspace}{Namespace for the identifier. Valid
  namespaces include doi, github (among others). Read more
  about available metrics here: http://impactstory.org/faq}
}
\description{
  Returns the metrics for a valid Impact Story ID
}
\examples{
\dontrun{
Get metrics on a github repo
metrics('karthikram,rtools', 'github')
Get metrics on an article from its DOI
metrics('10.1038/171737a0')
# metrics on a figshare document
metrics('10.6084/m9.figshare.97222', 'figshare')
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

