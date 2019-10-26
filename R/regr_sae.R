#' @title Sum of Absolute Errors
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sum_{i=1}^n \left| t_i - r_i \right|.
#' }{
#'   sum(abs((t - r))).
#' }
#'
#' @templateVar mid sae
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
sae = function(truth, response, ...) {
  assert_regr(truth, response = response)
  sum(ae(truth, response))
}

#' @include measures.R
add_measure(sae, "Sum of Absolute Errors", "regr", 0, Inf, TRUE)
