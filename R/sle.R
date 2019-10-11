# squared log error
sle = function(truth, response) {
  (log1p(truth) - log1p(response))^2
}
