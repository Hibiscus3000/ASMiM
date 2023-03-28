#define M 1000
#define K 100
#define N 10000000
#define BUF_SIZE 256

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

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
}

unsigned char heat_proc()
{
    return matrix_production();
}

unsigned long long get_ticks()
{
    unsigned long th, tl;
    __asm__ volatile("cpuid");
    __asm__ volatile("rdtsc\n"
                     : "=a"(tl), "=d"(th));
    unsigned long long ticks = (th << 32) | (4294967295UL & tl);
    return ticks;
}

void measure_predictor_capacity(int fd)
{
    int a;
    for (int k = 1; k < K; ++k)
    {
        unsigned long long startt = get_ticks();
        for (long long i = 0; i < N; ++i)
        {
            if (i % k <= 1)
            {
                a = 2;
            }
        }
        unsigned long long endt = get_ticks();
        unsigned long long time = endt - startt;
        double avg = (double)time / N;
        printf("k = %3d, time = %8lld, avg = %f\n", k, time, avg);
        write_to_file(avg, fd);
    }
}

int main(int argc, char *argv[])
{
    if (2 != argc)
    {
        fprintf(stderr, "wrong number of arguments, expected file name, where to put measurements results\n");
        return 1;
    }
    int results_table_fd = open(argv[1], O_RDWR | O_CREAT | O_APPEND, 0700);
    if (-1 == results_table_fd)
    {
        perror("open()");
        return 1;
    }
    if (heat_proc())
        return 1;
    measure_predictor_capacity(results_table_fd);
    close(results_table_fd);
    return 0;
}