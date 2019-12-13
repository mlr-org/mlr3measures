#' @title False Negatives
#'
#' @description
#' Classification measure counting the false negatives (type 2 error), i.e. the number of
#' predictions indicating a negative class label while in fact it is positive.
#' This is sometimes also called a "false alarm".
#'
#' @templateVar mid fn
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_fn
#' @export
fn = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_fn, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(fn, "False Negatives", "binary", 0, Inf, TRUE)
