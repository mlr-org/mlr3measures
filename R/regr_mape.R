#' @title Mean Absolute Percent Error
#'
#' @details
#' The Mean Absolute Percent Error is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left| \frac{ t_i - r_i}{t_i} \right|,
#'  }{
#'    weighted.mean(abs((t - r) / t), w),
#'  }
#' where \eqn{w_i} are normalized sample weights.
#'
#' @details
#' This measure is undefined if any element of \eqn{t} is \eqn{0}.
#'
#' @templateVar mid mape
#' @template regr_template
#'
#' @references
#' `r format_bib("de_myttenaere_2016")`
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
mape = function(truth, response, sample_weights = NULL, na_value = NaN, ...) {
  assert_regr(truth, response = response)
  if (any(abs(truth) < TOL)) {
    return(na_value)
  }
  wmean(.ape(truth, response), sample_weights)
}

#' @include measures.R
add_measure(mape, "Mean Absolute Percent Error", "regr", 0, Inf, TRUE, obs_loss = "ape")
