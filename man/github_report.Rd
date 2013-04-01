\name{github_report}
\alias{github_report}
\title{github report}
\usage{
  github_report(impact_report_id,
    key = getOption("ImpactStoryKey", stop("Missing ImpactStory consumer key")))
}
\arguments{
  \item{impact_report_id}{ImpactStory collection ID}

  \item{key}{ImpactStory API key. Contact: team at
  impactstory.org}
}
\value{
  \code{data.frame}
}
\description{
  Generates a report on a collection of GitHub repositories
}
\examples{
\dontrun{
df <- github_report("d4npn7")
# To visualize this, then use
github_plot(df)
}
}
\seealso{
  github_plot
}

