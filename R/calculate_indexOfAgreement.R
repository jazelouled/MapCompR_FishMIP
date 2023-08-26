#' Index of Agreement
#'
#' Quantifies the agreement between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the index of agreement.
#' @export
calculate_indexOfAgreement <- function(observed, predicted) {
  mean_obs <- mean(observed)
  num <- sum((observed - predicted)^2)
  denom <- sum((abs(predicted - mean_obs) + abs(observed - mean_obs))^2)
  return(1 - (num / denom))
}
