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
#' @export
tnr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  tnr_cm(cm(truth, response, positive), na_value)
}

tnr_cm = function(m, na_value = NaN) {
  div(m[2L, 2L], sum(m[, 2L]), na_value)
}

#' @export
#' @rdname tnr
specificity = tnr

#' @include measures.R
add_measure(tnr, "binary", 0, 1, FALSE)
add_measure(specificity, "binary", 0, 1, FALSE)
