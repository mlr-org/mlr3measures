#' @title Phi Coefficient Similarity
#'
#' @details
#' The Phi Coefficient is defined as the Pearson correlation between the binary
#' representation of two sets \eqn{A} and \eqn{B}.
#' The binary representation for \eqn{A} is a logical vector of
#' length \eqn{p} with the i-th element being 1 if the corresponding
#' element is in \eqn{A}, and 0 otherwise.
#'
#' If more than two sets are provided, the mean of all pairwise scores
#' is calculated.
#'
#' @references
#' `r format_bib("nogueira_2016", "bommert_2017", "stabm")`
#'
#' @templateVar mid phi
#' @template similarity_template
#'
#' @details
#' This measure is undefined if one set contains none or all possible elements.
#'
#' @inheritParams similarity_params
#' @export
#' @examples
#' set.seed(1)
#' sets = list(
#'   sample(letters[1:3], 1),
#'   sample(letters[1:3], 2)
#' )
#' phi(sets, p = 3)
phi = function(sets, p, na_value = NaN, ...) {
  sets = assert_sets(sets)
  assert_count(p, positive = TRUE)

  if (any(lengths(sets) %in% c(0L, p))) {
    return(na_value)
  }

  omega = unique(unlist(sets, use.names = FALSE))
  if (p < length(omega)) {
    stop("Number of observed elements in sets exceeds 'p'")
  }
  omega = c(omega, rep(NA, p - length(omega)))

  scores = map_pairwise(sets, function(A, B) {
    cor(omega %in% A, omega %in% B)
  })

  mean(scores)
}

#' @include measures.R
add_measure(phi, "Phi Coefficient Similarity", "similarity", -1, 1, FALSE)
