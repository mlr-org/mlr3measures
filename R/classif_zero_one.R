#' @title Zero-One Classification Loss (per observation)
#'
#' @description
#' Calculates the per-observation 0/1 loss as \deqn{
#'   t_i \neq r_1.
#' }{
#'   t != r.
#' }
#'
#' @templateVar mid zero_one
#' @template classif_template
#' @inheritParams classif_params
#'
#' @export
zero_one = function(truth, response, ...) {
  assert_classif(truth, response)
  as.integer(truth != response)
}

#' @include measures.R
add_measure(zero_one, "Zero-One Classification Loss", "classif", 0, 1, TRUE, aggregated = FALSE)
