#' @title Max Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \max \left( t_i - r_i \right)^2.
#'  }{
#'    max((t - r)^2).
#'  }
#'
#' @templateVar mid maxse
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
maxse = function(truth, response, ...) {
  assert_regr(truth, response = response)
  max(se(truth, response))
}

#' @include measures.R
add_measure(maxse, "regr", 0, Inf, TRUE)
