\name{IS_providers}
\alias{IS_providers}
\title{Returns a list of current ImpactStory data providers}
\usage{
  IS_providers(as.df = FALSE)
}
\arguments{
  \item{as.df}{= \code{FALSE}. Returns a \code{data.frame}
  instead of a list.}
}
\value{
  \code{list}
}
\description{
  Returns a list of current ImpactStory data providers
}
\examples{
\dontrun{
IS_providers()
IS_providers(as.df = TRUE)
write.csv(t1_providers(as.df = TRUE), file = "total-impact-metadata.csv")
 # will write the data to a flat csv file.
 # Note: The coercion will not be enISrely clean due to the variable number of fields under descripISon for each metric provider.
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

