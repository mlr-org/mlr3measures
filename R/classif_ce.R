#' @title Classification Error
#'
#' @description
#' Classification measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i \neq r_i \right).
#' }{
#'   mean(t != r).
#' }
#'
#' @templateVar mid ce
#' @template classif_template
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
ce = function(truth, response, ...) {
  assert_classif(truth, response = response)
  mean(truth != response)
}

ce_cm = function(m, na_value = NaN) {
  s = sum(m)
  diag(m) = 0
  sum(m) / s
}

#' @include measures.R
add_measure(ce, "Classification Error", "classif", 0, 1, TRUE)
