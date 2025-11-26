# Geometric Mean of Precision and Recall

Measure to compare true observed labels with predicted labels in binary
classification tasks.

## Usage

``` r
gpr(truth, response, positive, na_value = NaN, ...)
```

## Arguments

- truth:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  True (observed) labels. Must have the exactly same two levels and the
  same length as `response`.

- response:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  Predicted response labels. Must have the exactly same two levels and
  the same length as `truth`.

- positive:

  (`character(1))`  
  Name of the positive class.

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

Calculates the geometric mean of
[`precision()`](https://mlr3measures.mlr-org.com/reference/ppv.md) P and
[`recall()`](https://mlr3measures.mlr-org.com/reference/tpr.md) R as
\$\$ \sqrt{\mathrm{P} \cdot \mathrm{R}}. \$\$

This measure is undefined if precision or recall is undefined, i.e. if
TP + FP = 0 or if TP + FN = 0.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## References

He H, Garcia EA (2009). “Learning from Imbalanced Data.” *IEEE
Transactions on knowledge and data engineering*, **21**(9), 1263–1284.
[doi:10.1109/TKDE.2008.239](https://doi.org/10.1109/TKDE.2008.239) .

## See also

Other Binary Classification Measures:
[`auc()`](https://mlr3measures.mlr-org.com/reference/auc.md),
[`bbrier()`](https://mlr3measures.mlr-org.com/reference/bbrier.md),
[`dor()`](https://mlr3measures.mlr-org.com/reference/dor.md),
[`fbeta()`](https://mlr3measures.mlr-org.com/reference/fbeta.md),
[`fdr()`](https://mlr3measures.mlr-org.com/reference/fdr.md),
[`fn()`](https://mlr3measures.mlr-org.com/reference/fn.md),
[`fnr()`](https://mlr3measures.mlr-org.com/reference/fnr.md),
[`fomr()`](https://mlr3measures.mlr-org.com/reference/fomr.md),
[`fp()`](https://mlr3measures.mlr-org.com/reference/fp.md),
[`fpr()`](https://mlr3measures.mlr-org.com/reference/fpr.md),
[`gmean()`](https://mlr3measures.mlr-org.com/reference/gmean.md),
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
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
gpr(truth, response, positive = "a")
#> [1] 0.5
```
