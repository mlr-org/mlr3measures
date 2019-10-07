#' @importFrom stats cor median var relevel
"_PACKAGE"

TOL = NULL

.onLoad = function(libname, pkgname) {
  TOL <<- sqrt(.Machine$double.eps)
}
