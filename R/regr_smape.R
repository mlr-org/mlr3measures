#' @title Symmetric Mean Absolute Percent Error
#'
#' @details
#' The Symmetric Mean Absolute Percent Error is defined as \deqn{
#'   \frac{2}{n} \sum_{i=1}^n \frac{\left| t_i - r_i \right|}{\left| t_i \right| + \left| r_i \right|}.
#' }{
#'   2 * mean(abs(t - r) / (abs(t) + abs(r))).
#' }
#'
#' This measure is undefined if if any \eqn{|t| + |r|} is equal to \eqn{0}.
#'
#' @templateVar mid smape
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
smape = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  denom = abs(truth) + abs(response)
  if (any(denom < TOL)) {
    return(na_value)
  }
  2 * mean(.ae(truth, response) / denom)
}

#' @include measures.R
add_measure(smape, "Symmetric Mean Absolute Percent Error", "regr", 0, 2, TRUE)
