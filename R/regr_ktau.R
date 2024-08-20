#' @title Kendall's tau
#'
#' @details
#' Kendall's tau is defined as Kendall's rank correlation coefficient between truth and response.
#' It is defined as \deqn{
#'   \tau = \frac{(\mathrm{number of concordant pairs)} - (\mathrm{number of discordant pairs)}}{\mathrm{(number of pairs)}}
#'   }{
#'     t = (number of concordant pairs) - (number of discordant pairs) / (number of pairs)}
#' Calls [stats::cor()] with `method` set to `"kendall"`.
#'
#' @templateVar mid ktau
#' @template regr_template
#'
#' @references
#' `r format_bib("rosset_2006")`
#'
#' @inheritParams regr_params
#' @template regr_example
#' @export
ktau = function(truth, response, ...) {
  assert_regr(truth, response = response)
  cor(truth, response, method = "kendall")
}

#' @include measures.R
add_measure(ktau, "Kendall's tau", "regr", -1, 1, FALSE)
