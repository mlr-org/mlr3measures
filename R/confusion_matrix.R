#' @title Calculate Binary Confusion Matrix
#'
#' @description
#' Calculates the confusion matrix for a binary classification problem
#' once and then calculates all confusion measures of this package.
#'
#' @inheritParams binary_params
#' @param relative (`logical(1)`)\cr
#'   If `TRUE`, the returned confusion matrix contains relative frequencies
#'   instead of absolute frequencies.
#' @return
#'   List with two elements:
#'   * `matrix` stores the calculated confusion matrix.
#'   * `measures` stores the metrics as named numeric vector.
#'
#' @export
#' @examples
#' set.seed(123)
#' lvls = c("a", "b")
#' truth = factor(sample(lvls, 20, replace = TRUE), levels = lvls)
#' response = factor(sample(lvls, 20, replace = TRUE), levels = lvls)
#'
#' confusion_matrix(truth, response, positive = "a")
#' confusion_matrix(truth, response, positive = "a", relative = TRUE)
#' confusion_matrix(truth, response, positive = "b")
confusion_matrix = function(truth, response, positive, na_value = NaN, relative = FALSE) {
  assert_binary(truth, response = response, positive = positive, na_value = na_value)
  assert_flag(relative)
  m = cm(truth, response, positive)

  ids = c("acc", "ce", "dor", "fbeta", "fdr", "fnr", "fomr", "fpr", "mcc", "npv", "ppv", "tnr", "tpr")
  measures = vapply(ids, function(id) {
    do.call(paste0(id, "_cm"), list(m = m, na_value = na_value))
  }, FUN.VALUE = NA_real_, USE.NAMES = FALSE)
  names(measures) = replace(ids, ids == "fbeta", "f1")

  if (relative) {
    m = m / sum(m)
  }

  res = list(matrix = m, measures = measures)
  class(res) = "confusion_matrix"
  res
}

#' @export
print.confusion_matrix = function(x, ...) {
  print(x$matrix)
  str = sprintf("%-4s: % 1.4f", names(x$measures), x$measures)
  row = head(rep(seq_len(length(str) %/% 4 + 1), each = 4L), length(str))
  lapply(split(str, row), function(x) cat(paste(x, collapse = "; "), "\n"))
  invisible()
}
