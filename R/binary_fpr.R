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
#' @useDynLib mlr3measures c_fpr
#' @export
fpr = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_fpr, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(fpr, "False Positive Rate", "binary", 0, 1, TRUE)
