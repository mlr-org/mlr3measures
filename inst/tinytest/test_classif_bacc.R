source("setup.R")
using("checkmate")

truth = factor(c("a", "a", "b", "b"), levels = c("a", "b"))
response = factor(c("a", "a", "b", "a"), levels = c("a", "b"))
expect_equal(bacc(truth, response), 0.75)
expect_equal(bacc(truth, response, sample_weights = c(0.25, 0.25, 0.25, 0.25)), 0.75)
expect_equal(bacc(truth, response, sample_weights = c(0.25, 0.25, 0.25, 1)), 0.6)

truth = factor(c("a", "a", "a", "a", "a", "b"), levels = c("a", "b"))
response = factor(c("a", "a", "a", "a", "b", "b"), levels = c("a", "b"))
expect_equal(bacc(truth, response), 0.9)
expect_equal(bacc(truth, response, sample_weights = c(0, 0, 0, 0, 0, 1)), 1)
expect_equal(bacc(truth, response, sample_weights = c(0, 0, 0, 0, 0.5, 0.5)), 0.5)

truth = factor(c("c", "a", "a", "a", "a", "b"), levels = c("a", "b", "c"))
response = factor(c("c", "a", "a", "a", "b", "b"), levels = c("a", "b", "c"))
expect_equal(round(bacc(truth, response), 3), 0.917)
