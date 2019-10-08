#' @title Root Relative Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sqrt{\frac{\sum_{i=1}^n \left( t_i - r_i \right)^2}{\sum_{i=1}^n \left( t_i - \bar{t} \right)^2}}.
#' }{
#'   sqrt(sum((t - r)^2) / sum((t - mean(t))^2)).
#' }
#' Can be interpreted as root of the squared error of the predictions relative to a naive model predicting the mean.
#'
#' @templateVar mid rrse
#' @template regr_template
#'
#' @note
#' This measure is undefined for constant \eqn{t}.
#'
#' @inheritParams regr_params
#' @export
rrse = function(truth, response, na_value = NaN) {
  if (var(truth) < TOL)
    return(na_value)
  sqrt(sse(truth, response) / sse(truth, mean(truth)))
}

#' @include measures.R
add_measure(rrse, "regr", 0, Inf, TRUE)
