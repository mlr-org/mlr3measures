#' @title Spearman's rho
#'
#' @description
#' Regression measures defined as Spearman's rank correlation coefficient between truth and response.
#' Calls [stats::cor()] with `method` set to `"spearman"`.
#'
#' @templateVar mid spearmans_rho
#' @template regr_template
#'
#' @references
#' \cite{rosset_2006}
#'
#' @inheritParams regr_params
#' @export
spearmans_rho = function(truth, response) {
  cor(truth, response, use = "everything", method = "kendall")
}

#' @include metainfo.R
add_info(spearmans_rho, "regr", -1, 1, FALSE)
