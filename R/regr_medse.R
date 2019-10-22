#' @title Median Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
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
  median(se(truth, response))
}

#' @include measures.R
add_measure(medse, "regr", 0, Inf, TRUE)
