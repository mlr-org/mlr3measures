source("setup.R")
using("checkmate")

N = 10L
truth = 1 + runif(N)
response = 1 + runif(N)

for (m in as.list(measures)) {
  if (m$type != "regr")
    next
  f = match.fun(m$id)
  perf = f(truth = truth, response = response)
  expect_number(perf, na.ok = FALSE, lower = m$lower, upper = m$upper, label = m$id)
}
