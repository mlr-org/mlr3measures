# Spearman's rho

Measure to compare true observed response with predicted response in
regression tasks.

## Usage

``` r
srho(truth, response, ...)
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

Performance value as `numeric(1)`.

## Details

Spearman's rho is defined as Spearman's rank correlation coefficient
between truth and response. Calls
[`stats::cor()`](https://rdrr.io/r/stats/cor.html) with `method` set to
`"spearman"`.

## Meta Information

- Type: `"regr"`

- Range: \\\[-1, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## References

Rosset S, Perlich C, Zadrozny B (2006). “Ranking-based evaluation of
regression models.” *Knowledge and Information Systems*, **12**(3),
331–353.
[doi:10.1007/s10115-006-0037-3](https://doi.org/10.1007/s10115-006-0037-3)
.

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
[`smape()`](https://mlr3measures.mlr-org.com/dev/reference/smape.md),
[`sse()`](https://mlr3measures.mlr-org.com/dev/reference/sse.md)

## Examples

``` r
set.seed(1)
truth = 1:10
response = truth + rnorm(10)
srho(truth, response)
#> [1] 0.9393939
```
