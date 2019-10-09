#' @title Measure Registry
#'
#' @description
#' The [environment()] `measures` keeps track of all measures in this package.
#' Stores meta information about measures, such as minimum, maximum of if the
#' measure must be minimized or maximized.
#'
#' @export
#' @examples
#' names(measures)
#' measures$tpr
measures = new.env(parent = emptyenv())

# adds items to registry
add_measure = function(obj, type, min, max, minimize) {
  id = deparse(substitute(obj))
  stopifnot(length(type) == 1L, is.character(type))
  stopifnot(length(min) == 1L, is.numeric(min))
  stopifnot(length(max) == 1L, is.numeric(max))
  stopifnot(length(minimize) == 1L, is.logical(minimize))

  assign(id, list(id = id, type = type, min = min, max = max, minimize = minimize), envir = measures)
}
