#' @title Multiclass AUC Scores
#'
#' @description
#' Multiclass AUC measures.
#'
#' * **AUNU: AUC of each class against the rest, using the uniform class
#'   distribution.** Computes the AUC treating a `c`-dimensional classifier
#'   as `c` two-dimensional 1-vs-rest classifiers, where classes are assumed to have
#'   uniform distribution, in order to have a measure which is independent
#'   of class distribution change. (Fawcett 2001)
#' * **AUNP: AUC of each class against the rest, using the a priori class
#'   distribution.** Computes the AUC treating a `c`-dimensional classifier as `c`
#'   two-dimensional 1-vs-rest classifiers, taking into account the prior probability of
#'   each class. (Fawcett 2001)
#' * **AU1U: AUC of each class against each other, using the uniform class
#'   distribution.** Computes something like (see Hand (2001) for details)
#'   the AUC of `c(c - 1)` binary classifiers (all possible pairwise
#'   combinations).
#' * **AU1P: AUC of each class against each other, using the a priori class
#'   distribution.** Computes something like AUC of `c(c - 1)` binary classifiers
#'   while considering the a priori distribution of the classes as suggested
#'   in Ferri (2009). Note we deviate from the the definition in
#'   Ferri (2009) by a factor of `c`
#'   The person implementing this function and writing this very
#'   documentation right now cautions against using this measure because it is
#'   an imperfect generalization of AU1U.
#'
#' @templateVar mid mauc_aunu
#' @template classif_template
#'
#' @references
#' \cite{fawcett_2001}
#'
#' \cite{ferri_2009}
#'
#' \cite{hand_2001}
#'
#' @inheritParams classif_params
#' @template classif_example
#' @export
mauc_aunu = function(truth, prob, na_value = NaN, ...) {
  assert_classif(truth, prob = prob)
  if (length(unique(truth)) != nlevels(truth)) {
    warning("Measure is undefined if there isn't at least one sample per class.")
    return(na_value)
  }
  mean(onevrestauc(prob, truth))
}

#' @rdname mauc_aunu
#' @export
mauc_aunp = function(truth, prob, na_value = NaN, ...) {
  assert_classif(truth, prob = prob)
  if (nlevels(truth) <= 1) {
    # we multiply AUCs of empty classes with 0. The limit expression actually results
    # in 0 for those, so aunp *is* defined if at least two classes are present.
    warning("Measure is undefined if there isn't at least one sample for at least two classes.")
    return(na_value)
  }
  sum(sapply(levels(truth), function(lvl) mean(truth == lvl)) * onevrestauc(prob, truth))
}

#' @rdname mauc_aunu
#' @export
mauc_au1u = function(truth, prob, na_value = NaN, ...) {
  assert_classif(truth, prob = prob)
  if (length(unique(truth)) != nlevels(truth)) {
    warning("Measure is undefined if there isn't at least one sample per class.")
    return(NA_real_)
  }
  sum(colAUC(prob, truth)) / (2 * nlevels(truth) * (nlevels(truth) - 1))
}

#' @rdname mauc_aunu
#' @export
mauc_au1p = function(truth, prob, na_value = NaN, ...) {
  assert_classif(truth, prob = prob)
  if (length(unique(truth)) != nlevels(truth)) {
    warning("Measure is undefined if there isn't at least one sample per class.")
    return(NA_real_)
  }

  m = colAUC(prob, truth)
  weights = table(truth) / length(truth)
  sum(c(m + t(m)) * c(weights)) / (2 * (nlevels(truth) - 1))
}

#' @include measures.R
add_measure(mauc_aunu, "Average 1 vs. rest multiclass AUC", "classif", 0, 1, FALSE)
add_measure(mauc_aunp, "Weighted average 1 vs. rest multiclass AUC", "classif", 0, 1, FALSE)
add_measure(mauc_au1u, "Average 1 vs. 1 multiclass AUC", "classif", 0, 1, FALSE)
add_measure(mauc_au1p, "Weighted average 1 vs. 1 multiclass AUC", "classif", 0, 1, FALSE)

# returns a numeric length nlevel(truth), with one-vs-rest AUC
onevrestauc <- function(prob, truth) {
  ntotal = nrow(prob)
  sapply(levels(truth), function(cls) {
    nrest = sum(truth != cls)
    if (nrest == ntotal) {
      # this class has no members. What happened?
      #  - If we were called by mauc_aunu --> this does never happen, because we return(NA) if there are empty classes
      #  - If we were called by mauc_aunp --> this value gets multiplied with 0 and should result in 0
      # therefore we don't want to return Inf here, but a final value that does not matter in the end
      return(0)
    }
    r = rank(c(prob[truth != cls, cls], prob[truth == cls, cls]), ties.method = "average")
    # simplify the following:
    # (sum(r[seq_len(nrest)]) - nrest * (nrest + 1) / 2) / (nrest * (ntotal - nrest))
    (mean(r[seq_len(nrest)]) - (nrest + 1) / 2) / (ntotal - nrest)
  })
}

# calculates \cite{hand_2001} pairwise asymmetric(!) AUC matrix
colAUC = function(prob, truth) {
  prob <- as.matrix(prob)  # turn numeric vector to column if necessary
  truth <- as.factor(truth)  # turn logical to factor

  # conditional_auc[i, j] is A(i | j) as defined in \cite{hand_2001}:
  # "the probability that a randomly drawn member of class j will have a
  # lower estimated probability of belonging to class i than a randomly
  # drawn member of class i"
  conditional_auc = matrix(0, nlevels(truth), nlevels(truth))
  rownames(conditional_auc) = levels(truth)
  colnames(conditional_auc) = levels(truth)
  for (i in levels(truth)) {
    ni = sum(truth == i)  # avoid integer overflow
    for (j in levels(truth)) {
      if (i == j) next
      nj = sum(truth == j)  # avoid integer overflow
      r = rank(c(prob[truth == j, i], prob[truth == i, i]), ties.method = "average")
      # simplify the following:
      # conditional_auc[i, j] = (sum(r[seq_len(nj)]) - nj * (nj + 1) / 2) / (ni * nj)
      conditional_auc[i, j] = (mean(r[seq_len(nj)]) - (nj + 1) / 2) / ni
    }
  }
  conditional_auc
}
