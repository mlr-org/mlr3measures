#' @title Sum of Squared Errors
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sum_{i=1}^n \left( t_i - r_i \right)^2.
#' }{
#'   sum((t - r)^2).
#' }
#'
#' @templateVar mid sse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
sse = function(truth, response, ...) {
  assert_regr(truth, response = response)
  sum(se(truth, response))
}

#' @include measures.R
add_measure(sse, "Sum of Squared Errors", "regr", 0, Inf, TRUE)
