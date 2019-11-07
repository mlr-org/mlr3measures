#' @examples
#' set.seed(1)
#' lvls = c("a", "b")
#' truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
#' response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
#' <%= mid %>(truth, response, positive = "a")
