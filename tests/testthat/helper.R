library(checkmate)

wrapper = function(f, ...) {
  ddd = list(...)
  nn = intersect(names(ddd), formalArgs(f))
  do.call(f, list(...)[nn])
}
