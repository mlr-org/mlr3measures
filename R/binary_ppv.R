#' @title Positive Predictive Value
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TP}}{\mathrm{TP} + \mathrm{FP}}.
#' }{
#'    TP / (TP + FP).
#' }
#' Also know as "precision".
#'
#' @templateVar mid ppv
#' @template binary_template
#'
#' @note
#' This measure is undefined if TP + FP = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_ppv
#' @export
ppv = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_ppv, cm(truth, response, positive), length(truth))
}

#' @export
#' @rdname ppv
precision = ppv

#' @include measures.R
add_measure(ppv, "Positive Predictive Value", "binary", 0, 1, FALSE)
add_measure(precision, "Precision", "binary", 0, 1, FALSE)
