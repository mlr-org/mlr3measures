#' @title True Positives
#'
#' @description
#' Binary classification measure counting the true positives.
#'
#' @templateVar mid tp
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
tp = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[1L, 1L]
}

#' @include measures.R
add_measure(tp, "binary", 0, Inf, FALSE)
