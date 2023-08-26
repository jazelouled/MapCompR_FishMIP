#' Cross-Correlation Function
#'
#' Computes the cross-correlation function between observed and predicted time series.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A cross-correlation object.
#' @export
calculate_crossCorrelationFunction <- function(observed, predicted) {
  return(ccf(observed, predicted))
}
