#' Calculate RMSE
#'
#' This function calculates the root mean squared error (RMSE) between observed and predicted values.
#'
#' @param observed Numeric vector of observed values.
#' @param predicted Numeric vector of predicted values.
#'
#' @return The calculated RMSE.
#' @export
#'
#' @examples
#' observed <- c(1, 2, 3)
#' predicted <- c(1.1, 2.2, 3.3)
#' calculate_rmse(observed, predicted)
calculate_rmse <- function(observed, predicted) {
  sqrt(mean((predicted - observed)^2))
}
