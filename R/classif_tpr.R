#' @title True Positive Rate
#'
#' @description
#' Definition: \deqn{
#'    \frac{TP}{TP + FN}
#' }{
#'  TP / (TP + FN)
#' }
#'
#' @templateVar mid tpr
#' @template classif_metainfo
#'
#' @template classif_params
#' @template classif_positive
#' @template na_value
#' @template classif_return
#' @export
tpr = function(truth, response, positive, na_value = NaN) {
  m = confusion(truth, response, positive)
  div(m[1L, 1L], sum(m[, 1L]), na_value)
}

#' @include metainfo.R
add_info(tpr, "classif", 0, 1, FALSE)
