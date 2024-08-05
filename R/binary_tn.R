#' @title True Negatives
#'
#' @details
#' This measure counts the true negatives, i.e. the number of
#' predictions correctly indicating a negative class label. This is sometimes also called a "correct rejection".
#'
#' @templateVar mid tn
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
tn = function(truth, response, positive, ...) {
  assert_binary(truth, response = response, positive = positive)
  tn_cm(cm(truth, response, positive))
}

tn_cm = function(m, na_value = NaN) {
  m[2L, 2L]
}

#' @include measures.R
add_measure(tn, "True Negatives", "binary", 0, Inf, FALSE)
