#' @title Mean Absolute Errors
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left| t_i - r_i \right|.
#' }{
#'   mean(abs(t - r)).
#' }
#'
#' @templateVar mid mae
#' @template regr_template
#'
#' @inheritParams regr_params
#' @export
mae = function(truth, response) {
  mean(ae(truth, response))
}

#' @include metainfo.R
add_info(mae, "regr", 0, Inf, TRUE)
