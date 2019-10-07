#' @title True Positives
#'
#' @description
#' Binary classification measure counting the true positives.
#'
#' @templateVar mid tp
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
tp = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[1L, 1L]
}

#' @include metainfo.R
add_info(tp, "classif", 0, Inf, FALSE)
