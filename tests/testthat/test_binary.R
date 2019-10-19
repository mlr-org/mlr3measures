context("binary classification measures")

test_that("trigger all", {
  N = 20L
  truth = factor(sample(letters[1:2], N, replace = TRUE), levels = letters[1:2])
  response = factor(sample(letters[1:2], N, replace = TRUE), levels = letters[1:2])
  prob = runif(N)
  positive = sample(letters[1:2], 1)
  conf = cm(truth, response, positive = positive)

  for (m in as.list(measures)) {
    if (m$type != "binary")
      next
    f = match.fun(m$id)
    perf = wrapper(f, truth = truth, response = response, prob = prob, positive = positive)
    expect_number(perf, na.ok = FALSE, lower = m$lower, upper = m$upper, label = m$id)
    f_cm = get0(sprintf("%s_cm", m$id))
    if (!is.null(f_cm)) {
      expect_equal(perf, f_cm(conf))
    }
  }
})


test_that("tests from Metrics", {
  as_fac = function(...) factor(ifelse(c(...) == 0, "b", "a"), levels = c("a", "b"))
  as_prob = function(...) { p = c(...);  p = cbind(p, 1-p); colnames(p) = c("a", "b"); p}

  expect_equal(auc(as_fac(1,0,1,1), c(.32,.52,.26,.86), "a"), 1/3)
  expect_equal(auc(as_fac(1,0,1,0,1),c(.9,.1,.8,.1,.7), "a"), 1)
  expect_equal(auc(as_fac(0,1,1,0),c(.2,.1,.3,.4), "a"), 1/4)
  expect_equal(auc(as_fac(1,1,1,1,0,0,0,0,0,0),0*(1:10), "a"), 0.5)

  # expect_equal(ll(1,1), 0)
  # expect_equal(ll(1,0), Inf)
  # expect_equal(ll(0,1), Inf)
  # expect_equal(ll(1,0.5), -log(0.5))

  expect_equal(ppv(as_fac(1,1,0,0),as_fac(1,1,0,0), "a"), 1)
  expect_equal(ppv(as_fac(0,0,1,1),as_fac(1,1,0,0), "a"), 0)
  expect_equal(ppv(as_fac(1,1,0,0),as_fac(1,1,1,1), "a"), 1/2)

  expect_equal(tpr(as_fac(1,1,0,0),as_fac(1,1,0,0), "a"), 1)
  expect_equal(tpr(as_fac(0,0,1,1),as_fac(1,1,0,0), "a"), 0)
  expect_equal(tpr(as_fac(1,1,1,1),as_fac(1,0,0,1), "a"), 1/2)

  expect_equal(fbeta(as_fac(1,1,0,0), as_fac(1,1,0,0), "a"), 1)
  expect_equal(fbeta(as_fac(0,0,1,1), as_fac(1,1,1,0), "a"), 2/5)
  expect_equal(fbeta(as_fac(1,1,1,1), as_fac(1,0,0,1), "a"), 2/3)
  expect_equal(fbeta(as_fac(1,1,0,0), as_fac(1,1,1,1), "a", beta=0), 1/2)
})
