# Measure Registry

The [`environment()`](https://rdrr.io/r/base/environment.html)
`measures` keeps track of all measures in this package. It stores meta
information such as minimum, maximum or if the measure must be minimized
or maximized. The following information is available for each measure:

- `id`: Name of the measure.

- `title`: Short descriptive title.

- `type`: `"binary"` for binary classification, `"classif"` for binary
  or multi-class classification, `"regr"` for regression and
  `"similarity"` for similarity measures.

- `lower`: lower bound.

- `upper`: upper bound.

- `predict_type`: prediction type the measure operates on. `"response"`
  corresponds to class labels for classification and the numeric
  response for regression. `"prob"` corresponds to class probabilities,
  provided as a matrix with class labels as column names. `"se"`
  corresponds to to the vector of predicted standard errors for
  regression.

- `minimize`: If `TRUE` or `FALSE`, the objective is to minimize or
  maximize the measure, respectively. Can also be `NA`.

- `obs_loss`: Name of the function which is called to calculate the
  (unaggregated) loss per observation.

- `trafo`: Optional [`list()`](https://rdrr.io/r/base/list.html) of
  length 2, containing a transformation `"fn"` and its derivative
  `"deriv"`.

- `aggregated`: If `TRUE`, this function aggregates the losses to a
  single numeric value. Otherwise, a vector of losses is returned.

- `sample_weights`: If `TRUE`, it is possible calculate a weighted
  measure.

## Usage

``` r
measures
```

## Format

An object of class `MeasureEnv` (inherits from `environment`) of length
65.

## Examples

``` r
names(measures)
#>  [1] "rmsle"       "one_zero"    "mauc_au1u"   "rse"         "bbrier"     
#>  [6] "msle"        "maxae"       "zero_one"    "tnr"         "sse"        
#> [11] "pbias"       "mauc_aunp"   "precision"   "smape"       "fomr"       
#> [16] "mae"         "phi"         "tn"          "ape"         "mauc_aunu"  
#> [21] "pinball"     "fnr"         "tp"          "srho"        "ae"         
#> [26] "rsq"         "jaccard"     "npv"         "sle"         "dor"        
#> [31] "bacc"        "ppv"         "medse"       "auc"         "rae"        
#> [36] "sae"         "rmse"        "ktau"        "tpr"         "mcc"        
#> [41] "linex"       "fn"          "maxse"       "gmean"       "fp"         
#> [46] "bias"        "fdr"         "prauc"       "logloss"     "mauc_mu"    
#> [51] "mse"         "fpr"         "mbrier"      "ce"          "recall"     
#> [56] "gpr"         "specificity" "se"          "rrse"        "acc"        
#> [61] "fbeta"       "medae"       "sensitivity" "mape"        "mauc_au1p"  
measures$tpr
#> $id
#> [1] "tpr"
#> 
#> $title
#> [1] "True Positive Rate"
#> 
#> $type
#> [1] "binary"
#> 
#> $lower
#> [1] 0
#> 
#> $upper
#> [1] 1
#> 
#> $predict_type
#> [1] "response"
#> 
#> $minimize
#> [1] FALSE
#> 
#> $obs_loss
#> [1] NA
#> 
#> $aggregated
#> [1] TRUE
#> 
#> $sample_weights
#> [1] FALSE
#> 
#> $trafo
#> [1] NA
#> 
as.data.frame(measures)
#>             id                                       title       type lower
#> 1        rmsle                 Root Mean Squared Log Error       regr     0
#> 2     one_zero                   One-Zero Utility Function    classif     0
#> 3    mauc_au1u              Average 1 vs. 1 multiclass AUC    classif     0
#> 4          rse                      Relative Squared Error       regr     0
#> 5       bbrier                          Binary Brier Score     binary     0
#> 6         msle                      Mean Squared Log Error       regr     0
#> 7        maxae                          Max Absolute Error       regr     0
#> 8     zero_one                Zero-One Classification Loss    classif     0
#> 9          tnr                          True Negative Rate     binary     0
#> 10         sse                       Sum of Squared Errors       regr     0
#> 11       pbias                                Percent Bias       regr  -Inf
#> 12   mauc_aunp  Weighted average 1 vs. rest multiclass AUC    classif     0
#> 13   precision                                   Precision     binary     0
#> 14       smape       Symmetric Mean Absolute Percent Error       regr     0
#> 15        fomr                         False Omission Rate     binary     0
#> 16         mae                         Mean Absolute Error       regr     0
#> 17         phi                  Phi Coefficient Similarity similarity    -1
#> 18          tn                              True Negatives     binary     0
#> 19         ape Absolute Percentage Error (per observation)       regr     0
#> 20   mauc_aunu           Average 1 vs. rest multiclass AUC    classif     0
#> 21     pinball                                     Pinball       regr  -Inf
#> 22         fnr                         False Negative Rate     binary     0
#> 23          tp                              True Positives     binary     0
#> 24        srho                              Spearman's rho       regr    -1
#> 25          ae            Absolute Error (per observation)       regr     0
#> 26         rsq                                   R Squared       regr  -Inf
#> 27     jaccard                    Jaccard Similarity Index similarity     0
#> 28         npv                   Negative Predictive Value     binary     0
#> 29         sle         Squared Log Error (per observation)       regr     0
#> 30         dor                       Diagnostic Odds Ratio     binary     0
#> 31        bacc                           Balanced Accuracy    classif     0
#> 32         ppv                   Positive Predictive Value     binary     0
#> 33       medse                        Median Squared Error       regr     0
#> 34         auc                    Area Under the ROC Curve     binary     0
#> 35         rae                     Relative Absolute Error       regr     0
#> 36         sae                      Sum of Absolute Errors       regr     0
#> 37        rmse                     Root Mean Squared Error       regr     0
#> 38        ktau                               Kendall's tau       regr    -1
#> 39         tpr                          True Positive Rate     binary     0
#> 40         mcc            Matthews Correlation Coefficient    classif    -1
#> 41       linex   Linear-exponential Loss (per observation)       regr     0
#> 42          fn                             False Negatives     binary     0
#> 43       maxse                           Max Squared Error       regr     0
#> 44       gmean    Geometric Mean of Recall and Specificity     binary     0
#> 45          fp                             False Positives     binary     0
#> 46        bias                                        Bias       regr  -Inf
#> 47         fdr                        False Discovery Rate     binary     0
#> 48       prauc                      Precision-Recall Curve     binary     0
#> 49     logloss                                    Log Loss    classif     0
#> 50     mauc_mu                           Multiclass mu AUC    classif     0
#> 51         mse                          Mean Squared Error       regr     0
#> 52         fpr                         False Positive Rate     binary     0
#> 53      mbrier                      Multiclass Brier Score    classif     0
#> 54          ce                        Classification Error    classif     0
#> 55      recall                                      Recall     binary     0
#> 56         gpr      Geometric Mean of Precision and Recall     binary     0
#> 57 specificity                                 Specificity     binary     0
#> 58          se             Squared Error (per observation)       regr     0
#> 59        rrse                 Root Relative Squared Error       regr     0
#> 60         acc                     Classification Accuracy    classif     0
#> 61       fbeta                                F-beta score     binary     0
#> 62       medae                       Median Absolute Error       regr     0
#> 63 sensitivity                                 Sensitivity     binary     0
#> 64        mape                 Mean Absolute Percent Error       regr     0
#> 65   mauc_au1p     Weighted average 1 vs. 1 multiclass AUC    classif     0
#>    upper minimize sample_weights
#> 1    Inf     TRUE           TRUE
#> 2      1    FALSE          FALSE
#> 3      1    FALSE          FALSE
#> 4    Inf     TRUE          FALSE
#> 5      1     TRUE           TRUE
#> 6    Inf     TRUE           TRUE
#> 7    Inf     TRUE          FALSE
#> 8      1     TRUE          FALSE
#> 9      1    FALSE          FALSE
#> 10   Inf     TRUE           TRUE
#> 11   Inf       NA           TRUE
#> 12     1    FALSE          FALSE
#> 13     1    FALSE          FALSE
#> 14     2     TRUE          FALSE
#> 15     1     TRUE          FALSE
#> 16   Inf     TRUE           TRUE
#> 17     1    FALSE          FALSE
#> 18   Inf    FALSE          FALSE
#> 19   Inf     TRUE          FALSE
#> 20     1    FALSE          FALSE
#> 21   Inf     TRUE           TRUE
#> 22     1     TRUE          FALSE
#> 23   Inf    FALSE          FALSE
#> 24     1    FALSE          FALSE
#> 25   Inf     TRUE          FALSE
#> 26     1    FALSE          FALSE
#> 27     1    FALSE          FALSE
#> 28     1    FALSE          FALSE
#> 29   Inf     TRUE          FALSE
#> 30   Inf    FALSE          FALSE
#> 31     1    FALSE           TRUE
#> 32     1    FALSE          FALSE
#> 33   Inf     TRUE          FALSE
#> 34     1    FALSE          FALSE
#> 35   Inf     TRUE          FALSE
#> 36   Inf     TRUE           TRUE
#> 37   Inf     TRUE           TRUE
#> 38     1    FALSE          FALSE
#> 39     1    FALSE          FALSE
#> 40     1    FALSE          FALSE
#> 41   Inf     TRUE          FALSE
#> 42   Inf     TRUE          FALSE
#> 43   Inf     TRUE          FALSE
#> 44     1    FALSE          FALSE
#> 45   Inf     TRUE          FALSE
#> 46   Inf       NA           TRUE
#> 47     1     TRUE          FALSE
#> 48     1    FALSE          FALSE
#> 49   Inf     TRUE           TRUE
#> 50     1    FALSE          FALSE
#> 51   Inf     TRUE           TRUE
#> 52     1     TRUE          FALSE
#> 53     2     TRUE          FALSE
#> 54     1     TRUE           TRUE
#> 55     1    FALSE          FALSE
#> 56     1    FALSE          FALSE
#> 57     1    FALSE          FALSE
#> 58   Inf     TRUE          FALSE
#> 59   Inf     TRUE          FALSE
#> 60     1    FALSE           TRUE
#> 61     1    FALSE          FALSE
#> 62   Inf     TRUE          FALSE
#> 63     1    FALSE          FALSE
#> 64   Inf     TRUE           TRUE
#> 65     1    FALSE          FALSE
```
