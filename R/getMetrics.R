
#' Returns the metrics for a valid total impact ID
#'
#' @param id = NA A total impact ID
#' @export
#' @seealso \code{tiid}
#' @examples \dontrun{
#' metrics(id = '0df8aa0eb2c911e19e181231381b0f5a')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
metrics <- function(id = NA) {
if(is.null(id))
	stop('A total impact id was not specified', call.=FALSE)

metrics <- getURL(paste0('http://api.total-impact.org/item/', id))
 if(length(grep('404', metrics))>0 && grep('404', metrics)==1) {
	stop("No metics found on supplied total impact ID. Supplied ID may not be valid", call.= FALSE)
}

metric_data <- fromJSON(metrics)
return(metric_data)
}

