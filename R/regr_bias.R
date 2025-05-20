#' @title Bias
#'
#' @details
#' The Bias is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left( r_i - t_i \right).
#' }{
#'   weighted.mean(r - t, w).
#' }
#' where \eqn{w_i} are normalized sample weights.
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
  wmean(response - truth, sample_weights)
}

#' @include measures.R
add_measure(bias, "Bias", "regr", -Inf, Inf, NA)
