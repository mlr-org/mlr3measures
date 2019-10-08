#' @title Measure Registry
#'
#' @description
#' The [environment()] `measures` keeps track of all measures in this package.
#' Stores meta information about measures, such as minimum, maximum of if the
#' measure must be minimized or maximized.
#'
#' `list_measures()` returns the information in as a [data.frame()].
#'
#' @export
measures = new.env(parent = emptyenv())

#' @rdname measures
#' @export
list_measures = function() {
  tab = do.call(rbind, eapply(measures, as.data.frame, stringsAsFactors = FALSE))
  rownames(tab) = NULL
  tab
}

# adds items to registry
add_measure = function(obj, type, min, max, minimize, ...) {
  id = deparse(substitute(obj))
  stopifnot(length(type) == 1L, is.character(type))
  stopifnot(length(min) == 1L, is.numeric(min))
  stopifnot(length(max) == 1L, is.numeric(max))
  stopifnot(length(minimize) == 1L, is.logical(minimize))

  assign(id, list(id = id, type = type, min = min, max = max, minimize = minimize, ...), envir = measures)
}
