#' Nash-Sutcliffe Efficiency (NSE)
#'
#' Evaluates the efficiency of a model by comparing predicted to observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the Nash-Sutcliffe efficiency.
#' @export
calculate_nashSutcliffeEfficiency <- function(observed, predicted) {
  1 - (sum((predicted - observed)^2, na.rm = TRUE) / sum((observed - mean(observed, na.rm = TRUE))^2, na.rm = TRUE))
}
