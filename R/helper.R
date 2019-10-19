# absolute error
ae = function(truth, response) {
  abs(truth - response)
}

# absolute percent error
ape = function(truth, response) {
  abs((truth - response) / truth)
}

# squared error
se = function(truth, response) {
  (truth - response)^2
}

# squared log error
sle = function(truth, response) {
  (log1p(truth) - log1p(response))^2
}

# simple division, but ensures that `na_value` is returned
# if the denominator is < TOL
div = function(nominator, denominator, na_value) {
  if (abs(denominator) < TOL)
    na_value
  else
    nominator / denominator
}

cm = function(truth, response, positive = NULL) {
  if (!is.null(positive)) {
    truth = relevel(truth, positive)
    response = relevel(response, positive)
  }
  table(response, truth, useNA = "ifany")
}

# copied from mlr3misc to avoid the dependency
cite_bib = function(key) {
  stopifnot(length(key) == 1L, is.character(key))
  package = "mlr3measures"

  if (!requireNamespace("bibtex", quietly = TRUE)) {
    warning(sprintf("Could not load package 'bibtex' to parse citation '%s'", key))
    return(sprintf("bibtex:%s", key))
  }

  path = system.file("references.bib", package = package)
  if (!file.exists(path)) {
    warning(sprintf("Bibtex file '%s' for package '%s' does not exist", path, package))
    return(sprintf("bibtex:%s", key))
  }

  bib = bibtex::read.bib(path)

  if (!(key %in% names(bib))) {
    warning(sprintf("Key '%s' not found in references.bib of package '%s'", key, package))
    return(sprintf("bibtex:%s", key))
  }

  paste0(tools::toRd(bib[[key]]), "\n")
}
