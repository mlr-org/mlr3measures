#' @title Median Absolute Errors
#'
#' @description
#' Regression measure defined as \deqn{
#'   \mathop{\mathrm{median}}_i \left| t_i - r_i \right|.
#' }{
#'   median(abs(t - r)).
#' }
#'
#' @templateVar mid medae
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @export
medae = function(truth, response) {
  median(ae(truth, response))
}

#' @include metainfo.R
add_info(medae, "regr", 0, Inf, TRUE)
