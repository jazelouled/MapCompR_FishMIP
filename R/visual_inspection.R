#' Visual Inspection Function
#'
#' This function creates aesthetically pleasing visualizations for comparing observed and predicted fish biomass mean values over time and with a raster variable.
#' Plots include temporal comparisons, raster variable-wise comparisons, and a scatter plot of observed vs. predicted fish biomass means.
#'
#' @param df A data frame containing the data for visualization.
#' @param observed The column name of the observed fish biomass values in the data frame.
#' @param predicted The column name of the predicted fish biomass values in the data frame.
#' @param year The column name of the year information in the data frame.
#' @param rasterVariable The column name of the raster variable information in the data frame.
#'
#' @return A grid of plots displaying comparisons between observed and predicted fish biomass mean values.
#'
#' @import ggplot2
#' @import gridExtra
#'
#' @examples
#' # Creating an example data frame with more natural fish biomass data
#' set.seed(123)  # Set seed for reproducibility
#' years <- 2000:2022
#' num_rows <- length(years) * 10
#' df <- data.frame(
#'   year = rep(rep(years, each = 10), times = 3),
#'   biomass_observed = 100 - 0.5 * rep(years, each = 10) + rnorm(num_rows, sd = 10) + 1000,
#'   biomass_predicted = 95 - 0.5 * rep(years, each = 10) + rnorm(num_rows, sd = 5) + 1000,
#'   variable = sample(0:2000, num_rows, replace = TRUE)
#' )
#' # Calling the visual_inspection function
#' visual_inspection(df, "biomass_observed", "biomass_predicted", "year", "variable")
#'
#' @export
#'
visual_inspection <- function(df, observed, predicted, year, rasterVariable) {

  library(dplyr)
  library(ggplot2)
  library(gridExtra)

  df_mean <- df %>%
    group_by_at(vars(year)) %>%
    summarize(
      observed_mean = mean(!!sym(observed)),
      predicted_mean = mean(!!sym(predicted)),
      rasterVariable_mean = mean(!!sym(rasterVariable))
    )

  # Create temporal comparison plot
  plot_temporal <- ggplot(df_mean) +
    geom_point(aes_string(year, "predicted_mean", color = "'Predicted'")) +
    geom_smooth(aes_string(year, "predicted_mean", color = "'Predicted'"), method = "loess") +
    geom_point(aes_string(year, "observed_mean", color = "'Observed'")) +
    geom_smooth(aes_string(year, "observed_mean", color = "'Observed'"), method = "loess") +
    labs(x = "Year", y = "Fish Biomass", title = "Temporal Comparison") +
    theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
          panel.background = element_blank()) +
    theme(legend.position = "right", legend.title = element_blank())+
    scale_color_manual(values=c('darkorange','dodgerblue'))

  # Create raster variable-wise comparison plot
  plot_rasterVariable <- ggplot(df_mean) +
    geom_point(aes_string("rasterVariable_mean", "predicted_mean", color = "'Predicted'")) +
    geom_smooth(aes_string("rasterVariable_mean", "predicted_mean", color = "'Predicted'"), method = "loess") +
    geom_point(aes_string("rasterVariable_mean", "observed_mean", color = "'Observed'")) +
    geom_smooth(aes_string("rasterVariable_mean", "observed_mean", color = "'Observed'"), method = "loess") +
    labs(x = "Mean Raster Variable", y = "Fish Biomass", title = "Raster Variable Comparison") +
    theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
          panel.background = element_blank()) +
    theme(legend.position = "right", legend.title = element_blank())+
    scale_color_manual(values=c('darkorange','dodgerblue'))


  # Create observed vs. predicted scatter plot
  plot_vs <- ggplot(df_mean) +
    geom_point(aes_string("observed_mean", "predicted_mean"), color = "darkred") +
    geom_smooth(aes_string("observed_mean", "predicted_mean"), color = "darkred", method = "loess") +
    labs(x = "Observed Biomass", y = "Predicted Biomass", title = "Observed vs. Predicted") +
    theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
          panel.background = element_blank())

  # Arrange plots in a grid
  plots <- grid.arrange(plot_temporal, plot_rasterVariable, plot_vs, nrow = 3)

  return(plots)
}



# Creating an example data frame with more natural fish biomass data and mean values
set.seed(123)  # Set seed for reproducibility
years <- 2000:2022
num_rows <- length(years) * 10

df <- data.frame(
  year = rep(rep(years, each = 10), times = 3),
  biomass_observed = 100 - 0.5 * rep(years, each = 10) + rnorm(num_rows, sd = 10) + 1000,
  biomass_predicted = 95 - 0.5 * rep(years, each = 10) + rnorm(num_rows, sd = 5) + 1000,
  variable = sample(0:2000, num_rows, replace = TRUE)
)

# Calling the visual_inspection function
visual_inspection(df, "biomass_observed", "biomass_predicted", "year", "variable")
