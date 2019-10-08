#' @title False Positives
#'
#' @description
#' Classification measure counting the false positives.
#'
#' @templateVar mid fp
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
fp = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[1L, 2L]
}

#' @include measures.R
add_measure(fp, "binary", 0, Inf, TRUE)
