assert_binary = function(truth, response = NULL, prob = NULL, positive = NULL, na_value = NULL) {
  assert_factor(truth, min.len = 1L, n.levels = 2L, any.missing = FALSE)

  if (!is.null(response)) {
    assert_factor(response, len = length(truth), any.missing = FALSE)
    assert_set_equal(levels(truth), levels(response), ordered = TRUE)
  }

  if (!is.null(prob)) {
    assert_numeric(prob, len = length(truth), lower = 0, upper = 1, any.missing = FALSE)
  }

  if (!is.null(positive)) {
    assert_string(positive)
    assert_choice(positive, levels(truth))
  }

  assert_number(na_value, na.ok = TRUE, null.ok = TRUE)
}

assert_classif = function(truth, response = NULL, prob = NULL, na_value = NULL) {
  assert_factor(truth, min.len = 1L, min.levels = 2L, any.missing = FALSE)

  if (!is.null(response)) {
    assert_factor(response, len = length(truth), any.missing = FALSE)
    assert_set_equal(levels(truth), levels(response), ordered = TRUE)
  }

  if (!is.null(prob)) {
    assert_matrix(prob, nrows = length(truth), ncols = nlevels(truth), col.names = "named")
    assert_numeric(prob, lower = 0, upper = 1, any.missing = FALSE)
    assert_set_equal(colnames(prob), levels(truth))
  }

  assert_number(na_value, na.ok = TRUE, null.ok = TRUE)
}


assert_regr = function(truth, response, na_value = NULL) {
  assert_numeric(truth, min.len = 1L, any.missing = FALSE, finite = TRUE)
  assert_numeric(response, len = length(truth), any.missing = FALSE, finite = TRUE)
  assert_number(na_value, na.ok = TRUE, null.ok = TRUE)
}


assert_sets = function(sets) {
  assert_list(sets, types = c("character", "integer"), min.len = 2L, any.missing = FALSE)
  if (is.character(sets[[1L]])) {
    qassertr(sets, "S[1,]")
  } else {
    qassertr(sets, "I")
  }

  lapply(sets, unique)
}
