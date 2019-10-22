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
#' @template regr_example
#' @export
ktau = function(truth, response, ...) {
  assert_regr(truth, response = response)
  cor(truth, response, method = "kendall")
}

#' @include measures.R
add_measure(ktau, "regr", -1, 1, FALSE)
