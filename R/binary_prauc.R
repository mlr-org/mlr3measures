#' @title Area Under the Precision-Recall Curve
#'
#' @details
#' Computes the area under the Precision-Recall curve (PRC).
#' The PRC can be interpreted as the relationship between precision and recall (sensitivity),
#' and is considered to be a more appropriate measure for unbalanced datasets than the ROC curve.
#' The PRC is computed by integration of the piecewise function.
#'
#' @templateVar mid prauc
#' @template binary_template
#'
#' @details
#' This measure is undefined if the true values are either all positive or
#' all negative.
#'
#' @inheritParams binary_params
#'
#' @references
#' `r format_bib("davis_2006")`
#'
#' @export
#' @examples
#' truth = factor(c("a", "a", "a", "b"))
#' prob = c(.6, .7, .1, .4)
#' prauc(truth, prob, "a")
prauc = function(truth, prob, positive, na_value = NaN, ...) {
  assert_binary(truth, prob = prob, positive = positive, na_value = na_value)

  i = which(truth == positive)
  n_pos = length(i)
  n_neg = length(truth) - n_pos

  if (n_pos == 0L || n_neg == 0L) {
    return(na_value)
  }

  truth = ifelse(truth == positive, 1, 0)
  PRROC::pr.curve(
    scores.class0 = prob,
    weights.class0 = truth
  )[[2]]
}

#' @include measures.R
add_measure(prauc, "Precision-Recall Curve", "binary", 0, 1, FALSE)
