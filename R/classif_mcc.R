#' @title Matthews Correlation Coefficient
#'
#' @details
#' The Matthews Correlation Coefficient is defined as \deqn{
#'    \frac{\mathrm{TP} \cdot \mathrm{TN} - \mathrm{FP} \cdot \mathrm{FN}}{\sqrt{(\mathrm{TP} + \mathrm{FP}) (\mathrm{TP} + \mathrm{FN}) (\mathrm{TN} + \mathrm{FP}) (\mathrm{TN} + \mathrm{FN})}}.
#' }{
#'    (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)).
#' }
#'
#' @templateVar mid mcc
#' @template binary_template
#'
#' @details
#' This above formula is undefined if any of the four sums in the denominator is 0.
#' The denominator is then set to 1.
#'
#' @references
#' `r format_bib("matthews_1975")`
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
mcc = function(truth, response, positive = NULL, ...) {
  assert_classif(truth, response = response)

  mcc_cm(cm(truth, response, positive))
}

mcc_cm = function(m, na_value = NaN) {
  storage.mode(m) = "double"

  n_tp = sum(diag(m))
  n = sum(m)
  pk = rowSums(m)
  tk = colSums(m)

  nomin = n_tp * n - sum(pk * tk)
  denom = sqrt((n^2 - sum(pk^2)) * (n^2 - sum(tk^2)))

  if (denom == 0L) nomin else nomin / denom
}

#' @include measures.R
add_measure(mcc, "Matthews Correlation Coefficient", "classif", -1, 1, FALSE)
