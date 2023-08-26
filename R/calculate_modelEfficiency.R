#' Model Efficiency (MEF)
#'
#' Measures the efficiency of a model by comparing predicted to observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the model efficiency.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' calculate_modelEfficiency(observed, predicted)
#'
calculate_modelEfficiency <- function(observed, predicted) {
  1 - (sum((predicted - observed)^2, na.rm = TRUE) / sum((observed - mean(observed, na.rm = TRUE))^2, na.rm = TRUE))
}
