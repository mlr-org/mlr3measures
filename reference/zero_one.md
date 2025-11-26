# Zero-One Classification Loss (per observation)

Calculates the per-observation 0/1 (zero-one) loss as \$\$ \mathbf{1}
(t_i \neq r_1). \$\$ The 1/0 (one-zero) loss is equal to 1 - zero-one
and calculated as \$\$ \mathbf{1} (t_i = r_i). \$\$

Measure to compare true observed labels with predicted labels in
multiclass classification tasks.

Note that this is an unaggregated measure, returning the losses per
observation.

## Usage

``` r
zero_one(truth, response, ...)

one_zero(truth, response, ...)
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

- ...:

  (`any`)  
  Additional arguments. Currently ignored.

## Value

Performance value as `numeric(length(truth))`.

## Meta Information

- Type: `"classif"`

- Range (per observation): \\\[0, 1\]\\

- Minimize (per observation): `TRUE`

- Required prediction: `response`

## See also

Other Classification Measures:
[`acc()`](https://mlr3measures.mlr-org.com/reference/acc.md),
[`bacc()`](https://mlr3measures.mlr-org.com/reference/bacc.md),
[`ce()`](https://mlr3measures.mlr-org.com/reference/ce.md),
[`logloss()`](https://mlr3measures.mlr-org.com/reference/logloss.md),
[`mauc_aunu()`](https://mlr3measures.mlr-org.com/reference/mauc_aunu.md),
[`mbrier()`](https://mlr3measures.mlr-org.com/reference/mbrier.md),
[`mcc()`](https://mlr3measures.mlr-org.com/reference/mcc.md)
