# absolute percent error
ape = function(truth, response) {
  abs((truth - response) / truth)
}
