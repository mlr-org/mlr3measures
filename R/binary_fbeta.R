#' @title F-beta Score
#'
#' @details
#' With \eqn{P} as [precision()] and \eqn{R} as [recall()], the F-beta Score is defined as \deqn{
#'    (1 + \beta^2) \frac{P \cdot R}{(\beta^2 P) + R}.
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
#' @details
#' This measure is undefined if [precision] or [recall] is undefined, i.e. TP + FP = 0 or TP + FN = 0.
#'
#' @references
#' `r format_bib("rijsbergen_1979", "goutte_2005")`
#'
#' @inheritParams binary_params
#' @param beta (`numeric(1)`)\cr
#'   Parameter to give either precision or recall more weight.
#'   Default is `1`, resulting in balanced weights.
#' @template binary_example
#' @export
fbeta = function(truth, response, positive, beta = 1, na_value = NaN, ...) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  assert_number(beta, lower = 0)
  fbeta_cm(cm(truth, response, positive), beta, na_value)
}

fbeta_cm = function(m, beta = 1, na_value = NaN) {
  if (m[1L, 1L] == 0L && (m[1L, 2L] == 0L || m[2L, 1L] == 0L)) {
    return(na_value)
  }

  beta2 = beta^2
  nom = (1 + beta2) * m[1L, 1L]
  nom / (nom + beta2 * m[2L, 1L] + m[1L, 2L])
}

#' @include measures.R
add_measure(fbeta, "F-beta score", "binary", 0, 1, FALSE)
