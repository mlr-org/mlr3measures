#' @title Root Mean Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \sqrt{\frac{1}{n} \sum_{i=1}^n \left( t_i - r_i \right)^2}.
#' }{
#'   sqrt(mean((t - r)^2)).
#' }
#'
#' @templateVar mid rmse
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @family Regression Measures
#' @export
rmse = function(truth, response) {
  sqrt(mse(truth, response))
}

#' @include metainfo.R
add_info(rmse, "regr", 0, Inf, TRUE)
