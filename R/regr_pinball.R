#' @title Pinball
#'
#' @details
#' The pinball loss for quantile regression.
#'
#' @templateVar mid pinball
#' @template regr_template
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
pinball = function(truth, response, sample_weights = NULL, alpha = 0.5, ...) {
  assert_regr(truth, response = response)

  diff = truth - response
  wmean(ifelse(diff >= 0, alpha * diff, (1 - alpha) * -diff), sample_weights)
}

#' @include measures.R
add_measure(pinball, "Pinball", "regr", -Inf, Inf, TRUE)
