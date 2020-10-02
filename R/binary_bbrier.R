#' @title Binary Brier Score
#'
#' @description
#' Brier score for binary classification problems defined as \deqn{
#'    \frac{1}{n} \sum_{i=1}^n (I_i - p_i)^2.
#' }{
#'    1/n * sum(((t == positive) - p)^2).
#' }
#' \eqn{I_{i}}{I_i} is 1 if observation \eqn{i} belongs to the positive class, and 0 otherwise.
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
#' `r tools::toRd(bibentries["brier_1950"])`
#'
#' @inheritParams binary_params
#' @template binary_example
#' @export
bbrier = function(truth, prob, positive, ...) {
  assert_binary(truth, prob = prob, positive = positive)
  mean(se(truth == positive, prob))
}

#' @include measures.R
add_measure(bbrier, "Binary Brier Score", "binary", 0, 1, TRUE)
