#' @title Classification Accuracy
#'
#' @description
#' Definition:
#' \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i = r_i \right).
#' }{
#'   mean(t == r)
#' }
#'
#' @templateVar mid acc
#' @template classif_metainfo
#'
#' @template classif_params
#' @template classif_return
#' @export
acc = function(truth, response) {
  mean(truth == response)
}

#' @include metainfo.R
add_info(acc, "classif", 0, 1, FALSE)
