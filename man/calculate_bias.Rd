% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_bias.R
\name{calculate_bias}
\alias{calculate_bias}
\title{Calculate Bias}
\usage{
calculate_bias(observed, predicted)
}
\arguments{
\item{observed}{Numeric vector of observed values.}

\item{predicted}{Numeric vector of predicted values.}
}
\value{
The calculated bias.
}
\description{
This function calculates the bias between observed and predicted values.
}
\examples{
observed <- c(1, 2, 3)
predicted <- c(1.1, 2.2, 3.3)
calculate_bias(observed, predicted)
}
