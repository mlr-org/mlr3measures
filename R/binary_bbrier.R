#' @title Binary Brier Score
#'
#' @details
#' The Binary Brier Score is defined as \deqn{
#'    \frac{1}{n} \sum_{i=1}^n w_i (I_i - p_i)^2.
#' }{
#'    weighted.mean(((t == positive) - p)^2, w).
#' }
#' \if{latex}{
#' \eqn{w_i} are the sample weights,
#' \eqn{I_{i}}{I_i} is 1 if observation \eqn{i} belongs to the positive class, and 0 otherwise.
#' }
#'
#' Note that this (more common) definition of the Brier score is equivalent to the
#' original definition of the multi-class Brier score (see [mbrier()]) divided by 2.
#'
#' @templateVar mid bbrier
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Brier_score}
#'
#' `r format_bib("brier_1950")`
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
bbrier = function(truth, prob, positive, sample_weights = NULL, ...) {
  assert_binary(truth, prob = prob, positive = positive)
  wmean(.se(truth == positive, prob), sample_weights)
}

#' @include measures.R
add_measure(bbrier, "Binary Brier Score", "binary", 0, 1, TRUE)
