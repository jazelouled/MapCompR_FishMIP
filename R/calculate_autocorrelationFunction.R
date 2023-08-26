#' Autocorrelation Function
#'
#' Computes the autocorrelation function for the observed time series.
#'
#' @param observed A numeric vector of observed values.
#' @return An autocorrelation object.
#' @export
calculate_autocorrelationFunction <- function(observed) {
  return(acf(observed))
}
