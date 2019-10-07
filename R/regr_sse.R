#' @title Sum of Squared Errors
#'
#' @description
#' Definition:
#' \deqn{
#'   \sum_{i=1}^n \left( t_i - r_i \right)^2.
#' }{
#'   sum((t - r)^2)
#' }
#'
#' @templateVar mid sse
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @export
sse = function(truth, response) {
  sum(se(truth, response))
}

#' @include metainfo.R
add_info(sse, "regr", 0, Inf, TRUE)
