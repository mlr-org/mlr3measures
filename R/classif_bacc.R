#' @title Balanced Accuracy
#'
#' @details
#' The Balanced Accuracy computes the weighted balanced accuracy, suitable for imbalanced data sets.
#' It is defined analogously to the definition in [sklearn](https://scikit-learn.org/).
#'
#' First, all sample weights \eqn{w_i} are normalized per class so that each class has the same influence:
#' \deqn{
#'  \hat{w}_i = \frac{w_i}{\sum_{j=1}^n w_j \cdot \mathbf{1}(t_j = t_i)}.
#' }{
#'  w_hat[i] = w[i] / sum((t == t[i]) * w[i]).
#' }
#' The Balanced Accuracy is then calculated as
#' \deqn{
#'  \frac{1}{\sum_{i=1}^n \hat{w}_i} \sum_{i=1}^n \hat{w}_i \cdot \mathbf{1}(r_i = t_i).
#' }{
#'  1 / sum(w_hat) * sum((r == t) * w_hat).
#' }
#' This definition is equivalent to [acc()] with class-balanced sample weights.
#'
#' @references
#' `r format_bib("brodersen_2010", "guyon_2015")`
#'
#' @templateVar mid bacc
#' @template classif_template
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
bacc = function(truth, response, sample_weights = NULL, ...) {
  assert_classif(truth, response = response)
  if (is.null(sample_weights)) {
    sample_weights = rep(1, length(truth))
  } else {
    assert_numeric(sample_weights, lower = 0, any.missing = FALSE)
  }

  label_weights = vapply(split(sample_weights, truth), sum, NA_real_)
  sample_weights = sample_weights / label_weights[truth]
  sample_weights[is.na(sample_weights)] = 0

  sum((truth == response) * sample_weights) / sum(sample_weights)
}

#' @include measures.R
add_measure(bacc, "Balanced Accuracy", "classif", 0, 1, FALSE)
