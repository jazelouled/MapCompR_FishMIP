#' Calculate MAE
#'
#' This function calculates the mean absolute error (MAE) between observed and predicted values.
#'
#' @param observed Numeric vector of observed values.
#' @param predicted Numeric vector of predicted values.
#'
#' @return The calculated MAE.
#' @export
#'
#' @examples
#' observed <- c(1, 2, 3)
#' predicted <- c(1.1, 2.2, 3.3)
#' calculate_mae(observed, predicted)
calculate_mae <- function(observed, predicted) {
  mean(abs(predicted - observed))
}
