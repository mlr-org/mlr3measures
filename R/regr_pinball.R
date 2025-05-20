#' @title Average Pinball Loss
#'
#' @details
#' The pinball loss for quantile regression is defined as \deqn{
#' \text{Average Pinball Loss} = \frac{1}{n} \sum_{i=1}^{n} w_{i}
#' \begin{cases}
#' q \cdot (t_i - r_i) & \text{if } t_i \geq r_i \\
#'(1 - q) \cdot (r_i - t_i) & \text{if } t_i < r_i
#' \end{cases}
#' }
#' where \eqn{q} is the quantile and \eqn{w_i} are normalized sample weights.
#'
#'
#' @templateVar mid pinball
#' @template regr_template
#'
#' @inheritParams regr_params
#'
#' @param alpha `numeric(1)`\cr
#'  The quantile to compute the pinball loss.
#'
#' @template regr_example
#' @export
pinball = function(truth, response, sample_weights = NULL, alpha = 0.5, ...) {
  assert_regr(truth, response = response)

  diff = truth - response
  wmean(ifelse(diff >= 0, alpha * diff, (1 - alpha) * -diff), sample_weights)
}

#' @include measures.R
add_measure(pinball, "Pinball", "regr", -Inf, Inf, TRUE)
