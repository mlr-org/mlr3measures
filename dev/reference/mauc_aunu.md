# Multiclass AUC Scores

Measure to compare true observed labels with predicted probabilities in
multiclass classification tasks.

## Usage

``` r
mauc_aunu(truth, prob, na_value = NaN, ...)

mauc_aunp(truth, prob, na_value = NaN, ...)

mauc_au1u(truth, prob, na_value = NaN, ...)

mauc_au1p(truth, prob, na_value = NaN, ...)

mauc_mu(truth, prob, na_value = NaN, ...)
```

## Arguments

- truth:

  ([`factor()`](https://rdrr.io/r/base/factor.html))  
  True (observed) labels. Must have the same levels and length as
  `response`.

- prob:

  ([`matrix()`](https://rdrr.io/r/base/matrix.html))  
  Matrix of predicted probabilities, each column is a vector of
  probabilities for a specific class label. Columns must be named with
  levels of `truth`.

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

Multiclass AUC measures.

- *AUNU*: AUC of each class against the rest, using the uniform class
  distribution. Computes the AUC treating a `c`-dimensional classifier
  as `c` two-dimensional 1-vs-rest classifiers, where classes are
  assumed to have uniform distribution, in order to have a measure which
  is independent of class distribution change (Fawcett 2001).

- *AUNP*: AUC of each class against the rest, using the a-priori class
  distribution. Computes the AUC treating a `c`-dimensional classifier
  as `c` two-dimensional 1-vs-rest classifiers, taking into account the
  prior probability of each class (Fawcett 2001).

- *AU1U*: AUC of each class against each other, using the uniform class
  distribution. Computes something like the AUC of `c(c - 1)` binary
  classifiers (all possible pairwise combinations). See Hand (2001) for
  details.

- *AU1P*: AUC of each class against each other, using the a-priori class
  distribution. Computes something like AUC of `c(c - 1)` binary
  classifiers while considering the a-priori distribution of the classes
  as suggested in Ferri (2009). Note we deviate from the definition in
  Ferri (2009) by a factor of `c`.

- *MU*: Multiclass AUC as defined in Kleinman and Page (2019). This
  measure is an average of the pairwise AUCs between all classes. The
  measure was tested against the Python implementation by [Ross
  Kleinman](https://github.com/kleimanr/auc_mu).

## Meta Information

- Type: `"classif"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `prob`

## References

Fawcett, Tom (2001). “Using rule sets to maximize ROC performance.” In
*Proceedings 2001 IEEE international conference on data mining*,
131–138. IEEE.

Ferri, César, Hernández-Orallo, José, Modroiu, R (2009). “An
experimental comparison of performance measures for classification.”
*Pattern Recognition Letters*, **30**(1), 27–38.
[doi:10.1016/j.patrec.2008.08.010](https://doi.org/10.1016/j.patrec.2008.08.010)
.

Hand, J D, Till, J R (2001). “A simple generalisation of the area under
the ROC curve for multiple class classification problems.” *Machine
learning*, **45**(2), 171–186.

Kleiman R, Page D (2019). “AUC mu: A Performance Metric for Multi-Class
Machine Learning Models.” In Chaudhuri, Kamalika, Salakhutdinov, Ruslan
(eds.), *Proceedings of the 36th International Conference on Machine
Learning*, volume 97 series Proceedings of Machine Learning Research,
3439–3447. PMLR.

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/dev/reference/acc.md),
[`bacc()`](https://mlr3measures.mlr-org.com/dev/reference/bacc.md),
[`ce()`](https://mlr3measures.mlr-org.com/dev/reference/ce.md),
[`logloss()`](https://mlr3measures.mlr-org.com/dev/reference/logloss.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/dev/reference/mbrier.md),
[`mcc()`](https://mlr3measures.mlr-org.com/dev/reference/mcc.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/dev/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
prob = matrix(runif(3 * 10), ncol = 3)
colnames(prob) = levels(truth)
mauc_aunu(truth, prob)
#> [1] 0.4047619
```
