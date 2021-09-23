run_all_measures = function(sets, p) {
  tol = sqrt(.Machine$double.eps)

  for (m in as.list(measures)) {
    if (m$type != "similarity") {
      next
    }
    f = match.fun(m$id)
    perf = f(sets, p = p)
    expect_number(perf, na.ok = FALSE, lower = m$lower - tol, upper = m$upper + tol, label = m$id)
  }
}

test_that("trigger all", {
  sets = lapply(1:3, function(i) sample(letters[1:5], 2))
  run_all_measures(sets, p = 5)
})

test_that("no similarity", {
  p = 4L
  sets = list(
    1:2,
    3:4
  )

  expect_equal(jaccard(sets), measures$jaccard$lower)
  expect_equal(phi(sets, p = 4), measures$phi$lower)
})

test_that("perfect similarity", {
  p = 2L
  sets = list(
    1:2,
    1:2
  )

  expect_equal(jaccard(sets), measures$jaccard$upper)
  expect_equal(phi(sets, p = 4), measures$phi$upper)
})

test_that("jaccard", {
  sets = list(
    integer(),
    integer(),
    1:2
  )
  expect_identical(jaccard(sets), NaN)

  sets = list(
    integer(),
    1:2
  )
  expect_equal(jaccard(sets), 0)
})

test_that("phi", {
  sets = list(
    integer(),
    1:2
  )
  expect_identical(phi(sets, p = 2), NaN)

  sets = list(
    1L,
    1:2
  )
  expect_identical(phi(sets, p = 2), NaN)

  sets = list(
    1L,
    2L
  )
  expect_equal(phi(sets, p = 2), -1)

  sets = list(
    1:3L,
    2L
  )
  expect_error(phi(sets, p = 2), "exceeds")
})
