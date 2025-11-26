# F-beta Score

Measure to compare true observed labels with predicted labels in binary
classification tasks.

## Usage

``` r
fbeta(truth, response, positive, beta = 1, na_value = NaN, ...)
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

- beta:

  (`numeric(1)`)  
  Parameter to give either precision or recall more weight. Default is
  `1`, resulting in balanced weights.

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

With \\P\\ as
[`precision()`](https://mlr3measures.mlr-org.com/reference/ppv.md) and
\\R\\ as
[`recall()`](https://mlr3measures.mlr-org.com/reference/tpr.md), the
F-beta Score is defined as \$\$ (1 + \beta^2) \frac{P \cdot R}{(\beta^2
P) + R}. \$\$ It measures the effectiveness of retrieval with respect to
a user who attaches \\\beta\\ times as much importance to recall as
precision. For \\\beta = 1\\, this measure is called "F1" score.

This measure is undefined if
[precision](https://mlr3measures.mlr-org.com/reference/ppv.md) or
[recall](https://mlr3measures.mlr-org.com/reference/tpr.md) is
undefined, i.e. TP + FP = 0 or TP + FN = 0.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## References

Rijsbergen, Van CJ (1979). *Information Retrieval*, 2nd edition.
Butterworth-Heinemann, Newton, MA, USA. ISBN 408709294.

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
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
fbeta(truth, response, positive = "a")
#> [1] 0.5
```
