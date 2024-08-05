#' @title Median Absolute Error
#'
#' @details
#' The Median Absolute Error is defined as \deqn{
#'   \mathop{\mathrm{median}} \left| t_i - r_i \right|.
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
  median(.ae(truth, response))
}

#' @include measures.R
add_measure(medae, "Median Absolute Error", "regr", 0, Inf, TRUE, obs_loss = "ae")
