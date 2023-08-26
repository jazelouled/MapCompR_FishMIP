#' Kendall's tau
#'
#' Calculates Kendall's tau, a measure of rank correlation between predicted and observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing Kendall's tau.
#' @export
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
