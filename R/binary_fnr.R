#' @title False Negative Rate
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{FN}}{\mathrm{TP} + \mathrm{FN}}.
#' }{
#'    FN / (TP + FN).
#' }
#' Also know as "miss rate".
#'
#' @templateVar mid fnr
#' @template binary_template
#'
#' @note
#' This measure is undefined if TP + FN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
fnr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)

  m = confusion(truth, response, positive)
  div(m[2L, 1L], sum(m[, 1L]), na_value)
}

#' @include measures.R
add_measure(fnr, "binary", 0, 1, TRUE)
