
#' Retrieves the Impact Story ID for a given object.
#'
#' If an object was previously queried at Impact Story, it will have a IS ID and this function will retrive that ID which can then be used to retrieve the latest metrics or add the item to a collecISon using \code{create_collection}. If the object doesn't exist in Impact Story, this will call \code{\link{create_ISid}} and return the newly assigned ID.
#' @param id = NULL <what param does>
#' @param  nspace Default is \code{doi} but can be changed to \code{github}, \code{url}, \code{pmid}. Others such as \code{Mendeley} and \code{arXiv} are forthcoming.
#' @export
#' @seealso \code{create_collecISon}
#' @return \code{list} if a valid Impact Story ID was found. Otherwise returns an error.
#' @examples \dontrun{
#' ISid('10.1038/nrg3270')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
ISid <- function(id = NULL, nspace = "doi") {
ISid <- getURL(paste0('http://api.impactstory.org/tiid/', nspace, "/", id))
 if(length(grep('404', ISid))>0 && grep('404', ISid)==1) {
	  create_ISid(id, nspace)
} else {
return(str_sub(ISid, start=2, end=-2))
		}
}


#' Creates a Impact Story ID for a new object.
#'
#' @param id The id of an object. If you specify a \code{doi}, then leave the namespace blank. Otherwise please specify the namespace. Currently acceptable namespaces are \code{github}, \code{url}, and \code{pmid} (the last one is new and experimetal as of 09/07/2012)
#' @param  nspace = 'doi' <what param does>
#' @export
#' @return character
#' @examples \dontrun{
#' create_ISid('10.1038/nrg3270')
#'}
create_ISid <- function(id = NULL, nspace = 'doi') {
    new_id <- postForm(paste0("http://api.impactstory.org/item/", nspace, "/", id), args = NULL, style = "POST")  
    return(str_sub(new_id[1], start = 2, end = -2))
}

