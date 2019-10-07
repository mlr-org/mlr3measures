#' @title Max Absolue Error
#'
#' @description
#' Regression measure defined as \deqn{
#'   \max \left( \left| t_i - r_i \right| \right).
#'  }{
#'    max(abs(t - r)).
#'  }
#'
#' @templateVar mid maxae
#' @template regr_metainfo
#'
#' @template regr_params
#' @template regr_return
#' @export
maxae = function(truth, response) {
  max(ae(truth, response))
}

#' @include metainfo.R
add_info(maxae, "regr", 0, Inf, TRUE)
