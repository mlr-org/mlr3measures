#' @title Root Mean Squared Error
#'
#' @details
#' The Root Mean Squared Error is defined as \deqn{
#'   \sqrt{\frac{1}{n} \sum_{i=1}^n w_i \left( t_i - r_i \right)^2}.
#' }{
#'   sqrt(weighted.mean((t - r)^2, w)).
#' }
#'
#' @templateVar mid rmse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
rmse = function(truth, response, sample_weights = NULL, ...) {
  assert_regr(truth, response = response)
  sqrt(wmean(.se(truth, response), sample_weights))
}

#' @include measures.R
add_measure(rmse, "Root Mean Squared Error", "regr", 0, Inf, TRUE, obs_loss = "se", trafo = list(fn = sqrt, deriv = function(x) 0.5 / sqrt(x)))
