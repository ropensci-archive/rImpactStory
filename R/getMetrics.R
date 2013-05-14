
#' Returns the metrics for a valid ImpactStory ID
#'
#' @param key An ImpactStory API key
#' @param id  An object ID
#' @param nspace Namespace for the identifier. Valid namespaces include doi, github (among others). Read more about available metrics here: \url{http://impactstory.org/faq}
#' @param addifnot If TRUE, the function makes a call to \code{create_ISid} to put the object in ImpactStory, then the call is made again to retrieve data. If FALSE, and if the identifier is not found, a message returns saying so. Default is FALSE.
#' @param sleep Number of seconds to sleep between pings to retrieve data after posting item to ImpactStory database. Only used if addifnot=TRUE. This is done so as not to hit their servers too hard.
#' @param key Your ImpactStory API key.
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
metrics <- function(id = NULL, nspace = 'doi', addifnot = FALSE, sleep = 0.5, key = getOption("ImpactStoryKey", stop("Missing ImpactStory consumer key"))) {
  if(is.null(id))
    stop("No id specified", call.=FALSE)
  
  metrics <- getURL(paste0("http://api.impactstory.org/v1/item/", nspace, "/", id, "?key=", key))
  
  if(length(grep('404 Not Found', metrics))>0 && grep('404 Not Found', metrics)==1) {
    if(addifnot){
      create_ISid(id=id)
      message("item added to ImpactStory database")
      check <- TRUE
      while(check){
        Sys.sleep(sleep)
        metrics <- fromJSON(getURL(paste0("http://api.impactstory.org/v1/item/", nspace, "/", id, "?key=", key)), depth=150L)
        check <- metrics$currently_updating
      }
      return(metrics)
    } else
    { 
      stop("Item not found in ImpactStory database.", call.= FALSE) 
    }
    #     metrics <- getURL(paste0("http://api.impactstory.org/v1/item/", nspace, "/", id, "?key=", key))
    #     stop("Item not found in ImpactStory database.", call.= FALSE)
  } else 
  {
    metric_data <- fromJSON(metrics, depth = 150L)
    return(metric_data)
  }
#   
#   metric_data <- fromJSON(metrics, depth = 150L)
#   return(metric_data)
}