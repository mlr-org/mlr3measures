#' @title False Omission Rate
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{FN}}{\mathrm{FN} + \mathrm{TN}}.
#' }{
#'    FN / (FN + TN).
#' }
#'
#' @templateVar mid fomr
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
fomr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  fomr_cm(cm(truth, response, positive))
}

fomr_cm = function(m, na_value = NaN) {
  div(m[2L, 1L], sum(m[2L, ]), na_value)
}

#' @include measures.R
add_measure(fomr, "False Omission Rate", "binary", 0, 1, TRUE)
