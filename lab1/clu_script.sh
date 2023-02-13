#!/bin/bash

#PBS -l select=1:ncpus=1:mem=100m
#PBS -l walltime=00:01:00
#PBS -q xl230g9q
#PBS -m n

cd $PBS_O_WORKDIR

result_file_name=clu_table.csv

cat /proc/cpuinfo

gcc main_sse.s -o main_sse

>$result_file_name

for ((j = 0; j < 10; j++))
do
	./main_sse $result_file_name
	printf "\n">>$result_file_name
	printf "\n"
done
