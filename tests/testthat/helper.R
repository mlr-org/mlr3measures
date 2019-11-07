library(checkmate)

ssample = function(lvls, N) {
  x = c(lvls, sample(lvls, N - length(lvls), replace = TRUE))
  factor(sample(x), levels = lvls)
}
