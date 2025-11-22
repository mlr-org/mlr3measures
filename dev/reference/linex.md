# Linear-Exponential Loss (per observation)

Measure to compare true observed response with predicted response in
regression tasks.

Note that this is an unaggregated measure, returning the losses per
observation.

## Usage

``` r
linex(truth, response, a = -1, b = 1, ...)
```

## Arguments

- truth:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  True (observed) values. Must have the same length as `response`.

- response:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Predicted response values. Must have the same length as `truth`.

- a:

  (`numeric(1)`)  
  Shape parameter controlling asymmetry. Negative values penalize
  overestimation more, positive values penalize underestimation more. As
  `a` approaches 0, the loss resembles squared error loss. Default is
  `-1`.

- b:

  (`numeric(1)`)  
  Positive scaling factor for the loss. Larger values increase the loss
  magnitude. Default is `1`.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(length(truth))`.

## Details

The Linear-Exponential Loss is defined as \$\$ b (\exp (t_i - r_i) - a
(t_i - r_i) - 1), \$\$ where \\a \neq 0, b \> 0\\.

## Meta Information

- Type: `"regr"`

- Range (per observation): \\\[0, \infty)\\

- Minimize (per observation): `TRUE`

- Required prediction: `response`

## References

Varian, R. H (1975). “A Bayesian Approach to Real Estate Assessment.” In
Fienberg SE, Zellner A (eds.), *Studies in Bayesian Econometrics and
Statistics: In Honor of Leonard J. Savage*, 195–208. North-Holland,
Amsterdam.

## See also

Other Regression Measures:
[`ae()`](https://mlr3measures.mlr-org.com/dev/reference/ae.md),
[`ape()`](https://mlr3measures.mlr-org.com/dev/reference/ape.md),
[`bias()`](https://mlr3measures.mlr-org.com/dev/reference/bias.md),
[`ktau()`](https://mlr3measures.mlr-org.com/dev/reference/ktau.md),
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
[`smape()`](https://mlr3measures.mlr-org.com/dev/reference/smape.md),
[`srho()`](https://mlr3measures.mlr-org.com/dev/reference/srho.md),
[`sse()`](https://mlr3measures.mlr-org.com/dev/reference/sse.md)

## Examples

``` r
set.seed(1)
truth = 1:10
response = truth + rnorm(10)
linex(truth, response)
#>  [1] 0.16093764 0.01794385 0.26923044 2.33443235 0.06077585 0.26069380
#>  [7] 0.14069596 0.35410244 0.20273828 0.04222553
```
