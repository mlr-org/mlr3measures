# Area Under the ROC Curve

Measure to compare true observed labels with predicted probabilities in
binary classification tasks.

## Usage

``` r
auc(truth, prob, positive, na_value = NaN, ...)
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

Computes the area under the Receiver Operator Characteristic (ROC)
curve. The AUC can be interpreted as the probability that a randomly
chosen positive observation has a higher predicted probability than a
randomly chosen negative observation.

This measure is undefined if the true values are either all positive or
all negative.

## Meta Information

- Type: `"binary"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `prob`

## References

Youden WJ (1950). “Index for rating diagnostic tests.” *Cancer*,
**3**(1), 32–35.
[doi:10.1002/1097-0142(1950)3:1\<32::aid-cncr2820030106\>3.0.co;2-3](https://doi.org/10.1002/1097-0142%281950%293%3A1%3C32%3A%3Aaid-cncr2820030106%3E3.0.co%3B2-3)
.

## See also

Other Binary Classification Measures:
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
[`ppv()`](https://mlr3measures.mlr-org.com/reference/ppv.md),
[`prauc()`](https://mlr3measures.mlr-org.com/reference/prauc.md),
[`tn()`](https://mlr3measures.mlr-org.com/reference/tn.md),
[`tnr()`](https://mlr3measures.mlr-org.com/reference/tnr.md),
[`tp()`](https://mlr3measures.mlr-org.com/reference/tp.md),
[`tpr()`](https://mlr3measures.mlr-org.com/reference/tpr.md)

## Examples

``` r
truth = factor(c("a", "a", "a", "b"))
prob = c(.6, .7, .1, .4)
auc(truth, prob, "a")
#> [1] 0.6666667
```
