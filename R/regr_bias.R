#' @title Bias
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left( t_i - r_i \right).
#' }{
#'   weighted.mean(t - r, w).
#' }
#' Good predictions score close to 0.
#'
#' @templateVar mid bias
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
bias = function(truth, response, sample_weights = NULL, ...) {
  assert_regr(truth, response = response)
  wmean(truth - response, sample_weights)
}

#' @include measures.R
add_measure(bias, "Bias", "regr", -Inf, Inf, NA)
