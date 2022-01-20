if (requireNamespace("testthat", quietly = TRUE)) {
  library("testthat")
  suppressPackageStartupMessages(library("mlr3measures"))
  test_check("mlr3measures")
}
