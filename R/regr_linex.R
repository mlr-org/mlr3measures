#' @title Linear-Exponential Loss (per observation)
#'
#' @details
#' The Linear-Exponential Loss is defined as \deqn{
#'   b (\exp (t_i - r_i) - a (t_i - r_i) - 1),
#' }{
#    b(exp(t - r) − a(t - r) − 1),
#' }
#' where \eqn{a \neq 0, b > 0}.
#'
#' @templateVar mid linex
#' @template regr_template
#' @param a (`numeric(1)`)\cr
#'   Shape parameter controlling asymmetry.
#'   Negative values penalize overestimation more, positive values penalize underestimation more.
#'   As `a` approaches 0, the loss resembles squared error loss. Default is `-1`.
#' @param b (`numeric(1)`)\cr
#'   Positive scaling factor for the loss. Larger values increase the loss magnitude.
#'   Default is `1`.
#'
#' @references
#' `r format_bib("varian_1975")`
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
linex = function(truth, response, a = -1, b = 1, ...) {
  assert_regr(truth, response = response)
  assert_number(a)
  assert_number(b, lower = 0)
  if (a == 0) {
    stop("'a' can't be 0")
  }
  e = truth - response
  we = a * e
  b * (exp(we) - we - 1)
}

#' @include measures.R
add_measure(linex, "Linear-exponential Loss (per observation)", "regr", 0, Inf, TRUE, aggregated = FALSE)
