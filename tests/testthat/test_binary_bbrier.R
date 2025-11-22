test_that("bbrier obs_loss works", {
  truth = factor(rep(c("a", "b"), each = 5), levels = c("a", "b"))
  prob = runif(length(truth))
  expect_numeric(se_binary(truth, prob, positive = "a"), len = length(truth))
})
