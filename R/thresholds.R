#' @title Calculate Measures for All Possible Thresholds
#'
#' @description
#' For each value in probability `prob`, a confusion matrix is build and the
#' all requested measures are calculated.
#'
#' @inheritParams auc
#' @param measures :: `character()`\cr
#'   Names of measures to calculate.
#'
#' @return (`matrix()`). First column are the distinct probability values, additional
#'   columns store the corresponding calculated performance values, one column for each measure.
#'
#' @useDynLib mlr3measures c_thresholds
#' @export
#' @examples
#' N = 50
#' truth = factor(sample(c("a", "b"), N, replace = TRUE), levels = c("a", "b"))
#' prob = runif(N)
#' th = thresholds(truth, prob, "a")
#'
#' th = thresholds(truth, prob, "a", measures = c("tnr", "tpr"))
#'
#' # poor man's roc curve
#' plot(1 - th[, 2], th[, 3], type = "l", xlab = "1 - Specificity", ylab = "Sensitivity")
#' abline(0, 1, lty = "dotted")
thresholds = function(truth, prob, positive, measures = c("tpr", "tnr")) {
  assert_binary(truth, prob = prob, positive = positive)
  assert_subset(measures, c("acc", "ce", "dor", "f1", "fdr", "fnr", "fomr", "fpr",
      "mcc", "npv", "ppv", "tnr", "tpr", "tp", "tn", "fp", "fn"))

  ii = order(prob)
  performance = .Call(c_thresholds, (truth == positive)[ii], prob[ii], measures)
  performance = t(performance)
  colnames(performance) = c("prob", measures)
  return(performance)
}


if (FALSE) {
  # small benchmark
  N = 1e6
  truth = factor(sample(c("a", "b"), N, replace = TRUE), levels = c("a", "b"))
  prob = runif(N)
  positive = "a"
  bench::mark(thresholds(truth, prob, positive, measures = "mcc"))

  # order() + t() takes more time than calculating the measures? :/
  profvis::profvis(thresholds(truth, prob, positive, measures = "mcc"))
}
