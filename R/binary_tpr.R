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
#' @useDynLib mlr3measures c_tpr
#' @export
tpr = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_tpr, cm(truth, response, positive), length(truth))
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
