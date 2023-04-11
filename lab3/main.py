import csv
import sys
import math as m
import matplotlib
import matplotlib.pyplot as plt


def fix_nulls(csv):
    for line in csv:
        yield line.replace('\0', '')


attempts = int(sys.argv[2])
max_k = int(sys.argv[3])
dummies = int(sys.argv[4])
min_avgs = []
per = []
prev_d = -1

with open("table_" + sys.argv[1] + ".csv", newline='', encoding='utf-8') as \
        test_results_csv:
    spam_reader = csv.reader(fix_nulls(test_results_csv), delimiter=';')
    test_results_csv.seek(0)
    current_is_min = False
    for row_index, row in enumerate(spam_reader):
        if (attempts == row_index):
            break
        for column_index, column in enumerate(row):
            if column_index == 7 * dummies * (max_k - 1):
                break
            if (0 != column_index % 7) & (0 != column_index % 7 - 5):
                continue
            k = int(column_index / (7 * dummies))
            d = int(column_index % (7 * dummies) / 7)
            current_value = float(column)
            if 0 == row_index:
                if prev_d != d:
                    prev_d = d
                    min_avgs.append([])
                    per.append([])
                if 0 == column_index % 7:
                    min_avgs[d].append(current_value)
                else:
                    per[d].append(current_value)
            else:
                if 0 == column_index % 7:
                    if min_avgs[d][k] > current_value:
                        min_avgs[d][k] = current_value
                        current_is_min = True
                    else:
                        current_is_min = False
                if 0 == column_index % 7 - 5:
                    if current_is_min:
                        per[d][k] = current_value

with open("min_" + sys.argv[1] + ".csv", 'w', newline='') as min_csv:
    spam_writer = csv.writer(min_csv, delimiter=';')
    spam_writer.writerow(["k"] + ["d"] + ["avg"] + ["% of mispr"])
    for k in range(0, max_k - 1):
        for d in range(0, dummies):
            spam_writer.writerow([k + 1] + [d] + [min_avgs[d][k]] + [per[d][k]])

    matplotlib.use('Qt5Agg')
    split_into = 4
    number_of_lines_in_graph = m.ceil(dummies / split_into)
    side = int(m.sqrt(split_into))

    fig = plt.figure(figsize=(20,12))
    fig.suptitle('Среднее время выполнения итерации', fontsize = 24)
    hscape = 0.2
    wspace = 0.2
    x_list = list(range(1, 100, 3))
    k_list = list(range(0, 99))
    fig.subplots_adjust(wspace=wspace, hspace=hscape)
    for i in range(0, split_into):
        plt.subplot(side, side, i + 1)
        plt.xlabel('k')
        plt.ylabel('среднее время итерации (с)')
        plt.xticks(x_list)
        for d in range(i * number_of_lines_in_graph,
                       min((i + 1) * number_of_lines_in_graph, dummies)):
            plt.plot(k_list, min_avgs[d], label=d)
        plt.legend()
    plt.savefig("avg_" + sys.argv[1] + ".png")

    fig = plt.figure(figsize=(20,12))
    fig.suptitle('% неверных предсказаний', fontsize = 24)
    fig.subplots_adjust(wspace=wspace, hspace=hscape)
    for i in range(0, split_into):
        plt.subplot(side, side, i + 1)
        plt.xlabel('k')
        plt.ylabel('% неверных предсказаний')
        plt.xticks(x_list)
        for d in range(i * number_of_lines_in_graph,
                       min((i + 1) * number_of_lines_in_graph, dummies)):
            plt.plot(k_list, per[d], label=d)
        plt.legend()
    plt.savefig("per_" + sys.argv[1] + ".png")
