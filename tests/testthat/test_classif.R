context("classification measures")

test_that("trigger all", {
  k = 3
  n = 10
  truth = factor(sample(letters[1:k], n, replace = TRUE), levels = letters[1:k])
  response = factor(sample(letters[1:k], n, replace = TRUE), levels = letters[1:k])
  prob = matrix(runif(n*k), nrow = n)
  colnames(prob) = letters[1:k]

  Filter(Negate(is.null), eapply(measures, function(m) {
    if (m$type == "classif") {
      f = match.fun(m$id)
      perf = f(truth, response = response, prob = prob)
      expect_number(perf, na.ok = FALSE, lower = m$min, upper = m$max, label = m$id)
    }
  }))
})

test_that("tests from Metrics", {
  as_fac = function(...) factor(ifelse(c(...) == 0, "b", "a"), levels = c("a", "b"))

  expect_equal(ce(as_fac(1,1,1,0,0,0),as_fac(1,1,1,0,0,0)), 0.0)
  expect_equal(ce(as_fac(1,1,1,0,0,0),as_fac(1,1,1,1,0,0)), 1/6)

  expect_equal(ce(factor(c(1,2,3,4), levels = 1:4), factor(c(1,2,3,3), levels = 1:4)), 1/4)
  expect_equal(ce(c("cat","dog","bird"),c("cat","dog","fish")), 1/3)
  expect_equal(ce(c("cat","dog","bird"),c("caat","doog","biird")), 1.0)

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

test_that("ber", {
  truth = factor(c("a", "a", "b", "b", "c", "c"), levels = c("a", "b", "c"))
  response = factor(c("a", "a", "b", "b", "c", "c"), levels = c("a", "b", "c"))
  expect_equal(ber(truth, response), 0)

  response = factor(c("a", "b", "b", "c", "c", "a"), levels = c("a", "b", "c"))
  expect_equal(ber(truth, response), 0.5)

  response = factor(rep("a", 6), levels = c("a", "b", "c"))
  expect_equal(round(ber(truth, response), 2), 0.67)
})
