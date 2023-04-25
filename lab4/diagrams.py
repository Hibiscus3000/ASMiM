import json

from matplotlib import *
import numpy as np
import matplotlib.pyplot as plt
import sys
import csv
import json


def fix_nulls(csv):
    for line in csv:
        yield line.replace('\0', '')


def read_data(filename):
    with open(filename, 'r') as data_file:
        content = list(csv.reader(fix_nulls(data_file), delimiter=';'))
    results = {}

    for r in range(0, 3):
        results[r] = {}
        line_ind = 0
        for m in range(0, methods_no_loop_un + methods_with_loop_un):
            method = content[line_ind][0]
            results[r][method] = {}
            line_ind += 1
            for s in range(0, sizes):
                results[r][method][s] = {}
                for lu in range(0, 1 + (loop_un - 1) * (m >= methods_no_loop_un)):
                    results[r][method][s][lu] = {}
                    for t in range(0, threads):
                        results[r][method][s][lu][t] = []
                        results[r][method][s][lu][t] = factor * float(content[line_ind][r])
                        line_ind += 1
                        for a in range(1, attempts):
                            current = factor * float(content[line_ind][r])
                            if current > results[r][method][s][lu][t]:
                                results[r][method][s][lu][t] = current
                            line_ind += 1

    return results


def build_lib_diagrams(results, names):
    use('Qt5Agg')
    x = np.arange(len(names))
    width = 0.1
    for r in range(0, 3):
        fig, ax = plt.subplots(sizes, 1, figsize=(12, 10), constrained_layout=True)
        fig.suptitle(f'{tested[r]}', fontsize=20)
        for s in range(0, sizes):
            ax[s].set_title(f'Размер массива: {int(array_sizes[s] / 1000000)} Мбайт')
            for t in range(0, threads):
                ax[s].bar(x + (t - threads / 2) * width,
                          [results[r][method][s][0][t] for method in list(names.keys())],
                          align='edge',
                          width=width,
                          label=f'п: {t + 1}')
            ax[s].set_xticks(x, list(names.values()))
            ax[s].legend()
        plt.savefig(f'{folder_name}/{tested[r]}_lib')


def build_def_diagrams(results, names):
    use('Qt5Agg')
    x = np.arange(len(names))
    width = 0.1
    for r in range(0, 3):
        for lu in range(0, loop_un):
            fig, ax = plt.subplots(sizes, 1, figsize=(12, 10), constrained_layout=True)
            fig.suptitle(f'{tested[r]} (Раскрутка циклов: {2 ** lu})', fontsize=20)
            for s in range(0, sizes):
                ax[s].set_title(f'Размер массива: {int(array_sizes[s] / 1000000)} Мбайт')
                for t in range(0, threads):
                    ax[s].bar(x + (t - threads / 2) * width,
                              [results[r][method][s][lu][t] for method in list(names.keys())],
                              align='edge',
                              width=width,
                              label=f'п: {t + 1}')
                ax[s].set_xticks(x, list(names.values()))
                ax[s].legend()
            plt.savefig(f'{folder_name}/{tested[r]}_def{2 ** lu}')


if '__main__' == __name__:
    with open('config.json', 'r') as config_file:
        config = json.load(config_file)
    methods_no_loop_un = config['methods_without_loop_unrolling']
    methods_with_loop_un = config['methods_with_loop_unrolling']
    array_sizes = config['sizes']
    sizes = len(array_sizes)
    loop_un = config['loop_unrolling']
    threads = config['threads']
    attempts = config['attempts']
    folder_name = config['diagrams_folder']
    factor = config['factor']
    default_names = {'sample': 'default',
                     'sample_no_temp': 'non-cache',
                     'vectorized': 'vector',
                     'vectorized_no_temp': 'vector (non-cache)',
                     'vectorized_to_scalar': 'vector (s/l)',
                     'vectorized_to_scalar_nt': 'vector (s/l) (non-cache)'}
    lib_names = {'library char': 'char',
                 'library int': 'int',
                 'library long long': 'long long'}

    tested = ['Чтение', 'Запись', 'Копирование']

    # method => {size => {loop unrolling => {thread => tested}}
    results = read_data(config['filename'])
    build_lib_diagrams(results, lib_names)
    build_def_diagrams(results, default_names)
