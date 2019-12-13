#' @title True Negatives
#'
#' @description
#' Classification measure counting the true negatives, i.e. the number of
#' predictions correctly indicating a negative class label.
#'
#' @templateVar mid tn
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_tn
#' @export
tn = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_tn, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(tn, "True Negatives", "binary", 0, Inf, FALSE)
