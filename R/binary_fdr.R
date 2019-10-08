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
#' @export
fdr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[1L, 2L], sum(m[1L, ]), na_value)
}

#' @include metainfo.R
add_info(fdr, "classif", 0, 1, TRUE)
