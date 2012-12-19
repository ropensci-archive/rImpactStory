#' Retrives metadata on a valid ImpactStory collection ID
#'
#' @return a \code{list} with the following fields: \item{_id}{id #} \item{_rev}{revision #} \item{created}{created on} \item{ip_address}{ip address of creation} \item{items}{list of items} \item{key_hash}{} \item{last_modified}{} \item{owner}{} \item{title}{} \item{type}{}.
#' @param key An ImpactStory API key
#' @param collection_id An Impact Story collection id
#' @param as.csv Default is \code{FALSE}. Set to \code{TRUE} to return a .csv file. Use in conjunction with \code{\link{save_collection}}
#' @export
#' @examples \dontrun{
#' collection_metrics('kn5auf')
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
collection_metrics <- function(collection_id = NULL, key = getOption("ImpactStoryKey", stop("Missing Dropbox consumer key")), as.csv = FALSE) {
	if(is.null(collection_id))
		stop('Did not specify a collection ID', call.=FALSE)

base_url <- "http://api.impactstory.org/v1"
url <-  paste(base_url, "/collection/", collection_id, "?key=", key, sep="")

# collection_data <- getURL(paste0('http://api.impactstory.org/v1/collection/', collection_id))
collection_data <- getURL(url)

	if(length(grep('404 Not Found', collection_data))>0 && grep('404 Not Found', collection_data)==1) {
						stop('No metadata found for supplied collection id', call.=FALSE)

		}  else {
						if(!as.csv) {
				cmd_results <- fromJSON(collection_data)
				return(cmd_results)
				} else {
				 collection_data <- getURL(paste0('http://api.impactstory.org/v1/collection/',collection_id,".csv", "?key=", key))
				 return(collection_data)
				}

		}
}

#'Saves metrics from a collection to a csv file
#'
#' @param cid  A valid ImpactStory collection ID
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
