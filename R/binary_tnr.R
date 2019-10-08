#' @title True Negative Rate
#'
#' @aliases specificity
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
#' @export
tnr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[2L, 2L], sum(m[, 2L]), na_value)
}

#' @include measures.R
add_measure(tnr, "binary", 0, 1, FALSE)
