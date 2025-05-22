#' @title Classification Accuracy
#'
#' @details
#' The Classification Accuracy is defined as
#'  \deqn{
#'   \sum_{i=1}^n w_i \mathbf{1} \left( t_i = r_i \right),
#' }{sum(wi * 1(ti = ri))}
#' where \eqn{w_i} are weights normalized to sum to 1 for all observations \eqn{x_i}.
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
