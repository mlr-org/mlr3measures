#' @title R Squared
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{\sum_{i=1}^n \left| t_i - r_i \right|}{\sum_{i=1}^n \left| t_i - \bar{t} \right|}.
#' }{
#'   sum((t - r)^2) / sum((t - mean(t))^2).
#' }
#'
#' @templateVar mid rsq
#' @template regr_metainfo
#'
#' @note
#' This measure is undefined for constant \eqn{t}.
#'
#' @template regr_params
#' @template na_value
#' @template regr_return
#' @export
rsq = function(truth, response, na_value = NaN) {
  if (var(truth) < TOL)
    return(na_value)
  1 - sse(truth, response) / sse(truth, mean(truth))
}

#' @include metainfo.R
add_info(rsq, "regr", 0, Inf, TRUE)
