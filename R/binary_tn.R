#' @title True Negatives
#'
#' @description
#' Classification measure counting the true negatives.
#'
#' @templateVar mid tn
#' @template binary_template
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @inheritParams binary_params
#' @export
tn = function(truth, response, positive) {
  m = confusion(truth, response, positive)
  m[2L, 2L]
}

#' @include metainfo.R
add_info(tn, "classif", 0, Inf, FALSE)
