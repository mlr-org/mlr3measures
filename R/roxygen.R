#' @title Regression Parameters
#' @name regr_params
#'
#' @param truth (`numeric()`)\cr
#'   True (observed) values.
#'   Must have the same length as `response`.
#' @param response (`numeric()`)\cr
#'   Predicted response values.
#'   Must have the same length as `truth`.
#' @param sample_weights (`numeric()`)\cr
#'   Vector of non-negative and finite sample weights.
#'   Must have the same length as `truth`.
#'   The vector gets automatically normalized to sum to one.
#'   Defaults to equal sample weights.
#' @param na_value (`numeric(1)`)\cr
#'   Value that should be returned if the measure is not defined for the input
#'   (as described in the note). Default is `NaN`.
#' @param ... (`any`)\cr
#'   Additional arguments. Currently ignored.
#' @keywords internal
NULL

#' @title Binary Classification Parameters
#' @name binary_params
#'
#' @param truth (`factor()`)\cr
#'   True (observed) labels.
#'   Must have the exactly same two levels and the same length as `response`.
#' @param response (`factor()`)\cr
#'   Predicted response labels.
#'   Must have the exactly same two levels and the same length as `truth`.
#' @param prob (`numeric()`)\cr
#'   Predicted probability for positive class.
#'   Must have exactly same length as `truth`.
#' @param positive (`character(1))`\cr
#'   Name of the positive class.
#' @param sample_weights (`numeric()`)\cr
#'   Vector of non-negative and finite sample weights.
#'   Must have the same length as `truth`.
#'   The vector gets automatically normalized to sum to one.
#'   Defaults to equal sample weights.
#' @param na_value (`numeric(1)`)\cr
#'   Value that should be returned if the measure is not defined for the input
#'   (as described in the note). Default is `NaN`.
#' @param ... (`any`)\cr
#'   Additional arguments. Currently ignored.
#' @keywords internal
NULL

#' @title Classification Parameters
#' @name classif_params
#'
#' @param truth (`factor()`)\cr
#'   True (observed) labels.
#'   Must have the same levels and length as `response`.
#' @param response (`factor()`)\cr
#'   Predicted response labels.
#'   Must have the same levels and length as `truth`.
#' @param prob (`matrix()`)\cr
#'   Matrix of predicted probabilities, each column is a vector of probabilities for a
#'   specific class label.
#'   Columns must be named with levels of `truth`.
#' @param sample_weights (`numeric()`)\cr
#'   Vector of non-negative and finite sample weights.
#'   Must have the same length as `truth`.
#'   The vector gets automatically normalized to sum to one.
#'   Defaults to equal sample weights.
#' @param na_value (`numeric(1)`)\cr
#'   Value that should be returned if the measure is not defined for the input
#'   (as described in the note). Default is `NaN`.
#' @param ... (`any`)\cr
#'   Additional arguments. Currently ignored.
#' @keywords internal
NULL

#' @title Similarity Parameters
#' @name similarity_params
#'
#' @param sets (`list()`)\cr
#'   List of character or integer vectors.
#'   `sets` must have at least 2 elements.
#' @param p (`integer(1)`)\cr
#'   Total number of possible elements.
#' @param na_value (`numeric(1)`)\cr
#'   Value that should be returned if the measure is not defined for the input
#'   (as described in the note). Default is `NaN`.
#' @param ... (`any`)\cr
#'   Additional arguments. Currently ignored.
#' @keywords internal
NULL
