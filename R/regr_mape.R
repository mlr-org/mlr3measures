#' @title Mean Absolute Percent Error
#'
#' @description
#' Definition:
#' \deqn{
#'   \frac{1}{n} \sum_{i=1}^n \frac{\left| t_i - r_i \right|}{t_i}.
#'  }{
#'    mean(abs(t - r) / t)
#'  }
#'
#' @note
#' This measure is undefined if any element of \eqn{t} is \eqn{0}.
#'
#' @templateVar mid mape
#' @template regr_metainfo
#'
#' @references
#' \cite{de_myttenaere_2016}
#'
#' @template regr_params
#' @template na_value
#' @template regr_return
#' @export
mape = function(truth, response, na_value = NaN) {
  if (any(abs(truth) < TOL))
    return(na_value)
  mean(ae(truth, response) / truth)
}

#' @include metainfo.R
add_info(mape, "regr", 0, Inf, TRUE)
