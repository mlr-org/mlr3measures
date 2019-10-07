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
fomr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[2L, 1L], sum(m[2L, ]), na_value)
}

#' @include metainfo.R
add_info(fomr, "classif", 0, 1, TRUE)
