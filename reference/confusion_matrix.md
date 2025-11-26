# Calculate Binary Confusion Matrix

Calculates the confusion matrix for a binary classification problem once
and then calculates all binary confusion measures of this package.

## Usage

``` r
confusion_matrix(truth, response, positive, na_value = NaN, relative = FALSE)
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

- relative:

  (`logical(1)`)  
  If `TRUE`, the returned confusion matrix contains relative frequencies
  instead of absolute frequencies.

## Value

List with two elements:

- `matrix` stores the calculated confusion matrix.

- `measures` stores the metrics as named numeric vector.

## Details

The binary confusion matrix is defined as \$\$ \begin{pmatrix} TP & FP
\\ FN & TN \end{pmatrix}. \$\$ If `relative = TRUE`, all values are
divided by \\n\\.

## Examples

``` r
set.seed(123)
lvls = c("a", "b")
truth = factor(sample(lvls, 20, replace = TRUE), levels = lvls)
response = factor(sample(lvls, 20, replace = TRUE), levels = lvls)

confusion_matrix(truth, response, positive = "a")
#>         truth
#> response a b
#>        a 7 5
#>        b 4 4
#> acc :  0.5500; ce  :  0.4500; dor :  1.4000; f1  :  0.6087 
#> fdr :  0.4167; fnr :  0.3636; fomr:  0.5000; fpr :  0.5556 
#> mcc :  0.0821; npv :  0.5000; ppv :  0.5833; tnr :  0.4444 
#> tpr :  0.6364 
confusion_matrix(truth, response, positive = "a", relative = TRUE)
#>         truth
#> response    a    b
#>        a 0.35 0.25
#>        b 0.20 0.20
#> acc :  0.5500; ce  :  0.4500; dor :  1.4000; f1  :  0.6087 
#> fdr :  0.4167; fnr :  0.3636; fomr:  0.5000; fpr :  0.5556 
#> mcc :  0.0821; npv :  0.5000; ppv :  0.5833; tnr :  0.4444 
#> tpr :  0.6364 
confusion_matrix(truth, response, positive = "b")
#>         truth
#> response b a
#>        b 4 4
#>        a 5 7
#> acc :  0.5500; ce  :  0.4500; dor :  1.4000; f1  :  0.4706 
#> fdr :  0.5000; fnr :  0.5556; fomr:  0.4167; fpr :  0.3636 
#> mcc :  0.0821; npv :  0.5833; ppv :  0.5000; tnr :  0.6364 
#> tpr :  0.4444 
```
