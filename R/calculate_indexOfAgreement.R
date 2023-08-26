#' Index of Agreement
#'
#' Quantifies the agreement between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the index of agreement.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' calculate_indexOfAgreement(observed, predicted)
#'
calculate_indexOfAgreement <- function(observed, predicted) {
  mean_obs <- mean(observed)
  num <- sum((observed - predicted)^2)
  denom <- sum((abs(predicted - mean_obs) + abs(observed - mean_obs))^2)
  return(1 - (num / denom))
}

