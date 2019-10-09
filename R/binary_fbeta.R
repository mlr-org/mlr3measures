#' @title F-beta Score
#'
#' @description
#' Binary classification measure defined with \eqn{P} as [precision()] and \eqn{R} as
#' [recall()] as \deqn{
#'    (1 + \beta^2) \frac{PR}{(\beta^2 P) + R}.
#' }{
#'    (1 + beta^2) * (P*R) / ((beta^2 * P) + R).
#' }
#' It measures the effectiveness of retrieval with respect to a user who attaches \eqn{\beta}{beta} times
#' as much importance to recall as precision.
#' For \eqn{\beta = 1}{beta = 1}, this measure is called "F1" score.
#'
#' @templateVar mid fbeta
#' @template binary_template
#'
#' @note
#' This measure is undefined if either [precision] or [recall] is undefined, i.e.
#' TP + FP = 0 or TP + FN = 0.
#'
#' @references
#' \cite{sasaki_2007}
#'
#' \cite{rijsbergen_1979}
#'
#' @inheritParams binary_params
#' @param beta :: `numeric(1)`\cr
#'   Parameter to give either precision or recall more weight.
#'   Default is 1, resulting in balanced weights.
#' @export
fbeta = function(truth, response, positive, beta = 1, na_value = NaN, ...) {
  m = confusion(truth, response, positive)

  pred_pos = sum(m[1L, ])
  cond_pos = sum(m[, 1L])
  if (pred_pos == 0L || cond_pos == 0L)
    return(na_value)

  P = m[1L, 1L] / pred_pos
  R = m[1L, 1L] / cond_pos
  ((1 + beta^2) * P * R) / ((beta^2 * P) + R)
}

#' @include measures.R
add_measure(fbeta, "binary", 0, 1, FALSE)