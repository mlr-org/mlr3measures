#' @title True Negative Rate
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TN}}{\mathrm{FP} + \mathrm{TN}}.
#' }{
#'    TN / (FP + TN).
#' }
#' Also know as "specificity".
#'
#' @templateVar mid tnr
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
#' @useDynLib mlr3measures c_tnr
#' @export
tnr = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_tnr, cm(truth, response, positive), length(truth))
}

#' @export
#' @rdname tnr
specificity = tnr

#' @include measures.R
add_measure(tnr, "True Negative Rate", "binary", 0, 1, FALSE)
add_measure(specificity, "Specificity", "binary", 0, 1, FALSE)
