#' @title Mean Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i - r_i \right)^2.
#' }{
#'   mean((t - r)^2).
#' }
#'
#' @templateVar mid mse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
mse = function(truth, response, ...) {
  assert_regr(truth, response = response)
  mean(se(truth, response))
}

#' @include measures.R
add_measure(mse, "Mean Squared Error", "regr", 0, Inf, TRUE)
