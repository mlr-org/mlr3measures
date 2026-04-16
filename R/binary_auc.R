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

  # Unweighted path uses the rank-sum identity via a single C-level rank() call.
  # Weighted path computes the Mann-Whitney U directly: a sort + cumsum over
  # negative weights, with rle() to share values across tied prob groups.
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

    # Weighted AUC via the direct Mann-Whitney form:
    #   AUC_w = sum_i w_i^+ U_i^w / (W+ W-),
    # with U_i^w = W_<i^- + W_=i^- / 2, i.e. the weight of negatives strictly
    # below prob[i] plus half the weight of negatives tied with prob[i].
    w1 = sum(sample_weights[i])
    w0 = sum(sample_weights) - w1

    if (w1 == 0 || w0 == 0) {
      return(na_value)
    }

    # Compute U in one O(n log n) sort + O(n) sweep over negative weights.
    # permutation placing observations in ascending prob order
    ord = order(prob)
    # mask out positives: only negatives contribute to U
    w_neg = sample_weights[ord] * (truth[ord] != positive)
    # running total along the sort order: cw[k] = weight of negatives with
    # prob <= prob[ord[k]]
    cw = cumsum(w_neg)
    # run-length encode the sorted prob values: each run is a tie group
    run = rle(prob[ord])
    # end[g] = sorted-order index of the last obs in tie group g,
    # so cw[end[g]] = W_<s^- + W_=s^- for that group's distinct value s
    # end[g] = sorted-order index of the last element of tie group g. Because
    # cw is cumulative over sorted order, cw[end[g]] is the total negative
    # weight accumulated up to and including group g, i.e. W_<=s^- for that
    # group's shared prob value s. Split that into
    #   cw[end[g]] = W_<s^- (negatives strictly below s)
    #              + W_=s^- (negatives tied exactly at s).
    end = cumsum(run$lengths)

    # W_=s^- for group g is just how much cw grew inside the group, i.e. the
    # difference between cw at the end of this group and cw at the end of the
    # previous group. For g = 1 there is no previous group, so we treat it as
    # 0. `c(0, cw[end[-length(end)]])` is [0, cw[end[1]], ..., cw[end[G-1]]],
    # giving a vectorized diff. (Equivalent to diff(c(0, cw[end])).)
    w_eq = cw[end] - c(0, cw[end[-length(end)]])

    # Every observation in tie group g gets the same Mann-Whitney contribution
    #   u = W_<s^- + W_=s^- / 2.
    # Rewriting using the quantities we already have:
    #   u = (W_<s^- + W_=s^-) - W_=s^- / 2 = cw[end[g]] - w_eq[g] / 2.
    # rep(..., run$lengths) expands the per-group u back to one value per
    # observation, still in sorted order.
    u_sorted = rep(cw[end] - w_eq / 2, run$lengths)
    # allocate u in original (unsorted) order
    u = numeric(length(prob))
    u[ord] = u_sorted

    sum(sample_weights[i] * u[i]) / (w1 * w0)
  }
}

#' @include measures.R
add_measure(auc, "Area Under the ROC Curve", "binary", 0, 1, FALSE)
