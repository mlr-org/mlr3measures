# Absolute Error (per observation)

Measure to compare true observed response with predicted response in
regression tasks.

Note that this is an unaggregated measure, returning the losses per
observation.

## Usage

``` r
ae(truth, response, ...)
```

## Arguments

- truth:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  True (observed) values. Must have the same length as `response`.

- response:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Predicted response values. Must have the same length as `truth`.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(length(truth))`.

## Details

Calculates the per-observation absolute error as \$\$ \left\| t_i - r_i
\right\|. \$\$

## Meta Information

- Type: `"regr"`

- Range (per observation): \\\[0, \infty)\\

- Minimize (per observation): `TRUE`

- Required prediction: `response`

## See also

Other Regression Measures:
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
[`rrse()`](https://mlr3measures.mlr-org.com/reference/rrse.md),
[`rse()`](https://mlr3measures.mlr-org.com/reference/rse.md),
[`rsq()`](https://mlr3measures.mlr-org.com/reference/rsq.md),
[`sae()`](https://mlr3measures.mlr-org.com/reference/sae.md),
[`se()`](https://mlr3measures.mlr-org.com/reference/se.md),
[`sle()`](https://mlr3measures.mlr-org.com/reference/sle.md),
[`smape()`](https://mlr3measures.mlr-org.com/reference/smape.md),
[`srho()`](https://mlr3measures.mlr-org.com/reference/srho.md),
[`sse()`](https://mlr3measures.mlr-org.com/reference/sse.md)
