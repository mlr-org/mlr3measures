#' @title Negative Predictive Value
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TN}}{\mathrm{FN} + \mathrm{TN}}.
#' }{
#'    TN / (FN + TN).
#' }
#'
#' @templateVar mid npv
#' @template binary_template
#'
#' @note
#' This measure is undefined if FN + TN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
npv = function(truth, response, positive, na_value = NaN, ...) {
  m = confusion(truth, response, positive)
  div(m[2L, 2L], sum(m[2L, ]), na_value)
}

#' @include measures.R
add_measure(npv, "binary", 0, 1, FALSE)
