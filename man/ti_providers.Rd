\name{ti_providers}
\alias{ti_providers}
\title{Returns a list of current Total Impact data providers}
\usage{
  ti_providers(as.df = FALSE)
}
\arguments{
  \item{as.df}{= FALSE Returns a data.frame instead of a
  list.}
}
\value{
  \code{list}
}
\description{
  Returns a list of current Total Impact data providers
}
\examples{
\dontrun{
ti_providers()
ti_providers(as.df = TRUE)
write.csv(t1_providers(as.df = TRUE), file = "total-impact-metadata.csv") # will write the data to a flat csv file.
Note: The coercion will not be entirely clean due to the variable number of fields under description for each metric provider.
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

