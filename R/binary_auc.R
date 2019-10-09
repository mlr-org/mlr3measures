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
#' @inheritParams binary_params
#' @export
#' @examples
#' truth = c("a", "a", "a", "b")
#' prob = c(.6, .7, .1, .4)
#' auc(truth, prob, "a")
auc = function(truth, prob, positive, ...) {
  i = (truth == positive)
  r = rank(prob, ties.method = "average")

  n_pos = sum(i)
  n_neg = length(i) - n_pos
  (sum(r[i]) - n_pos * (n_pos + 1L) / 2L) / (n_pos * n_neg)
}

#' @include measures.R
add_measure(auc, "binary", 0, 1, FALSE)
