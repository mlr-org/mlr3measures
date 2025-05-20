#' @title Mean Squared Error
#'
#' @details
#' The Mean Squared Error is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left( t_i - r_i \right)^2,
#' }{
#'   weighted.mean((t - r)^2, w),
#' }
#' where \eqn{w_i} are normalized sample weights.
#'
#' @templateVar mid mse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
mse = function(truth, response, sample_weights = NULL, ...) {
  assert_regr(truth, response = response)
  wmean(.se(truth, response), sample_weights)
}

#' @include measures.R
add_measure(mse, "Mean Squared Error", "regr", 0, Inf, TRUE, obs_loss = "se")
