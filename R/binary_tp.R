#' @title True Positives
#'
#' @description
#' Binary classification measure counting the true positives, i.e. the number of
#' predictions correctly indicating a positive class label.
#'
#' @templateVar mid tp
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_tp
#' @export
tp = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_tp, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(tp, "True Positives", "binary", 0, Inf, FALSE)
