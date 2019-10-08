#' @title Positive Predictive Value
#'
#' @aliases precision
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
#' @export
ppv = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[1L, 1L], sum(m[1L, ]), na_value)
}

#' @include measures.R
add_measure(ppv, "binary", 0, 1, FALSE)
