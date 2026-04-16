#' @title Area Under the ROC Curve
#'
#' @details
#' Computes the area under the Receiver Operator Characteristic (ROC) curve.
#' The AUC can be interpreted as the probability that a randomly chosen positive observation
#' has a higher predicted probability than a randomly chosen negative observation.
#'
#' @templateVar mid auc
#' @template binary_template
#'
#' @details
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
auc = function(truth, prob, positive, sample_weights = NULL, na_value = NaN, ...) {
  assert_binary(truth, prob = prob, positive = positive, na_value = na_value)

  i = which(truth == positive)

  # keep unweighted path separate: rank() is a single C-level pass, while the
  # weighted branch needs order() + rle() to assign shared weighted ranks to tied prob values
  if (is.null(sample_weights)) {
    n_pos = length(i)
    n_neg = length(truth) - n_pos

    if (n_pos == 0L || n_neg == 0L) {
      return(na_value)
    }

    r = rank(prob, ties.method = "average")
    # simplifying the following:
    # (sum(r[i]) - n_pos * (n_pos + 1L) / 2L) / (n_pos * n_neg)
    (mean(r[i]) - (as.numeric(n_pos) + 1) / 2) / as.numeric(n_neg)
  } else {
    assert_numeric(sample_weights, lower = 0, finite = TRUE, any.missing = FALSE, len = length(truth))

    w1 = sum(sample_weights[i])
    w0 = sum(sample_weights) - w1

    if (w1 == 0 || w0 == 0) {
      return(na_value)
    }

    # within each tie group cw at the last index is W_lt + W_eq, shared by every group member.
    # subtracting W_eq/2 yields the weighted rank W_lt + W_eq/2.
    ord = order(prob)
    cw = cumsum(sample_weights[ord])
    run = rle(prob[ord])
    end = cumsum(run$lengths)
    w_eq = cw[end] - c(0, cw[end[-length(end)]])
    wr_sorted = rep(cw[end] - w_eq / 2, run$lengths)
    wr = numeric(length(prob))
    wr[ord] = wr_sorted

    (sum(sample_weights[i] * wr[i]) / w1 - w1 / 2) / w0
  }
}

#' @include measures.R
add_measure(auc, "Area Under the ROC Curve", "binary", 0, 1, FALSE)
