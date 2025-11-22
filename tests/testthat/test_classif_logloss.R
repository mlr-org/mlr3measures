test_that("logloss obs_loss works", {
  truth = factor(rep(c("a", "b"), each = 5), levels = c("a", "b"))
  prob = matrix(runif(length(truth) * 2), ncol = 2)
  prob = t(apply(prob, 1, function(x) x / sum(x)))
  colnames(prob) = levels(truth)
  expect_numeric(obs_logloss(truth, prob), len = length(truth))
})
