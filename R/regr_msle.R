#' @title Mean Squared Log Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( \ln (1 + t_i) - \ln (1 + r_i) \right)^2.
#' }{
#'   mean(log(1 + t) - log(1 + r))^2.
#' }
#'
#' @templateVar mid msle
#' @template regr_template
#'
#' @note
#' This measure is undefined if any element of \eqn{t} or \eqn{r} is less than or equal to \eqn{-1}.
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
msle = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response, na_value = na_value)
  if (min(truth, response) < -1)
    return(na_value)
  mean(sle(truth, response))
}

#' @include measures.R
add_measure(msle, "regr", 0, Inf, TRUE)
