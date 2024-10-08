% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regr_rrse.R
\name{rrse}
\alias{rrse}
\title{Root Relative Squared Error}
\usage{
rrse(truth, response, na_value = NaN, ...)
}
\arguments{
\item{truth}{(\code{numeric()})\cr
True (observed) values.
Must have the same length as \code{response}.}

\item{response}{(\code{numeric()})\cr
Predicted response values.
Must have the same length as \code{truth}.}

\item{na_value}{(\code{numeric(1)})\cr
Value that should be returned if the measure is not defined for the input
(as described in the note). Default is \code{NaN}.}

\item{...}{(\code{any})\cr
Additional arguments. Currently ignored.}
}
\value{
Performance value as \code{numeric(1)}.
}
\description{
Measure to compare true observed response with predicted response in regression tasks.
}
\details{
The Root Relative Squared Error is defined as \deqn{
  \sqrt{\frac{\sum_{i=1}^n \left( t_i - r_i \right)^2}{\sum_{i=1}^n \left( t_i - \bar{t} \right)^2}},
}{
  sqrt(sum((t - r)^2) / sum((t - mean(t))^2)),
}
where \eqn{\bar{t} = \sum_{i=1}^n t_i}.

Can be interpreted as root of the squared error of the predictions relative to a naive model predicting the mean.

This measure is undefined for constant \eqn{t}.
}
\section{Meta Information}{

\itemize{
\item Type: \code{"regr"}
\item Range: \eqn{[0, \infty)}{[0, Inf)}
\item Minimize: \code{TRUE}
\item Required prediction: \code{response}
}
}

\examples{
set.seed(1)
truth = 1:10
response = truth + rnorm(10)
rrse(truth, response)
}
\seealso{
Other Regression Measures: 
\code{\link{ae}()},
\code{\link{ape}()},
\code{\link{bias}()},
\code{\link{ktau}()},
\code{\link{linex}()},
\code{\link{mae}()},
\code{\link{mape}()},
\code{\link{maxae}()},
\code{\link{maxse}()},
\code{\link{medae}()},
\code{\link{medse}()},
\code{\link{mse}()},
\code{\link{msle}()},
\code{\link{pbias}()},
\code{\link{pinball}()},
\code{\link{rae}()},
\code{\link{rmse}()},
\code{\link{rmsle}()},
\code{\link{rse}()},
\code{\link{rsq}()},
\code{\link{sae}()},
\code{\link{se}()},
\code{\link{sle}()},
\code{\link{smape}()},
\code{\link{srho}()},
\code{\link{sse}()}
}
\concept{Regression Measures}
\concept{regression_measure}
