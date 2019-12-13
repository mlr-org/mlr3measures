#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP c_confusion_measures(SEXP, SEXP);
extern SEXP c_dor(SEXP, SEXP);
extern SEXP c_f1(SEXP, SEXP);
extern SEXP c_fdr(SEXP, SEXP);
extern SEXP c_fn(SEXP, SEXP);
extern SEXP c_fnr(SEXP, SEXP);
extern SEXP c_fomr(SEXP, SEXP);
extern SEXP c_fp(SEXP, SEXP);
extern SEXP c_fpr(SEXP, SEXP);
extern SEXP c_mcc(SEXP, SEXP);
extern SEXP c_npv(SEXP, SEXP);
extern SEXP c_ppv(SEXP, SEXP);
extern SEXP c_thresholds(SEXP, SEXP, SEXP);
extern SEXP c_tn(SEXP, SEXP);
extern SEXP c_tnr(SEXP, SEXP);
extern SEXP c_tp(SEXP, SEXP);
extern SEXP c_tpr(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"c_confusion_measures", (DL_FUNC) &c_confusion_measures, 2},
    {"c_dor",                (DL_FUNC) &c_dor,                2},
    {"c_f1",                 (DL_FUNC) &c_f1,                 2},
    {"c_fdr",                (DL_FUNC) &c_fdr,                2},
    {"c_fn",                 (DL_FUNC) &c_fn,                 2},
    {"c_fnr",                (DL_FUNC) &c_fnr,                2},
    {"c_fomr",               (DL_FUNC) &c_fomr,               2},
    {"c_fp",                 (DL_FUNC) &c_fp,                 2},
    {"c_fpr",                (DL_FUNC) &c_fpr,                2},
    {"c_mcc",                (DL_FUNC) &c_mcc,                2},
    {"c_npv",                (DL_FUNC) &c_npv,                2},
    {"c_ppv",                (DL_FUNC) &c_ppv,                2},
    {"c_thresholds",         (DL_FUNC) &c_thresholds,         3},
    {"c_tn",                 (DL_FUNC) &c_tn,                 2},
    {"c_tnr",                (DL_FUNC) &c_tnr,                2},
    {"c_tp",                 (DL_FUNC) &c_tp,                 2},
    {"c_tpr",                (DL_FUNC) &c_tpr,                2},
    {NULL, NULL, 0}
};

void R_init_mlr3measures(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

