#' @title Kendall's tau
#'
#' @description
#' Regression measure defined as Kendall's rank correlation coefficient between truth and response.
#' Calls [stats::cor()] with `method` set to `"kendall"`.
#'
#' @templateVar mid kendalls_tau
#' @template regr_metainfo
#'
#' @references
#' \cite{rosset_2006}
#'
#' @template regr_params
#' @template regr_return
#' @family Regression Measures
#' @export
kendalls_tau = function(truth, response) {
  cor(truth, response, use = "everything", method = "kendall")
}

#' @include metainfo.R
add_info(kendalls_tau, "regr", -Inf, 1, FALSE)
