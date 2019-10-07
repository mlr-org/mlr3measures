#' @title True Negatives
#'
#' @description
#' Classification measure counting the true negatives.
#'
#' @templateVar mid tn
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
tn = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[2L, 2L]
}

#' @include metainfo.R
add_info(tn, "classif", 0, Inf, FALSE)
