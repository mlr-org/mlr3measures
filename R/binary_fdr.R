#' @title False Discovery Rate
#'
#' @details
#' The False Discovery Rate is defined as \deqn{
#'    \frac{\mathrm{FP}}{\mathrm{TP} + \mathrm{FP}}.
#' }{
#'    FP / (TP + FP).
#' }
#'
#' @templateVar mid fdr
#' @template binary_template
#'
#' @details
#' This measure is undefined if TP + FP = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
fdr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  fdr_cm(cm(truth, response, positive), na_value)
}

fdr_cm = function(m, na_value = NaN) {
  div(m[1L, 2L], sum(m[1L, ]), na_value)
}

#' @include measures.R
add_measure(fdr, "False Discovery Rate", "binary", 0, 1, TRUE)
