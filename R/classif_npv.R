#' @title Negative Predictive Value
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TN}}{\mathrm{FN} + \mathrm{TN}}.
#' }{
#'    TN / (FN + TN).
#' }
#'
#' @templateVar mid npv
#' @template classif_metainfo
#'
#' @note
#' This measure is undefined if FN + TN = 0.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @template classif_params_binary
#' @template classif_positive
#' @template na_value
#' @template classif_return
#' @family Binary Classification Measures
#' @export
npv = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[2L, 2L], sum(m[2L, ]), na_value)
}

#' @include metainfo.R
add_info(npv, "classif", 0, 1, FALSE)
