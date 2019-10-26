#' @title Mean Absolute Percent Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left| \frac{ t_i - r_i}{t_i} \right|.
#'  }{
#'    mean(abs((t - r) / t)).
#'  }
#'
#' @note
#' This measure is undefined if any element of \eqn{t} is \eqn{0}.
#'
#' @templateVar mid mape
#' @template regr_template
#'
#' @references
#' \cite{de_myttenaere_2016}
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
mape = function(truth, response, na_value = NaN, ...) {
  assert_regr(truth, response = response)
  if (any(abs(truth) < TOL))
    return(na_value)
  mean(ape(truth, response))
}

#' @include measures.R
add_measure(mape, "Mean Absolute Percent Error", "regr", 0, Inf, TRUE)
