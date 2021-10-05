#' @title True Positives
#'
#' @details
#' This measure counts the true positives, i.e. the number of
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
#' @export
tp = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  tp_cm(cm(truth, response, positive))
}

tp_cm = function(m, na_value = NaN) {
  m[1L, 1L]
}

#' @include measures.R
add_measure(tp, "True Positives", "binary", 0, Inf, FALSE)
