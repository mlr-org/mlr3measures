# Area Under the Precision-Recall Curve

Measure to compare true observed labels with predicted probabilities in
binary classification tasks.

## Usage

``` r
prauc(truth, prob, positive, na_value = NaN, ...)
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

Computes the area under the Precision-Recall curve (PRC). The PRC can be
interpreted as the relationship between precision and recall
(sensitivity), and is considered to be a more appropriate measure for
unbalanced datasets than the ROC curve. The AUC-PRC is computed by
integration of the piecewise function.

This measure is undefined if the true values are either all positive or
all negative.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `prob`

## References

Davis J, Goadrich M (2006). “The relationship between precision-recall
and ROC curves.” In *Proceedings of the 23rd International Conference on
Machine Learning*. ISBN 9781595933836.

## See also

Other Binary Classification Measures:
[`auc()`](https://mlr3measures.mlr-org.com/dev/reference/auc.md),
[`bbrier()`](https://mlr3measures.mlr-org.com/dev/reference/bbrier.md),
[`dor()`](https://mlr3measures.mlr-org.com/dev/reference/dor.md),
[`fbeta()`](https://mlr3measures.mlr-org.com/dev/reference/fbeta.md),
[`fdr()`](https://mlr3measures.mlr-org.com/dev/reference/fdr.md),
[`fn()`](https://mlr3measures.mlr-org.com/dev/reference/fn.md),
[`fnr()`](https://mlr3measures.mlr-org.com/dev/reference/fnr.md),
[`fomr()`](https://mlr3measures.mlr-org.com/dev/reference/fomr.md),
[`fp()`](https://mlr3measures.mlr-org.com/dev/reference/fp.md),
[`fpr()`](https://mlr3measures.mlr-org.com/dev/reference/fpr.md),
[`gmean()`](https://mlr3measures.mlr-org.com/dev/reference/gmean.md),
[`gpr()`](https://mlr3measures.mlr-org.com/dev/reference/gpr.md),
[`npv()`](https://mlr3measures.mlr-org.com/dev/reference/npv.md),
[`ppv()`](https://mlr3measures.mlr-org.com/dev/reference/ppv.md),
[`tn()`](https://mlr3measures.mlr-org.com/dev/reference/tn.md),
[`tnr()`](https://mlr3measures.mlr-org.com/dev/reference/tnr.md),
[`tp()`](https://mlr3measures.mlr-org.com/dev/reference/tp.md),
[`tpr()`](https://mlr3measures.mlr-org.com/dev/reference/tpr.md)

## Examples

``` r
truth = factor(c("a", "a", "a", "b"))
prob = c(.6, .7, .1, .4)
prauc(truth, prob, "a")
#> [1] 0.904106
```
