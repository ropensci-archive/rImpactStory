
#' Returns the metrics for a valid ImpactStory ID
#'
#' @param key An ImpactStory API key
#' @param id  An object ID
#' @param nspace Namespace for the identifier. Valid namespaces include doi, github (among others). Read more about available metrics here: \url{http://impactstory.org/faq}
#' @export
#' @examples \dontrun{
#' Get metrics on a github repo (username,reponame)
#' metrics('karthikram,rtools', nspace ='github')
#' Get metrics on an article from its DOI
#' metrics('10.1038/171737a0')
#' # metrics on a figshare document
#' metrics('10.6084/m9.figshare.91458')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
metrics <- function(id = NULL, nspace = 'doi', key = getOption("ImpactStoryKey", stop("Missing Dropbox consumer key"))) {
if(is.null(id))
	stop("No id specified", call.=FALSE)

metrics <- getURL(paste0("http://api.impactstory.org/v1/item/", nspace, "/", id, "?key=", key))

 if(length(grep('404 Not Found', metrics))>0 && grep('404 Not Found', metrics)==1) {
	stop("Item not found in ImpactStory database.", call.= FALSE)
}

metric_data <- fromJSON(metrics, depth = 150L)
return(metric_data)
}

