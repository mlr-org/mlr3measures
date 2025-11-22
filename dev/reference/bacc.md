# Balanced Accuracy

Measure to compare true observed labels with predicted labels in
multiclass classification tasks.

## Usage

``` r
bacc(truth, response, sample_weights = NULL, ...)
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

The Balanced Accuracy computes the weighted balanced accuracy, suitable
for imbalanced data sets. It is defined analogously to the definition in
[sklearn](https://scikit-learn.org/).

First, all sample weights \\w_i\\ are normalized per class so that each
class has the same influence: \$\$ \hat{w}\_i = \frac{w_i}{\sum\_{j=1}^n
w_j \cdot \mathbf{1}(t_j = t_i)}. \$\$ The Balanced Accuracy is then
calculated as \$\$ \frac{1}{\sum\_{i=1}^n \hat{w}\_i} \sum\_{i=1}^n
\hat{w}\_i \cdot \mathbf{1}(r_i = t_i). \$\$ This definition is
equivalent to
[`acc()`](https://mlr3measures.mlr-org.com/dev/reference/acc.md) with
class-balanced sample weights.

## Meta Information

- Type: `"classif"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

- Required prediction: `response`

## References

Brodersen KH, Ong CS, Stephan KE, Buhmann JM (2010). “The Balanced
Accuracy and Its Posterior Distribution.” In *2010 20th International
Conference on Pattern Recognition*.
[doi:10.1109/icpr.2010.764](https://doi.org/10.1109/icpr.2010.764) .

Guyon I, Bennett K, Cawley G, Escalante HJ, Escalera S, Ho TK, Macia N,
Ray B, Saeed M, Statnikov A, Viegas E (2015). “Design of the 2015
ChaLearn AutoML challenge.” In *2015 International Joint Conference on
Neural Networks (IJCNN)*.
[doi:10.1109/ijcnn.2015.7280767](https://doi.org/10.1109/ijcnn.2015.7280767)
.

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/dev/reference/acc.md),
[`ce()`](https://mlr3measures.mlr-org.com/dev/reference/ce.md),
[`logloss()`](https://mlr3measures.mlr-org.com/dev/reference/logloss.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/dev/reference/mauc_aunu.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/dev/reference/mbrier.md),
[`mcc()`](https://mlr3measures.mlr-org.com/dev/reference/mcc.md),
[`zero_one()`](https://mlr3measures.mlr-org.com/dev/reference/zero_one.md)

## Examples

``` r
set.seed(1)
lvls = c("a", "b", "c")
truth = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
response = factor(sample(lvls, 10, replace = TRUE), levels = lvls)
bacc(truth, response)
#> [1] 0.2222222
```
