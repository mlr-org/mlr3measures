#' @title Squared Log Error (per observation)
#'
#' @description
#' Calculates the per-observation squared error as \deqn{
#'   \left( \ln (1 + t_i) - \ln (1 + r_i) \right)^2.
#' }{
#'   (log(1 + t) - log(1 + r))^2.
#' }
#'
#' @templateVar mid sle
#' @template regr_template
#' @inheritParams regr_params
#'
#' @export
sle = function(truth, response, ...) {
  assert_regr(truth, response)
  .sle(truth, response)
}

.sle = function(truth, response) {
  (log1p(truth) - log1p(response))^2
}

#' @include measures.R
add_measure(sle, "Squared Log Error (per observation)", "regr", 0, Inf, TRUE, aggregated = FALSE)
