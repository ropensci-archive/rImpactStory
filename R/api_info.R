
#' About Total Impact
#'
#' Retrieves the latest information about the Total Impact API
#' @param as.df Default is \code{FALSE}. Set this to \code{TRUE} if you would like a data.frame returned instead.
#' @export
#' @return \code{list}
#' @examples \dontrun{
#' about_ti()
#' about_ti(as.df = TRUE) # will return a nicely formatted data.frame
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
about_ti <- function(as.df = FALSE) {
 about <- getURL('http://api.total-impact.org')
 about <- as.list(fromJSON(I(about)))
 if(!as.df) { 
 	return(about)
 	} else {
 		about_df <- ldply(about)
 		names(about_df) <- c("Name", "Value")
 		return(about_df)
 	}
}
