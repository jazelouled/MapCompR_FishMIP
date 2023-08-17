#' Calculate NMAE
#'
#' This function calculates the normalized mean absolute error (NMAE) between observed and predicted values.
#'
#' @param observed Numeric vector of observed values.
#' @param predicted Numeric vector of predicted values.
#'
#' @return The calculated NMAE.
#' @export
#'
#' @examples
#' observed <- c(1, 2, 3)
#' predicted <- c(1.1, 2.2, 3.3)
#' calculate_nmae(observed, predicted)
calculate_nmae <- function(observed, predicted) {
  mean(abs(predicted - observed)) / (max(observed) - min(observed))
}
