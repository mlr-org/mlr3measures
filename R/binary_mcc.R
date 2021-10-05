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
mcc = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  mcc_cm(cm(truth, response, positive))
}

mcc_cm = function(m, na_value = NaN) {
  storage.mode(m) = "double"
  tp = m[1L, 1L]
  tn = m[2L, 2L]
  fp = m[1L, 2L]
  fn = m[2L, 1L]

  nomin = (tp * tn - fp * fn)
  denom = prod(sqrt(c(tp + fp, tp + fn, tn + fp, tn + fn)))
  if (denom == 0L) nomin else nomin / denom
}

#' @include measures.R
add_measure(mcc, "Matthews Correlation Coefficient", "binary", -1, 1, FALSE)
