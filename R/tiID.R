
#' Retrieves the total impact ID for a given object.
#'
#' If an object was previously queried at total impact, it will have a ti ID and this function will retrive that ID which can then be used to retrieve the latest metrics or add the item to a collection using \code{\link{create_collection}}. If the object doesn't exist in Total Impact, this will call \code{\link{create_tiid}} and return the newly assigned ID.
#' @param id = NULL <what param does>
#' @param  nspace Default is \code{doi} but can be changed to \code{github}, \code{url}, \code{pmid}. Others such as \code{Mendeley} and \code{arXiv} are forthcoming.
#' @export
#' @seealso \code{create_collection}
#' @return \code{list} if a valid total impact ID was found. Otherwise returns an error.
#' @examples \dontrun{
#' get_tiid('10.1038/nrg3270')
#'}
tiid <- function(id = NULL, nspace = "doi") {
tiid <- getURL(paste0('http://api.total-impact.org/tiid/', nspace, "/", id))
 if(length(grep('404', tiid))>0 && grep('404', tiid)==1) {
	  create_tiid(id, nspace)
} else {
return(str_sub(tiid, start=2, end=-2))
		}
}


#' Creates a total impact ID for a new object.
#'
#' @param id The id of an object. If you specify a \code{doi}, then leave the namespace blank. Otherwise please specify the namespace. Currently acceptable namespaces are \code{github}, \code{url}, and \code{pmid} (the last one is new and experimetal as of 09/07/2012)
#' @param  nspace = 'doi' <what param does>
#' @export
#' @return character
#' @examples \dontrun{
#' create_tiid('10.1038/nrg3270')
#'}
create_tiid <- function(id = NULL, nspace = 'doi') {
    new_id <- postForm(paste0("http://api.total-impact.org/item/", nspace, "/", id), args = NULL, style = "POST")  
    return(str_sub(new_id[1], start = 2, end = -2))
}

