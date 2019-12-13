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
#' @useDynLib mlr3measures c_dor
#' @export
dor = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_dor, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(dor, "Diagnostic Odds Ratio", "binary", 0, Inf, FALSE)
