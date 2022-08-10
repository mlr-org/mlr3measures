#' @title Geometric Mean of Precision and Recall
#'
#' @details
#' Calculates the geometric mean of [precision()] P and [recall()] R as \deqn{
#'    \sqrt{\mathrm{P} \mathrm{R}}.
#' }{
#'    sqrt(P * R)
#' }
#'
#' @templateVar mid gpr
#' @template binary_template
#'
#' @details
#' This measure is undefined if precision or recall is undefined, i.e. if TP + FP = 0 or if TP + FN = 0.
#'
#' @references
#' `r format_bib("he_2009")`
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
gpr = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  gpr_cm(cm(truth, response, positive), na_value)
}

gpr_cm = function(m, na_value = NaN) {
  rs1 = sum(m[1L, ])
  cs1 = sum(m[, 1L])
  if (rs1 == 0L || cs1 == 0L) {
    return(na_value)
  }

  sqrt(m[1L, 1L]^2 / (rs1 * cs1))
}

#' @include measures.R
add_measure(gpr, "Geometric Mean of Precision and Recall", "binary", 0, 1, TRUE)
