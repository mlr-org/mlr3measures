# Classification Accuracy

Measure to compare true observed labels with predicted labels in
multiclass classification tasks.

## Usage

``` r
acc(truth, response, sample_weights = NULL, ...)
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

The Classification Accuracy is defined as \$\$ \sum\_{i=1}^n w_i
\mathbf{1} \left( t_i = r_i \right), \$\$ where \\w_i\\ are weights
normalized to sum to 1 for all observations \\x_i\\.

## Meta Information

- Type: `"classif"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## See also

Other Classification Measures:
[`bacc()`](https://mlr3measures.mlr-org.com/dev/reference/bacc.md),
[`ce()`](https://mlr3measures.mlr-org.com/dev/reference/ce.md),
[`logloss()`](https://mlr3measures.mlr-org.com/dev/reference/logloss.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/dev/reference/mauc_aunu.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/dev/reference/mbrier.md),
[`mcc()`](https://mlr3measures.mlr-org.com/dev/reference/mcc.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/dev/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
acc(truth, response)
#> [1] 0.2
```
