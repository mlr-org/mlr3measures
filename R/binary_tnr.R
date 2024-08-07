#' @title True Negative Rate
#'
#' @details
#' The True Negative Rate is defined as \deqn{
#'    \frac{\mathrm{TN}}{\mathrm{FP} + \mathrm{TN}}.
#' }{
#'    TN / (FP + TN).
#' }
#' Also know as "specificity" or "selectivity".
#'
#' @templateVar mid tnr
#' @template binary_template
#'
#' @details
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
add_measure(tnr, "True Negative Rate", "binary", 0, 1, FALSE)
add_measure(specificity, "Specificity", "binary", 0, 1, FALSE)
