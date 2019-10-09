#' @title Kendall's tau
#'
#' @description
#' Regression measure defined as Kendall's rank correlation coefficient between truth and response.
#' Calls [stats::cor()] with `method` set to `"kendall"`.
#'
#' @templateVar mid ktau
#' @template regr_template
#'
#' @references
#' \cite{rosset_2006}
#'
#' @inheritParams regr_params
#' @export
ktau = function(truth, response, ...) {
  cor(truth, response, use = "everything", method = "kendall")
}

#' @include measures.R
add_measure(ktau, "regr", -1, 1, FALSE)