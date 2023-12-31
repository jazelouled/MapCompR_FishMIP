% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/obsPredBiomassDF.R
\name{obsPredBiomassDF}
\alias{obsPredBiomassDF}
\title{Put data frame in the format we need for comparison}
\usage{
obsPredBiomassDF(
  observed,
  observedLon,
  observedLat,
  observedBiomass,
  predicted,
  rasterVariable,
  bufferExtract
)
}
\arguments{
\item{observed}{A dataframe containing observed data.}

\item{observedLon}{Column name in the observed dataframe representing longitude values.}

\item{observedBiomass}{Column name in the observed dataframe representing observed biomass values.}

\item{predicted}{A vector of filenames representing predicted raster data.}

\item{rasterVariable}{An extra variable (a raster; e.g. bathymetry to make visualizations later, like biomass vs. depth)}

\item{observedLat:}{Column name in the observed dataframe representing latitude values.}

\item{buffer}{A parameter determining the buffer size for data extraction. In km.}
}
\value{
A standardized data frame with the columns longitude, latitude, biomass_observed, biomass_predicted, year and variable (i.e., extracted value of the extra variable)
}
\description{
This function will take the dataset obtained with the obsInPred function and extract the biomass
values in the observed latitude and longitude from the predicted values by the MEM. It also adds the depth
of the location by using a bathymetry layer.
}
\examples{
hh <- obsPredBiomassDF(observed = MEDITS_data_, observedLon = "longitud", observedLat = "latitud", observedBiomass = "BIOMASA", predicted = Ecospace_data, rasterVariable = bathy, bufferExtract = 20)

}
