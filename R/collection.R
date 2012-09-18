
#' Retrives metadata on a valid Total Impact collection ID
#'
#' @return a \code{list} with the following fields: \item{_id}{id #} \item{_rev}{revision #} \item{created}{created on} \item{ip_address}{ip address of creation} \item{items}{list of items} \item{key_hash}{} \item{last_modified}{} \item{owner}{} \item{title}{} \item{type}{}.
#' @param collection_id A total impact collection id
#' @param as.csv Default is \code{FALSE}. Set to \code{TRUE} to return a .csv file. Use in conjunction with \code{\link{save_collection}}
#' @export
#' @examples \dontrun{
#' collection_metrics('kn5auf')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
collection_metrics <- function(collection_id = NULL, as.csv = FALSE) {
	if(is.null(collection_id))
		stop('Did not specify a collection ID', call.=FALSE)

collection_data <- getURL(paste0('http://api.total-impact.org/collection/', collection_id))		

	if(length(grep('404', collection_data))>0 && grep('404', collection_data)==1) {
						stop('No metadata found for supplied collection id', call.=FALSE)

		}  else {
						if(!as.csv) {	
				collection_data <- getURL(paste0('http://api.total-impact.org/collection/', collection_id))
				cmd_results <- fromJSON(collection_data)
				return(cmd_results)
				} else {
				 collection_data <- getURL(paste0('http://api.total-impact.org/collection/', collection_id,".csv"))	
				 return(collection_data)
				}
				
		}
}


#'Saves metrics from a collection to a csv file 
#'
#' @param cid  A valid total Impact collection ID
#' @param  file A filename for the \code{csv} file including path. If left blank, the file is named after the collection and stored in the current working directory.
#' @export
#' @examples \dontrun{
#' save_collection('kn5auf', file = '~/Desktop/test.csv')
#'}
save_collection <- function(cid = NULL, file = NULL) {
 if(is.null(cid))
 	stop("You did not specify a collection ID", call.=FALSE)

 # If a file name was not specified, just use the collection ID 	
 if(is.null(file)) {
 	fname <- paste0(cid, ".csv")	
 	} else {
 	 fname <- paste0(file, ".csv")	
 	}

# Grab the csv data
data <- collection_metrics(collection_id = cid, as.csv = TRUE)
# write that to disk
 write.csv(read.csv(textConnection(data)), file = fname)
}


#' Creates a collection from a list of total impact ids (not working)
#'
#' @param title Title of the collection
#' @param  objects a \code{list} of total impact ids.
#' @export
#' @return collection id
#' @examples \dontrun{
#' doi <- c("10.1145/1327452.1327492", "10.1080/10556781003625177")	
#' pmid <- c("19782018","17420288", "17593900", "17420288")
#' create_collection(title="my collection", list_of_items) # list must be valid total impact IDs.
#'}
create_collection <- function(title = NULL, objects = NULL) {
	if(is.null(title))
		stop("Please specify a title for your collection", call.=FALSE)

	if(is.null(objects) || class(objects)!=list)
		stop("You need to specify a list of objects to curate into a collection. See ?create_collection for examples.", call.=FALSE)


 
	object_list <- toJSON(objects)	
	browser()
	new_id <- postForm('http://api.total-impact.org/collection', args = object_list, style = "POST")  	

} 

# Tests

pmid <- as.list(c("19782018","17420288", "17593900", "17420288"))
doi <- as.list(doi <- c("10.1145/1327452.1327492", "10.1080/10556781003625177")
	)
x=list(pmid = pmid, doi =doi)
 names(pmid) <- rep("pmid", length(pmid))
 xx <- llply(x, function(z) {
 	browser()
 	})

 
 names(doi) <- rep("doi", length(doi))
 all <- c(pmid, doi)
object_list <- toJSON(all, .withNames = TRUE)