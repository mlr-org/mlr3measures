#' @section Meta Information:
#' <% item = measures[[mid]] %>
#' * Type: `"<%= item$type %>"`
#' * Range: <%= format_range(item) %>
#' * Minimize: `<%= item$minimize %>`
#' * Required prediction: `<%= item$predict_type %>`
#'
#' @family Similarity Measures
#' @concept similarity_measure
#' @seealso Package \CRANpkg{stabm} which implements many more stability measures with included
#'   correction for chance.
#' @return Performance value as `numeric(1)`.
