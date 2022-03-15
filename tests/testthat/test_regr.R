test_that("trigger all", {
  N = 10L
  truth = 1 + runif(N)
  response = 1 + runif(N)
  tol = sqrt(.Machine$double.eps)

  for (m in as.list(measures)) {
    if (m$type != "regr") {
      next
    }
    f = match.fun(m$id)

    perf = f(truth = truth, response = response)
    if (m$aggregated) {
      expect_number(perf, na.ok = FALSE, lower = m$lower - tol, upper = m$upper + tol, label = m$id)
    } else {
      expect_numeric(perf, any.missing = FALSE, lower = m$lower - tol, upper = m$upper + tol, label = m$id)
    }

    if ("sample_weights" %in% names(formals(f))) {
      sample_weights = runif(length(truth))
      perf = f(truth = truth, response = response, sample_weights = sample_weights)
      expect_number(perf, na.ok = FALSE, lower = m$lower - tol, upper = m$upper + tol, label = m$id)
    }
  }
})

test_that("tests from Metrics", {
  expect_equal(bias(1, 1), 0)
  expect_equal(bias(c(-1, -100, 17.5), c(0, 0, 0)), mean(c(-1, -100, 17.5)))

  expect_equal(pbias(c(1, 2, 3), c(1, 3, 2)), mean(c(0, -1 / 2, 1 / 3)))
  expect_equal(pbias(c(1, 2, 0), c(1, 2, 1)), NaN)
  expect_equal(pbias(0, 0), NaN)
  expect_equal(pbias(c(-1.1, 1.1), c(-1, 1)), 0)

  expect_equal(se(3.4, 4.4), 1)
  expect_equal(se(9:11, 11:9), c(4, 0, 4))

  expect_equal(sse(c(1, 3, 2), c(2, 3, 4)), 5)

  expect_equal(mse(1:4, c(2, 3, 4, 4)), 3 / 4)

  expect_equal(rmse(1:4, c(1, 2, 3, 5)), sqrt(1 / 4))
  expect_equal(rmse(1:4, 1:4), 0)

  expect_equal(ae(3.4, 4.4), 1)
  expect_equal(ae(9:11, 11:9), c(2, 0, 2))

  expect_equal(mae(1:4, c(1, 2, 3, 5)), 0.25)

  expect_equal(medae(1:4, c(1, 2, 4, 50)), 0.5)

  expect_equal(ape(0:3, 1:4), c(Inf, 1, 1 / 2, 1 / 3))
  expect_equal(ape(0:2, c(0, 0, 0)), c(NaN, 1, 1))
  expect_equal(ape(c(-1.1, 1.1), c(-1, 1)), c(1 / 11, 1 / 11))

  expect_equal(mape(1:3, 2:4), mean(c(1, 1 / 2, 1 / 3)))
  expect_equal(mape(c(-1.1, 1.1), c(-1, 1)), 1 / 11)

  expect_equal(smape(0, 0), NaN)
  expect_equal(smape(1, -1), 2)
  expect_equal(smape(1, 0), 2)
  expect_equal(smape(c(1, 2, 3), c(2, 5, 4)), smape(c(2, 5, 4), c(1, 2, 3)))

  expect_equal(sle(c(0, 1, 3.4), c(1, 0, 3.4)), c(log(2), log(2), 0)^2)
  expect_equal(sle(exp(2) - 1, exp(1) - 1), 1)

  expect_equal(msle(c(1, 2, exp(1) - 1), c(1, 2, exp(2) - 1)), 1 / 3)

  expect_equal(rmsle(c(exp(5) - 1), c(exp(1) - 1)), 4)

  expect_equal(rae(0:10, 30:40), 11)
  expect_equal(rae(seq(0, 2, 0.5), seq(0, 2, 0.5)), 0.0)
  expect_equal(rae(1:4, c(1, 2, 3, 5)), 0.25)

  expect_equal(rrse(0:10, 2:12), sqrt(0.4))
  expect_equal(rrse(seq(0, 2, 0.5), seq(0, 2, 0.5)), 0.0)
  expect_equal(rrse(1:4, c(1, 2, 3, 5)), sqrt(0.2))

  expect_equal(rse(0:10, 2:12), 0.4)
  expect_equal(rse(seq(0, 2, 0.5), seq(0, 2, 0.5)), 0.0)
  expect_equal(rse(1:4, c(1, 2, 3, 5)), 0.2)

  expect_equal(rsq(0:10, 2:12), 0.6)
  expect_equal(rsq(seq(0, 2, 0.5), seq(0, 2, 0.5)), 1.0)
  expect_equal(rsq(1:4, c(1, 2, 3, 5)), 0.8)
})
