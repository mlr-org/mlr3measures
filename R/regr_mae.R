#' @title Mean Absolute Error
#'
#' @details
#' The Mean Absolute Error is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left| t_i - r_i \right|.
#' }{
#'   weighted.mean(abs(t - r), w).
#' }
#'
#' @templateVar mid mae
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
mae = function(truth, response, sample_weights = NULL, ...) {
  assert_regr(truth, response = response)
  wmean(ae(truth, response), sample_weights)
}

#' @include measures.R
add_measure(mae, "Mean Absolute Error", "regr", 0, Inf, TRUE)
