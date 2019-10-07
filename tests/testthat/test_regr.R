test_that("regression measures", {
  measures = list_measures()
  measures = measures[measures$type == "regr", ]

  for (id in rownames(measures)) {
    f = match.fun(id)
    truth = runif(10)
    response = runif(10)
    perf = f(truth, response)
    expect_number(perf, na.ok = FALSE, label = id)
  }
})
