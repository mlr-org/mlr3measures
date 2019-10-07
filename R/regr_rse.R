#' @title Relative Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{\sum_{i=1}^n \left( t_i - r_i \right)^2}{\sum_{i=1}^n \left( t_i - \bar{t} \right)^2}.
#' }{
#'   sum((t - r)^2) / sum((t - mean(t))^2).
#' }
#'
#' @templateVar mid rse
#' @template regr_metainfo
#'
#' @note
#' This measure is undefined for constant \eqn{t}.
#'
#' @template regr_params
#' @template na_value
#' @template regr_return
#' @family Regression Measures
#' @export
rse = function(truth, response, na_value = NaN) {
  if (var(truth) < TOL)
    return(na_value)
  sse(truth, response) / sse(truth, mean(truth))
}

#' @include metainfo.R
add_info(rse, "regr", 0, Inf, TRUE)
