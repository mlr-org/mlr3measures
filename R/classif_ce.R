#' @title Classification Error
#'
#' @description
#' Classification measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i \neq r_i \right).
#' }{
#'   mean(t != r).
#' }
#'
#' @templateVar mid ce
#' @template classif_metainfo
#'
#' @template classif_params
#' @template classif_return
#' @family Binary Classification Measures
#' @family Classification Measures
#' @export
ce = function(truth, response) {
  mean(truth != response)
}

#' @include metainfo.R
add_info(ce, "classif", 0, 1, TRUE)
