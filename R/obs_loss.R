#' @title Loss per Observation
#'
#' @name obs_loss
#' @description
#' The functions calculate the unaggregated loss per observation.
#' There are mainly used internally, but can also be called from \CRANpkg{mlr3}.
#'
#' @param truth (`factor()` | `numeric()`)\cr
#'   True (observed) labels.
#'   The required type depends on the type of problem: factor for classification,
#'   numeric for regression.
#' @param response (`factor()` | `numeric()`)\cr
#'   Predicted labels. Must be of the same type as `truth`.
#' @param ... (any)\cr
#'   Additional parameters, currently ignored.
#' @export
zero_one = function(truth, response, ...) {
  assert_classif(truth, response)
  truth != response
}

#' @rdname obs_loss
#' @export
ae = function(truth, response, ...) {
  assert_regr(truth, response)
  .ae(truth, response)
}

.ae = function(truth, response) {
  abs(truth - response)
}


#' @rdname obs_loss
#' @export
ape = function(truth, response, ...) {
  assert_regr(truth, response)
  .ape(truth, response)
}

.ape = function(truth, response) {
  abs((truth - response) / truth)
}


#' @rdname obs_loss
#' @export
se = function(truth, response, ...) {
  assert_regr(truth, response)
  .se(truth, response)
}

.se = function(truth, response) {
  (truth - response)^2
}

#' @rdname obs_loss
#' @export
sle = function(truth, response, ...) {
  assert_regr(truth, response)
  .sle(truth, response)
}

.sle = function(truth, response) {
  (log1p(truth) - log1p(response))^2
}
