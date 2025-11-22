# Log Loss

Measure to compare true observed labels with predicted probabilities in
multiclass classification tasks.

## Usage

``` r
logloss(truth, prob, sample_weights = NULL, eps = 1e-15, ...)
```

## Arguments

- truth:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  True (observed) labels. Must have the same levels and length as
  `response`.

- prob:

  ([`matrix()`](https://rdrr.io/r/base/matrix.html))  
  Matrix of predicted probabilities, each column is a vector of
  probabilities for a specific class label. Columns must be named with
  levels of `truth`.

- sample_weights:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Vector of non-negative and finite sample weights. Must have the same
  length as `truth`. The vector gets automatically normalized to sum to
  one. Defaults to equal sample weights.

- eps:

  (`numeric(1)`)  
  Probabilities are clipped to `max(eps, min(1 - eps, p))`. Otherwise
  the measure would be undefined for probabilities `p = 0` and `p = 1`.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

The Log Loss (a.k.a Benoulli Loss, Logistic Loss, Cross-Entropy Loss) is
defined as \$\$ -\frac{1}{n} \sum\_{i=1}^n w_i \log \left( p_i \right )
\$\$ where \\p_i\\ is the probability for the true class of observation
\\i\\ and \\w_i\\ are normalized weights for each observation \\x_i\\.

## Meta Information

- Type: `"classif"`

- Range: \\\[0, \infty)\\

- Minimize: `TRUE`

- Required prediction: `prob`

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/dev/reference/acc.md),
[`bacc()`](https://mlr3measures.mlr-org.com/dev/reference/bacc.md),
[`ce()`](https://mlr3measures.mlr-org.com/dev/reference/ce.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/dev/reference/mauc_aunu.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/dev/reference/mbrier.md),
[`mcc()`](https://mlr3measures.mlr-org.com/dev/reference/mcc.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/dev/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
prob = matrix(runif(3 * 10), ncol = 3, dimnames = list(NULL, lvls))
prob = t(apply(prob, 1, function(x) x / sum(x)))
logloss(truth, prob)
#> [1] 1.33052
```
