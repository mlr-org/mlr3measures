#' @title R Squared
#'
#' @description
#' Regression measure defined as \deqn{
#'   1 - \frac{\sum_{i=1}^n \left( t_i - r_i \right)^2}{\sum_{i=1}^n \left( t_i - \bar{t} \right)^2}.
#' }{
#'   1 - sum((t - r)^2) / sum((t - mean(t))^2).
#' }
#' Also known as coefficient of determination or explained variation.
#' Subtracts the [rse()] from 1, hence it compares the squared error of
#' the predictions relative to a naive model predicting the mean.
#'
#'
#' @templateVar mid rsq
#' @template regr_template
#'
#' @details
#' This measure is undefined for constant \eqn{t}.
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
rsq = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  v = var(truth)
  if (v < TOL) {
    return(na_value)
  }
  1 - sum(se(truth, response)) / (v * (length(truth) - 1L))
}

#' @include measures.R
add_measure(rsq, "R Squared", "regr", -Inf, 1, FALSE)
