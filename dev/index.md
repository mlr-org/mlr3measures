# mlr3measures

Package website: [release](https://mlr3measures.mlr-org.com/) \|
[dev](https://mlr3measures.mlr-org.com/dev/)

Implements multiple performance measures for supervised learning.
Includes over 40 measures for regression and classification.
Additionally, meta information about the performance measures can be
queried, e.g. what the best and worst possible performances scores are.
Internally, [checkmate](https://CRAN.R-project.org/package=checkmate) is
used to check arguments efficiently - no other runtime dependencies.

The [function
reference](https://mlr3measures.mlr-org.com/reference/index.html) gives
an encompassing overview over implemented measures.

Note that explicitly loading this package is not required if you want to
use any of these measures in [mlr3](https://mlr3.mlr-org.com). Also note
that we advise against attaching the package via
[`library()`](https://rdrr.io/r/base/library.html) to avoid namespace
clashes. Instead, load the namespace via
[`requireNamespace()`](https://rdrr.io/r/base/ns-load.html) and use the
`::` operator.
