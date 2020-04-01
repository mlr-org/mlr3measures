#' @importFrom utils head
#' @importFrom stats cor median var relevel contr.treatment
#' @import checkmate
"_PACKAGE"

.onAttach = function(libname, pkgname) {
  packageStartupMessage(paste(
    "In order to avoid name clashes, do not attach 'mlr3measures'.",
    "Instead, only load the namespace with `requireNamespace(\"mlrmeasures\")`",
    "and access the measures directly via `::`, e.g. `mlr3measures::auc()`."
  ))
}
