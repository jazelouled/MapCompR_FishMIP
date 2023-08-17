#' Calculate Bias
#'
#' This function calculates the bias between observed and predicted values.
#'
#' @param observed Numeric vector of observed values.
#' @param predicted Numeric vector of predicted values.
#'
#' @return The calculated bias.
#' @export
#'
#' @examples
#' observed <- c(1, 2, 3)
#' predicted <- c(1.1, 2.2, 3.3)
#' calculate_bias(observed, predicted)
calculate_bias <- function(observed, predicted) {
  mean(predicted - observed)
}
