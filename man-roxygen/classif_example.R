#' @examples
#' set.seed(1)
#' lvls = c("a", "b", "c")
#' truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
<% if ("response" %in% formalArgs(mid)) { %>
#' response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
#' <%= mid %>(truth, response)
<% } else { %>
#' prob = matrix(runif(3 * 10), ncol = 3)
#' colnames(prob) = levels(truth)
#' <%= mid %>(truth, prob)
<% } %>
