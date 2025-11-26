# Matthews Correlation Coefficient

Measure to compare true observed labels with predicted labels in
multiclass classification tasks.

## Usage

``` r
mcc(truth, response, positive = NULL, ...)
```

## Arguments

- truth:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  True (observed) labels. Must have the same levels and length as
  `response`.

- response:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  Predicted response labels. Must have the same levels and length as
  `truth`.

- positive:

  (`character(1)`) Name of the positive class in case of binary
  classification.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(1)`.

## Details

In the binary case, the Matthews Correlation Coefficient is defined as
\$\$ \frac{\mathrm{TP} \cdot \mathrm{TN} - \mathrm{FP} \cdot
\mathrm{FN}}{\sqrt{(\mathrm{TP} + \mathrm{FP}) (\mathrm{TP} +
\mathrm{FN}) (\mathrm{TN} + \mathrm{FP}) (\mathrm{TN} + \mathrm{FN})}},
\$\$ where \\TP\\, \\FP\\, \\TN\\, \\TP\\ are the number of true
positives, false positives, true negatives, and false negatives
respectively.

In the multi-class case, the Matthews Correlation Coefficient is defined
for a multi-class confusion matrix \\C\\ with \\K\\ classes: \$\$
\frac{c \cdot s - \sum_k^K p_k \cdot t_k}{\sqrt{(s^2 - \sum_k^K p_k^2)
\cdot (s^2 - \sum_k^K t_k^2)}}, \$\$ where

- \\s = \sum_i^K \sum_j^K C\_{ij}\\: total number of samples

- \\c = \sum_k^K C\_{kk}\\: total number of correctly predicted samples

- \\t_k = \sum_i^K C\_{ik}\\: number of predictions for each class \\k\\

- \\p_k = \sum_j^K C\_{kj}\\: number of true occurrences for each class
  \\k\\.

The above formula is undefined if any of the four sums in the
denominator is 0 in the binary case and more generally if either \\s^2 -
\sum_k^K p_k^2\\ or \\s^2 - \sum_k^K t_k^2)\\ is equal to 0. The
denominator is then set to 1.

When there are more than two classes, the MCC will no longer range
between -1 and +1. Instead, the minimum value will be between -1 and 0
depending on the true distribution. The maximum value is always +1.

## Meta Information

- Type: `"classif"`

- Range: \\\[-1, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## References

<https://en.wikipedia.org/wiki/Phi_coefficient>

Matthews BW (1975). “Comparison of the predicted and observed secondary
structure of T4 phage lysozyme.” *Biochimica et Biophysica Acta (BBA) -
Protein Structure*, **405**(2), 442–451.
[doi:10.1016/0005-2795(75)90109-9](https://doi.org/10.1016/0005-2795%2875%2990109-9)
.

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/reference/acc.md),
[`bacc()`](https://mlr3measures.mlr-org.com/reference/bacc.md),
[`ce()`](https://mlr3measures.mlr-org.com/reference/ce.md),
[`logloss()`](https://mlr3measures.mlr-org.com/reference/logloss.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/reference/mauc_aunu.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/reference/mbrier.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
mcc(truth, response)
#> [1] -0.1846372
```
