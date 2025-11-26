# Classification Error

Measure to compare true observed labels with predicted labels in
multiclass classification tasks.

## Usage

``` r
ce(truth, response, sample_weights = NULL, ...)
```

## Arguments

- truth:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  True (observed) labels. Must have the same levels and length as
  `response`.

- response:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  Predicted response labels. Must have the same levels and length as
  `truth`.

- sample_weights:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Vector of non-negative and finite sample weights. Must have the same
  length as `truth`. The vector gets automatically normalized to sum to
  one. Defaults to equal sample weights.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

The Classification Error is defined as \$\$ \frac{1}{n} \sum\_{i=1}^n
w_i \mathbf{1} \left( t_i \neq r_i \right), \$\$ where \\w_i\\ are
normalized weights for each observation \\x_i\\.

## Meta Information

- Type: `"classif"`

- Range: \\\[0, 1\]\\

- Minimize: `TRUE`

- Required prediction: `response`

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/reference/acc.md),
[`bacc()`](https://mlr3measures.mlr-org.com/reference/bacc.md),
[`logloss()`](https://mlr3measures.mlr-org.com/reference/logloss.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/reference/mauc_aunu.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/reference/mbrier.md),
[`mcc()`](https://mlr3measures.mlr-org.com/reference/mcc.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
ce(truth, response)
#> [1] 0.8
```
