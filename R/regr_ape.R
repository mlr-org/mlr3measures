#' @title Absolute Percentage Error (per observation)
#'
#' @description
#' Calculates the per-observation absolute percentage error as \deqn{
#'   \left| \frac{ t_i - r_i}{t_i} \right|.
#' }{
#'   abs((t - r) / t).
#' }
#'
#' @templateVar mid ape
#' @template regr_template
#' @inheritParams regr_params
#'
#' @export
ape = function(truth, response, ...) {
  assert_regr(truth, response)
  .ape(truth, response)
}

.ape = function(truth, response) {
  abs((truth - response) / truth)
}

#' @include measures.R
add_measure(ape, "Absolute Percentage Error (per observation)", "regr", 0, Inf, TRUE, aggregated = FALSE)
