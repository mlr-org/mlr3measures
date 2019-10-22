#' @title Classification Accuracy
#'
#' @description
#' Classification measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i = r_i \right).
#' }{
#'   mean(t == r).
#' }
#'
#' @templateVar mid acc
#' @template classif_template
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
acc = function(truth, response, ...) {
  assert_classif(truth, response = response)
  mean(truth == response)
}

acc_cm = function(m, na_value = NaN) {
  sum(diag(m)) / sum(m)
}

#' @include measures.R
add_measure(acc, "classif", 0, 1, FALSE)
