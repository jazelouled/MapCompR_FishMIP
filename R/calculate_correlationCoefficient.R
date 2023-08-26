#' Correlation Coefficient
#'
#' Calculates the Pearson correlation coefficient between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the correlation coefficient.
#' @export
calculate_correlationCoefficient <- function(observed, predicted) {
  return(cor(observed, predicted))
}
