#' Bardsley Coefficient
#'
#' Measures the deviation of predicted values from observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the Bardsley coefficient.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' model_efficiency(observed, predicted)
#'
calculate_bardsleyCoefficient <- function(observed, predicted) {
  1 - (sum((observed - predicted)^2, na.rm = TRUE) / sum(observed^2, na.rm = TRUE))
}
