# Kendall's tau

Measure to compare true observed response with predicted response in
regression tasks.

## Usage

``` r
ktau(truth, response, ...)
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

Kendall's tau is defined as Kendall's rank correlation coefficient
between truth and response. It is defined as \$\$ \tau =
\frac{(\mathrm{number of concordant pairs)} - (\mathrm{number of
discordant pairs)}}{\mathrm{(number of pairs)}} \$\$ Calls
[`stats::cor()`](https://rdrr.io/r/stats/cor.html) with `method` set to
`"kendall"`.

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
[`ae()`](https://mlr3measures.mlr-org.com/reference/ae.md),
[`ape()`](https://mlr3measures.mlr-org.com/reference/ape.md),
[`bias()`](https://mlr3measures.mlr-org.com/reference/bias.md),
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

## Examples

``` r
set.seed(1)
truth = 1:10
response = truth + rnorm(10)
ktau(truth, response)
#> [1] 0.8222222
```
