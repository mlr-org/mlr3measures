#' @title False Positives
#'
#' @description
#' Classification measure counting the false positives.
#'
#' @templateVar mid fp
#' @template classif_metainfo
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @template classif_params_binary
#' @template classif_positive
#' @template classif_return
#' @export
fp = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[1L, 2L]
}

#' @include metainfo.R
add_info(fp, "classif", 0, Inf, FALSE)
