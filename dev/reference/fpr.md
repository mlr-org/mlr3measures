# False Positive Rate

Measure to compare true observed labels with predicted labels in binary
classification tasks.

## Usage

``` r
fpr(truth, response, positive, na_value = NaN, ...)
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

The False Positive Rate is defined as \$\$
\frac{\mathrm{FP}}{\mathrm{FP} + \mathrm{TN}}. \$\$ Also know as fall
out or probability of false alarm.

This measure is undefined if FP + TN = 0.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

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
[`fn()`](https://mlr3measures.mlr-org.com/dev/reference/fn.md),
[`fnr()`](https://mlr3measures.mlr-org.com/dev/reference/fnr.md),
[`fomr()`](https://mlr3measures.mlr-org.com/dev/reference/fomr.md),
[`fp()`](https://mlr3measures.mlr-org.com/dev/reference/fp.md),
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
fpr(truth, response, positive = "a")
#> [1] 0.75
```
