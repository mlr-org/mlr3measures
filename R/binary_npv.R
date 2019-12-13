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
#' @template binary_example
#' @useDynLib mlr3measures c_npv
#' @export
npv = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_npv, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(npv, "Negative Predictive Value", "binary", 0, 1, FALSE)
