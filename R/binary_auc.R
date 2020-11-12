#' @title Area Under the ROC Curve
#'
#' @description
#' Computes the area under the Receiver Operator Characteristic (ROC) curve.
#' The AUC can be interpreted as the probability that a randomly chosen positive observation
#' has a higher predicted probability than a randomly chosen negative observation.
#'
#' @templateVar mid auc
#' @template binary_template
#'
#' @note
#' This measure is undefined if the true values are either all positive or
#' all negative.
#'
#' @inheritParams binary_params
#'
#' @references
#' `r format_bib("youden_1950")`
#'
#' @export
#' @examples
#' truth = factor(c("a", "a", "a", "b"))
#' prob = c(.6, .7, .1, .4)
#' auc(truth, prob, "a")
auc = function(truth, prob, positive, na_value = NaN, ...) {
  assert_binary(truth, prob = prob, positive = positive, na_value = na_value)

  i = which(truth == positive)
  n_pos = length(i)
  n_neg = length(truth) - n_pos

  if (n_pos == 0L || n_neg == 0L)
    return(na_value)

  r = rank(prob, ties.method = "average")
  # simplifying the following:
  # (sum(r[i]) - n_pos * (n_pos + 1L) / 2L) / (n_pos * n_neg)
  (mean(r[i]) - (as.numeric(n_pos) + 1) / 2) / as.numeric(n_neg)
}

#' @include measures.R
add_measure(auc, "Area Under the ROC Curve", "binary", 0, 1, FALSE)
