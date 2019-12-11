#include <R.h>
#include <Rinternals.h>
#include <stdbool.h>

#define TP(m) (m[0])
#define FN(m) (m[1])
#define FP(m) (m[2])
#define TN(m) (m[3])

static inline double ddiv(int a, int b) { return ((double) a) / b; }

typedef double(*msr)(int *, int);
static double acc(int * m, int n) { return ddiv(TP(m) + TN(m), n); }
static double ce(int * m, int n) { return ddiv(FP(m) + FN(m), n); }
static double dor(int * m, int n) { return ddiv(TP(m) * TN(m), FP(m) * FN(m)); }
static double f1(int * m, int n) { return ddiv(2 * TP(m), 2 * TP(m) + FP(m) + FN(m)); }
static double fdr(int * m, int n) { return ddiv(FP(m), TP(m) + FP(m)); }
static double fn (int * m, int n) { return (double) FN(m); }
static double fnr(int * m, int n) { return ddiv(FN(m), TP(m) + FN(m)); }
static double fomr(int * m, int n) { return ddiv(FN(m), FN(m) + TN(m)); }
static double fp (int * m, int n) { return (double) FP(m); }
static double fpr (int * m, int n) { return ddiv(FP(m), FP(m) + TN(m)); }
static double mcc (int * m, int n) { return ddiv(TP(m) * TN(m) - FP(m) * FN(m), sqrt((TP(m) + FP(m)) * (TP(m) + FN(m)) * (TN(m) + FP(m)) * (TN(m) + FN(m)))); }
static double npv(int * m, int n) { return ddiv(TN(m), FN(m) + TN(m)); }
static double ppv(int * m, int n) { return ddiv(TP(m), TP(m) + FP(m)); }
static double tn (int * m, int n) { return (double) TN(m); }
static double tnr(int * m, int n) { return ddiv(TN(m), FP(m) + TN(m)); }
static double tp (int * m, int n) { return (double) TP(m); }
static double tpr(int * m, int n) { return ddiv(TP(m), TP(m) + FN(m)); }

// return pointer to measure function
static msr get_measure(const char * id) {
    if (strcmp(id, "acc") == 0)
        return &acc;
    if (strcmp(id, "ce") == 0)
        return &ce;
    if (strcmp(id, "dor") == 0)
        return &dor;
    if (strcmp(id, "f1") == 0)
        return &f1;
    if (strcmp(id, "fdr") == 0)
        return &fdr;
    if (strcmp(id, "fn") == 0)
        return &fn;
    if (strcmp(id, "fnr") == 0)
        return &fnr;
    if (strcmp(id, "fomr") == 0)
        return &fomr;
    if (strcmp(id, "fp") == 0)
        return &fp;
    if (strcmp(id, "fpr") == 0)
        return &fpr;
    if (strcmp(id, "mcc") == 0)
        return &mcc;
    if (strcmp(id, "npv") == 0)
        return &npv;
    if (strcmp(id, "ppv") == 0)
        return &ppv;
    if (strcmp(id, "tn") == 0)
        return &tn;
    if (strcmp(id, "tnr") == 0)
        return &tnr;
    if (strcmp(id, "tp") == 0)
        return &tp;
    if (strcmp(id, "tpr") == 0)
        return &tpr;

    return NULL;
}

static int count(const int * x, const R_len_t n) {
    int sum = 0;
    for (R_len_t i = 0; i < n; i++) {
        if (x[i]) sum++;
    }
    return sum;
}

SEXP c_thresh_path(SEXP label_, SEXP prob_, SEXP measures_) {
    const int * label = LOGICAL(label_);
    const double * prob = REAL(prob_);
    const int n = length(label_);
    const int n_measures = length(measures_);

    const int n_positive = count(label, n);
    const int nrow = n_measures + 1;

    // initialize array of function pointers to measure functions
    msr * measures = malloc(sizeof(msr) * n_measures);
    for (R_len_t i = 0; i < n_measures; i++) {
        measures[i] = get_measure(CHAR(STRING_ELT(measures_, i)));
        if (measures[i] == NULL) {
            free(measures);
            error("Unknown measure");
        }
    }

    // Determine duplicated probabilities with fromLast = TRUE
    // This is the same as
    // > SEXP dup_ = PROTECT(duplicated(prob_, TRUE));
    // but we can exploit that the vector is already sorted
    bool * dup = malloc(sizeof(int) * n);
    int n_dup = 0;
    for (int i = 0; i < n - 1; i++) {
        if (prob[i] == prob[i + 1]) {
            dup[i] = true;
            n_dup++;
        } else {
            dup[i] = false;
        }
    }
    dup[n-1] = false;

    // Result matrix: (n_measures + 1) x (length(prob) - sum(duplicated(prob)) + 2)
    // we always add probabilities 0 and a 1
    SEXP result_ = PROTECT(allocMatrix(REALSXP, nrow, n - n_dup + 2));
    double * result = REAL(result_);

    // confusion matrix
    int cm[4];

    // set all predictions to positive (threshold = 0)
    TP(cm) = n_positive;
    FP(cm) = n - n_positive;
    FN(cm) = 0;
    TN(cm) = 0;

    // calculate measures for threshold 0
    result[0] = 0;
    for (R_len_t j = 0; j < n_measures; j++) {
        result[j + 1] = measures[j](cm, n);
    }
    int offset = nrow;

    // go over all labels (which are sorted by probability for positive class),
    // update confusion matrix element-wise and calculate corresponding measures
    for (R_len_t i = 0; i < n; i++) {
        if (label[i]) { // was TP, now FN
            TP(cm)--;
            FN(cm)++;
        } else { // was FP, now TN
            FP(cm)--;
            TN(cm)++;
        }

        // if not duplicated, store prob and calculate corresponding measures
        if (!dup[i]) {
            result[offset] = prob[i];
            for (R_len_t j = 0; j < n_measures; j++) {
                result[offset + j + 1] = measures[j](cm, n);
            }
            offset += nrow;
        }
    }

    // set all predictions to negative (threshold = 1)
    // not sure if this is really required, the confusion matrix
    // should already look like this
    TP(cm) = 0;
    FP(cm) = 0;
    FN(cm) = n_positive;
    TN(cm) = n - n_positive;

    // calculate measures for threshold 1
    result[offset] = 1;
    for (R_len_t j = 0; j < n_measures; j++) {
        result[offset + j + 1] = measures[j](cm, n);
    }

    // cleanup
    free(measures);
    free(dup);
    UNPROTECT(1);

    return result_;
}
