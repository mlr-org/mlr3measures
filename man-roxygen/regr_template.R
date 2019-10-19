#' @section Meta Information:
#' <% item = measures[[mid]] %>
#' * Type: <%= item$type %>
#' * Minimum value: <%= item$lower %>
#' * Maximum value: <%= item$upper %>
#' * Minimize: <%= item$minimize %>
#' * Required prediction: <%= item$predict_type %>
#'
#' @family Regression Measures
#' @concept regression_measure
#' @return Performance value as `numeric(1)`.
