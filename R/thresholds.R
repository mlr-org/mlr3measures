#' @title Calculate Measures for All Possible Thresholds
#'
#' @description
#' For each value in probability `prob`, a confusion matrix is build and the
#' all requested measures are calculated.
#'
#' @inheritParams auc
#'
#' @return (`matrix()`). First column are the distinct probability values, additional
#'   columns store the calculated performance values, one column for each measure.
#'
#' @useDynLib mlr3measures c_thresh_path
#' @export
#' @examples
#' N = 200
#' truth = factor(sample(c("a", "b"), N, replace = TRUE), levels = c("a", "b"))
#' prob = runif(N)
#' th = thresholds(truth, prob, "a")
#'
#' # poor mans roc curve
#' plot(th[, 2], 1 - th[, 3], type = "l")
#' abline(0, 1)
thresholds = function(truth, prob, positive, measures = c("tpr", "tnr")) {
  assert_binary(truth, prob = prob, positive = positive)
  assert_subset(measures, c("acc", "ce", "dor", "fbeta", "fdr", "fnr", "fomr", "fpr",
      "mcc", "npv", "ppv", "tnr", "tpr", "tp", "tn", "fp", "fn"))

  ii = order(prob)
  performance = .Call(c_thresh_path, (truth == positive)[ii], prob[ii], measures)
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
  bench::mark(thresholds(truth, prob, positive))

  # order() + t() takes more time as calculating the measures :/
  profvis::profvis(thresholds(truth, prob, positive))
}
