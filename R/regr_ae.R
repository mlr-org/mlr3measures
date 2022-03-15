#' @title Absolute Error (per observation)
#'
#' @description
#' Calculates the per-observation absolute error as \deqn{
#'   \left| t_i - r_i \right|.
#' }{
#'   abs(t - r).
#' }
#'
#' @templateVar mid ae
#' @template regr_template
#' @inheritParams regr_params
#'
#' @export
ae = function(truth, response, ...) {
  assert_regr(truth, response)
  .ae(truth, response)
}

.ae = function(truth, response) {
  abs(truth - response)
}

#' @include measures.R
add_measure(ae, "Absolute Error (per observation)", "regr", 0, Inf, TRUE, aggregated = FALSE)
