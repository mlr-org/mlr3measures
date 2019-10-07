#' @title Median Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \mathop{\mathrm{median}}_i \left[ \left( t_i - r_i \right)^2 \right].
#' }{
#'   median((t - r)^2).
#' }
#'
#' @templateVar mid medse
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @export
medse = function(truth, response) {
  median(se(truth, response))
}

#' @include metainfo.R
add_info(medse, "regr", 0, Inf, TRUE)
