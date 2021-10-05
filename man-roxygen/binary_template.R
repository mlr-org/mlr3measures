#' <% item = measures[[mid]] %>
#' @description
#' Measure to compare true observed labels with predicted
#' <%= if (item$predict_type == "response") "labels" else "probabilities" %>
#' in binary classification tasks.
#'
#' @section Meta Information:
#' * Type: `"<%= item$type %>"`
#' * Range: <%= format_range(item) %>
#' * Minimize: `<%= item$minimize %>`
#' * Required prediction: `<%= item$predict_type %>`
#'
#' @family Binary Classification Measures
#' @concept binary_classification_measure
#' @return Performance value as `numeric(1)`.
