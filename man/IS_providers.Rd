\name{IS_providers}
\alias{IS_providers}
\title{Returns a list of current ImpactStory data providers}
\usage{
  IS_providers(key = getOption("ImpactStoryKey", stop("Missing ImpactStory consumer key")),
    as.df = FALSE)
}
\arguments{
  \item{key}{An ImpactStory API key}

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
write.csv(t1_providers(as.df = TRUE), file = "ImpactStory_metadata.csv")
 # will write the data to a flat csv file.
 # Note: The coercion will not be entirely clean due to the variable number of fields under description for each metric provider.
}
}
\author{
  Karthik Ram \email{karthik.ram@gmail.com}
}

