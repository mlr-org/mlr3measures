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
#' @export
fp = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  fp_cm(cm(truth, response, positive))
}

fp_cm = function(m, na_value = NaN) {
  m[1L, 2L]
}

#' @include measures.R
add_measure(fp, "binary", 0, Inf, TRUE)
