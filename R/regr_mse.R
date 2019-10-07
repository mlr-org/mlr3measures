#' @title Mean Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \left( t_i - r_i \right)^2.
#' }{
#'   mean((t - r)^2).
#' }
#'
#' @templateVar mid mse
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @family Regression Measures
#' @export
mse = function(truth, response) {
  mean(se(truth, response))
}

#' @include metainfo.R
add_info(mse, "regr", 0, Inf, TRUE)
