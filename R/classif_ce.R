#' @title Classification Error
#'
#' @details
#' The Classification Error is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left( t_i \neq r_i \right).
#' }{
#'   weighted.mean(t != r, w).
#' }
#'
#' @templateVar mid ce
#' @template classif_template
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
ce = function(truth, response, sample_weights = NULL, ...) {
  assert_classif(truth, response = response)
  wmean(truth != response, sample_weights)
}

ce_cm = function(m, na_value = NaN) {
  s = sum(m)
  diag(m) = 0
  sum(m) / s
}

#' @include measures.R
add_measure(ce, "Classification Error", "classif", 0, 1, TRUE)
