#' @title Sum of Absolute Errors
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sum_{i=1}^n \left| t_i - r_i \right|.
#' }{
#'   sum(abs((t - r))).
#' }
#'
#' @templateVar mid sae
#' @template regr_template
#'
#' @inheritParams regr_params
#' @export
sae = function(truth, response) {
  sum(ae(truth, response))
}

#' @include metainfo.R
add_info(sae, "regr", 0, Inf, TRUE)
