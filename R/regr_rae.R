#' @title Relative Absolute Error
#'
#' @details
#' The Relative Absolute Error is defined as \deqn{
#'   \frac{\sum_{i=1}^n \left| t_i - r_i \right|}{\sum_{i=1}^n \left| t_i - \bar{t} \right|}.
#' }{
#'   sum((t - r)^2) / sum((t - mean(t))^2).
#' }
#' Can be interpreted as absolute error of the predictions relative to a naive model predicting the mean.
#'
#' @templateVar mid rae
#' @template regr_template
#'
#' @details
#' This measure is undefined for constant \eqn{t}.
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
rae = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  div(sum(ae(truth, response)), sum(ae(truth, mean(truth))), na_value)
}


#' @include measures.R
add_measure(rae, "Relative Absolute Error", "regr", 0, Inf, TRUE)
