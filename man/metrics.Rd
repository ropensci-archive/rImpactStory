\name{metrics}
\alias{metrics}
\title{Returns the metrics for a valid ImpactStory ID}
\usage{
  metrics(id = NULL, nspace = "doi")
}
\arguments{
  \item{id}{An ImpactStory ID}

  \item{nspace}{Namespace for the identifier. Valid
  namespaces include doi, github (among others). Read more
  about available metrics here:
  \url{http://impactstory.org/faq}}
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

