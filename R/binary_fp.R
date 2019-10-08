#' @title False Positives
#'
#' @description
#' Classification measure counting the false positives.
#'
#' @templateVar mid fp
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
fp = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[1L, 2L]
}

#' @include metainfo.R
add_info(fp, "classif", 0, Inf, TRUE)
