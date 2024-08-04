#' @title Percent Bias
#'
#' @details
#' The Percent Bias is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \frac{\left( t_i - r_i \right)}{\left| t_i \right|},
#' }{
#'   weighted.mean((t - r) / abs(t), w),
#' }
#' where \eqn{w_i} are normalized sample weights.
#' Good predictions score close to 0.
#'
#' @templateVar mid pbias
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
pbias = function(truth, response, sample_weights = NULL, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  if (any(abs(truth) < TOL)) {
    return(na_value)
  }
  wmean((truth - response) / abs(truth), sample_weights)
}

#' @include measures.R
add_measure(pbias, "Percent Bias", "regr", -Inf, Inf, NA)
