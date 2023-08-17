#' Calculate MEF
#'
#' This function calculates the model efficiency (MEF) between observed and predicted values.
#'
#' @param observed Numeric vector of observed values.
#' @param predicted Numeric vector of predicted values.
#'
#' @return The calculated MEF.
#' @export
#'
#' @examples
#' observed <- c(1, 2, 3)
#' predicted <- c(1.1, 2.2, 3.3)
#' calculate_mef(observed, predicted)
calculate_mef <- function(observed, predicted) {
  1 - (calculate_rmse(observed, predicted)^2 / var(observed))
}
