#' Willmott Index
#'
#' Assesses the goodness of fit between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the Willmott index.
#' @export
calculate_WillmottIndex <- function(observed, predicted) {
  num <- sum(abs(predicted - observed))
  denom <- sum(abs(predicted - mean(observed)) + abs(observed - mean(observed)))
  return(1 - (num / denom))
}
