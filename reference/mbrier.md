# Multiclass Brier Score

Measure to compare true observed labels with predicted probabilities in
multiclass classification tasks.

## Usage

``` r
mbrier(truth, prob, ...)
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

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

Brier score for multi-class classification problems with \\k\\ labels
defined as \$\$ \frac{1}{n} \sum\_{i=1}^n \sum\_{j=1}^k (I\_{ij} -
p\_{ij})^2. \$\$ \\I\_{ij}\\ is 1 if observation \\x_i\\ has true label
\\j\\, and 0 otherwise. \\p\_{ij}\\ is the probability that observation
\\x_i\\ belongs to class \\j\\.

Note that there also is the more common definition of the Brier score
for binary classification problems in
[`bbrier()`](https://mlr3measures.mlr-org.com/reference/bbrier.md).

## Meta Information

- Type: `"classif"`

- Range: \\\[0, 2\]\\

- Minimize: `TRUE`

- Required prediction: `prob`

## References

Brier GW (1950). “Verification of forecasts expressed in terms of
probability.” *Monthly Weather Review*, **78**(1), 1–3.
[doi:10.1175/1520-0493(1950)078\<0001:vofeit\>2.0.co;2](https://doi.org/10.1175/1520-0493%281950%29078%3C0001%3Avofeit%3E2.0.co%3B2)
.

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/reference/acc.md),
[`bacc()`](https://mlr3measures.mlr-org.com/reference/bacc.md),
[`ce()`](https://mlr3measures.mlr-org.com/reference/ce.md),
[`logloss()`](https://mlr3measures.mlr-org.com/reference/logloss.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/reference/mauc_aunu.md),
[`mcc()`](https://mlr3measures.mlr-org.com/reference/mcc.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
prob = matrix(runif(3 * 10), ncol = 3)
colnames(prob) = levels(truth)
mbrier(truth, prob)
#> [1] 1.084326
```
