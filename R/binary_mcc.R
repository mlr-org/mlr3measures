#' @title Matthews Correlation Coefficient
#'
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{\mathrm{TP} \cdot \mathrm{TN} - \mathrm{FP} \cdot \mathrm{FN}}{\sqrt{(\mathrm{TP} + \mathrm{FP}) (\mathrm{TP} + \mathrm{FN}) (\mathrm{TN} + \mathrm{FP}) (\mathrm{TN} + \mathrm{FN})}}.
#' }{
#'    (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)).
#' }
#'
#' @templateVar mid mcc
#' @template binary_template
#'
#' @note
#' This measure is undefined if any of the four sums in the denominator is 0.
#' The denominator is then set to 1.
#'
#' @references
#' \cite{matthews_1975}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_mcc
#' @export
mcc = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_mcc, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(mcc, "Matthews Correlation Coefficient", "binary", -1, 1, FALSE)
