# Jaccard Similarity Index

Measure to compare two or more sets w.r.t. their similarity.

## Usage

``` r
jaccard(sets, na_value = NaN, ...)
```

## Arguments

- sets:

  ([`list()`](https://rdrr.io/r/base/list.html))  
  List of character or integer vectors. `sets` must have at least 2
  elements.

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

For two sets \\A\\ and \\B\\, the Jaccard Index is defined as \$\$ J(A,
B) = \frac{\|A \cap B\|}{\|A \cup B\|}. \$\$ If more than two sets are
provided, the mean of all pairwise scores is calculated.

This measure is undefined if two or more sets are empty.

## Meta Information

- Type: `"similarity"`

- Range: \\\[0, 1\]\\

- Minimize: `FALSE`

## References

Jaccard, Paul (1901). “Étude comparative de la distribution florale dans
une portion des Alpes et du Jura.” *Bulletin de la Société Vaudoise des
Sciences Naturelles*, **37**, 547-579.
[doi:10.5169/SEALS-266450](https://doi.org/10.5169/SEALS-266450) .

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
[`phi()`](https://mlr3measures.mlr-org.com/dev/reference/phi.md)

## Examples

``` r
set.seed(1)
sets = list(
  sample(letters[1:3], 1),
  sample(letters[1:3], 2)
)
jaccard(sets)
#> [1] 0.5
```
