#include "confusion_measures.h"
#include "defines.h"

static inline double ddiv(int a, int b) {
    return ((double) a) / b;
}

double acc(int * m, int n) {
    return ddiv(TP(m) + TN(m), n);
}

SEXP c_acc(SEXP m_, SEXP n_) {
    return ScalarReal(acc(INTEGER(m_), INTEGER(n_)[0]));
}

double ce(int * m, int n) {
    return ddiv(FP(m) + FN(m), n);
}

SEXP c_ce(SEXP m_, SEXP n_) {
    return ScalarReal(ce(INTEGER(m_), INTEGER(n_)[0]));
}

double dor(int * m, int n) {
    return ddiv(TP(m) * TN(m), FP(m) * FN(m));
}

SEXP c_dor(SEXP m_, SEXP n_) {
    return ScalarReal(dor(INTEGER(m_), INTEGER(n_)[0]));
}

double f1(int * m, int n) {
    return ddiv(2 * TP(m), 2 * TP(m) + FP(m) + FN(m));
}

SEXP c_f1(SEXP m_, SEXP n_) {
    return ScalarReal(f1(INTEGER(m_), INTEGER(n_)[0]));
}

double fdr(int * m, int n) {
    return ddiv(FP(m), TP(m) + FP(m));
}

SEXP c_fdr(SEXP m_, SEXP n_) {
    return ScalarReal(fdr(INTEGER(m_), INTEGER(n_)[0]));
}

double fn (int * m, int n) {
    return (double) FN(m);
}

SEXP c_fn(SEXP m_, SEXP n_) {
    return ScalarReal(fn(INTEGER(m_), INTEGER(n_)[0]));
}

double fnr(int * m, int n) {
    return ddiv(FN(m), TP(m) + FN(m));
}

SEXP c_fnr(SEXP m_, SEXP n_) {
    return ScalarReal(fnr(INTEGER(m_), INTEGER(n_)[0]));
}

double fomr(int * m, int n) {
    return ddiv(FN(m), FN(m) + TN(m));
}


SEXP c_fomr(SEXP m_, SEXP n_) {
    return ScalarReal(fomr(INTEGER(m_), INTEGER(n_)[0]));
}

double fp (int * m, int n) {
    return (double) FP(m);
}


SEXP c_fp(SEXP m_, SEXP n_) {
    return ScalarReal(fp(INTEGER(m_), INTEGER(n_)[0]));
}

double fpr (int * m, int n) {
    return ddiv(FP(m), FP(m) + TN(m));
}

SEXP c_fpr(SEXP m_, SEXP n_) {
    return ScalarReal(fpr(INTEGER(m_), INTEGER(n_)[0]));
}

double mcc (int * m, int n) {
    int nomin = TP(m) * TN(m) - FP(m) * FN(m);
    double denom = (TP(m) + FP(m)) * (TP(m) + FN(m)) * (TN(m) + FP(m)) * (TN(m) + FN(m));

    return denom == 0 ? nomin : nomin / sqrt(denom);
}

SEXP c_mcc(SEXP m_, SEXP n_) {
    return ScalarReal(mcc(INTEGER(m_), INTEGER(n_)[0]));
}

double npv(int * m, int n) {
    return ddiv(TN(m), FN(m) + TN(m));
}

SEXP c_npv(SEXP m_, SEXP n_) {
    return ScalarReal(npv(INTEGER(m_), INTEGER(n_)[0]));
}

double ppv(int * m, int n) {
    return ddiv(TP(m), TP(m) + FP(m));
}

SEXP c_ppv(SEXP m_, SEXP n_) {
    return ScalarReal(ppv(INTEGER(m_), INTEGER(n_)[0]));
}

double tn (int * m, int n) {
    return (double) TN(m);
}

SEXP c_tn(SEXP m_, SEXP n_) {
    return ScalarReal(tn(INTEGER(m_), INTEGER(n_)[0]));
}

double tnr(int * m, int n) {
    return ddiv(TN(m), FP(m) + TN(m));
}

SEXP c_tnr(SEXP m_, SEXP n_) {
    return ScalarReal(tnr(INTEGER(m_), INTEGER(n_)[0]));
}

double tp (int * m, int n) {
    return (double) TP(m);
}

SEXP c_tp(SEXP m_, SEXP n_) {
    return ScalarReal(tp(INTEGER(m_), INTEGER(n_)[0]));
}

double tpr(int * m, int n) {
    return ddiv(TP(m), TP(m) + FN(m));
}

SEXP c_tpr(SEXP m_, SEXP n_) {
    return ScalarReal(tpr(INTEGER(m_), INTEGER(n_)[0]));
}

SEXP c_confusion_measures(SEXP m_, SEXP n_) {
    int * m = INTEGER(m_);
    int n = INTEGER(n_)[0];
    SEXP result_ = PROTECT(allocVector(REALSXP, 13));
    double * result = REAL(result_);
    SEXP names_ = PROTECT(allocVector(STRSXP, 13));

    result[0]  = acc(m, n);  SET_STRING_ELT(names_, 0,  mkChar("acc"));
    result[1]  = ce(m, n);   SET_STRING_ELT(names_, 1,  mkChar("ce"));
    result[2]  = dor(m, n);  SET_STRING_ELT(names_, 2,  mkChar("dor"));
    result[3]  = f1(m, n);   SET_STRING_ELT(names_, 3,  mkChar("f1"));
    result[4]  = fdr(m, n);  SET_STRING_ELT(names_, 4,  mkChar("fdr"));
    result[5]  = fnr(m, n);  SET_STRING_ELT(names_, 5,  mkChar("fnr"));
    result[6]  = fomr(m, n); SET_STRING_ELT(names_, 6,  mkChar("fomr"));
    result[7]  = fpr(m, n);  SET_STRING_ELT(names_, 7,  mkChar("fpr"));
    result[8]  = mcc(m, n);  SET_STRING_ELT(names_, 8,  mkChar("mcc"));
    result[9]  = npv(m, n);  SET_STRING_ELT(names_, 9,  mkChar("npv"));
    result[10] = ppv(m, n);  SET_STRING_ELT(names_, 10, mkChar("ppv"));
    result[11] = tnr(m, n);  SET_STRING_ELT(names_, 11, mkChar("tnr"));
    result[12] = tpr(m, n);  SET_STRING_ELT(names_, 12, mkChar("tpr"));

    setAttrib(result_, R_NamesSymbol, names_);
    UNPROTECT(2);

    return result_;
}
