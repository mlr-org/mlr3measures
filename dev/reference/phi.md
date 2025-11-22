# Phi Coefficient Similarity

Measure to compare two or more sets w.r.t. their similarity.

## Usage

``` r
phi(sets, p, na_value = NaN, ...)
```

## Arguments

- sets:

  ([`list()`](https://rdrr.io/r/base/list.html))  
  List of character or integer vectors. `sets` must have at least 2
  elements.

- p:

  (`integer(1)`)  
  Total number of possible elements.

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

The Phi Coefficient is defined as the Pearson correlation between the
binary representation of two sets \\A\\ and \\B\\. The binary
representation for \\A\\ is a logical vector of length \\p\\ with the
i-th element being 1 if the corresponding element is in \\A\\, and 0
otherwise.

If more than two sets are provided, the mean of all pairwise scores is
calculated.

This measure is undefined if one set contains none or all possible
elements.

## Meta Information

- Type: `"similarity"`

- Range: \\\[-1, 1\]\\

- Minimize: `FALSE`

## References

Nogueira S, Brown G (2016). “Measuring the Stability of Feature
Selection.” In *Machine Learning and Knowledge Discovery in Databases*,
442–457. Springer International Publishing.
[doi:10.1007/978-3-319-46227-1_28](https://doi.org/10.1007/978-3-319-46227-1_28)
.

Bommert A, Rahnenführer J, Lang M (2017). “A Multicriteria Approach to
Find Predictive and Sparse Models with Stable Feature Selection for
High-Dimensional Data.” *Computational and Mathematical Methods in
Medicine*, **2017**, 1–18.
[doi:10.1155/2017/7907163](https://doi.org/10.1155/2017/7907163) .

Bommert A, Lang M (2021). “stabm: Stability Measures for Feature
Selection.” *Journal of Open Source Software*, **6**(59), 3010.
[doi:10.21105/joss.03010](https://doi.org/10.21105/joss.03010) .

## See also

Package [stabm](https://CRAN.R-project.org/package=stabm) which
implements many more stability measures with included correction for
chance.

Other Similarity Measures:
[`jaccard()`](https://mlr3measures.mlr-org.com/dev/reference/jaccard.md)

## Examples

``` r
set.seed(1)
sets = list(
  sample(letters[1:3], 1),
  sample(letters[1:3], 2)
)
phi(sets, p = 3)
#> [1] 0.5
```
