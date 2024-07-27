#' @title Log Loss
#'
#' @details
#' The Log Loss (a.k.a Benoulli Loss, Logistic Loss, Cross-Entropy Loss) is defined as
#' \deqn{
#'   -\frac{1}{n} \sum_{i=1}^n w_i \log \left(  p_i \right )
#' }{
#'   -weighted.mean(log(p), w)
#' }
#' where \eqn{p_i}{p} is the probability for the true class of observation \eqn{i} and \eqn{w_i} are normalized weights for each observation \eqn{x_i}.
#'
#' @templateVar mid logloss
#' @template classif_template
#'
#' @inheritParams classif_params
#' @param eps (`numeric(1)`)\cr
#'   Probabilities are clipped to `max(eps, min(1 - eps, p))`.
#'   Otherwise the measure would be undefined for probabilities `p = 0` and `p = 1`.
#' @export
#' @examples
#' set.seed(1)
#' lvls = c("a", "b", "c")
#' truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
#' prob = matrix(runif(3 * 10), ncol = 3, dimnames = list(NULL, lvls))
#' prob = t(apply(prob, 1, function(x) x / sum(x)))
#' logloss(truth, prob)
logloss = function(truth, prob, sample_weights = NULL, eps = 1e-15, ...) {
  assert_classif(truth, prob = prob)
  assert_number(eps, lower = 0, upper = 1)

  ii = match(as.character(truth), colnames(prob))
  p = prob[cbind(seq_len(nrow(prob)), ii)]
  p = pmax(eps, pmin(1 - eps, p))
  -wmean(log(p), sample_weights)
}

#' @include measures.R
add_measure(logloss, "Log Loss", "classif", 0, Inf, TRUE)
