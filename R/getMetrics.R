
#' Returns the metrics for a valid Impact Story ID
#'
#' @param id  An Impact Story ID
#' @param nspace Namespace for the identifier. Valid namespaces include doi, github (among others).
#' @export
#' @examples \dontrun{
#' Get metrics on a github repo
#' metrics('karthikram,rtools', 'github')
#' Get metrics on an article from its DOI
#' metrics('10.1038/171737a0')
#' # metrics on a figshare document
#' metrics('10.6084/m9.figshare.97222', 'figshare')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
metrics <- function(id = NULL, nspace = 'doi') {
if(is.null(id))
	stop("No id specified", call.=FALSE)

id2 <- ISid(id, nspace)	

metrics <- getURL(paste0("http://api.impactstory.org/item/", id2))


 if(length(grep('404 Not Found', metrics))>0 && grep('404 Not Found', metrics)==1) {
	stop("No metrics found on supplied Impact Story ID. Supplied ID may not be valid", call.= FALSE)
}

metric_data <- fromJSON(metrics, depth = 150L)
return(metric_data)
}

