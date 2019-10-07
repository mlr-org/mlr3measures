#' @title False Positive Rate
#'
#' @aliases fall_out
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{FP}{FP + TN}.
#' }{
#'    FP / (FP + TN).
#' }
#' Also know as "miss rate".
#'
#' @templateVar mid fpr
#' @template classif_metainfo
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram}
#'
#' @template classif_params_binary
#' @template classif_positive
#' @template na_value
#' @template classif_return
#' @export
fpr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[1L, 2L], sum(m[, 2L]), na_value)
}

#' @include metainfo.R
add_info(fpr, "classif", 0, 1, FALSE)
