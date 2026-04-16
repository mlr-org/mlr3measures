#' @title Area Under the ROC Curve
#'
#' @details
#' Computes the area under the Receiver Operator Characteristic (ROC) curve.
#' The AUC can be interpreted as the probability that a randomly chosen positive observation
#' has a higher predicted probability than a randomly chosen negative observation.
#'
#' For \eqn{n^+} positive and \eqn{n^-} negative observations with \eqn{R_i^+} the rank of the
#' \eqn{i}-th positive observation's predicted probability (average ranks for ties), the AUC
#' is estimated as \deqn{
#'   \widehat{\operatorname{AUC}} = \frac{1}{n^+ n^-} \left( \sum_{i=1}^{n^+} R_i^+ \; - \; \frac{n^+(n^+ + 1)}{2} \right).
#' }{
#'   AUC = (sum(R_pos) - n_pos * (n_pos + 1) / 2) / (n_pos * n_neg).
#' }
#'
#' If `sample_weights` are provided, let \eqn{w_i^+} be the weight of the \eqn{i}-th positive observation with
#' predicted probability \eqn{p_i^+}, \eqn{W^+ = \sum_i w_i^+}, and \eqn{W^-} the total weight of the
#' negative observations. Define the weighted Mann-Whitney contribution of positive observation \eqn{i} as
#' \eqn{U_i^w = W_{< p_i^+}^- + \tfrac{1}{2} W_{= p_i^+}^-},
#' i.e. the total weight of negative observations with a smaller predicted probability plus half the weight
#' of negatives tied with \eqn{p_i^+}. The weighted AUC is then \deqn{
#'   \widehat{\operatorname{AUC}}_w = \frac{1}{W^+ W^-} \sum_{i=1}^{n^+} w_i^+ U_i^w.
#' }{
#'   AUC_w = sum(w_pos * U_pos) / (W_pos * W_neg).
#' }
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

  # Two paths share the Mann-Whitney rank-sum identity but differ in how ranks
  # are built: rank() is a single C-level pass, while the weighted branch needs
  # order() + rle() to assign shared weighted ranks across tied prob values.
  if (is.null(sample_weights)) {
    # Unweighted: AUC = (sum_{i in pos} r_i - n+(n+ + 1)/2) / (n+ * n-),
    # where r_i is the average rank of prob[i] in the combined sample.
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

    # Weighted AUC via the rank-sum identity in weighted form. The weighted
    # rank is the direct analog of rank(..., ties.method = "average"):
    #   wr_i = W_<i + W_=i / 2 + w_i / 2,
    # i.e. the sum of weights of all observations <= prob[i] with ties at half
    # (W_<i strictly below, W_=i tied including self). Then
    #   sum_i w_i^+ wr_i = ((W+)^2 + sum_i (w_i^+)^2) / 2 + sum_i w_i^+ U_i^w,
    # with U_i^w = sum_j w_j^- [I(p_j^- < p_i^+) + 1/2 I(p_j^- = p_i^+)]. The
    # sum_i (w_i^+)^2 term accounts for the self-contribution of each positive
    # to its own weighted rank. Rearranging:
    #   AUC_w = (sum_i w_i^+ wr_i - ((W+)^2 + sum_i (w_i^+)^2) / 2) / (W+ W-).
    # Setting all w = 1 recovers n+(n+ + 1)/2 and the unweighted formula above.
    # Derivation: notes-ml/content/01_auc.tex, "Weighted AUC" section.
    w1 = sum(sample_weights[i])
    w0 = sum(sample_weights) - w1

    if (w1 == 0 || w0 == 0) {
      return(na_value)
    }

    # Compute wr (weighted rank vector) in one O(n log n) sort + O(n) sweep.
    # permutation placing observations in ascending prob order
    ord = order(prob)
    # running total along the sort order: cw[k] = sum of weights of the
    # first k observations in sorted order = W of all obs with prob <= prob[ord[k]]
    cw = cumsum(sample_weights[ord])
    # run-length encode the sorted prob values: each run is a tie group
    run = rle(prob[ord])
    # end[g] = sorted-order index of the last obs in tie group g,
    # so cw[end[g]] = W_<s + W_=s for that group's distinct value s
    end = cumsum(run$lengths)
    # w_eq[g] = W_=s for group g, obtained as the diff of consecutive cw[end];
    # prepending 0 makes the first group equal to cw[end[1]] itself
    w_eq = cw[end] - c(0, cw[end[-length(end)]])
    # every member of tie group g shares the part W_<s + W_=s/2 = cw[end] - w_eq/2;
    # adding the member's own w_i/2 completes wr_i = W_<i + W_=i/2 + w_i/2
    wr_sorted = rep(cw[end] - w_eq / 2, run$lengths) + sample_weights[ord] / 2
    # allocate wr in original (unsorted) order
    wr = numeric(length(prob))
    # invert the sort: the ord[k]-th original observation has weighted rank wr_sorted[k]
    wr[ord] = wr_sorted

    (sum(sample_weights[i] * wr[i]) - (w1 * w1 + sum(sample_weights[i]^2)) / 2) / (w1 * w0)
  }
}

#' @include measures.R
add_measure(auc, "Area Under the ROC Curve", "binary", 0, 1, FALSE)
