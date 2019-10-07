#' @title False Negative Rate
#'
#' @aliases miss_rate
#' @description
#' Binary classification measure defined as \deqn{
#'    \frac{FN}{TP + FN}.
#' }{
#'    FN / (TP + FN).
#' }
#' Also know as "miss rate".
#'
#' @templateVar mid fnr
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
fnr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[2L, 1L], sum(m[, 1L]), na_value)
}

#' @include metainfo.R
add_info(fnr, "classif", 0, 1, FALSE)
