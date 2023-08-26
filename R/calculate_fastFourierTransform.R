#' Fast Fourier Transform
#'
#' Computes the amplitude spectrum using Fast Fourier Transform.
#'
#' @param observed A numeric vector of observed values.
#' @param sampling_rate The sampling rate of the observed values.
#' @return A data frame with Frequency and Amplitude columns.
#' @export
calculate_fastFourierTransform <- function(observed, sampling_rate) {
  n <- length(observed)
  freq <- (0:(n/2)) * (sampling_rate/n)
  fft_result <- fft(observed)
  amplitude <- Mod(fft_result[1:(n/2 + 1)]) * 2/n
  return(data.frame(Frequency = freq, Amplitude = amplitude))
}
