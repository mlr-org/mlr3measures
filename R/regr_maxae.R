#' @title Max Absolute Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \max \left( \left| t_i - r_i \right| \right).
#'  }{
#'    max(abs(t - r)).
#'  }
#'
#' @templateVar mid maxae
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
maxae = function(truth, response, ...) {
  assert_regr(truth, response = response)
  max(ae(truth, response))
}

#' @include measures.R
add_measure(maxae, "Max Absolute Error", "regr", 0, Inf, TRUE)
