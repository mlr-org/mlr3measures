#' @title Root Mean Squared Log Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sqrt{\frac{1}{n} \sum_{i=1}^n \left( \ln (1 + t_i) - \ln (1 + r_i) \right)^2}.
#' }{
#'   sqrt(mean(log(1 + t) - log(1 + r))^2).
#' }
#'
#' @templateVar mid rmsle
#' @template regr_template
#'
#' @note
#' This measure is undefined if any element of \eqn{t} or \eqn{r} is less than or equal to \eqn{-1}.
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
rmsle = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  if (min(truth, response) <= -1)
    return(na_value)
  sqrt(mean(sle(truth, response)))
}

#' @include measures.R
add_measure(rmsle, "Root Mean Squared Log Error", "regr", 0, Inf, TRUE)
