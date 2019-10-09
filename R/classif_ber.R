#' @title Balanced error rate
#'
#' @description
#' Mean of misclassification error rates on all individual classes.
#'
#' Classification measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i \neq r_i \right).
#' }{
#'   mean(t != r).
#' }
#'
#' @templateVar mid ber
#' @template classif_template
#'
#' @inheritParams classif_params
#' @export
ber = function(truth, response, ...) {
  conf = confusion(truth, response)
  cs = colSums(conf)
  mean((cs - diag(conf)) / cs)
}

#' @include measures.R
add_measure(ber, "classif", 0, 1, TRUE)
