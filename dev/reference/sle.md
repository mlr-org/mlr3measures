# Squared Log Error (per observation)

Calculates the per-observation squared error as \$\$ \left( \ln (1 +
t_i) - \ln (1 + r_i) \right)^2. \$\$

Measure to compare true observed response with predicted response in
regression tasks.

Note that this is an unaggregated measure, returning the losses per
observation.

## Usage

``` r
sle(truth, response, ...)
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

## Meta Information

- Type: `"regr"`

- Range (per observation): \\\[0, \infty)\\

- Minimize (per observation): `TRUE`

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
[`smape()`](https://mlr3measures.mlr-org.com/dev/reference/smape.md),
[`srho()`](https://mlr3measures.mlr-org.com/dev/reference/srho.md),
[`sse()`](https://mlr3measures.mlr-org.com/dev/reference/sse.md)
