#' Cross-Correlation Function
#'
#' Computes the cross-correlation function between observed and predicted time series.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A cross-correlation object.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' model_efficiency(observed, predicted)
#'
calculate_crossCorrelationFunction <- function(observed, predicted) {
  return(ccf(observed, predicted))
}
