#define N 2000
#define NUM_OF_ITERATIONS 1000
#define BUF_SIZE 256

#include <fcntl.h>
#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void write_to_file(double value, int fd)
{
    char buf[BUF_SIZE];
    sprintf(buf,"%f;",value);
    int wc;
    if (strlen(buf) + 1 > (wc = write(fd,buf,strlen(buf) + 1)))
        if (wc < 0)
            perror("write()");
        else
            fprintf(stderr,"write to file error\n");
}

unsigned char matrix_production()
{
    double *A, *B, *C;
    A = (double *)malloc(N * N * sizeof(double));
    B = (double *)malloc(N * N * sizeof(double));
    C = (double *)calloc(N * N, sizeof(double));

    if (!A || !B || !C)
    {
        perror("mastrix production failed\n");
        return 1;
    }

    for (int i = 0; i < N; ++i)
    {
        for (int j = 0; j < N; ++j)
        {
            A[i * N + j] = i + j;
            B[i * N + j] = i - j;
        }
    }

    for (int i = 0; i < N; ++i)
    {
        double *c = C + i * N;

        for (int k = 0; k < N; ++k)
        {
            double *b = B + k * N;
            double a = A[i * N + k];
            for (int j = 0; j < N; ++j)
                c[j] += a * b[j];
        }
    }

    printf("proc heat: %f %f\n", C[N * (N / 2)], C[(N / 2) * (N / 2)]);

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
    printf("ticks: %lld\n", ticks);
    return ticks;
}

void measure_latency(int rtfd)
{
    double *result = (double *)_mm_malloc(sizeof(__m256d), sizeof(__m256d));
    __m256d vect = _mm256_set_pd(10000.0, 40000.0, 90000.0, 55443.65);

    volatile unsigned long long startt = get_ticks();
    for (int i = 0; i < NUM_OF_ITERATIONS; ++i)
    {
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
        vect = _mm256_sqrt_pd(vect);
    }
    volatile unsigned long long endt = get_ticks();

    _mm256_store_pd(result, vect);
    printf("measure latency: %f\n", result[0]);
    double latency;
    printf("LATENCY: %f\n", latency = (double)(endt - startt) / (16 * NUM_OF_ITERATIONS));
    write_to_file(latency,rtfd);
    free(result);
}

void measure_reciprocal_throughput(int rtfd)
{
    int number_of_ind_vects = 16;
    double *result = (double *)_mm_malloc(sizeof(__m256d), sizeof(__m256d));
    __m256d *vects = (__m256d *)_mm_malloc(number_of_ind_vects * sizeof(__m256d),sizeof(__m256d));

    for (int i = 0; i < number_of_ind_vects; ++i)
        vects[i] = _mm256_set_pd(10 * i, 55.55 * i, 93.003 * i, i);

    volatile unsigned long long startt = get_ticks();
    for (int i = 0; i < NUM_OF_ITERATIONS; ++i)
    {
        vects[0] = _mm256_sqrt_pd(vects[0]);
        vects[1] = _mm256_sqrt_pd(vects[1]);
        vects[2] = _mm256_sqrt_pd(vects[2]);
        vects[3] = _mm256_sqrt_pd(vects[3]);
        vects[4] = _mm256_sqrt_pd(vects[4]);
        vects[5] = _mm256_sqrt_pd(vects[5]);
        vects[6] = _mm256_sqrt_pd(vects[6]);
        vects[7] = _mm256_sqrt_pd(vects[7]);
        vects[8] = _mm256_sqrt_pd(vects[8]);
        vects[9] = _mm256_sqrt_pd(vects[9]);
        vects[10] = _mm256_sqrt_pd(vects[10]);
        vects[11] = _mm256_sqrt_pd(vects[11]);
        vects[12] = _mm256_sqrt_pd(vects[12]);
        vects[13] = _mm256_sqrt_pd(vects[13]);
        vects[14] = _mm256_sqrt_pd(vects[14]);
        vects[15] = _mm256_sqrt_pd(vects[15]);
    }
    volatile unsigned long long endt = get_ticks();

    _mm256_store_pd(result, vects[number_of_ind_vects / 2 + number_of_ind_vects / 4]);
    printf("measure reciprocal throughput: %f\n", result[0]);
    double throughput;
    printf("RECIPROCAL THROUGHPUT: %f\n",throughput = (double)(endt - startt) / (number_of_ind_vects * NUM_OF_ITERATIONS));
    write_to_file(throughput,rtfd);
    free(result);
    free(vects);
}

int main(int argc, char * argv[])
{
    if (2 != argc)
    {
        fprintf(stderr,"wrong number of arguments, expected file name, where to put measurements results\n");
        return 1;
    }
    int results_table_fd = open(argv[1],O_RDWR | O_CREAT | O_APPEND, 0700);
    if (-1 == results_table_fd)
    {
        perror("open()");
        return 1;
    }

    if (heat_proc())
        return 1;
    measure_latency(results_table_fd);
    measure_reciprocal_throughput(results_table_fd);
    close(results_table_fd);
    return 0;
}