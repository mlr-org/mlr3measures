#' @title Root Mean Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sqrt{\frac{1}{n} \sum_{i=1}^n \left( t_i - r_i \right)^2}.
#' }{
#'   sqrt(mean((t - r)^2)).
#' }
#'
#' @templateVar mid rmse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
rmse = function(truth, response, ...) {
  assert_regr(truth, response = response)
  sqrt(mean(se(truth, response)))
}

#' @include measures.R
add_measure(rmse, "Root Mean Squared Error", "regr", 0, Inf, TRUE)
