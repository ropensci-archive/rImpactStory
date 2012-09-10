# Total Impact Methods

#' @return \code{NULL}
#'
#' @export
#' @rdname ti_metrics
#' @S3method plot ti_metrics
plot.ti_metrics <- function(metrics, verbose = FALSE) {
    # function yet to be coded
    # Check attributes to see there is a data slot in the input object.
    # If yes, then proceed to print otherwise exit with a message.
    #  ...
} 


#' @return \code{NULL}
#' @export
#' @rdname ti_metrics
#' @S3method print ti_metrics
print.ti_metrics <- function(metrics, verbose = FALSE) {
    metrics$call <- ifelse(is.null(metrics$call), "undefined call",
        metrics$call)
    metrics$source <- ifelse(is.null(metrics$source), "undefined call",
        metrics$source)
    cat("Results from ", metrics$call, "to", metrics$source,
        "\n")
    if (is.null(metrics$format)) {
        metrics$format <- "Undefined"
    }
    cat("Format:", metrics$format, "\n")
    if (!empty(metrics$data)) {
        head(data)
        if (dim(data)[1] > 10)
            cat("Printed first 10 rows of ", dim(data)[1], "\n")
    }
    if (empty(metrics$data)) {
        cat("No data in object", "\n")
    }
}


save.ti_metrics <- function(metrics, file = NULL) {

	
}