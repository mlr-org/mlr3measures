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
#' @details
#' This measure is undefined if TP + FP = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' `r format_bib("goutte_2005")`
#'
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
ppv = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  ppv_cm(cm(truth, response, positive), na_value)
}

ppv_cm = function(m, na_value = NaN) {
  div(m[1L, 1L], sum(m[1L, ]), na_value)
}

#' @export
#' @rdname ppv
precision = ppv

#' @include measures.R
add_measure(ppv, "Positive Predictive Value", "binary", 0, 1, FALSE)
add_measure(precision, "Precision", "binary", 0, 1, FALSE)
