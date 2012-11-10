
#' Returns a list of current ImpactStory data providers
#'
#' @param as.df = \code{FALSE}. Returns a \code{data.frame} instead of a list.
#' @export
#' @return \code{list}
#' @examples \dontrun{
#' IS_providers()
#' IS_providers(as.df = TRUE)
#' write.csv(t1_providers(as.df = TRUE), file = "ImpactStory_metadata.csv")
#'  # will write the data to a flat csv file.
#'  # Note: The coercion will not be entirely clean due to the variable number of fields under description for each metric provider.
#'}
#' @author Karthik Ram \email{karthik.ram@@gmail.com}
IS_providers <- function(as.df = FALSE) {
 providers <-  getURL('http://api.impactstory.org/provider')
 provider_list <- (as.list(fromJSON(I(providers))))
 message("Impact Story currently provides metrics on the following data providers: ")
 message(sprintf("%s ", names(provider_list)))
 if(!(as.df)) {
 	return(provider_list)
 } else {
 	provider_df <- ldply(provider_list, function(x) {
     provider <- names(x)
     stats <- melt(x)
     return(data.frame(provider = rep(provider, length = dim(stats)[1]), stats))
 	})
   names(provider_df) <- c("Provider", "Var1", "Values1", "Var2", "Values2")
   return(provider_df)
		}
} 


