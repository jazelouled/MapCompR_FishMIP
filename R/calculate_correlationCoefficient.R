#' Correlation Coefficient
#'
#' Calculates the Pearson correlation coefficient between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the correlation coefficient.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' model_efficiency(observed, predicted)
#'
calculate_correlationCoefficient <- function(observed, predicted) {
  return(cor(observed, predicted))
}
