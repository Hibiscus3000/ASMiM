    }
    unsigned long long endt = __rdtscp(&AUX);
    CHECK(PAPI_stop(event_set, values.data()), PAPI_OK);
    unsigned long long time = endt - startt;
    double avg = (double)time / N;
    cout << setw(6) << k << setw(5) << d << setw(14) << time << setw(18) << avg;
    write_to_file(avg, fd);
    for (auto v : values)
    {
        cout << setw(20) << v;
        write_to_file(v, fd);
    }
    double mispr = (double)values[2] / values[1] * 100;
    cout << setw(20) << setprecision(4) << mispr << endl;
    write_to_file(mispr, fd);
}

int main(int argc, char *argv[])
{
    if (4 != argc)
    {
        cerr << "wrong number of arguments, expected k, number of dummies" <<
            " and file name, where to put measurements results" << endl;
        return 1;
    }
    int results_table_fd = open(argv[3], O_RDWR | O_CREAT | O_APPEND, 0700);
    if (-1 == results_table_fd)
    {
        perror("open()");
        return 1;
    }
    int k = atoi(argv[1]);
    if (!k)
    {
        cerr << "k = \"" << argv[1] << "\" invalid, should be positive integer" << endl;
        return 1;
    }
    if (heat_proc())
        return 1;

    CHECK(PAPI_library_init(PAPI_VER_CURRENT), PAPI_VER_CURRENT);
    CHECK(PAPI_create_eventset(&event_set), PAPI_OK);

    for (auto code : event_codes)
        CHECK(PAPI_add_event(event_set, code), PAPI_OK);

    cout << setw(6) << "k";
    cout << setw(5) << "d";
    cout << setw(14) << "rdtsc tics" << setw(20)
         << "avg it time";
    for (auto code : event_codes)
        cout << setw(20) << event_descr(code);
    cout << setw(20) << "% of mispredict" << endl;

    measure_predictor_capacity(k, atoi(argv[2]), results_table_fd);
    close(results_table_fd);
    return 0;
}