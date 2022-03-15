#' @title Median Squared Error
#'
#' @details
#' The Median Squared Error is defined as \deqn{
#'   \mathop{\mathrm{median}}_i \left[ \left( t_i - r_i \right)^2 \right].
#' }{
#'   median((t - r)^2).
#' }
#'
#' @templateVar mid medse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
medse = function(truth, response, ...) {
  assert_regr(truth, response = response)
  median(.se(truth, response))
}

#' @include measures.R
add_measure(medse, "Median Squared Error", "regr", 0, Inf, TRUE, obs_loss = "se")
