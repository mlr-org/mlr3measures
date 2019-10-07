#' @title Symmetric Mean Absolute Percent Error
#'
#' @description
#' Definition:
#' \deqn{
#'   \frac{2}{n} \sum_{i=1}^n \frac{\left| t_i - r_i \right|}{\left| t_i \right| + \left| t_i \right|}.
#' }{
#'   2 * mean(abs(t - r) / (abs(t) + abs(r)))
#' }
#'
#' @templateVar mid smape
#' @template regr_metainfo
#'
#' @note
#' This measure is undefined if if any \eqn{|t| + |r|} is \eqn{0}.
#'
#' @template regr_params
#' @template na_value
#' @template regr_return
#' @export
smape = function(truth, response, na_value = NaN) {
  denom = abs(truth) + abs(response)
  if (any(denom < TOL))
    return(na_value)
  2 * mean(ae(truth, response) / denom)
}

#' @include metainfo.R
add_info(smape, "regr", 0, Inf, TRUE)
