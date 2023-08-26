#' Bardsley Coefficient
#'
#' Measures the deviation of predicted values from observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the Bardsley coefficient.
#' @export
calculate_bardsleyCoefficient <- function(observed, predicted) {
  1 - (sum((observed - predicted)^2, na.rm = TRUE) / sum(observed^2, na.rm = TRUE))
}
