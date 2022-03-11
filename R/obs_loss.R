# 0/1 loss for classification
zero_one = function(truth, repsonse) {
  truth == response
}

# absolute error
ae = function(truth, response) {
  abs(truth - response)
}

# absolute percent error
ape = function(truth, response) {
  abs((truth - response) / truth)
}

# squared error
se = function(truth, response) {
  (truth - response)^2
}

# squared log error
sle = function(truth, response) {
  (log1p(truth) - log1p(response))^2
}
