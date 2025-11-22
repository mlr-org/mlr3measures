# False Negatives

Measure to compare true observed labels with predicted labels in binary
classification tasks.

## Usage

``` r
fn(truth, response, positive, ...)
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

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

This measure counts the false negatives (type 2 error), i.e. the number
of predictions indicating a negative class label while in fact it is
positive. This is sometimes also called a "miss" or an
"underestimation".

## Meta Information

- Type: `"binary"`

- Range: \\\[0, \infty)\\

- Minimize: `TRUE`

- Required prediction: `response`

## References

<https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram>

## See also

Other Binary Classification Measures:
[`auc()`](https://mlr3measures.mlr-org.com/dev/reference/auc.md),
[`bbrier()`](https://mlr3measures.mlr-org.com/dev/reference/bbrier.md),
[`dor()`](https://mlr3measures.mlr-org.com/dev/reference/dor.md),
[`fbeta()`](https://mlr3measures.mlr-org.com/dev/reference/fbeta.md),
[`fdr()`](https://mlr3measures.mlr-org.com/dev/reference/fdr.md),
[`fnr()`](https://mlr3measures.mlr-org.com/dev/reference/fnr.md),
[`fomr()`](https://mlr3measures.mlr-org.com/dev/reference/fomr.md),
[`fp()`](https://mlr3measures.mlr-org.com/dev/reference/fp.md),
[`fpr()`](https://mlr3measures.mlr-org.com/dev/reference/fpr.md),
[`gmean()`](https://mlr3measures.mlr-org.com/dev/reference/gmean.md),
[`gpr()`](https://mlr3measures.mlr-org.com/dev/reference/gpr.md),
[`npv()`](https://mlr3measures.mlr-org.com/dev/reference/npv.md),
[`ppv()`](https://mlr3measures.mlr-org.com/dev/reference/ppv.md),
[`prauc()`](https://mlr3measures.mlr-org.com/dev/reference/prauc.md),
[`tn()`](https://mlr3measures.mlr-org.com/dev/reference/tn.md),
[`tnr()`](https://mlr3measures.mlr-org.com/dev/reference/tnr.md),
[`tp()`](https://mlr3measures.mlr-org.com/dev/reference/tp.md),
[`tpr()`](https://mlr3measures.mlr-org.com/dev/reference/tpr.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
fn(truth, response, positive = "a")
#> [1] 3
```
