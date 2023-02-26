#define NUMBER_OF_ITERATIONS 1000000

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const int n = 10240 * (128 + 512 + 3072) / sizeof(int);
// cache size in ints

void swap(int *a, int *b)
{
    int c = *a;
    *a = *b;
    *b = c;
}

void prepare_random_access_array(int *array)
{
    array[0] = rand() % (n - 2) + 1;
    for (int i = 1; i < n - 1; ++i)
        array[i] = i;
    array[array[0]] = n - 1;
    array[n - 1] = 0;

    int j;

    for (int i = 1; i < n - 2; ++i)
    {
        j = (rand() % (n - i - 2)) + i + 1;
        swap(&(array[i]), &(array[j]));
    }
}

unsigned long long get_ticks()
{
    unsigned long th, tl;
    __asm__ volatile("rdtscp\n"
                     : "=a"(tl), "=d"(th));
    return (th << 32) | (4294967295UL & tl);
}

int main()
{
    srand(time(NULL));
    int *array = (int *)malloc(n * sizeof(int));
    if (!array)
    {
        fprintf(stderr, "Unable to allocate memory for random access array");
        return 1;
    }
    prepare_random_access_array(array);

    int k = 0;
    unsigned long long startt = get_ticks();
    for (int i = 0; i < NUMBER_OF_ITERATIONS; ++i)
        k = array[k];
    unsigned long long endt = get_ticks();
    printf("average ticks: %lld\n", (endt - startt) / NUMBER_OF_ITERATIONS);
    free(array);
}