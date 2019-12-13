#ifndef MLR3MEASURES_CONFUSION_MEASURES_H_
#define MLR3MEASURES_CONFUSION_MEASURES_H_

#include <R.h>
#include <Rinternals.h>

double acc(int * m, int n);
SEXP c_acc(SEXP, SEXP);

double ce(int * m, int n);
SEXP c_ce(SEXP, SEXP);

double dor(int * m, int n);
SEXP c_dor(SEXP, SEXP);

double f1(int * m, int n);
SEXP c_f1(SEXP, SEXP);

double fdr(int * m, int n);
SEXP c_fdr(SEXP, SEXP);

double fn (int * m, int n);
SEXP c_fn (SEXP, SEXP);

double fnr(int * m, int n);
SEXP c_fnr(SEXP, SEXP);

double fomr(int * m, int n);
SEXP c_fomr(SEXP, SEXP);

double fp (int * m, int n);
SEXP c_fp (SEXP, SEXP);

double fpr (int * m, int n);
SEXP c_fpr (SEXP, SEXP);

double mcc (int * m, int n);
SEXP c_mcc (SEXP, SEXP);

double npv(int * m, int n);
SEXP c_npv(SEXP, SEXP);

double ppv(int * m, int n);
SEXP c_ppv(SEXP, SEXP);

double tn (int * m, int n);
SEXP c_tn (SEXP, SEXP);

double tnr(int * m, int n);
SEXP c_tnr(SEXP, SEXP);

double tp (int * m, int n);
SEXP c_tp (SEXP, SEXP);

double tpr(int * m, int n);
SEXP c_tpr(SEXP, SEXP);

SEXP c_confusion_measures(SEXP, SEXP);

#endif
