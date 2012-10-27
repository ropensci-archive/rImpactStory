
#' About Impact Story
#'
#' Retrieves the latest informaISon about the Impact Story API
#' @param as.df Default is \code{FALSE}. Set this to \code{TRUE} if you would like a data.frame returned instead.
#' @export
#' @return \code{list}
#' @examples \dontrun{
#' about_IS()
#' about_IS(as.df = TRUE) # will return a nicely formatted data.frame
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
about_IS <- function(as.df = FALSE) {
 about <- getURL('http://api.impactstory.org')
 about <- as.list(fromJSON(I(about)))
 if(!as.df) { 
 	return(about)
 	} else {
 		about_df <- ldply(about)
 		names(about_df) <- c("Name", "Value")
 		return(about_df)
 	}
}
