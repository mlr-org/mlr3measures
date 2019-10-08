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
#' @templateVar mid percent_bias
#' @template regr_template
#'
#' @inheritParams regr_params
#' @export
percent_bias = function(truth, response, na_value = NaN) {
  if (any(abs(truth) < TOL))
    return(na_value)
  mean((truth - response) / abs(truth))
}

#' @include measures.R
add_measure(percent_bias, "regr", -Inf, Inf, NA)
