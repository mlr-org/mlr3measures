#' @title Sum of Squared Errors
#'
#' @details
#' The Sum of Squared Errors is defined as \deqn{
#'   \sum_{i=1}^n w_i \left( t_i - r_i \right)^2.
#' }{
#'   sum(w * (t - r)^2).
#' }
#' where \eqn{w_i} are unnormalized weights for each observation \eqn{x_i}, defaulting to 1.
#'
#' @templateVar mid sse
#' @template regr_template
#'
#' @param sample_weights (`numeric()`)\cr
#'   Vector of non-negative and finite sample weights.
#'   Must have the same length as `truth`.
#'   Weights for this function are not normalized.
#'   Defaults to sample weights 1.
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
sse = function(truth, response, sample_weights = NULL, ...) {
  assert_regr(truth, response = response)
  wsum(.se(truth, response), sample_weights)
}

#' @include measures.R
add_measure(sse, "Sum of Squared Errors", "regr", 0, Inf, TRUE, obs_loss = "se")
