#' @title Zero-One Classification Loss (per observation)
#'
#' @description
#' Calculates the per-observation 0/1 (zero-one) loss as \deqn{
#'   \mathbf{1} (t_i \neq r_1).
#' }{
#'   1(t != r).
#' }
#' The 1/0 (one-zero) loss is equal to 1 - zero-one and calculated as \deqn{
#'   \mathbf{1} (t_i = r_i).
#' }{
#'   1(t_i = r_i).
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

#' @rdname zero_one
#' @export
one_zero = function(truth, response, ...) {
  assert_classif(truth, response)
  as.integer(truth == response)
}

#' @include measures.R
add_measure(zero_one, "Zero-One Classification Loss", "classif", 0, 1, TRUE, aggregated = FALSE)
#' @include measures.R
add_measure(one_zero, "One-Zero Utility Function", "classif", 0, 1, FALSE, aggregated = FALSE)
