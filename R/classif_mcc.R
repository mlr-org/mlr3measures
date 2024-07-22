#' @title Matthews Correlation Coefficient
#'
#' @details
#' In the binary case, the Matthews Correlation Coefficient is defined as \deqn{
#'    \frac{\mathrm{TP} \cdot \mathrm{TN} - \mathrm{FP} \cdot \mathrm{FN}}{\sqrt{(\mathrm{TP} + \mathrm{FP}) (\mathrm{TP} + \mathrm{FN}) (\mathrm{TN} + \mathrm{FP}) (\mathrm{TN} + \mathrm{FN})}},
#' }{
#'    (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)),
#' }
#' where \eqn{TP}, \eqn{FP}, \eqn{TN}, \eqn{TP} are the number of true positives, false positives, true negatives, and false negatives respectively.
#'
#' In the multi-class case, the Matthews Correlation Coefficient defined for a multi-class confusion matrix \eqn{C} with \eqn{K} classes: \deqn{
#'    \frac{c \cdot s - \sum_k^K p_k \cdot t_k}{\sqrt{(s^2 - \sum_k^K p_k^2) \cdot (s^2 - \sum_k^K t_k^2)}},
#' }{
#'    (c * s - sum(pk * tk)) / sqrt((s^2 - sum(pk^2)) * (s^2 - sum(tk^2))),
#' }
#' where
#' - \eqn{s = \sum_i^K \sum_j^K C_{ij}}: total number of samples
#' - \eqn{c = \sum_k^K C_{kk}}: total number of correctly predicted samples
#' - \eqn{t_k = \sum_i^K C_{ik}}: number of predictions for each class \eqn{k}
#' - \eqn{p_k = \sum_j^K C_{kj}}: number of true occurrences for each class \eqn{k}.
#'
#' @templateVar mid mcc
#' @template classif_template
#'
#' @details
#' The above formula is undefined if any of the four sums in the denominator is 0 in the binary case and more generally if either \eqn{s^2 - sum(pk^2)} or \eqn{s^2 - sum(tk^2)} is equal to 0.
#' The denominator is then set to 1.
#' When there are more than two classes, the MCC will no longer range between -1 and +1.
#' Instead, the minimum value will be between -1 and 0 depending on the true distribution. The maximum value is always +1.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Phi_coefficient}
#'
#' `r format_bib("matthews_1975")`
#'
#' @inheritParams classif_params
#' @param positive (`character(1`) Name of the positive class in case of binary classification.
#'
#' @template classif_example
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
