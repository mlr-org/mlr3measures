#' @title Relative Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{\sum_{i=1}^n \left( t_i - r_i \right)^2}{\sum_{i=1}^n \left( t_i - \bar{t} \right)^2}.
#' }{
#'   sum((t - r)^2) / sum((t - mean(t))^2).
#' }
#' Can be interpreted as squared error of the predictions relative to a naive model predicting the mean.
#'
#' @templateVar mid rse
#' @template regr_template
#'
#' @details
#' This measure is undefined for constant \eqn{t}.
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
rse = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  v = var(truth)
  if (v < TOL) {
    return(na_value)
  }
  sum(se(truth, response)) / (v * (length(truth) - 1L))
}

#' @include measures.R
add_measure(rse, "Relative Squared Error", "regr", 0, Inf, TRUE)
