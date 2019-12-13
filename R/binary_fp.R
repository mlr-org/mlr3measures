#' @title False Positives
#'
#' @description
#' Classification measure counting the false positives (type 1 error), i.e. the number of
#' predictions indicating a positive class label while in fact it is negative.
#'
#' @templateVar mid fp
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @useDynLib mlr3measures c_fp
#' @export
fp = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  .Call(c_fp, cm(truth, response, positive), length(truth))
}

#' @include measures.R
add_measure(fp, "False Positives", "binary", 0, Inf, TRUE)
