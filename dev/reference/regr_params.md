# Regression Parameters

Regression Parameters

## Arguments

- truth:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  True (observed) values. Must have the same length as `response`.

- response:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Predicted response values. Must have the same length as `truth`.

- sample_weights:

  ([`numeric()`](https://rdrr.io/r/base/numeric.html))  
  Vector of non-negative and finite sample weights. Must have the same
  length as `truth`. The vector gets automatically normalized to sum to
  one. Defaults to equal sample weights.

- na_value:

  (`numeric(1)`)  
  Value that should be returned if the measure is not defined for the
  input (as described in the note). Default is `NaN`.

- ...:

  (`any`)  
  Additional arguments. Currently ignored.
