# Binary Brier Score

Measure to compare true observed labels with predicted probabilities in
binary classification tasks.

## Usage

``` r
bbrier(truth, prob, positive, sample_weights = NULL, ...)
```

## Arguments

- truth:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  True (observed) labels. Must have the exactly same two levels and the
  same length as `response`.

- prob:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Predicted probability for positive class. Must have exactly same
  length as `truth`.

- positive:

  (`character(1))`  
  Name of the positive class.

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

The Binary Brier Score is defined as \$\$ \frac{1}{n} \sum\_{i=1}^n w_i
(I_i - p_i)^2, \$\$ where \\w_i\\ are the sample weights, and \\I\_{i}\\
is 1 if observation \\x_i\\ belongs to the positive class, and 0
otherwise.

Note that this (more common) definition of the Brier score is equivalent
to the original definition of the multi-class Brier score (see
[`mbrier()`](https://mlr3measures.mlr-org.com/reference/mbrier.md))
divided by 2.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

- Minimize: `TRUE`

- Required prediction: `prob`

## References

<https://en.wikipedia.org/wiki/Brier_score>

Brier GW (1950). “Verification of forecasts expressed in terms of
probability.” *Monthly Weather Review*, **78**(1), 1–3.
[doi:10.1175/1520-0493(1950)078\<0001:vofeit\>2.0.co;2](https://doi.org/10.1175/1520-0493%281950%29078%3C0001%3Avofeit%3E2.0.co%3B2)
.

## See also

Other Binary Classification Measures:
[`auc()`](https://mlr3measures.mlr-org.com/reference/auc.md),
[`dor()`](https://mlr3measures.mlr-org.com/reference/dor.md),
[`fbeta()`](https://mlr3measures.mlr-org.com/reference/fbeta.md),
[`fdr()`](https://mlr3measures.mlr-org.com/reference/fdr.md),
[`fn()`](https://mlr3measures.mlr-org.com/reference/fn.md),
[`fnr()`](https://mlr3measures.mlr-org.com/reference/fnr.md),
[`fomr()`](https://mlr3measures.mlr-org.com/reference/fomr.md),
[`fp()`](https://mlr3measures.mlr-org.com/reference/fp.md),
[`fpr()`](https://mlr3measures.mlr-org.com/reference/fpr.md),
[`gmean()`](https://mlr3measures.mlr-org.com/reference/gmean.md),
[`gpr()`](https://mlr3measures.mlr-org.com/reference/gpr.md),
[`npv()`](https://mlr3measures.mlr-org.com/reference/npv.md),
[`ppv()`](https://mlr3measures.mlr-org.com/reference/ppv.md),
[`prauc()`](https://mlr3measures.mlr-org.com/reference/prauc.md),
[`tn()`](https://mlr3measures.mlr-org.com/reference/tn.md),
[`tnr()`](https://mlr3measures.mlr-org.com/reference/tnr.md),
[`tp()`](https://mlr3measures.mlr-org.com/reference/tp.md),
[`tpr()`](https://mlr3measures.mlr-org.com/reference/tpr.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
prob = runif(10)
bbrier(truth, prob, positive = "a")
#> [1] 0.2812546
```
