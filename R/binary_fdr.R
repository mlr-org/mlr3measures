#' @title False Discovery Rate
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{FP}}{\mathrm{TP} + \mathrm{FP}}.
#' }{
#'    FP / (TP + FP).
#' }
#'
#' @templateVar mid fdr
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
#' @useDynLib mlr3measures c_fdr
#' @export
fdr = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_fdr, cm(truth, response, positive), length(truth))
}


#' @include measures.R
add_measure(fdr, "False Discovery Rate", "binary", 0, 1, TRUE)
