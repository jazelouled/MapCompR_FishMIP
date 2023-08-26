#' Model Efficiency (MEF)
#'
#' Measures the efficiency of a model by comparing predicted to observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the model efficiency.
#' @export
calculate_modelEfficiency <- function(observed, predicted) {
  1 - (sum((predicted - observed)^2, na.rm = TRUE) / sum((observed - mean(observed, na.rm = TRUE))^2, na.rm = TRUE))
}
