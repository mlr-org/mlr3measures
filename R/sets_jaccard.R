if (FALSE) {
  all_feats = letters[1:5]
  sets = lapply(1:3, function(i) sample(all_feats, sample(length(all_feats))))
  jaccard(sets, 3)
  stabilityJaccard(sets)

  dice(sets)
  stabilityDice(sets)

  lustgarten(sets, p = 5)
  stabilityLustgarten(sets, p = 5)

  phi(sets, p = 5)
  stabilityPhi(sets, p = 5)
}

jaccard = function(sets, na_value = NaN, ...) {
  sets = assert_sets(sets)

  if (sum(lengths(sets) == 0L) >= 2L) {
    return(na_value)
  }

  scores = map_pairwise(sets, function(x, y) {
    length(intersect(x, y)) / length(union(x, y))
  })

  m = length(sets)
  2L / (m * (m - 1L)) * sum(scores)
}

dice = function(sets, na_value = NaN, ...) {
  sets = assert_sets(sets)

  if (sum(lengths(sets) == 0L) >= 2L) {
    return(na_value)
  }

  scores = map_pairwise(sets, function(x, y) {
    2L * length(intersect(x, y)) / (length(x) + length(y))
  })

  m = length(sets)
  2L / (m * (m - 1L)) * sum(scores)
}

lustgarten = function(sets, p, na_value = NaN, ...) {
  sets = assert_sets(sets)
  assert_count(p, positive = TRUE)

  if (sum(lengths(sets) == 0L) >= 2L) {
    return(na_value)
  }

  scores = map_pairwise(sets, function(x, y) {
    nx = length(x)
    ny = length(y)
    (length(intersect(x, y)) - (nx * ny / p)) / (min(nx, ny) - max(0L, nx + ny - p))
  })

  if (anyMissing(scores)) {
    return(na_value)
  }

  m = length(sets)
  2L / (m * (m - 1L)) * sum(scores)
}



phi = function(sets, p, na_value = NaN, ...) {
  sets = assert_sets(sets)
  assert_count(p, positive = TRUE) # TODO: assert that p is >= uniqueN(sets)

  if (any(lengths(sets) %in% c(0L, p))) {
    return(na_value)
  }

  nn = unique(unlist(sets, use.names = FALSE))
  nn = c(nn, rep("__unknown__", p - length(nn)))

  scores = map_pairwise(sets, function(x, y) {
    cor(nn %in% x, nn %in% y)
  })

  m = length(sets)
  2L / (m * (m - 1L)) * sum(scores)
}
