source("setup.R")
using("checkmate")

ssample = function(lvls, N) {
  x = c(lvls, sample(lvls, N - length(lvls), replace = TRUE))
  factor(sample(x), levels = lvls)
}

N = 30L
truth = ssample(letters[1:2], N)
response = ssample(letters[1:2], N)
prob = runif(N)
positive = sample(letters[1:2], 1)
conf = cm(truth, response, positive = positive)

for (m in as.list(measures)) {
  if (m$type != "binary")
    next
  f = match.fun(m$id)
  perf = f(truth = truth, response = response, prob = prob, positive = positive)
  expect_number(perf, na.ok = FALSE, lower = m$lower, upper = m$upper, label = m$id)
  f_cm = get0(sprintf("%s_cm", m$id))
  if (!is.null(f_cm)) {
    expect_equal(perf, f_cm(conf))
  }
}
