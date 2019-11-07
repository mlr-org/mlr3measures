#' @title False Positive Rate
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{FP}}{\mathrm{FP} + \mathrm{TN}}.
#' }{
#'    FP / (FP + TN).
#' }
#' Also know as fall out or probability of false alarm.
#'
#' @templateVar mid fpr
#' @template binary_template
#'
#' @note
#' This measure is undefined if FP + TN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
fpr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  fpr_cm(cm(truth, response, positive), na_value)
}

fpr_cm = function(m, na_value = NaN) {
  div(m[1L, 2L], sum(m[, 2L]), na_value)
}

#' @include measures.R
add_measure(fpr, "False Positive Rate", "binary", 0, 1, TRUE)
