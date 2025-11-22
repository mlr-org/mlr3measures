# Symmetric Mean Absolute Percent Error

Measure to compare true observed response with predicted response in
regression tasks.

## Usage

``` r
smape(truth, response, na_value = NaN, ...)
```

## Arguments

- truth:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  True (observed) values. Must have the same length as `response`.

- response:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Predicted response values. Must have the same length as `truth`.

- na_value:

  (`numeric(1)`)  
  Value that should be returned if the measure is not defined for the
  input (as described in the note). Default is `NaN`.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

The Symmetric Mean Absolute Percent Error is defined as \$\$ \frac{2}{n}
\sum\_{i=1}^n \frac{\left\| t_i - r_i \right\|}{\left\| t_i \right\| +
\left\| r_i \right\|}. \$\$

This measure is undefined if if any \\\|t\| + \|r\|\\ is equal to \\0\\.

## Meta Information

- Type: `"regr"`

- Range: \\\[0, 2\]\\

- Minimize: `TRUE`

- Required prediction: `response`

## See also

Other Regression Measures:
[`ae()`](https://mlr3measures.mlr-org.com/dev/reference/ae.md),
[`ape()`](https://mlr3measures.mlr-org.com/dev/reference/ape.md),
[`bias()`](https://mlr3measures.mlr-org.com/dev/reference/bias.md),
[`ktau()`](https://mlr3measures.mlr-org.com/dev/reference/ktau.md),
[`linex()`](https://mlr3measures.mlr-org.com/dev/reference/linex.md),
[`mae()`](https://mlr3measures.mlr-org.com/dev/reference/mae.md),
[`mape()`](https://mlr3measures.mlr-org.com/dev/reference/mape.md),
[`maxae()`](https://mlr3measures.mlr-org.com/dev/reference/maxae.md),
[`maxse()`](https://mlr3measures.mlr-org.com/dev/reference/maxse.md),
[`medae()`](https://mlr3measures.mlr-org.com/dev/reference/medae.md),
[`medse()`](https://mlr3measures.mlr-org.com/dev/reference/medse.md),
[`mse()`](https://mlr3measures.mlr-org.com/dev/reference/mse.md),
[`msle()`](https://mlr3measures.mlr-org.com/dev/reference/msle.md),
[`pbias()`](https://mlr3measures.mlr-org.com/dev/reference/pbias.md),
[`pinball()`](https://mlr3measures.mlr-org.com/dev/reference/pinball.md),
[`rae()`](https://mlr3measures.mlr-org.com/dev/reference/rae.md),
[`rmse()`](https://mlr3measures.mlr-org.com/dev/reference/rmse.md),
[`rmsle()`](https://mlr3measures.mlr-org.com/dev/reference/rmsle.md),
[`rrse()`](https://mlr3measures.mlr-org.com/dev/reference/rrse.md),
[`rse()`](https://mlr3measures.mlr-org.com/dev/reference/rse.md),
[`rsq()`](https://mlr3measures.mlr-org.com/dev/reference/rsq.md),
[`sae()`](https://mlr3measures.mlr-org.com/dev/reference/sae.md),
[`se()`](https://mlr3measures.mlr-org.com/dev/reference/se.md),
[`sle()`](https://mlr3measures.mlr-org.com/dev/reference/sle.md),
[`srho()`](https://mlr3measures.mlr-org.com/dev/reference/srho.md),
[`sse()`](https://mlr3measures.mlr-org.com/dev/reference/sse.md)

## Examples

``` r
set.seed(1)
truth = 1:10
response = truth + rnorm(10)
smape(truth, response)
#> [1] 0.2115182
```
