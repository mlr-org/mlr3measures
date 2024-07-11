#' @title Classification Accuracy
#'
#' @details
#' The Classification Accuracy is defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n w_i \left( t_i = r_i \right).
#' }{
#'   weighted.mean(t == r, w).
#' }
#'
#' @templateVar mid acc
#' @template classif_template
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
acc = function(truth, response, sample_weights = NULL, ...) {
  assert_classif(truth, response = response)
  wmean(truth == response, sample_weights)
}

acc_cm = function(m, na_value = NaN) {
  sum(diag(m)) / sum(m)
}

#' @include measures.R
add_measure(acc, "Classification Accuracy", "classif", 0, 1, FALSE, obs_loss = "one_zero")
