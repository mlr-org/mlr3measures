#' @title Multiclass Brier Score
#'
#' @details
#' Brier score for multi-class classification problems with \eqn{k} labels defined as \deqn{
#'    \frac{1}{n} \sum_{i=1}^n \sum_{j=1}^k (I_{ij} - p_{ij})^2.
#' }{
#     1/n * sum_i sum_j (I_ij - p_ij)^2.
#' }
#' \eqn{I_{ij}}{I_ij} is 1 if observation \eqn{x_i} has true label \eqn{j}, and 0 otherwise.
#' \eqn{p_{ij}}{p_ij} is the probability that observation \eqn{x_i} belongs to class \eqn{j}.
#'
#' Note that there also is the more common definition of the Brier score for binary
#' classification problems in [bbrier()].
#'
#' @templateVar mid mbrier
#' @template classif_template
#'
#' @references
#' `r format_bib("brier_1950")`
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
mbrier = function(truth, prob, ...) {
  assert_classif(truth, prob = prob)

  mat01 = contr.treatment(colnames(prob), contrasts = FALSE)
  mat01 = mat01[match(truth, rownames(mat01)), ]
  mean(rowSums(.se(mat01, prob)))
}

#' @include measures.R
add_measure(mbrier, "Multiclass Brier Score", "classif", 0, 2, TRUE)
