#' Put data frame in the format we need for comparison
#'
#' This function will take the dataset obtained with the obsInPred function and extract the biomass
#' values in the observed latitude and longitude from the predicted values by the MEM. It also adds the depth
#' of the location by using a bathymetry layer.
#'
#' @param observed  A dataframe containing observed data.
#' @param observedLon Column name in the observed dataframe representing longitude values.
#' @param observedLat: Column name in the observed dataframe representing latitude values.
#' @param observedBiomass Column name in the observed dataframe representing observed biomass values.
#' @param predicted  A vector of filenames representing predicted raster data.
#' @param rasterVariable An extra variable (a raster; e.g. bathymetry to make visualizations later, like biomass vs. depth)
#' @param buffer A parameter determining the buffer size for data extraction. In km.
#'
#' @return A standardized data frame with the columns longitude, latitude, biomass_observed, biomass_predicted, year and variable (i.e., extracted value of the extra variable)
#'
#' @examples
#' hh <- obsPredBiomassDF(observed = MEDITS_data_, observedLon = "longitud", observedLat = "latitud", observedBiomass = "BIOMASA", predicted = Ecospace_data, rasterVariable = bathy, bufferExtract = 20)
#'
#' @import raster
#' @import lubridate
#' @import data.table
#'
#'
#'

# Function to process observed and predicted biomass data and extract relevant information
obsPredBiomassDF <- function(observed, observedLon, observedLat, observedBiomass, predicted, rasterVariable, bufferExtract) {

  # Initialize empty lists to store extracted data
  listExtract <- list()
  listExtract_ <- list()

  # Loop through each predicted raster file
  for (j in 1:length(predicted)) {
    # Skip the 24th predicted raster (j==24)
    if (j == 24) next

    # Get the filename and month number from the predicted raster
    predictedRaster <- predicted[j]
    fileName <- sub("\\.asc$*", "", predictedRaster)
    fileName_ <- substr(fileName, nchar(fileName) - 4, nchar(fileName))

    # Load the predicted raster and divide values by 1000
    predictedRaster_ <- raster(predictedRaster) / 1000

    # Convert month number to a date and extract the year
    numberMonth <- as.numeric(fileName_)
    originDate <- lubridate::ymd("2000-01-01")
    date <- lubridate::ymd(originDate + months(numberMonth - 1))
    year <- year(date)

    # Filter observed data to include only rows matching the current year
    observed_ <- observed[observed$Year %like% year,]

    # Loop through each observation in the filtered observed data
    for (i in 1:length(observed_$Year)) {
      print(i)
      # Extract column data for the current observation
      columnInfo <- observed_[[observedBiomass]]
      observedLon_ <- observed_[[observedLon]]
      observedLat_ <- observed_[[observedLat]]

      # Adjust the buffer size and extract environmental data from predicted raster
      bufferExtract <- bufferExtract * 1000
      extracted_env <- raster::extract(predictedRaster_, cbind(observedLon_[i], observedLat_[i]), buffer = 0, fun = mean, na.rm = TRUE)
      extracted_rasterVariable <- raster::extract(rasterVariable, cbind(observedLon_[i], observedLat_[i]), bufferExtract = bufferExtract, fun = mean, na.rm = TRUE)

      # Create a dataframe to store extracted information
      df_predObs <- data.frame("longitude" = numeric(), "latitude" = numeric(), "biomass_observed" = numeric(), "biomass_predicted" = numeric(), "year" = numeric(), "variable" = numeric())
      df_predObs[1,1] <- observedLon_[i]
      df_predObs[1,2] <- observedLat_[i]
      df_predObs[1,3] <- columnInfo[i]
      df_predObs[1,4] <- extracted_env
      df_predObs[1,5] <- year
      df_predObs[1,6] <- extracted_rasterVariable

      # Store the dataframe in the list of extracted data
      listExtract[[i]] <- df_predObs
    }

    # Combine dataframes in the list into a single dataframe
    aa <- do.call(rbind, listExtract)
    listExtract_[[j]] <- aa
  }

  # Combine dataframes from each predicted raster into a single dataframe
  DF_standardized <- do.call(rbind, listExtract_)

  # Remove rows with missing values
  DF_standardized_ <- DF_standardized[complete.cases(DF_standardized),]

  # Return the final standardized dataframe
  return(DF_standardized_)
}
