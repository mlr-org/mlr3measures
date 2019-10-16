#' @title Log Loss
#'
#' @description
#' Classification measure defined as \deqn{
#'   -\frac{1}{n} \sum_{i=1}^n \log \left(  p_i \right )
#' }{
#'   -mean(log(p))
#' }
#' where \eqn{p_i}{p} is the probability for the true class of observation \eqn{i}.
#'
#' @templateVar mid ber
#' @template classif_template
#'
#' @inheritParams classif_params
#' @param eps :: `numeric(1)`\cr
#'   Probabilities are clipped to `max(eps, min(1 - eps, p))` to avoid
#'   errors for probabilities `p = 0` and `p = 1`.
#' @export
logloss = function(truth, prob, eps = 1e-15, ...){
  ii = match(as.character(truth), colnames(prob))
  p = prob[cbind(seq_len(nrow(prob)), ii)]
  p = pmax(eps, pmin(1 - eps, p))
  -mean(log(p))
}

#' @include measures.R
add_measure(logloss, "classif", 0, Inf, TRUE)
