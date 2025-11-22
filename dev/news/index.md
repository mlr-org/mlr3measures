# Changelog

## mlr3measures (development version)

- feat: Add observation-wise loss functions for `bbrier` and `logloss`.

## mlr3measures 1.1.0

CRAN release: 2025-09-04

- fix: Define bias measures correctly.
- BREAKING CHANGE: Deprecate `rse`, `rsq`, `rrse`, and `rae`.
- feat: Measures `sae` and `sse` gain `sample_weights` (unnormalized
  weights).

## mlr3measures 1.0.0

CRAN release: 2024-09-11

- Added new measure `linex` (Linear-Exponential Loss).
- Added new measure `pinball` (Average Pinball Loss).
- Added new measure `mauc_mu` (Mu AUC).

## mlr3measures 0.6.0

CRAN release: 2024-07-20

- Added binary classification measures `gmean` and `gpr`.
- Added new measure `mcc` (Matthews Correlation Coefficient).

## mlr3measures 0.5.0

CRAN release: 2022-08-05

- Added some observation-wise loss functions: `ae`, `ape`, `se`, `sle`,
  and `zero_one`,

## mlr3measures 0.4.1

CRAN release: 2022-01-13

- Calculation of `fbeta` is now more numerically more stable.
- Improved documentation.

## mlr3measures 0.4.0

CRAN release: 2021-09-26

- New measures to calculate set similarities: `jaccard` and `phi`.
- Many measures now support sample weights. Supported measures have
  `$sample_weights` set to `TRUE` in the `measures` environment.

## mlr3measures 0.3.1

CRAN release: 2021-01-06

- Fix edge case for `msle` and `rmsle`.

## mlr3measures 0.3.0

CRAN release: 2020-10-05

- New measure `prauc` (area under precision-recall curve)
  ([\#22](https://github.com/mlr-org/mlr3measures/issues/22))
  implemented in package `PRROC`.
- Removed dependency on orphaned package `bibtex`.

## mlr3measures 0.2.0

CRAN release: 2020-06-27

- New measures: `mauc_au1p`, `mauc_au1u`, `mauc_aunp`, and `mauc_aunu`.
- Fixed noLD check warnings.

## mlr3measures 0.1.3

CRAN release: 2020-04-01

- Added a
  [`packageStartupMessage()`](https://rdrr.io/r/base/message.html)
  advising against attaching this package.
- Added new measure `bbrier` (binary Brier Score).
- Added new measure `mbrier` (multi-class Brier Score).
- Improved numerical stability for measure `mcc`.

## mlr3measures 0.1.2

CRAN release: 2020-03-04

- Fixed integer overflows in `auc`, `dor` and `mcc`.

## mlr3measures 0.1.1

CRAN release: 2019-11-05

- Added new measure `bacc` (Balanced Accuracy).
- Fixed some tests which stochastically failed.
- The name of the measure is now also stored in the meta data.

## mlr3measures 0.1.0

CRAN release: 2019-10-28

Initial release.
