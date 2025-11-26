# Positive Predictive Value

Measure to compare true observed labels with predicted labels in binary
classification tasks.

## Usage

``` r
ppv(truth, response, positive, na_value = NaN, ...)

precision(truth, response, positive, na_value = NaN, ...)
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

The Positive Predictive Value is defined as \$\$
\frac{\mathrm{TP}}{\mathrm{TP} + \mathrm{FP}}. \$\$ Also know as
"precision".

This measure is undefined if TP + FP = 0.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## References

<https://en.wikipedia.org/wiki/Template:DiagnosticTesting_Diagram>

Goutte C, Gaussier E (2005). “A Probabilistic Interpretation of
Precision, Recall and F-Score, with Implication for Evaluation.” In
*Lecture Notes in Computer Science*, 345–359.
[doi:10.1007/978-3-540-31865-1_25](https://doi.org/10.1007/978-3-540-31865-1_25)
.

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
[`gpr()`](https://mlr3measures.mlr-org.com/reference/gpr.md),
[`npv()`](https://mlr3measures.mlr-org.com/reference/npv.md),
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
ppv(truth, response, positive = "a")
#> [1] 0.5
```
