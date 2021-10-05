#' @description
#' Measure to compare true observed response with predicted response in regression tasks.
#'
#' @section Meta Information:
#' <% item = measures[[mid]] %>
#' * Type: `"<%= item$type %>"`
#' * Range: <%= format_range(item) %>
#' * Minimize: `<%= item$minimize %>`
#' * Required prediction: `<%= item$predict_type %>`
#'
#' @family Regression Measures
#' @concept regression_measure
#' @return Performance value as `numeric(1)`.
