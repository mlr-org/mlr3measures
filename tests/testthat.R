if (requireNamespace("testthat", quietly = TRUE)) {
  library(testthat)
  library(mlr3measures)
  test_check("mlr3measures")
}
