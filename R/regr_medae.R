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
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
medae = function(truth, response, ...) {
  assert_regr(truth, response = response)
  median(ae(truth, response))
}

#' @include measures.R
add_measure(medae, "regr", 0, Inf, TRUE)
