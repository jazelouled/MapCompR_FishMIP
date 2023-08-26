#' Willmott Index
#'
#' Assesses the goodness of fit between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the Willmott index.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' calculate_WillmottIndex(observed, predicted)
#'
calculate_WillmottIndex <- function(observed, predicted) {
  num <- sum(abs(predicted - observed))
  denom <- sum(abs(predicted - mean(observed)) + abs(observed - mean(observed)))
  return(1 - (num / denom))
}
