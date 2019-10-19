context("classification measures")

test_that("trigger all", {
  k = 3
  n = 10
  truth = factor(sample(letters[1:k], n, replace = TRUE), levels = letters[1:k])
  response = factor(sample(letters[1:k], n, replace = TRUE), levels = letters[1:k])
  prob = matrix(runif(n*k), nrow = n)
  colnames(prob) = letters[1:k]

  for (m in as.list(measures)) {
    if (m$type != "classif")
      next
    f = match.fun(m$id)
    perf = wrapper(f, truth = truth, response = response, prob = prob)
    expect_number(perf, na.ok = FALSE, lower = m$lower, upper = m$upper, label = m$id)
  }
})

test_that("tests from Metrics", {
  as_fac = function(...) factor(ifelse(c(...) == 0, "b", "a"), levels = c("a", "b"))
  as_prob = function(...) { p = c(...);  p = cbind(p, 1-p); colnames(p) = c("a", "b"); p}

  expect_equal(ce(as_fac(1,1,1,0,0,0),as_fac(1,1,1,0,0,0)), 0.0)
  expect_equal(ce(as_fac(1,1,1,0,0,0),as_fac(1,1,1,1,0,0)), 1/6)

  expect_equal(ce(factor(c(1,2,3,4), levels = 1:4), factor(c(1,2,3,3), levels = 1:4)), 1/4)
  lvls = c("cat", "dog", "bird", "fish")
  expect_equal(ce(factor(c("cat","dog","bird"), levels = lvls),factor(c("cat","dog","fish"), levels = lvls)), 1/3)

  expect_equal(logloss(as_fac(1,1,0,0),as_prob(1,1,0,0)), 0)
  expect_number(logloss(as_fac(1,1,0,0),as_prob(0,0,1,1)), lower = 10, upper = 50)
  expect_equal(logloss(as_fac(1,1,1,0,0,0),as_prob(.5,.1,.01,.9,.75,.001)), 1.881797068998267)

  # rater.a <- c(1, 2, 1)
  # rater.b <- c(1, 2, 2)
  # kappa <- ScoreQuadraticWeightedKappa(rater.a, rater.b)
  # expect_equal(kappa, 0.4)

  # rater.a <- c(1, 2, 3, 1, 2, 3)
  # rater.b <- c(1, 2, 3, 1, 3, 2)
  # kappa <- ScoreQuadraticWeightedKappa(rater.a, rater.b)
  # expect_equal(kappa, 0.75)

  # rater.a <- c(1, 2, 3)
  # rater.b <- c(1, 2, 3)
  # kappa <- ScoreQuadraticWeightedKappa(rater.a, rater.b)
  # expect_equal(kappa, 1.0)

  # rater.a <- c(1, 3, 5)
  # rater.b <- c(2, 4, 6)
  # kappa <- ScoreQuadraticWeightedKappa(rater.a, rater.b)
  # expect_equal(kappa, 0.8421052631578947)

  # rater.a <- c(1, 3, 3, 5)
  # rater.b <- c(2, 4, 5, 6)
  # kappa <- ScoreQuadraticWeightedKappa(rater.a, rater.b, 1, 6)
  # expect_equal(kappa, 0.6956521739130435)
  #
  #
  # kappa <- MeanQuadraticWeightedKappa( c(1, 1) )
  # expect_equal(kappa, 0.999)

  # kappa <- MeanQuadraticWeightedKappa( c(1, -1) )
  # expect_equal(kappa, 0.0)

  # kappa <- MeanQuadraticWeightedKappa( c(.5, .8), c(1.0, .5) )
  # expect_equal(kappa, 0.624536446425734)
})

# test_that("ber", {
#   truth = factor(c("a", "a", "b", "b", "c", "c"), levels = c("a", "b", "c"))
#   response = factor(c("a", "a", "b", "b", "c", "c"), levels = c("a", "b", "c"))
#   expect_equal(ber(truth, response), 0)

#   response = factor(c("a", "b", "b", "c", "c", "a"), levels = c("a", "b", "c"))
#   expect_equal(ber(truth, response), 0.5)

#   response = factor(rep("a", 6), levels = c("a", "b", "c"))
#   expect_equal(round(ber(truth, response), 2), 0.67)
# })
