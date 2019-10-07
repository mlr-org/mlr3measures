metainfo = new.env(parent = emptyenv())

add_info = function(obj, type, min, max, minimize, ...) {
  id = deparse(substitute(obj))
  stopifnot(length(type) == 1L, is.character(type))
  stopifnot(length(min) == 1L, is.numeric(min))
  stopifnot(length(max) == 1L, is.numeric(max))
  stopifnot(length(minimize) == 1L, is.logical(minimize))

  assign(id, list(type = type, min = min, max = max, minimize = minimize, ...), envir = metainfo)
}

list_measures = function() {
  do.call(rbind, eapply(metainfo, as.data.frame))
}
