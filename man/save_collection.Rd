\name{save_collection}
\alias{save_collection}
\title{Saves metrics from a collection to a csv file}
\usage{
  save_collection(cid = NULL, file = NULL)
}
\arguments{
  \item{cid}{A valid ImpactStory collection ID}

  \item{file}{A filename for the \code{csv} file including
  path. If left blank, the file is named after the
  collection and stored in the current working directory.}
}
\description{
  Saves metrics from a collection to a csv file
}
\examples{
\dontrun{
save_collection('kn5auf', file = '~/Desktop/test.csv')
}
}

