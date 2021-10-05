#' @title False Negative Rate
#'
#' @details
#' The False Negative Rate is defined as \deqn{
#'    \frac{\mathrm{FN}}{\mathrm{TP} + \mathrm{FN}}.
#' }{
#'    FN / (TP + FN).
#' }
#' Also know as "miss rate".
#'
#' @templateVar mid fnr
#' @template binary_template
#'
#' @details
#' This measure is undefined if TP + FN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
fnr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  fnr_cm(cm(truth, response, positive), na_value)
}

fnr_cm = function(m, na_value = NaN) {
  div(m[2L, 1L], sum(m[, 1L]), na_value)
}

#' @include measures.R
add_measure(fnr, "False Negative Rate", "binary", 0, 1, TRUE)
