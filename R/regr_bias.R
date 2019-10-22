#' @title Bias
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i - r_i \right).
#' }{
#'   mean(t - r).
#' }
#' Good predictions score close to 0.
#'
#' @templateVar mid bias
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
bias = function(truth, response, ...) {
  assert_regr(truth, response = response)
  mean(truth - response)
}

#' @include measures.R
add_measure(bias, "regr", -Inf, Inf, NA)
