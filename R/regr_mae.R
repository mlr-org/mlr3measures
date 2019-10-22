#' @title Mean Absolute Errors
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left| t_i - r_i \right|.
#' }{
#'   mean(abs(t - r)).
#' }
#'
#' @templateVar mid mae
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
mae = function(truth, response, ...) {
  assert_regr(truth, response = response)
  mean(ae(truth, response))
}

#' @include measures.R
add_measure(mae, "regr", 0, Inf, TRUE)
