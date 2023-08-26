#' Kendall's tau
#'
#' Calculates Kendall's tau, a measure of rank correlation between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing Kendall's tau.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' model_efficiency(observed, predicted)
#'
calculate_kendallTau <- function(observed, predicted) {
  n <- length(observed)
  concordant_pairs <- 0
  discordant_pairs <- 0

  for (i in 1:(n-1)){
    for (j in (i+1):n){
      if ((observed[i] < observed[j] && predicted[i] < predicted[j]) || (observed[i] > observed[j] && predicted[i] > predicted[j])){
        concordant_pairs <- concordant_pairs + 1
      } else if ((observed[i] < observed[j] && predicted[i] > predicted[j]) || (observed[i] > observed[j] && predicted[i] < predicted[j])){
        discordant_pairs <- discordant_pairs + 1
      }
    }
  }

  tau <- (concordant_pairs - discordant_pairs) / (0.5 * n * (n - 1))
  return(tau)
}
