#' @title Diagnostic Odds Ratio
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TP}/\mathrm{FP}}{\mathrm{FN}/\mathrm{TN}}.
#' }{
#'    (TP/FP) / (FN/TN).
#' }
#'
#' @templateVar mid dor
#' @template classif_metainfo
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @note
#' This measure is undefined if FP = 0 or FN = 0.
#'
#' @template classif_params_binary
#' @template classif_positive
#' @template na_value
#' @template classif_return
#' @family Binary Classification Measures
#' @export
dor = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[1L, 1L] * m[2L, 2L], m[1L, 2L] * m[2L, 1L], na_value)
}

#' @include metainfo.R
add_info(dor, "classif", 0, Inf, FALSE)
