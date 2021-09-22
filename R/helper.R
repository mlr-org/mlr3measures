TOL = sqrt(.Machine$double.eps)

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
  if (abs(denominator) < TOL) {
    na_value
  } else {
    nominator / denominator
  }
}

wmean = function(x, w) { # a better stats::weighted.mean
  if (is.null(w)) {
    return(mean(x))
  }
  assert_numeric(w, lower = 0, finite = TRUE, any.missing = FALSE, len = length(x))
  if (all(abs(w) < TOL)) {
    stop("All sample weights are 0")
  }

  sum(x * (w / sum(w)))
}

# confusion matrix
cm = function(truth, response, positive = NULL) {
  if (!is.null(positive)) {
    truth = relevel(truth, positive)
    response = relevel(response, positive)
  }
  table(response, truth, useNA = "ifany")
}

# used in roxygen templates
format_range = function(item) {
  l = item$lower
  u = item$upper

  str = sprintf("%s%s, %s%s",
    if (is.finite(l)) "[" else "(",
    if (is.finite(l)) c(l, l) else c("-\\infty", "-Inf"),
    if (is.finite(u)) c(u, u) else c("\\infty", "Inf"),
    if (is.finite(u)) "]" else ")")
  paste0("\\eqn{", str[1L], "}{", str[2L], "}")
}

map_pairwise = function(x, .fun, ...) {
  .fun = match.fun(.fun)
  combn(x, m = 2L, function(.pair, ...) .fun(.pair[[1L]], .pair[[2L]], ...), simplify = TRUE, ...)
}
