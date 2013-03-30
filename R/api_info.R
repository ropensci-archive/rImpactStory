
#' About ImpactStory
#'
#' Retrieves the latest information about the ImpactStory API. This package now requires an API key. You can obtain one by emailing \code{team at impactstory dot org}. Then the key can be saved in your \code{.rprofile} as \code{options(ImpactStoryKey="YOUR_KEY")} or specified inline with each function call. Any API call cannot go through without a valid key.
#' @param key An ImpactStory API key
#' @param as.df Default is \code{FALSE}. Set this to \code{TRUE} if you would like a \code{data.frame} returned instead.
#' @export
#' @return \code{list}
#' @examples \dontrun{
#' about_IS()
#' about_IS(as.df = TRUE) # will return a nicely formatted data.frame
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
about_IS <- function(key = getOption("ImpactStoryKey", stop("Missing ImpactStory consumer key")), as.df = FALSE) {

base_url <- "http://api.impactstory.org/v1"
 url <- paste(base_url, "?key=", key, sep="")
 about <- getURL(url)
 about <- as.list(fromJSON(I(about)))
 if(!as.df) {
 	return(about)
 	} else {
 		about_df <- ldply(about)
 		names(about_df) <- c("Name", "Value")
 		return(about_df)
 	}
}
