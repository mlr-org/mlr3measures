#' @title Negative Predictive Value
#'
#' @details
#' The Negative Predictive Value is defined as \deqn{
#'    \frac{\mathrm{TN}}{\mathrm{FN} + \mathrm{TN}}.
#' }{
#'    TN / (FN + TN).
#' }
#'
#' @templateVar mid npv
#' @template binary_template
#'
#' @details
#' This measure is undefined if FN + TN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
npv = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  npv_cm(cm(truth, response, positive), na_value)
}

npv_cm = function(m, na_value = NaN) {
  div(m[2L, 2L], sum(m[2L, ]), na_value)
}

#' @include measures.R
add_measure(npv, "Negative Predictive Value", "binary", 0, 1, FALSE)
