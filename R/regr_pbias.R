#' @title Percent Bias
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \frac{\left( t_i - r_i \right)}{\left| t_i \right|}.
#' }{
#'   mean((t - r) / abs(t)).
#' }
#' Good predictions score close to 0.
#'
#' @templateVar mid pbias
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
pbias = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  if (any(abs(truth) < TOL))
    return(na_value)
  mean((truth - response) / abs(truth))
}

#' @include measures.R
add_measure(pbias, "Percent Bias", "regr", -Inf, Inf, NA)
