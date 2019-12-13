#' @title Calculate Binary Confusion Matrix
#'
#' @description
#' Calculates the confusion matrix for a binary classification problem
#' once and then calculates all confusion measures of this package.
#'
#' @inheritParams binary_params
#' @param relative :: `logical(1)`\cr
#'   If `TRUE`, the returned confusion matrix contains relative frequencies
#'   instead of absolute frequencies.
#' @return
#'   List with two elements:
#'   * `matrix` stores the calculated confusion matrix.
#'   * `performance` stores the metrics as named numeric vector.
#'
#' @export
#' @useDynLib mlr3measures c_confusion_measures
#' @examples
#' set.seed(123)
#' lvls = c("a", "b")
#' truth = factor(sample(lvls, 20, replace = TRUE), levels = lvls)
#' response = factor(sample(lvls, 20, replace = TRUE), levels = lvls)
#'
#' confusion_matrix(truth, response, positive = "a")
#' confusion_matrix(truth, response, positive = "a", relative = TRUE)
#' confusion_matrix(truth, response, positive = "b")
confusion_matrix = function(truth, response, positive, relative = FALSE) {
  assert_binary(truth, response = response, positive = positive)
  assert_flag(relative)
  m = cm(truth, response, positive)

  performance = .Call(c_confusion_measures, m, length(truth))

  res = list(matrix = m, performance = performance)
  class(res) = "confusion_matrix"
  res
}

print.confusion_matrix = function(x, ...) {
  print(x$matrix)
  str = sprintf("%-4s: % 1.4f", names(x$performance), x$performance)
  row = head(rep(seq_len(length(str) %/% 4 + 1), each = 4L), length(str))
  lapply(split(str, row), function(x) cat(paste(x, collapse = "; "), "\n"))
  invisible()
}
