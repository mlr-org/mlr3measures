#' @title Relative Absolute Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{\sum_{i=1}^n \left| t_i - r_i \right|}{\sum_{i=1}^n \left| t_i - \bar{t} \right|}.
#' }{
#'   sum((t - r)^2) / sum((t - mean(t))^2).
#' }
#'
#' @templateVar mid rae
#' @template regr_metainfo
#'
#' @note
#' This measure is undefined for constant \eqn{t}.
#'
#' @template regr_params
#' @template na_value
#' @template regr_return
#' @export
rae = function(truth, response, na_value = NaN) {
  div(sum(ae(truth, mean(truth))), sae(truth, response), na_value)
}


#' @include metainfo.R
add_info(rae, "regr", 0, Inf, TRUE)
