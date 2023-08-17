#' Calculate Metrics
#'
#' This function calculates various evaluation metrics for observed and predicted values.
#'
#' @param df A data frame containing the observed and predicted values.
#' @param observed The name of the column containing the observed values in \code{df}.
#' @param predicted The name of the column containing the predicted values in \code{df}.
#'
#' @return A data frame containing calculated metrics and plots.
#' @export
#'
#' @examples
#' df <- data.frame(observed = c(1, 2, 3), predicted = c(1.1, 2.2, 3.3))
#' calculate_metrics(df, "observed", "predicted")
#'
#'
#' @import dplyr
#' @import ggplot
#' @import cowplot

calculate_metrics <- function(df, observed, predicted) {

  observed <- dplyr::pull(df, {{ observed }})
  predicted <- dplyr::pull(df, {{ predicted }})

  # Calculate Bias
  bias <- mean(predicted - observed)

  # Calculate RMSE
  rmse <- sqrt(mean((predicted - observed)^2))

  # Calculate MEF
  mef <- 1 - (rmse^2 / var(observed))

  # Calculate NMAE --> MAE/mean(observed) --> is this the good function?
  nmae <- mean(abs(predicted - observed)) / (max(observed) - min(observed))

  # Calculate MAE
  mae <- mean(abs(predicted - observed))

  # Create plots
  plot_bias <- ggplot2::ggplot(data.frame(x = observed, y = predicted), ggplot2::aes(x, y)) +
    ggplot2::geom_point() +
    ggplot2::geom_abline(intercept = bias, slope = 1, color = "red") +
    ggplot2::labs(title = "Bias Plot", x = "Observed", y = "Predicted")

  plot_residuals <- ggplot2::ggplot(data.frame(residuals = predicted - observed), ggplot2::aes(residuals)) +
    ggplot2::geom_histogram(binwidth = 0.5, fill = "lightblue", color = "black") +
    ggplot2::labs(title = "Residuals Plot", x = "Residuals", y = "Frequency")

  # Arrange plots in a grid
  grid_arrange <- cowplot::plot_grid(plot_bias, plot_residuals, nrow = 1)

  # Create a dataframe with the metrics
  result <- data.frame(bias = bias, rmse = rmse, mef = mef, nmae = nmae, mae = mae)

  # Return the metrics and plots
  return(list(metrics = result, plots = grid_arrange))
}
