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
#' @template binary_example
#' @useDynLib mlr3measures c_fnr
#' @export
fnr = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_fnr, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(fnr, "False Negative Rate", "binary", 0, 1, TRUE)
