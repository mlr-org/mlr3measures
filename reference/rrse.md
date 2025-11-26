# Root Relative Squared Error

Measure to compare true observed response with predicted response in
regression tasks.

## Usage

``` r
rrse(truth, response, na_value = NaN, ...)
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

The Root Relative Squared Error is defined as \$\$
\sqrt{\frac{\sum\_{i=1}^n \left( t_i - r_i \right)^2}{\sum\_{i=1}^n
\left( t_i - \bar{t} \right)^2}}, \$\$ where \\\bar{t} = \sum\_{i=1}^n
t_i\\.

Can be interpreted as root of the squared error of the predictions
relative to a naive model predicting the mean.

This measure is undefined for constant \\t\\.

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
[`rmse()`](https://mlr3measures.mlr-org.com/reference/rmse.md),
[`rmsle()`](https://mlr3measures.mlr-org.com/reference/rmsle.md),
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
rrse(truth, response)
#> Warning: rrse is deprecated
#> [1] 0.2618953
```
