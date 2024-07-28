#' @title Geometric Mean of Recall and Specificity
#'
#' @details
#' Calculates the geometric mean of [recall()] R and [specificity()] S as \deqn{
#'    \sqrt{\mathrm{R} \cdot \mathrm{S}}.
#' }{
#'    sqrt(R * S)
#' }
#'
#' @templateVar mid gmean
#' @template binary_template
#'
#' @details
#' This measure is undefined if recall or specificity is undefined, i.e. if TP + FN = 0 or if FP + TN = 0.
#'
#' @references
#' `r format_bib("he_2009")`
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
gmean = function(truth, response, positive, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  gmean_cm(cm(truth, response, positive), na_value)
}

gmean_cm = function(m, na_value = NaN) {
  cs = colSums(m)
  if (any(cs == 0L)) {
    return(na_value)
  }

  sqrt(prod(diag(m) / colSums(m)))
}

#' @include measures.R
add_measure(gmean, "Geometric Mean of Recall and Specificity", "binary", 0, 1, FALSE)
