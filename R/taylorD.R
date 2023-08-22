#' Taylor Diagram
#'
#' This function creates a Taylor Diagram to compare predictive capacity (RMSE + correlation) of one or more models, with the option to segregate by a variable.
#'
#' @param observed A vector of observed values.
#' @param predicted A vector or data frame containing predicted values from one or more models.
#' @param by A vector with the same length as 'observed', containing values of the variable to condition the plots to.
#' @param by.class Character, "numeric" or "factor". If "numeric", data will be split in quantiles.
#' @param panel Logical, TRUE to plot segregated values in different panels, and FALSE to differentiate by model and 'by' variable within a single panel.
#'
#' @return A Taylor Diagram plot.
#' @importFrom openair TaylorDiagram
#' @importFrom tidyr gather
#'
#' @examples
#' observed <- c(2, 4, 5, 7)
#' model1 <- c(3, 5, 4, 8)
#' model2 <- c(2, 4.5, 5, 7.2)
#' predicted <- as.data.frame(cbind(model1, model2))
#' year <- c(2000, 2000, 2001, 2001)
#' taylorD(observed, model1)
#'
#' @export
taylorD <- function(observed, predicted, by = NULL, by.class = NULL, panel = TRUE) {

  if (is.null(by)) {

    data <- as.data.frame(cbind(observed, predicted))
    data <- tidyr::gather(data, key = "Model", value = "predicted", 2:ncol(data))
    return(openair::TaylorDiagram(data, obs = "observed", mod = "predicted", group = "Model"))

  } else {

    data <- as.data.frame(cbind(by, observed, predicted))
    data <- tidyr::gather(data, key = "Model", value = "predicted", 3:ncol(data))

    if (by.class == "numeric") {
      data$by <- as.numeric(data$by)
    } else {
      data$by <- as.factor(data$by)
    }

    if (panel) {
      return(openair::TaylorDiagram(data, obs = "observed", mod = "predicted", group = "Model", type = "by"))
    } else {
      return(openair::TaylorDiagram(data, obs = "observed", mod = "predicted", group = c("Model", "by")))
    }

  }

}
