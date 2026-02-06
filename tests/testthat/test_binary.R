run_all_measures = function(truth, response, prob, positive, na_allowed = FALSE) {
  conf = cm(truth, response, positive = positive)
  na_value = if (na_allowed) 123456789 else NaN
  tol = sqrt(.Machine$double.eps)
  sample_weights = runif(length(truth))

  for (m in as.list(measures)) {
    if (m$type != "binary") {
      next
    }

    f = match.fun(m$id)
    f_cm = get0(sprintf("%s_cm", m$id))

    perf = f(truth = truth, response = response, prob = prob, positive = positive, na_value = na_value)
    if (!(na_allowed && identical(perf, na_value))) {
      expect_number(perf, na.ok = FALSE, lower = m$lower - tol, upper = m$upper + tol, label = m$id)
    }

    if (!is.null(f_cm)) {
      expect_identical(perf, f_cm(conf, na_value = na_value), label = m$id)
    }

    if ("sample_weights" %in% names(formals(f))) {
      perf = f(truth = truth, response = response, prob = prob, positive = positive, na_value = na_value, sample_weights = sample_weights)
      expect_number(perf, na.ok = FALSE, lower = m$lower - tol, upper = m$upper + tol, label = m$id)
    }
  }
}

test_that("trigger all", {
  N = 30L
  truth = ssample(letters[1:2], N)
  response = ssample(letters[1:2], N)
  prob = runif(N)
  positive = sample(letters[1:2], 1)

  run_all_measures(truth, response, prob, positive)
})

test_that("integer overflow", {
  N = 500000
  truth = ssample(c("a", "b"), N)
  response = truth
  prob = runif(N)
  positive = sample(letters[1:2], 1)
  run_all_measures(truth, response, prob, positive, na_allowed = TRUE)

  response = ssample(c("a", "b"), N)
  run_all_measures(truth, response, prob, positive)

  response = factor(ifelse(truth == "a", "b", "a"), levels = levels(truth))
  run_all_measures(truth, response, prob, positive, na_allowed = TRUE)
})


test_that("tests from Metrics", {
  as_fac = function(...) factor(ifelse(c(...) == 0, "b", "a"), levels = c("a", "b"))
  as_prob = function(...) {
    p = c(...)
    p = cbind(p, 1 - p)
    colnames(p) = c("a", "b")
    p
  }

  expect_equal(auc(as_fac(1, 0, 1, 1), c(.32, .52, .26, .86), "a"), 1 / 3)
  expect_equal(auc(as_fac(1, 0, 1, 0, 1), c(.9, .1, .8, .1, .7), "a"), 1)
  expect_equal(auc(as_fac(0, 1, 1, 0), c(.2, .1, .3, .4), "a"), 1 / 4)
  expect_equal(auc(as_fac(1, 1, 1, 1, 0, 0, 0, 0, 0, 0), 0 * (1:10), "a"), 0.5)

  # expect_equal(ll(1,1), 0)
  # expect_equal(ll(1,0), Inf)
  # expect_equal(ll(0,1), Inf)
  # expect_equal(ll(1,0.5), -log(0.5))

  expect_equal(ppv(as_fac(1, 1, 0, 0), as_fac(1, 1, 0, 0), "a"), 1)
  expect_equal(ppv(as_fac(0, 0, 1, 1), as_fac(1, 1, 0, 0), "a"), 0)
  expect_equal(ppv(as_fac(1, 1, 0, 0), as_fac(1, 1, 1, 1), "a"), 1 / 2)

  expect_equal(tpr(as_fac(1, 1, 0, 0), as_fac(1, 1, 0, 0), "a"), 1)
  expect_equal(tpr(as_fac(0, 0, 1, 1), as_fac(1, 1, 0, 0), "a"), 0)
  expect_equal(tpr(as_fac(1, 1, 1, 1), as_fac(1, 0, 0, 1), "a"), 1 / 2)

  expect_equal(fbeta(as_fac(1, 1, 0, 0), as_fac(1, 1, 0, 0), "a"), 1)
  expect_equal(fbeta(as_fac(0, 0, 1, 1), as_fac(1, 1, 1, 0), "a"), 2 / 5)
  expect_equal(fbeta(as_fac(1, 1, 1, 1), as_fac(1, 0, 0, 1), "a"), 2 / 3)
  expect_equal(fbeta(as_fac(1, 1, 0, 0), as_fac(1, 1, 1, 1), "a", beta = 0), 1 / 2)
})


test_that("confusion measures", {
  truth = factor(rep(c("a", "b"), each = 5), levels = c("a", "b"))
  response = factor(c("a", "a", "a", "b", "b", "b", "b", "b", "b", "a"), levels = c("a", "b"))
  # table(response, truth)

  TP = tp(response, truth, positive = "a")
  TN = tn(response, truth, positive = "a")
  FP = fp(response, truth, positive = "a")
  FN = fn(response, truth, positive = "a")

  expect_identical(TP, 3L)
  expect_identical(TN, 4L)
  expect_identical(FP, 2L)
  expect_identical(FN, 1L)

  expect_equal(dor(response, truth, positive = "a"), (TP / FP) / (FN / TN))
  expect_equal(fdr(response, truth, positive = "a"), FP / (TP + FP))
  expect_equal(fnr(response, truth, positive = "a"), FN / (TP + FN))
  expect_equal(fomr(response, truth, positive = "a"), FN / (FN + TN))
  expect_equal(fpr(response, truth, positive = "a"), FP / (FP + TN))
  expect_equal(mcc(response, truth, positive = "a"), (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)))
  expect_equal(npv(response, truth, positive = "a"), TN / (FN + TN))
  expect_equal(ppv(response, truth, positive = "a"), TP / (TP + FP))
  expect_equal(precision(response, truth, positive = "a"), TP / (TP + FP))
  expect_equal(recall(response, truth, positive = "a"), TP / (TP + FN))
  expect_equal(sensitivity(response, truth, positive = "a"), TP / (TP + FN))
  expect_equal(specificity(response, truth, positive = "a"), TN / (FP + TN))
  expect_equal(tnr(response, truth, positive = "a"), TN / (FP + TN))
  expect_equal(tpr(response, truth, positive = "a"), TP / (TP + FN))
})

test_that("weighted confusion measures", {
  truth = factor(c("a", "a", "b", "b"), levels = c("a", "b"))
  response = factor(c("a", "b", "a", "b"), levels = c("a", "b"))
  # Unweighted: TP=1, TN=1, FP=1, FN=1
  # Weighted (2,1,1,2): TP=2, TN=2, FP=1, FN=1
  w = c(2, 1, 1, 2)

  # Weighted counts
  TP = tp(truth, response, positive = "a", sample_weights = w)
  TN = tn(truth, response, positive = "a", sample_weights = w)
  FP = fp(truth, response, positive = "a", sample_weights = w)
  FN = fn(truth, response, positive = "a", sample_weights = w)

  expect_equal(TP, 2)
  expect_equal(TN, 2)

  expect_equal(FP, 1)
  expect_equal(FN, 1)

  # Derived measures with weights
  expect_equal(tpr(truth, response, positive = "a", sample_weights = w), TP / (TP + FN))
  expect_equal(fpr(truth, response, positive = "a", sample_weights = w), FP / (FP + TN))
  expect_equal(tnr(truth, response, positive = "a", sample_weights = w), TN / (FP + TN))
  expect_equal(fnr(truth, response, positive = "a", sample_weights = w), FN / (TP + FN))
  expect_equal(ppv(truth, response, positive = "a", sample_weights = w), TP / (TP + FP))
  expect_equal(npv(truth, response, positive = "a", sample_weights = w), TN / (FN + TN))
  expect_equal(fdr(truth, response, positive = "a", sample_weights = w), FP / (TP + FP))
  expect_equal(fomr(truth, response, positive = "a", sample_weights = w), FN / (FN + TN))
  expect_equal(dor(truth, response, positive = "a", sample_weights = w), (TP / FP) / (FN / TN))
  expect_equal(mcc(truth, response, positive = "a", sample_weights = w),
    (TP * TN - FP * FN) / sqrt((TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)))

  # Composite measures
  expect_equal(fbeta(truth, response, positive = "a", sample_weights = w),
    2 * TP / (2 * TP + FP + FN))
  expect_equal(gmean(truth, response, positive = "a", sample_weights = w),
    sqrt((TP / (TP + FN)) * (TN / (FP + TN))))
  expect_equal(gpr(truth, response, positive = "a", sample_weights = w),
    sqrt((TP / (TP + FP)) * (TP / (TP + FN))))

  # Uniform weights should equal unweighted
  w_uniform = c(1, 1, 1, 1)
  expect_equal(tpr(truth, response, positive = "a", sample_weights = w_uniform),
    tpr(truth, response, positive = "a"))
  expect_equal(fbeta(truth, response, positive = "a", sample_weights = w_uniform),
    fbeta(truth, response, positive = "a"))
})

test_that("bbrier", {
  N = 30L
  truth = ssample(letters[1:2], N)
  prob = as.numeric(truth == "a")

  expect_equal(bbrier(truth, prob, positive = "a"), 0)
  expect_equal(bbrier(truth, prob, positive = "b"), 1)

  prob = runif(N)
  pm = cbind(prob, 1 - prob)
  colnames(pm) = c("a", "b")
  expect_equal(2 * bbrier(truth, prob, "a"), mbrier(truth, pm))

  colnames(pm) = c("b", "a")
  expect_equal(2 * bbrier(truth, prob, "b"), mbrier(truth, pm))
})
