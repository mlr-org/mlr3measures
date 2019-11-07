#' @title Diagnostic Odds Ratio
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TP}/\mathrm{FP}}{\mathrm{FN}/\mathrm{TN}}.
#' }{
#'    (TP/FP) / (FN/TN).
#' }
#'
#' @templateVar mid dor
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @note
#' This measure is undefined if FP = 0 or FN = 0.
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
dor = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  dor_cm(cm(truth, response, positive), na_value)
}

dor_cm = function(m, na_value = NaN) {
  div(m[1L, 1L] * m[2L, 2L], m[1L, 2L] * m[2L, 1L], na_value)
}

#' @include measures.R
add_measure(dor, "Diagnostic Odds Ratio", "binary", 0, Inf, FALSE)
