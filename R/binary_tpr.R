#' @title True Positive Rate
#'
#' @aliases recall sensitivity
#' @description
#' Binary classification measure defined as \deqn{
#'   \frac{\mathrm{TP}}{\mathrm{TP} + \mathrm{FN}}.
#' }{
#'   TP / (TP + FN).
#' }
#' Also know as "recall" or "sensitivity".
#'
#' @note
#' This measure is undefined if FP + TN = 0.
#'
#' @templateVar mid tpr
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
tpr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[1L, 1L], sum(m[, 1L]), na_value)
}

#' @include metainfo.R
add_info(tpr, "classif", 0, 1, FALSE)
