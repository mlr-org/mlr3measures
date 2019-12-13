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
#' @note
#' This measure is undefined if FN + TN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_fomr
#' @export
fomr = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_fomr, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(fomr, "False Omission Rate", "binary", 0, 1, TRUE)
