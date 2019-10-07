#' @title False Negatives
#'
#' @description
#' Classification measure counting the false negatives.
#'
#' @templateVar mid fn
#' @template classif_metainfo
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @template classif_params_binary
#' @template classif_positive
#' @template classif_return
#' @family Binary Classification Measures
#' @export
fn = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[2L, 1L]
}

#' @include metainfo.R
add_info(fn, "classif", 0, Inf, TRUE)
