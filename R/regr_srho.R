#' @title Spearman's rho
#'
#' @description
#' Regression measures defined as Spearman's rank correlation coefficient between truth and response.
#' Calls [stats::cor()] with `method` set to `"spearman"`.
#'
#' @templateVar mid srho
#' @template regr_template
#'
#' @references
#' \cite{rosset_2006}
#'
#' @inheritParams regr_params
#' @export
srho = function(truth, response, ...) {
  assert_regr(truth, response = response)

  cor(truth, response, use = "everything", method = "kendall")
}

#' @include measures.R
add_measure(srho, "regr", -1, 1, FALSE)
