#' Fast Fourier Transform
#'
#' Computes the amplitude spectrum using Fast Fourier Transform.
#'
#' @param observed A numeric vector of observed values.
#' @param sampling_rate The sampling rate of the observed values.
#' @return A data frame with Frequency and Amplitude columns.
#' @export
#'
#' @examples
#' observed <- c(10, 15, 12, 8, 20, 10, 15, 12, 8, 20)  # Simulated observed values
#' sampling_rate <- 1  # Sampling rate in Hz
#' fft_result <- fast_fourier_transform(observed, sampling_rate)
#' plot(fft_result$Frequency, fft_result$Amplitude, type = 'l', xlab = 'Frequency', ylab = 'Amplitude')
#'
calculate_fastFourierTransform <- function(observed, sampling_rate) {
  n <- length(observed)
  freq <- (0:(n/2)) * (sampling_rate/n)
  fft_result <- fft(observed)
  amplitude <- Mod(fft_result[1:(n/2 + 1)]) * 2/n
  return(data.frame(Frequency = freq, Amplitude = amplitude))
}
