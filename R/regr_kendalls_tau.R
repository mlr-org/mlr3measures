#' @title Kendall's tau
#'
#' @description
#' Regression measure defined as Kendall's rank correlation coefficient between truth and response.
#' Calls [stats::cor()] with `method` set to `"kendall"`.
#'
#' @templateVar mid kendalls_tau
#' @template regr_template
#'
#' @references
#' \cite{rosset_2006}
#'
#' @inheritParams regr_params
#' @export
kendalls_tau = function(truth, response, ...) {
  cor(truth, response, use = "everything", method = "kendall")
}

#' @include measures.R
add_measure(kendalls_tau, "regr", -Inf, 1, FALSE)
