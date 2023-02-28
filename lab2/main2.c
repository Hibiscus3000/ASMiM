#define NUMBER_OF_ITERATIONS 1000000
#define BUF_SIZE 256

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

void swap(int *a, int *b)
{
    int c = *a;
    *a = *b;
    *b = c;
}

void prepare_random_access_array(int *array, int n)
{
    for (int i = 0; i < n; ++i)
        array[i] = i;

    int j;
    for (int i = 0; i < n - 1; ++i)
    {
        j = (rand() % (n - i - 1)) + i + 1;
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

int main(int argc, char* argv[])
{
    if (3 != argc)
    {
        fprintf(stderr,"Expected 2 arguments:\n\tarray size\n\t.csv file, where to place results\n");
        return 1;
    }
    int n = atoi(argv[1]);
    if (n <= 0)
    {
        fprintf(stderr,"Invalid array size\n");
        return 2;
    }
    int fd = open(argv[2],O_RDWR | O_APPEND | O_CREAT,0700);
    if (-1 == fd)
    {
        perror("open()");
        return 3;
    }

    srand(time(NULL));
    int *array1 = (int *)malloc(n * sizeof(int));
    int *array2 = (int *)malloc(n * sizeof(int));
    if (!array1 || !array2)
    {
        fprintf(stderr, "Unable to allocate memory for random access arrays");
        return 1;
    }
    prepare_random_access_array(array1,n);
    prepare_random_access_array(array2,n);

    int k1 = 0, k2 = 0;
    char buf[BUF_SIZE];
    unsigned long long startt = get_ticks();
    for (int i = 0; i < NUMBER_OF_ITERATIONS; ++i)
    {
        k1 = array1[k1];
        k2 = array2[k2];
    }

    unsigned long long endt = get_ticks();

    unsigned long long time = endt - startt;
    printf("time = %lld ",time);
    unsigned long long average_ticks = time / NUMBER_OF_ITERATIONS;
    sprintf(buf,"%lld;",average_ticks);
    printf("average ticks: %lld\n", average_ticks);
    write(fd,buf,strlen(buf));
    free(array1);
    free(array2);
}