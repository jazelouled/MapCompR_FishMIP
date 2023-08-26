#' Model Skill Score
#'
#' Measures the skill of a model in predicting observed values.
#'
#' @param observed A numeric vector of observed values.
#' @param predicted A numeric vector of predicted values.
#' @return A numeric value representing the model skill score.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20)
#' predicted <- c(12, 16, 10, 7, 18)
#' model_efficiency(observed, predicted)
#'
calculate_modelSkillScore <- function(observed, predicted) {
  mean_obs <- mean(observed)
  num <- sum((observed - predicted)^2)
  denom <- sum((observed - mean_obs)^2)
  return(1 - (num / denom))
}
