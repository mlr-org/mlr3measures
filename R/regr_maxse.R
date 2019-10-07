#' @title Max Squared Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \max \left( t_i - r_i \right)^2.
#'  }{
#'    max((t - r)^2).
#'  }
#'
#' @templateVar mid maxse
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @family Regression Measures
#' @export
maxse = function(truth, response) {
  max(se(truth, response))
}

#' @include metainfo.R
add_info(maxse, "regr", 0, Inf, TRUE)
