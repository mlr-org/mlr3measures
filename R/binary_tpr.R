#' @title True Positive Rate
#'
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
#' @template binary_example
#' @export
tpr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  tpr_cm(cm(truth, response, positive), na_value)
}

tpr_cm = function(m, na_value = NaN) {
  div(m[1L, 1L], sum(m[, 1L]), na_value)
}

#' @export
#' @rdname tpr
recall = tpr

#' @export
#' @rdname tpr
sensitivity = tpr

#' @include measures.R
add_measure(tpr, "True Positive Rate", "binary", 0, 1, FALSE)
add_measure(recall, "Recall", "binary", 0, 1, FALSE)
add_measure(sensitivity, "Sensitivity", "binary", 0, 1, FALSE)
