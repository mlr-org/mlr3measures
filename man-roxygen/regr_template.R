#' <% item = measures[[mid]] %>
#' @description
#' Measure to compare true observed response with predicted response in regression tasks.
#'
#' <%= if (item$aggregated == FALSE) "Note that this is an unaggregated measure, returning the losses per observation." %>
#'
#' @section Meta Information:
#' * Type: `"<%= item$type %>"`
#' * Range<%= if (!item$aggregated) " (per observation)" %>: <%= format_range(item) %>
#' * Minimize<%= if (!item$aggregated) " (per observation)" %>: `<%= item$minimize %>`
#' * Required prediction: `<%= item$predict_type %>`
#'
#' @family Regression Measures
#' @concept regression_measure
#' @return Performance value as `numeric(<%= if (item$aggregated) "1" else "length(truth)" %>)`.
