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
#' @export
ce = function(truth, response, ...) {
  mean(truth != response)
}

#' @include measures.R
add_measure(ce, "classif", 0, 1, TRUE)
