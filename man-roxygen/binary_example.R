#' @examples
#' set.seed(1)
#' lvls = c("a", "b")
#' truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
<% if ("response" %in% formalArgs(mid)) { %>
#' response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
#' <%= mid %>(truth, response, positive = "a")
<% } else { %>
#' prob = runif(10)
#' <%= mid %>(truth, prob, positive = "a")
<% } %>
