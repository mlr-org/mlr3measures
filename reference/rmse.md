# Root Mean Squared Error

Measure to compare true observed response with predicted response in
regression tasks.

## Usage

``` r
rmse(truth, response, sample_weights = NULL, ...)
```

## Arguments

- truth:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  True (observed) values. Must have the same length as `response`.

- response:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Predicted response values. Must have the same length as `truth`.

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

The Root Mean Squared Error is defined as \$\$ \sqrt{\frac{1}{n}
\sum\_{i=1}^n w_i \left( t_i - r_i \right)^2}, \$\$ where \\w_i\\ are
normalized sample weights.

## Meta Information

- Type: `"regr"`

- Range: \\\[0, \infty)\\

- Minimize: `TRUE`

- Required prediction: `response`

## See also

Other Regression Measures:
[`ae()`](https://mlr3measures.mlr-org.com/reference/ae.md),
[`ape()`](https://mlr3measures.mlr-org.com/reference/ape.md),
[`bias()`](https://mlr3measures.mlr-org.com/reference/bias.md),
[`ktau()`](https://mlr3measures.mlr-org.com/reference/ktau.md),
[`linex()`](https://mlr3measures.mlr-org.com/reference/linex.md),
[`mae()`](https://mlr3measures.mlr-org.com/reference/mae.md),
[`mape()`](https://mlr3measures.mlr-org.com/reference/mape.md),
[`maxae()`](https://mlr3measures.mlr-org.com/reference/maxae.md),
[`maxse()`](https://mlr3measures.mlr-org.com/reference/maxse.md),
[`medae()`](https://mlr3measures.mlr-org.com/reference/medae.md),
[`medse()`](https://mlr3measures.mlr-org.com/reference/medse.md),
[`mse()`](https://mlr3measures.mlr-org.com/reference/mse.md),
[`msle()`](https://mlr3measures.mlr-org.com/reference/msle.md),
[`pbias()`](https://mlr3measures.mlr-org.com/reference/pbias.md),
[`pinball()`](https://mlr3measures.mlr-org.com/reference/pinball.md),
[`rae()`](https://mlr3measures.mlr-org.com/reference/rae.md),
[`rmsle()`](https://mlr3measures.mlr-org.com/reference/rmsle.md),
[`rrse()`](https://mlr3measures.mlr-org.com/reference/rrse.md),
[`rse()`](https://mlr3measures.mlr-org.com/reference/rse.md),
[`rsq()`](https://mlr3measures.mlr-org.com/reference/rsq.md),
[`sae()`](https://mlr3measures.mlr-org.com/reference/sae.md),
[`se()`](https://mlr3measures.mlr-org.com/reference/se.md),
[`sle()`](https://mlr3measures.mlr-org.com/reference/sle.md),
[`smape()`](https://mlr3measures.mlr-org.com/reference/smape.md),
[`srho()`](https://mlr3measures.mlr-org.com/reference/srho.md),
[`sse()`](https://mlr3measures.mlr-org.com/reference/sse.md)

## Examples

``` r
set.seed(1)
truth = 1:10
response = truth + rnorm(10)
rmse(truth, response)
#> [1] 0.752237
```
