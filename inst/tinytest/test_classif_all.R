source("setup.R")
using("checkmate")

ssample = function(lvls, N) {
  x = c(lvls, sample(lvls, N - length(lvls), replace = TRUE))
  factor(sample(x), levels = lvls)
}

k = 3
n = 10
truth = ssample(letters[1:k], n)
response = ssample(letters[1:k], n)
prob = matrix(runif(n*k, min = 1e-8, max = 1 - 1e-8), nrow = n)

prob = t(apply(prob, 1, function(x) x / sum(x)))
colnames(prob) = letters[1:k]

for (m in as.list(measures)) {
  if (m$type != "classif")
    next
  f = match.fun(m$id)
  perf = f(truth = truth, response = response, prob = prob)
  expect_number(perf, na.ok = FALSE, lower = m$lower, upper = m$upper, label = m$id)
}
