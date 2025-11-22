# Average Pinball Loss

Measure to compare true observed response with predicted response in
regression tasks.

## Usage

``` r
pinball(truth, response, sample_weights = NULL, alpha = 0.5, ...)
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

- alpha:

  `numeric(1)`  
  The quantile to compute the pinball loss.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

The pinball loss for quantile regression is defined as \$\$
\text{Average Pinball Loss} = \frac{1}{n} \sum\_{i=1}^{n} w\_{i}
\begin{cases} q \cdot (t_i - r_i) & \text{if } t_i \geq r_i \\ (1 - q)
\cdot (r_i - t_i) & \text{if } t_i \< r_i \end{cases} \$\$ where \\q\\
is the quantile and \\w_i\\ are normalized sample weights.

## Meta Information

- Type: `"regr"`

- Range: \\(-\infty, \infty)\\

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
pinball(truth, response)
#> [1] 0.3248953
```
