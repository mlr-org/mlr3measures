#' @title Squared Error (per observation)
#'
#' @details
#' Calculates the per-observation squared error as \deqn{
#'   \left( t_i - r_i \right)^2.
#' }{
#'   (t - r)^2.
#' }
#'
#' @templateVar mid se
#' @template regr_template
#' @inheritParams regr_params
#'
#' @export
se = function(truth, response, ...) {
  assert_regr(truth, response)
  .se(truth, response)
}

.se = function(truth, response) {
  (truth - response)^2
}

#' @include measures.R
add_measure(se, "Squared Error (per observation)", "regr", 0, Inf, TRUE, aggregated = FALSE)
