% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_bardsleyCoefficient.R
\name{calculate_bardsleyCoefficient}
\alias{calculate_bardsleyCoefficient}
\title{Bardsley Coefficient}
\usage{
calculate_bardsleyCoefficient(observed, predicted)
}
\arguments{
\item{observed}{A numeric vector of observed values.}

\item{predicted}{A numeric vector of predicted values.}
}
\value{
A numeric value representing the Bardsley coefficient.
}
\description{
Measures the deviation of predicted values from observed values.
}
\examples{
observed <- c(10, 15, 12, 8, 20)
predicted <- c(12, 16, 10, 7, 18)
calculate_bardsleyCoefficient(observed, predicted)

}
