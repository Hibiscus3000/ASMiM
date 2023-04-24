#define _GNU_SOURCE
#define FREQ 2400000000
#define BUF_SIZE 256

#include <fcntl.h>
#include <immintrin.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <unistd.h>
#include <x86intrin.h>

typedef __m256d tested;

enum MEMORY
{
    dyn,
    align
};

typedef enum MEMORY memory_alloc;

struct thread_data_t
{
    pthread_barrier_t *barrier;
    int cpu;
    unsigned long long (*test)(tested *, long long, void *);
    // array_size in bytes
    long long array_size;
    memory_alloc mem_al;
    void *add_param;
    unsigned long long ticks;
};

typedef struct thread_data_t thread_data;

int check_code(int code, const char *msg)
{
    if (code)
        fprintf(stderr, "%s: %s\n", msg, strerror(code));
    return code;
}

void write_to_file(double value, int fd)
{
    char buf[BUF_SIZE];
    sprintf(buf, "%.4f;", value);
    int wc;
    if (strlen(buf) + 1 > (wc = write(fd, buf, strlen(buf) + 1)))
        if (wc < 0)
            perror("write()");
        else
            fprintf(stderr, "write to file error\n");
}

tested *get_array(long long number_of_elements, memory_alloc mem_al)
{
    void *arr;
    int code = posix_memalign(&arr, sizeof(tested), sizeof(tested) * number_of_elements);
    if (check_code(code, "posix_memalign"))
        return NULL;
    return (tested *)arr;
}

unsigned long long rd(tested *array, long long number_of_elements, void *param)
{
    unsigned int AUX;
    void *arr;
    if (check_code(posix_memalign(&arr, sizeof(tested), 4 * sizeof(tested)), "posix_memalign()"))
        return -1;
    double *double_array = (double *)arr;
    double a = 1.5;
    unsigned long long startt = __rdtscp(&AUX);
    for (long long i = 0; i < number_of_elements; ++i)
    {
        _mm256_store_pd(double_array, array[i]);
        a += double_array[2];
    }
    unsigned long long endt = __rdtscp(&AUX);
    return endt - startt;
}

unsigned long long wr(tested *array, long long number_of_elements, void *param)
{
    unsigned int AUX;
    void *arr;
    if (check_code(posix_memalign(&arr, sizeof(tested), 4 * sizeof(tested)), "posix_memalign()"))
        return -1;
    double *double_array = (double *)arr;
    char to_write_value = (char)param;
    double_array[0] = double_array[1] = double_array[2] = double_array[3] = to_write_value;
    unsigned long long startt = __rdtscp(&AUX);
    for (long long i = 0; i < number_of_elements; ++i)
        array[i] = _mm256_load_pd(double_array);
    unsigned long long endt = __rdtscp(&AUX);
    return endt - startt;
}

unsigned long long cp(tested *array, long long number_of_elements, void *param)
{
    unsigned int AUX;
    tested *new_array = get_array(number_of_elements, (memory_alloc)param);
    unsigned long long startt = __rdtscp(&AUX);
    for (long long i = 0; i < number_of_elements; ++i)
        new_array[i] = array[i];
    unsigned long long endt = __rdtscp(&AUX);
    return endt - startt;
}

void *test_param(void *param)
{
    thread_data *t_data = (thread_data *)param;
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(t_data->cpu, &set);
    check_code(sched_setaffinity(0, sizeof(set), &set), "sched_setaffinity");
    long long number_of_elements = t_data->array_size / sizeof(tested);
    tested *array = get_array(number_of_elements, t_data->mem_al);
    if (!array)
    {
        fprintf(stderr, "%d: unable to allocate memory for array\n", getpid());
        t_data->ticks = -1;
        return NULL;
    }
    pthread_barrier_wait(t_data->barrier);
    t_data->test(array, number_of_elements, t_data->add_param);
    unsigned long long ticks = t_data->test(array, number_of_elements, t_data->add_param);
    t_data->test(array, number_of_elements, t_data->add_param);
    t_data->ticks = ticks;
    free(array);
}

void test(long number_of_threads, long number_of_cpus, long number_of_virtual_threads,
          long long array_size, memory_alloc mem_al, long to_write_value, int results_table_fd)
{
    pthread_t threads[number_of_threads - 1];
    int number_of_cores = number_of_cpus / number_of_virtual_threads;
    long long array_size_per_thread = array_size / number_of_threads;
    unsigned long long (*test[3])(tested *, long long, void *) = {rd, wr, cp};
    const char *operations_name[3] = {"read", "write", "copy"};
    void *add_params[3] = {NULL, (void *)to_write_value, (void *)mem_al};

    pthread_barrier_t barrier;
    pthread_barrier_init(&barrier, NULL, number_of_threads);
    for (int k = 0; k < 3; ++k)
    {
        int core_id = 0, virtual_thread_id = 0;
        thread_data thread_datas[number_of_threads];
        // create threads
        for (long i = 0; i < number_of_threads; ++i)
        {
            thread_datas[i].barrier = &barrier;
            thread_datas[i].cpu = core_id * number_of_virtual_threads + virtual_thread_id;
            thread_datas[i].test = test[k];
            thread_datas[i].array_size = array_size_per_thread;
            thread_datas[i].mem_al = mem_al;
            thread_datas[i].add_param = add_params[k];

            if (number_of_threads - 1 == i)
                break;

            int code = pthread_create(threads + i, NULL, test_param, thread_datas + i);
            check_code(code, "pthread_create");
            core_id = (core_id + 1) % number_of_cores;
            if (!core_id)
                virtual_thread_id = (virtual_thread_id + 1) % number_of_virtual_threads;
        }
        test_param(thread_datas + number_of_threads - 1);

        // join threads
        for (long i = 0; i < number_of_threads - 1; ++i)
            check_code(pthread_join(threads[i], NULL), "pthread_join");

        double bandwidth = 0;
        double t_bandwidth;
        // write results to file
        for (long i = 0; i < number_of_threads; ++i)
        {
            t_bandwidth = (double)array_size_per_thread * FREQ / (thread_datas[i].ticks * (1 << 30));
            printf("%ld: %s %.5f GBps\n", i, operations_name[k], t_bandwidth);
            write_to_file(bandwidth, results_table_fd);
            bandwidth += t_bandwidth;
        }
        printf("\t%s %.5f GBps\n", operations_name[k], bandwidth);
        write_to_file(bandwidth, results_table_fd);
    }
    pthread_barrier_destroy(&barrier);
}

long long get_arg(char *argv, const char *arg_name)
{
    char *end_ptr;
    long long arg = strtoll(argv, &end_ptr, 10);
    if (end_ptr == argv)
    {
        fprintf(stderr, "invalid %s\n", arg_name);
        exit(-1);
    }
    return arg;
}

int main(int argc, char *argv[])
{
    if (argc < 8)
    {
        fprintf(stderr, "not enough arguments, number of threads, number of cpus, number of virtual threads, array size, memory allocation type, to write value and file name, where to put results\n");
        return 1;
    }
    long number_of_threads = get_arg(argv[1], "number of threads");
    long number_of_cpus = get_arg(argv[2], "number of cpus");
    long number_of_virual_threads = get_arg(argv[3], "number of virual threads");
    long long array_size = get_arg(argv[4], "array size");
    memory_alloc mem_al = get_arg(argv[5], "memory allocation type");
    long to_write_value = get_arg(argv[6], "to write value");

    int results_table_fd = open(argv[7], O_RDWR | O_CREAT | O_APPEND, 0700);
    if (-1 == results_table_fd)
    {
        perror("open()");
        return 1;
    }

    struct rlimit rlim;
    if (getrlimit(RLIMIT_AS, &rlim))
    {
        perror("getrlimit()");
        return 2;
    }
    rlim.rlim_cur = rlim.rlim_cur > 3 * array_size ? rlim.rlim_cur : 3 * array_size;
    rlim.rlim_max = rlim.rlim_cur;
    if (setrlimit(RLIMIT_DATA, &rlim) || setrlimit(RLIMIT_AS, &rlim))
    {
        perror("setrlimit()");
        return 1;
    }
    test(number_of_threads, number_of_cpus, number_of_virual_threads, array_size, mem_al, to_write_value, results_table_fd);

    return 0;
}