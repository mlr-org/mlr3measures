#' @section Meta Information:
#' <% item = measures[[mid]] %>
#' * Type: `"<%= item$type %>"`
#' * Range: <%= format_range(item) %>
#' * Minimize: `<%= item$minimize %>`
#' * Required prediction: `<%= item$predict_type %>`
#'
#' @family Binary Classification Measures
#' @concept binary_classification_measure
#' @return Performance value as `numeric(1)`.
