#' @title Kendall's tau
#'
#' @description
#' Defined as Kendall rank correlation coefficent between truth and response.
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
#' @export
kendalls_tau = function(truth, response) {
  cor(truth, response, use = "everything", method = "kendall")
}

#' @include metainfo.R
add_info(kendalls_tau, "regr", -Inf, 1, FALSE)
