#' @title Jaccard Similarity Index
#'
#' @details
#' For two sets \eqn{A} and \eqn{B}, the Jaccard Index is defined as
#' \deqn{
#'   J(A, B) = \frac{|A \cap B|}{|A \cup B|}.
#' }{
#'   J(A, B) = length(intersect(A, B)) / length(union(A, B)).
#' }
#' If more than two sets are provided, the mean of all pairwise scores
#' is calculated.
#'
#' @references
#' `r format_bib("jaccard_1901", "bommert_2017", "stabm")`
#'
#' @templateVar mid jaccard
#' @template similarity_template
#'
#' @details
#' This measure is undefined if two or more sets are empty.
#'
#' @inheritParams similarity_params
#'
#' @export
#' @examples
#' set.seed(1)
#' sets = list(
#'   sample(letters[1:3], 1),
#'   sample(letters[1:3], 2)
#' )
#' jaccard(sets)
jaccard = function(sets, na_value = NaN, ...) {
  sets = assert_sets(sets)

  if (sum(lengths(sets) == 0L) >= 2L) {
    return(na_value)
  }

  scores = map_pairwise(sets, function(A, B) {
    n_inter = length(intersect(A, B))
    n_inter / (length(A) + length(B) - n_inter)
  })

  mean(scores)
}

#' @include measures.R
add_measure(jaccard, "Jaccard Similarity Index", "similarity", 0, 1, FALSE)
