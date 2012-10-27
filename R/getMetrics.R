
#' Returns the metrics for a valid Impact Story ID
#'
#' @param id = NA A Impact Story ID
#' @export
#' @seealso \code{ISid}
#' @examples \dontrun{
#' my_id <- ISid('10.1890/ES11-00339.1')	
#' metrics(my_id)
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
metrics <- function(id = NA) {
if(is.null(id))
	stop('A Impact Story id was not specified', call.=FALSE)

metrics <- getURL(paste0('http://api.impactstory.org/item/', id))
 if(length(grep('404', metrics))>0 && grep('404', metrics)==1) {
	stop("No metrics found on supplied Impact Story ID. Supplied ID may not be valid", call.= FALSE)
}

metric_data <- fromJSON(metrics, depth = 150L)
return(metric_data)
}

