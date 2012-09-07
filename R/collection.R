
#' Retrives metadata on a valid Total Impact collection ID
#'
#' @return a \code{list} with the following fields: \item{_id}{id #} \item{_rev}{revision #} \item{created}{created on} \item{ip_address}{ip address of creation} \item{items}{list of items} \item{key_hash}{} \item{last_modified}{} \item{owner}{} \item{title}{} \item{type}{}.
#' @param collection_id A total impact collection id
#' @export
#' @examples \dontrun{
#' collection_metadata('kn5auf')
#'}
collection_metadata <- function(collection_id = NULL) {
	if(is.null(collection_id))
		stop('Did not specify a collection ID', call.=FALSE)

	collection_data <- getURL(paste0('http://api.total-impact.org/collection/', collection_id))
	if(length(grep('404', collection_data))>0 && grep('404', collection_data)==1) {
						stop('No metadata found for supplied collection id', call.=FALSE)

		}  else {
				cmd_results <- fromJSON(collection_data)
				return(cmd_results)
		}
}



#' Creates a collection from a list of total impact ids (not working)
#'
#' @param title Title of the collection
#' @param  objects a \code{list} of total impact ids.
#' @export
#' @return collection id
#' @examples \dontrun{
#' create_collection(title="my collection", list_of_items) # list must be valid total impact IDs.
#'}
create_collection <- function(title = NULL, objects = NULL) {
	if(is.null(title))
		stop("Please specify a title for your collection", call.=FALSE)

	if(is.null(objects) || class(objects)!=list)
		stop("You need to specify a list of objects to curate into a collection", call.=FALSE)

	object_list <- toJSON(objects)		

}


    new_id <- postForm('http://api.total-impact.org/collection', args = object_list, style = "POST")  
    return(stringr::str_sub(new_id[1], start = 2, end = -2))