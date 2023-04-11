#define M 600
#define N 1000000
#define BUF_SIZE 256

#include <algorithm>
#include <cstdlib>
#include <fcntl.h>
#include <iomanip>
#include <iostream>
#include <papi.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <vector>
#include <x86intrin.h>

using namespace std;

vector<int> event_codes = {PAPI_TOT_CYC, PAPI_BR_CN, PAPI_BR_MSP, PAPI_BR_PRC};
vector<long long> values(event_codes.size());
int event_set = PAPI_NULL;

#define CHECK(x, code)                                                                                 \
    {                                                                                                  \
        int retval = x;                                                                                \
        if (retval != code)                                                                            \
        {                                                                                              \
            std::cout << #x " : PAPI error " << retval << " : " << PAPI_strerror(retval) << std::endl; \
            exit(1);                                                                                   \
        }                                                                                              \
    }

string event_descr(int event_code)
{
    PAPI_event_info_t info;
    CHECK(PAPI_get_event_info(event_code, &info), PAPI_OK);
    return string(info.short_descr);
}

void write_to_file(double value, int fd)
{
    char buf[BUF_SIZE];
    sprintf(buf, "%f;", value);
    int wc;
    if (strlen(buf) + 1 > (wc = write(fd, buf, strlen(buf) + 1)))
        if (wc < 0)
            perror("write()");
        else
            fprintf(stderr, "write to file error\n");
}

unsigned char matrix_production()
{
    double *A, *B, *C;
    A = (double *)malloc(M * M * sizeof(double));
    B = (double *)malloc(M * M * sizeof(double));
    C = (double *)calloc(M * M, sizeof(double));

    if (!A || !B || !C)
    {
        perror("mastrix production failed\n");
        return 1;
    }

    for (int i = 0; i < M; ++i)
    {
        for (int j = 0; j < M; ++j)
        {
            A[i * M + j] = i + j;
            B[i * M + j] = i - j;
        }
    }

    for (int i = 0; i < M; ++i)
    {
        double *c = C + i * M;

        for (int k = 0; k < M; ++k)
        {
            double *b = B + k * M;
            double a = A[i * M + k];
            for (int j = 0; j < M; ++j)
                c[j] += a * b[j];
        }
    }

    free(A);
    free(B);
    free(C);

    return 0;
}

unsigned char heat_proc()
{
    return matrix_production();
}

void measure_predictor_capacity(int k, int d, int fd)
{
    int a = 1;
    CHECK(PAPI_start(event_set), PAPI_OK);
    unsigned int AUX;
    long long startt = __rdtscp(&AUX);
    for (long long i = 0; i < N; ++i)
    {
        if (i % k <= 1)
            a = a + a;
        